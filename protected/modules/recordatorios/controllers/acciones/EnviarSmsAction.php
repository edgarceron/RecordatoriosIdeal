<?php
require('elibom/elibom.php');

class EnviarSmsAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
	public $elibom;
	
    public function run()
    {           
		$criteria = new CDbCriteria();
		$elibom = new ElibomClient('triforceofforest@hotmail.com', 'psM2Pj929O');
		$criteria->condition = "fecha > '".date("Y-m-d H:i:s")."'";
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		$recordatoriosEnviados = 0;
		foreach($citas as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				$this->enviarSms($recordatorio);
				$recordatoriosEnviados++;
			}
		}
		echo $recordatoriosEnviados . ' recordatorios pendiente enviados';
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
	 * Envia un correo recordatorio con la información de la cita 
	 * @param $recordatorio información de la cita
	 * @return bool true si el correo fue enviado, false en caso contrario
	 */
	
	public function enviarSms($recordatorio){
		
		$mail = new PHPMailer;
		if($this->validarNumero($recordatorio['telefono'])){
			$mensaje = $this->construirMensaje($recordatorio);
			$deliveryId = $elibom->sendMessage($recordatorio['telefono'], $mensaje);
			$this->registrarRecordatorioEnviado($recordatorio['id'], 'SMS');
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
		$direccion = $recordatorio['direccion']; //20
		$profesional = $recordatorio['profesional']; //30
		$mensaje = 'Sr/a. ' . $nombre . ' su cita en fundacion ideal fecha: ' 
		. $fecha . ' ' . $hora . 'Lugar: ' . $sede . ' ' . $direccion . ' con el Dr. ' . $profesional; 
		return $mensaje;
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

