<?php
/* @var $this OpcionesController */
/* @var $model Opciones */
/* @var $form CActiveForm */
?>

<div class="row">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'opciones-opciones-form',
    'action'=> Yii::app()->createAbsoluteUrl('/recordatorios/default/guardarOpciones') ,
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// See class documentation of CActiveForm for details on this,
	// you need to use the performAjaxValidation()-method described there.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($num_recordatorios); ?>

    <div class="col-lg-4">
	<div class="form-group">
		<?php echo CHtml::label(CHtml::encode('Numero de recordatorios'),'opcion',array('class'=>'label label-success')); ?>
		<?php echo CHtml::dropDownList('opcion',$num_recordatorios->valor,array('1'=>'1', '2'=>'2', '3'=>'3')); ?>
		<?php echo $form->error($num_recordatorios,'valor'); ?>
	</div>
    </div>

    <div class="col-lg-4">
	<div class="form-group">
		<?php echo CHtml::label('Numero de campaña','opcion_c',array('class'=>'label label-success')); ?>
		<?php echo CHtml::dropDownList('opcion_c',$num_campana->valor,$campanas); ?>
		<?php echo $form->error($num_campana,'valor'); ?>
	</div>
    </div>

    <div class="col-lg-4">
	<div class="form-group">
		<?php echo CHtml::label('Recordar cuantos días antes','opcion_d',array('class'=>'label label-success')); ?>
		<?php echo CHtml::dropDownList('opcion_d',$dias_antes->valor,array('1'=>'1', '2'=>'2', '3'=>'3', '4'=>'4', '5'=>'5')); ?>
		<?php echo $form->error($dias_antes,'valor'); ?>
	</div>
    </div>    

    <div class="col-lg-12">
	<div class="form-group">
		<?php echo CHtml::submitButton('Submit',array('class'=>'btn btn-primary')); ?>
	</div>
    </div>
<?php $this->endWidget(); ?>

</div><!-- form -->