<?php
class RegistrarLlamadaAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {           
		$id = $_GET['id'];
		$fecha = $_GET['fecha'];
		$tipo = 'CALL';
		$model = RecordatoriosEnviados::model()->find("id_cita_recordatorio = $id  AND 
		fecha = \"$fecha\" AND tipo = \"$tipo\"");
		$model['recibida'] = "Si";
		$model->save();
    }
}