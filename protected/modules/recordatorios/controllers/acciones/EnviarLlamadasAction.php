<?php
require('elibom/elibom.php');

class EnviarLlamadasAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
	
    public function run(){           
		$criteria = new CDbCriteria();
		$criteria->condition = "fecha > '".date("Y-m-d H:i:s")."'";
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		$recordatoriosEnviados = 0;
		
		foreach($citas as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				$this->enviarLlamada($recordatorio);
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
	 * Envia la programación de una llamada al servidor elastix junto con los
	 * datos respectivos de la cita
	 * @param $recordatorio información de la cita
	 * @return bool true si la llamada fue enviada, false en caso contrario
	 */
	
	public function enviarLlamada($recordatorio){
		if($this->validarNumero($recordatorio['telefono'])){
			$id_campaign = $this->getIdCamapana();
			$id = $this->guardarLlamada($id_campaign, $recordatorio['telefono']);
			$this->guardarLlamadaRecordatorio($id, $recordatorio);
			$this->registrarRecordatorioEnviado($recordatorio['id'], 'CALL');
			if($id) return true;
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
		$keys = array_keys($recordatorio);
		foreach($keys as $k){
			$llamadas_recordatorios[$k] = $recordatorios[$k];
		}
		$llamadas_recordatorios['id'] = $id;
		$llamadas_recordatorios->save();
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

