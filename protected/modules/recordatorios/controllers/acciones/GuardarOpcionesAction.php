<?php
class GuardarOpcionesAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {
	$num_recordatorios = Opciones::model()->findByPk('NUM_RECORDATORIOS');
	$num_campana = Opciones::model()->findByPk('NUM_CAMPAÑA');
	$dias_antes = Opciones::model()->findByPk('DIAS_ANTES');
	
	$num_recordatorios = $_POST['NUM_RECORDATORIOS'];
	$num_campana->valor = $_POST['NUM_CAMPAÑA'];
	$dias_antes->valor = $_POST['DIAS_ANTES'];

	$num_recordatorios->save();
	$num_campana->save();
	$dias_antes->save();

	$campanas = Campaign::model()->findAll();

        $this->controller->render('opciones',array(
		'num_recordatorios' => $num_recordatorios, 
		'num_campana' => $num_campana,
		'dias_antes' => $dias_antes,
		'campanas' => $campanas));
    }
}
?>