<?php
/* @var $this DefaultController */

$this->breadcrumbs=array(
	$this->module->id,
        $this->module->nombre,
);
?>


<div class="panel panel-default">
    <div class="panel-heading">
        <div class="container row">
            <div class="col-lg-6 text-left"><img alt="Bootstrap Image Preview" src="<?php echo Yii::app()->request->baseUrl.'/images/data.png' ?>"/></div>
            <div class="col-lg-6"></div>
        </div>
      
    </div>
    <div class="panel-body">
        <div class="col-lg-12 container">
			<?php
				$form = $this->beginWidget(
					'CActiveForm',
					array(
						'id' => 'upload-form',
						'enableAjaxValidation' => false,
						'action'=>Yii::app()->createAbsoluteUrl('/recordatorios/default/subir'),
						'htmlOptions' => array('enctype' => 'multipart/form-data'),
					)
				);
				// ...
				echo $form->labelEx($model, 'datos');
				echo $form->fileField($model, 'datos');
				echo $form->error($model, 'datos');
				// ...
				echo CHtml::submitButton('Submit');
				$this->endWidget();

				if(isset($mensaje)){
					echo "<br>".$mensaje;
				}
			?>
        </div>
		
		<?php
			if(isset($exitosas)){
				echo "Subida completad: <br> Filas existosas " . $exitosas. "<br>Filas fallidas: " . $fallidas;
			}
		?>
    </div>
</div>
