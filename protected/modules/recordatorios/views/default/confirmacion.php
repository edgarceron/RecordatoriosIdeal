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
			<h4><?php echo $mensaje; ?> </h4>
			
			<?php 
			if(!($filas == "")){
				echo "<h4>Descripción: </h4>";
				echo $filas;
			} ?>
			
			
			<?php 
			if(!($error == "")){
				echo "<h4>Errores criticos: </h4>";
				echo $error;
			} ?>
        </div>
    </div>
</div>
