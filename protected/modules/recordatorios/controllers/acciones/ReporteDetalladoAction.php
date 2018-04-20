<?php
class ReporteDetalladoAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {
		//Recogiendo datos del formulario
		if(isset($_GET['id']) && $_GET['id'] != ""){
			$id = $_GET['id'];
		}
		//Contruyendo criteria
		$criteria = new CDbCriteria;
		$criteria->addCondition('id_cita_recordatorio = '. $id);
		
		//Creando Data provider
		$recordatorios_enviados = new RecordatoriosEnviados;
		$reporte = new CActiveDataProvider($recordatorios_enviados, array('criteria' => $criteria));
		$atributos['reporte'] = $reporte;
        $this->controller->render('detallado',$atributos);
    }
}
?>

