<?php
class GuardarOpcionesAction extends CAction
{
    //Reemplazar Model por el modelo que corresponda al modulo
    public function run()
    {
		$num_recordatorios = Opciones::model()->findByPk('NUM_RECORDATORIOS');
		$num_campana = Opciones::model()->findByPk('NUM_CAMPANA');
		$dias_antes = Opciones::model()->findByPk('DIAS_ANTES');
		
		$num_recordatorios->valor = $_POST['opcion'];
		$num_campana->valor = $_POST['opcion_c'];
		$dias_antes->valor = $_POST['opcion_d'];

		$num_recordatorios->save();
		$num_campana->save();
		$dias_antes->save();
		$this->controller->redirect('formularioOpciones');
	}
}
?>