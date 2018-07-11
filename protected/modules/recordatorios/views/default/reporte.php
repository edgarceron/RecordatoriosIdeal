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
            <div class="col-lg-6">
		
			</div>
        </div>
    </div>
	
	<div class="panel-body">
	
		<?php 
		$form=$this->beginWidget(
			'CActiveForm', 
			array(
				'id'=>'recordatorios-form',
				'action'=>Yii::app()->createAbsoluteUrl('recordatorios/default/reporte'),
				'enableAjaxValidation'=>false,
				'method'=>'get',
			)
		); 
		?>
		<div class="col-lg-3">
			<div class="form-group">
				<?php echo CHtml::label('Buscar en rango de fechas de la cita: ', 'labelInfo',array('class'=>'label label-success'));?>
			</div>
		</div>
		
		<div class="col-lg-3">
			<div class="form-group">
				<?php echo CHtml::label('Desde', 'fecha_desde',array('class'=>'label label-success'));?>
				<?php 
					echo CHtml::dateField(
						'fecha_desde', 
						$fecha_desde,
						array(
							'id'=>'fecha_desde',
							'class'=>'form-control',					
							'maxlength'=>10)
					); 
				?>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="form-group">
				<?php echo CHtml::label('Hasta', 'fecha_hasta',array('class'=>'label label-success'));?>
				<?php 
					echo CHtml::dateField(
						'fecha_hasta', 
						$fecha_hasta,
						array(
							'id'=>'fecha_hasta',
							'class'=>'form-control',					
							'maxlength'=>10)
					); 
				?>
			</div>
		</div>
		
		<div class="col-lg-3">
			<div class="form-group">
				<?php echo CHtml::label('Telefono', 'telefono',array('class'=>'label label-success'));?>
				<?php 
					echo CHtml::textField(
						'telefono', 
						$telefono,
						array(
							'id'=>'telefono',
							'class'=>'form-control',					
							'maxlength'=>10)
					); 
				?>
			</div>
		</div>
		
		<div class="col-lg-3">
			<div class="form-group">
				<?php echo CHtml::label('Correo', 'correo',array('class'=>'label label-success'));?>
				<?php 
					echo CHtml::textField(
						'correo', 
						$correo,
						array(
							'id'=>'correo',
							'class'=>'form-control')
					); 
				?>
			</div>
		</div>
		
		<div class="col-lg-3">
			<?php echo CHtml::submitButton('Buscar',array('class'=>'btn btn-info')); ?>
		</div>
		<?php $this->endWidget(); ?>
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
        <?php
			if(isset($reporte)){
				Yii::app()->controller->widget(
					'zii.widgets.grid.CGridView', array(	
						'id'=>'reporte-grid',//Reemplazar Model por el modelo que corresponda
						'dataProvider'=>$reporte,
						'pager' => array('cssFile' => Yii::app()->baseUrl . '/css/bootstrap.min.css'),
						'cssFile' => Yii::app()->baseUrl . '/css/bootstrap.min.css',
						'itemsCssClass' => 'table table-hover table-striped',
						'columns'=>array(
							array(
								'name'=>'idCitaRecordatorio.nombre_paciente',
							),
							array(
								'name'=>'idCitaRecordatorio.fecha',
							),
							array(
								'name'=>'idCitaRecordatorio.nombre_profesional',
							),
							array(
								'name'=>'idCitaRecordatorio.telefono',
							),
							array(
								'name'=>'idCitaRecordatorio.correo',
							),
							array(
								'name'=>'enviados',
								'value'=>'CHtml::link($data->enviados,array("reporteDetallado",
                                         "id"=>$data->id_cita_recordatorio))',
								'type'=>'raw',
							),
							
						),
					)
				);
			}
		?>
		
	
    </div>
	
    <div class="panel-body">
        <div class="col-lg-12 container">
			<?php echo CHtml::link('Subir recordatorios',array('formularioSubir')); ?>
			<br>
			<?php echo CHtml::link('Reporte recordatorios',array('reporte')); ?>
			<br>
			<?php echo CHtml::link('Opciones',array('formularioOpciones')); ?>
        </div>
    </div>
</div>
