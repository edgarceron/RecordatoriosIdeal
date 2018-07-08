<?php
require('elibom/elibom.php');

class EnviarLlamadasAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
	
    public function run(){           
		$criteria = new CDbCriteria();
		$criteria->condition = "fecha > '".date("Y-m-d H:i:s")."' 
		AND fecha < DATE_ADD('" . date("Y-m-d H:i:s") . "' , INTERVAL " . $this->getNumeroDiasAntes() . " DAY)";
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		$recordatoriosEnviados = 0;
		$errores = 0;
		foreach($citas as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				if($this->enviarLlamada($recordatorio)){
					$recordatoriosEnviados++;
				}
				else{
					$errores++;
				}
			}
		}
		$this->activarCampana();
		echo $recordatoriosEnviados . ' recordatorios por llamada pendientes registrados con ' . $errores . ' errores';
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
	 * Obtiene el Id de la camapaña a la que se enviara la llamada
	 * @return int Id de la camapaña
	 */
	
	public function getIdCamapana(){
		return Opciones::model()->find("opcion = 'NUM_CAMPAÑA'")['valor'];
	}
	
	
	/**
	 * Obtiene el numero de recordatorios enviados a la cita ingresada
	 * @param $id id de la cita en la table citas_recordatorios
	 * @return int Numero de recordatorios enviados a la cita con el id entregado
	 */
	public function getNumeroRecordatoriosEnviados($id){
		$tipo = 'CALL';
		$enviados = RecordatoriosEnviados::model()->findAll("id_cita_recordatorio = " . $id . " AND tipo = '".$tipo."'");
		return count($enviados);
	}
	
	/**
	 * Obtiene el numero dias antes que se enviaran recordatorios
	 * @return int Numero de dias
	 */
	public function getNumeroDiasAntes(){
		return Opciones::model()->find("opcion = 'DIAS_ANTES'")['valor'];
	}
	
	/**
	 * Envia la programación de una llamada al servidor elastix junto con los
	 * datos respectivos de la cita
	 * @param $recordatorio información de la cita
	 * @return bool true si la llamada fue enviada, false en caso contrario
	 */
	
	public function enviarLlamada($recordatorio){
		if($this->validarNumero($recordatorio['telefono'])){
			try{
				$id_campaign = $this->getIdCamapana();
				$id = $this->guardarLlamada($id_campaign, $recordatorio['telefono']);
				$this->guardarLlamadaRecordatorio($id, $recordatorio);
				$this->registrarRecordatorioEnviado($recordatorio['id'], 'CALL');
				if($id) return true;
			}
			catch(Exeption $e){
					return false;
			}	
		}
		return false;
	}
	
	/**
	 * Guarda la llamada en la tabla calls
	 * @param $id_campaign Id de la camapaña a la cual pertenece la llamada
	 * @param $phone Numero telefonico al que deberia lanzarce la llamada
	 * @return El id del registro creado
	 */
	public function guardarLlamada($id_campaign, $phone){
		$calls = new Calls;
		$calls['id_campaign'] = $id_campaign;
		$calls['phone'] = $phone;
		$calls->save();
		return $calls['id'];
	}
	
	/**
	 * Guarda el recordatorio en la tabla de recordatorio del servidor elastix y lo asocia con la llamada
	 * @param $id Int Id de la llamada registrada en la tabla Calls
	 * @param $recordatorio Array con los datos del recordatorio
	 */
	public function guardarLlamadaRecordatorio($id, $recordatorio){
		$llamadas_recordatorios = new LlamadasRecordatorios;
		$keys = array_keys($recordatorio->getAttributes());
		foreach($keys as $k){
			$llamadas_recordatorios[$k] = $this->removerTildes($recordatorio[$k]);
		}
		$llamadas_recordatorios['id'] = $id;
		$llamadas_recordatorios['direccion'] = $this->transformarDireccion($recordatorio['direccion']);
		$llamadas_recordatorios['fecha'] = $this->transformarFecha($recordatorio['fecha']);
		if(!$llamadas_recordatorios->save()){
			echo "<br>No se guardo $id<br>";
		}
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
		return true;
	}
	
	/**
	 * Transforma la dirección a un formato que sea entendible al ser leido por Text2wav
	 * @param $direccion String que contenga una dirección
	 * @return String con la dirección en el formato legible
	 */
	public function transformarDireccion($direccion){
		return $this->separarLetrasDeNumeros($this->reemplazarNumeral($direccion));
	} 
	
	/**
	 * Cambia el simbolo # en un string por la palabra "numero"
	 * @param $direccion String con una direccion
	 * return String con todos los # cambiados por la palabra numero
	 */
	
	public function reemplazarNumeral($direccion){
		return str_replace("#", " numero ", $direccion);
	}
	
	/*
	 * @parama $direccion String con una direccion
	 * @return String con todos los numeros y palabras separados
	 */
	public function separarLetrasDeNumeros($direccion){
		$arr = str_split ($direccion);
		for($i = 0; $i < count($arr) - 1; $i++){
			if( $arr[$i] != " " && (is_numeric($arr[$i]) && ctype_alpha($arr[$i + 1])) || (ctype_alpha($arr[$i]) && is_numeric($arr[$i + 1])) ){
				for($j = count($arr); $j > $i + 1; $j--){
					$arr[$j] = $arr[$j - 1]; 
				}
				$arr[$i + 1] = " ";
			}
		}
		return implode($arr);
	}
	
	/**
	 * Transforma una fecha con hora a un formato que sea entendible al ser leido por Text2wav
	 * @param $fecha String con un date time
	 * @return String con la fecha en un formato legible
	 */
	public function transformarFecha($fecha){
		//2018-04-06 07:30:00 	
		$date = date_create($fecha);
		$dia = $date->format('j');
		$mes = $date->format('n');
		$hora = $date->format('g');
		$minutos = $date->format('i');
		$meriden = $date->format('a');
		if($meriden = 'am'){
			$meriden = 'a m';
		}
		else{
			$meriden = 'p m';
		}
		
		$cadena = $dia . " de " . $this->getTextoMes($mes) . " a las " . $hora . " y " . $minutos . " " . $meriden;
		return $cadena;
	}
	
	/**
	 * Devuelve en texto el nombre del mes a partir de un numero
	 * @param $mes int Numero del mes (Entre 1 y 12)
	 * @return String con el mes en texto
	 */
	public function getTextoMes($mes){
		switch($mes){
			case 1:
				return 'Enero';
			case 2:
				return 'Febrero';
			case 3:
				return 'Marzo';
			case 4:
				return 'Abril';
			case 5:
				return 'Mayo';
			case 6:
				return 'Junio';
			case 7:
				return 'Julio';
			case 8:
				return 'Agosto';
			case 9:
				return 'Septiembre';
			case 10:
				return 'Octubre';
			case 11:
				return 'Noviembre';
			case 12:
				return 'Diciembre';
			default:
				return false;
		}
	}
	
	/**
	 * Activa la camapaña correspondiente
	 */
	public function activarCampana(){
		$id_campaign = $this->getIdCamapana();
		$model = Campaign::model()->findByPk($id_campaign);
		$model['estatus'] = 'A';
		$model->save();
	}
	
	/**
	 * Reemplaza las vocales con tidel por vocales sin tilde
	 * @param $texto String 
	 * @return String texto sin tildes
	 */
	public function removerTildes($texto){
		$arr = str_split ($texto);
		for($i = 0; $i < count($arr); $i++){
			if($arr[$i] == 'á'){
				$arr[$i] = 'a';
			}
			else if($arr[$i] == 'ó'){
				$arr[$i] = 'o';
			}
			else if($arr[$i] == 'é'){
				$arr[$i] = 'e';
			}
			else if($arr[$i] =='í'){
				$arr[$i] = 'i';
			}
			else if($arr[$i] == 'ú'){
				$arr[$i] = 'u';
			}
		}
		return implode($arr);
	} 
	
}
?>

