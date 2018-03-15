<?php
class FormularioOpcionesAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {           
		$num_recordatorios = Opciones::model()->findByPk('NUM_RECORDATORIOS');
        $this->controller->render('opciones',array('num_recordatorios' => $num_recordatorios));
    }
}
?>

