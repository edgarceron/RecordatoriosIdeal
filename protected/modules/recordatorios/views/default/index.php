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
            <div class="col-lg-6 text-left"><img alt="Bootstrap Image Preview" src="<?php echo Yii::app()->request->baseUrl.'/images/icon.png' ?>"/></div>
            <div class="col-lg-6"></div>
        </div>
      
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="container row">
            <div class="col-lg-6 text-left"><img alt="Bootstrap Image Preview" src="<?php echo Yii::app()->request->baseUrl.'/images/data.png' ?>"/></div>
            <div class="col-lg-6"></div>
        </div>
      
    </div>
    <div class="panel-body">
        <div class="col-lg-12 container">
			<?php echo CHtml::link('Subir recordatorios',array('formularioSubir')); ?>
			<br>
			<?php echo CHtml::link('Reporte recordatorios',array('reporte')); ?>
			<br>
			<?php echo CHtml::link('Reporte de llamadas',array('reporteLlamadas')); ?>
			<br>
			<?php echo CHtml::link('Opciones',array('formularioOpciones')); ?>
        </div>
    </div>
</div>
