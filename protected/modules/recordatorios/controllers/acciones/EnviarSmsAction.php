<?php
require('elibom/elibom.php');
require('nusoap/src/nusoap.php');
class EnviarSmsAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
	public $elibom;
	
    public function run()
    {           
		$criteria = new CDbCriteria();
		$this->elibom = new ElibomClient('triforceofforest@hotmail.com', 'psM2Pj929O');
		$criteria->condition = "fecha > '".date("Y-m-d H:i:s")."' 
		AND fecha < DATE_ADD('" . date("Y-m-d H:i:s") . "' , INTERVAL " . $this->getNumeroDiasAntes() . " DAY)";
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		$recordatoriosEnviados = 0;
		
		foreach($citas as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				$this->enviarSmsClaro($recordatorio);
				$recordatoriosEnviados++;
			}
		}
		
		echo $recordatoriosEnviados . ' recordatorios de SMS pendiente enviados';
    }
	
	/**
	 * Obtiene el numero maximo de recordatorios que se deben enviar de 
     * la tabla de opciones
	 * @return int Numero maximo de recordatorios
	 */
	
	public function getMaxNumeroRecordatorios(){
		return Opciones::model()->find("opcion = 'NUM_RECORDATORIOS'")['valor'];
	}
	
	/**
	 * Obtiene el numero dias antes que se enviaran recordatorios
	 * @return int Numero de dias
	 */
	public function getNumeroDiasAntes(){
		return Opciones::model()->find("opcion = 'DIAS_ANTES'")['valor'];
	}
	
	/**
	 * Obtiene el numero de recordatorios enviados a la cita ingresada
	 * @param $id id de la cita en la table citas_recordatorios
	 * @return int Numero de recordatorios enviados a la cita con el id entregado
	 */
	 
	public function getNumeroRecordatoriosEnviados($id){
		$tipo = 'SMS';
		$enviados = RecordatoriosEnviados::model()->findAll("id_cita_recordatorio = " . $id . " AND tipo = '".$tipo."'");
		return count($enviados);
	}
	
	/**
	 * Obtiene el numero de recordatorios enviados a la cita ingresada
	 * @param $id id de la cita en la table citas_recordatorios
	 * @return int Numero de recordatorios enviados a la cita con el id entregado
	 */
	 
	public function getConsecutivoRecordatorio(){
		return Opciones::model()->find("opcion = 'CONSECUTIVO'")['valor'];
	}
	
	public function aumentarConsecutivoRecordatorio(){
		$model = Opciones::model()->findByPk("CONSECUTIVO");
		$model->valor = $model->valor + 1;
		$model->save();
	}
	
	/**
	 * Envia un SMS recordatorio con la información de la cita 
	 * @param $recordatorio información de la cita
	 * @return bool true si el SMS fue enviado, false en caso contrario
	 */
	
	public function enviarSmsElibom($recordatorio){
		if($this->validarNumero($recordatorio['telefono'])){
			$mensaje = $this->construirMensaje($recordatorio);
			$deliveryId = $this->elibom->sendMessage($recordatorio['telefono'], $mensaje);
			$this->registrarRecordatorioEnviado($recordatorio['id'], 'SMS');
			if($deliveryId) return true;
		}
		return false;
	}
	
	/**
	 * Construye un mensaje de texto de maximo 160 caracteres
	 * @param $recordatorio información de la cita
	 * @return String con el sms
	 */
	public function construirMensaje($recordatorio){
		$campos = explode(" ",trim($recordatorio['nombre_paciente']));
		$nombre = $campos[0]; //15
		$datetime = new DateTime($recordatorio['fecha']);
		$fecha = $datetime->format('Y-m-d'); //10
		$hora = $datetime->format('g:i A'); //10
		$sede = $recordatorio['sede']; //20
		$servicio = $recordatorio['servicio'];
		$direccion = $recordatorio['direccion']; //20
		$profesional = $recordatorio['nombre_profesional']; //30
		$mensaje = 'Sr/a. ' . $nombre . ' recordamos su cita de ' . $servicio . ' en Fundacion IDEAL el dia ' 
		. $fecha . ' ' . $hora . ' Sede: ' . $sede . ' ' . $direccion 
		. " recuerde valor a cancelar, sino puede asistir informar 4863732"; 
		return $mensaje;
	}
	
	/**
	 * Envia una solicitud SOAP de SMS a los servidores de claro
	 * @param $recordatorio información de la cita
	 * @return bool true si el SMS fue enviado, false en caso contrario
	 */
	public function enviarSmsClaro($recordatorio){
		if($this->validarNumero($recordatorio['telefono'])){
			
			$wsdl = "https://www.gestormensajeriaadmin.com/RA/tggDataSoap?wsdl";
			$telefono = "57" . $recordatorio['telefono'];
			$mensaje = $this->construirMensaje($recordatorio);
			$sender = "890330";
			$requestid = $this->getConsecutivoRecordatorio();
			$receiptRequest = "0";
			$dataCoding = "0";
			$login = "w460";
			$password = "fjul10c4l0nj3";
			/*
			$params = array(
				"subscriber" => $telefono,
				"sender" => $sender,
				"requestId" => $requestid,
				"receiptRequest" => $receiptRequest,
				"dataCoding" => $dataCoding,
				"message" => $mensaje
			);*/
			
			
			$params = "
			
			<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:tgg='http://ws.tiaxa.net/tggDataSoapService/'>
				<soapenv:Header/>
				<soapenv:Body>
					<tgg:sendMessageRequest>
						<subscriber>$telefono</subscriber>
						<sender>$sender</sender>
						<requestId>$requestid</requestId>
						<receiptRequest>$receiptRequest</receiptRequest>
						<dataCoding>$dataCoding</dataCoding>
						<message>$mensaje</message>
					</tgg:sendMessageRequest>
				</soapenv:Body>
			</soapenv:Envelope>
			";
			
			$soap_client = new nusoap_client($wsdl, true);
			
			$soap_client->setCredentials($login, $password, 'basic');
			$soap_client->useHTTPPersistentConnection();
			$soap_client->setUseCURL(false);
			$soap_client->soap_defencoding = 'UTF-8'; //Fix encode erro, if you need
			$soap_client->setEndpoint("https://www.gestormensajeriaadmin.com/RA/tggDataSoap?wsdl");
			$soap_return = $soap_client->call("sendMessage", $params, "http://ws.tiaxa.net/tggDataSoapService/");
			
			if($soap_return['resultCode'] == 0){
				$this->registrarRecordatorioEnviado($recordatorio['id'], 'SMS');
				$this->aumentarConsecutivoRecordatorio();
				return true;
			}	
		}			
		return false;
	}	
	
	
	/**
	 * Guarda un registro en la tabla citas recordatorios 
	 * indicando que se envio el correo.
	 * @param $id Identificador del recordatorio
	 * @param $tipo Tipo de recordatorio (E-MAIL, SMS, CALL)
	 */
	 
	public function registrarRecordatorioEnviado($id, $tipo){
		$model = new RecordatoriosEnviados;
		$model->id_cita_recordatorio = $id;
		$model->fecha = date('Y-m-d H:i:s');
		$model->tipo = $tipo;
		if($model->save()){
			echo '<br>Recordatorio registrado.';
		}
		else{
			echo '<br>Recordatorio no registrado.';
		}
	}
	
	/**
	 * Verifica que el numero telefonico sea un numero celular de colombia
	 * @param $numero 
	 * return bool true si el numero telefonico es correco, false en caso contrario
	 */
	 
	public function validarNumero($numero){
		if(strlen($numero) == 10){
			if(substr($numero, 0, 1) == '3'){
				return true;
			}
		}
		return false;
	}
}
?>

