<?php
class FormularioSubirAction extends CAction
{
    public function run()
    {				
		$model = new SubirArchivo;
        $this->controller->render('formularioSubir',array(
		   'model' => $model,
		));
    }
}
?>