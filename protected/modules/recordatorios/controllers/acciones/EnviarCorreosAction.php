<?php
class EnviarCorreosAction extends CAction
{
	
	
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {           
		$criteria = new CDbCriteria();
		$criteria->condition = "fecha > ".date("Y-m-d");
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		
		foreach($cita as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				$this->enviarCorreo($recordatorio);
			}
		}
		
        $this->controller->render('opciones',array('num_recordatorios' => $num_recordatorios));
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
		$tipo = 'E-MAIL';
		$enviados = RecordatoriosEnviados::model()->findAll("id_cita_recordatorio = " . $id . " AND tipo = '".$tipo."'");
		return count($enviados);
	}
	
	/**
	 * Envia un correo recordatorio con la información de la cita 
	 * @param $recordatorio información de la cita
	 * @return bool true si el correo fue enviado, false en caso contrario
	 */
	
	public function enviarCorreo($recordatorio){
		$mail = new JPhpMailer;
		if(filter_var($recordatorio['correo'], FILTER_VALIDATE_EMAIL)){
			$adjunto = $this->construirMensaje($recordatorio);
			$mail->IsSMTP();
			$mail->Host = 'smtp.googlemail.com:465';
			$mail->SMTPSecure = "ssl";
			$mail->SMTPAuth = true;
			$mail->Username = 'grupoingenieros.soluciones@gmail.com';
			$mail->Password = 'Juan.890922';
			$mail->SetFrom('miempresa@midominio.com', $info);
			$mail->Subject = $estado;
			$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!';
			$mail->MsgHTML($adjunto);
			$mail->AddAddress(Yii::app()->getSession()->get('Correo'), Yii::app()->user->name);	
			$mail->AddBCC($recordatorio['correo'], $recordatorio['nombre_paciente']);
			$mail->Send();
			return true;
		}
		return false;
	}
	
	/**
	 * Construye una pagina html con los datos del recordatorio
	 * @param $recordatorio información de la cita
	 * @return String con el html de la pagina
	 */
	public function construirMensaje($recordatorio){
		return $this->controller->renderPartial('plantillaCorreo', array('model' => $recordatorio));
	}
}
?>

