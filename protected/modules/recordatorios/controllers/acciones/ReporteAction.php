<?php
class ReporteAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {
		//Recogiendo datos del formulario
		if(isset($_GET['fecha_desde']) && $_GET['fecha_desde'] != ""){
			$fecha_desde = $_GET['fecha_desde'];
			$atributos['fecha_desde'] = $fecha_desde;
		}
		else{
			$atributos['fecha_desde'] = "";
		}
		if(isset($_GET['fecha_hasta']) && $_GET['fecha_hasta'] != ""){
			$fecha_hasta = $_GET['fecha_hasta'];
			$atributos['fecha_hasta'] = $fecha_hasta;
		}
		else{
			$atributos['fecha_hasta'] = "";
		}
		if(isset($_GET['telefono']) && $_GET['telefono'] != ""){
			$telefono = $_GET['telefono'];
			$atributos['telefono'] = $telefono;
		}
		else{
			$atributos['telefono'] = "";
		}
		if(isset($_GET['correo']) && $_GET['correo'] != ""){
			$correo = $_GET['correo'];
			$atributos['correo'] = $correo;
		}
		else{
			$atributos['correo'] = "";
		}
		
		
		//Construyendo comparador de fechas
		if( isset($fecha_desde) && isset($fecha_hasta) && $fecha_desde != "" &&  $fecha_hasta != ""){
			$comparador_fecha = 't1.fecha BETWEEN "'.$fecha_desde.'" AND DATE_ADD("'.$fecha_hasta.'", INTERVAL 86399 SECOND)';
		}
		else if(isset($fecha_desde) && $fecha_desde != ""){
			$comparador_fecha = 't1.fecha > "'. $fecha_desde .'"';
		}
		else if(isset($fecha_hasta) && $fecha_hasta != ""){
			$comparador_fecha = 't1.fecha < "'. $fecha_hasta .'"';
		}
		
		//Contruyendo criteria
		$criteria = new CDbCriteria;
		$criteria->with = array(
            'idCitaRecordatorio' => 
			array(
				'alias'=> 't1', 
				'together' => true,
				'select' => array('t1.nombre_paciente', 't1.fecha', 't1.nombre_profesional', 't1.telefono', 't1.correo') )
        );
		
		$criteria->select = "COUNT(t.fecha) as enviados";
		if(isset($comparador_fecha)){
			$criteria->addCondition($comparador_fecha);
		}
		
		if(isset($telefono)){
			$criteria->addCondition('t1.telefono LIKE "%'. $telefono . '%"');
		}
		
		if(isset($correo)){
			$criteria->addCondition('t1.correo LIKE "%'. $correo . '%"');
		}
		
		$criteria->group = 't.id_cita_recordatorio';
		$criteria->order = 't1.fecha DESC';
		//Creando Data provider
		$recordatorios_enviados = new RecordatoriosEnviados;
		$reporte = new CActiveDataProvider($recordatorios_enviados, array('criteria' => $criteria));
		$aux = $recordatorios_enviados->model()->findAll($criteria);
		$atributos['reporte'] = $reporte;
        $this->controller->render('reporte',$atributos);
    }
}
?>

