<?php
use PHPMailer\PHPMailer\PHPMailer;
require 'vendor/autoload.php';

class EnviarCorreosAction extends CAction
{
	
	
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {           
		$criteria = new CDbCriteria();
		$criteria->condition = "fecha > ".date("Y-m-d");
		$citas = CitasRecordatorios::model()->findAll($criteria);
		$max_numero_recordatorios = $this->getMaxNumeroRecordatorios();
		
		foreach($citas as $recordatorio){
			$id_cita = $recordatorio['id'];
			$enviados = $this->getNumeroRecordatoriosEnviados($id_cita);
			if($enviados < $max_numero_recordatorios){
				$this->enviarCorreo($recordatorio);
			}
		}
		
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
		
		$mail = new PHPMailer;
		if(filter_var($recordatorio['correo'], FILTER_VALIDATE_EMAIL)){
			$adjunto = $this->construirMensaje($recordatorio);
			$mail->IsSMTP();
			$mail->Host = gethostbyname('smtp.gmail.com');
			$mail->Port = 587;
			$mail->SMTPDebug = 4;
			$mail->SMTPOptions = array(
				'ssl' => array(
					'verify_peer' => false,
					'verify_peer_name' => false,
					'allow_self_signed' => true
				)
			);
			$mail->SMTPSecure = "tls";
			$mail->SMTPAuth = true;
			$mail->Username = 'matsuurahana@gmail.com';
			$mail->Password = 'yamashita.nanamI3191';
			$mail->setFrom('miempresa@midominio.com', 'Recordatorio cita');
			$mail->Subject = 'Recordatorio de cita ideal';
			$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!';
			$mail->msgHTML($adjunto);
			$mail->AddAddress($recordatorio['correo'], $recordatorio['nombre_paciente']);	
			//$mail->AddBCC($recordatorio['correo'], $recordatorio['nombre_paciente']);
			if(!$mail->send()) {
			  echo '<br>Message was not sent.<br>';
			  echo 'Mailer error: ' . $mail->ErrorInfo;
			} else {
			  echo '<br>Message has been sent.';
			}
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
		return $this->controller->renderPartial('plantillaCorreo', array('recordatorio' => $recordatorio), true);
	}
}
?>

