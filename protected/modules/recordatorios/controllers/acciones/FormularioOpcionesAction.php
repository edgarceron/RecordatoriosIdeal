<?php
class FormularioOpcionesAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {           
	$num_recordatorios = Opciones::model()->findByPk('NUM_RECORDATORIOS');
	$num_campana = Opciones::model()->findByPk('NUM_CAMPANA');
	$dias_antes = Opciones::model()->findByPk('DIAS_ANTES');
	$campanasDatos = Campaign::model()->findAll();
	$campanas = array();
	foreach($campanasDatos as $c){
		$campanas[$c->id] = $c->name;
	}
	
    $this->controller->render('opciones',array(
		'num_recordatorios' => $num_recordatorios, 
		'num_campana' => $num_campana,
		'dias_antes' => $dias_antes,
		'campanas' => $campanas));
    }
}
?>

