<?php

class DefaultController extends Controller
{
	public function beforeAction() 
	{
		
		 $acciones = Yii::app()->getController()->actions();
		 

			foreach($acciones as $clave => $valor)    
			{
				$cri_val = new CDbCriteria();
				$cri_val->compare('modulo', $this->module->id);
				$cri_val->compare('accion', $clave);
				$verificar = Acciones::model()->find($cri_val);
				if(empty($verificar))
				{
					$validacion = new Acciones;
					$validacion->modulo = $this->module->id;
					$validacion->accion = $clave;
					$validacion->ruta = $valor;
					$validacion->save();
				}                    
				
			}
			return true;
	}
        
    public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}
        
	public function actions()
	{
		return array(
			'index'=>'application.modules.'.$this->module->id.'.controllers.acciones.IndexAction',  
			'formularioSubir'=>'application.modules.'.$this->module->id.'.controllers.acciones.FormularioSubirAction',
			'formularioOpciones'=>'application.modules.'.$this->module->id.'.controllers.acciones.FormularioOpcionesAction',
			'enviarCorreos'=>'application.modules.'.$this->module->id.'.controllers.acciones.EnviarCorreosAction',
			'enviarSms'=>'application.modules.'.$this->module->id.'.controllers.acciones.EnviarSmsAction',
			'enviarLlamadas'=>'application.modules.'.$this->module->id.'.controllers.acciones.EnviarLlamadasAction',
			'guardarOpciones'=>'application.modules.'.$this->module->id.'.controllers.acciones.GuardarOpcionesAction',
			'reporte'=>'application.modules.'.$this->module->id.'.controllers.acciones.ReporteAction',
			'reporteDetallado'=>'application.modules.'.$this->module->id.'.controllers.acciones.ReporteDetalladoAction',
			'subir'=>'application.modules.'.$this->module->id.'.controllers.acciones.SubirAction',
		);
	}
        
    public function accessRules()
	{
		return array(	
                        				
			array(
			'allow', // allow only the owner to perform 'view' 'update' 'delete' actions
			'actions' => array('index'),
			'expression' => array(__CLASS__,'allowIndex'),
			),
			array(
			'allow', 
			'actions' => array('formularioSubir'),
			'expression' => array(__CLASS__,'allowFormularioSubir'),
			),
			array(
			'allow', 
			'actions' => array('formularioOpciones'),
			'expression' => array(__CLASS__,'allowFomularioOpciones'),
            ),
			array(
			'allow', 
			'actions' => array('guardarOpciones'),
			'expression' => array(__CLASS__,'allowFomularioOpciones'),
            ),
			array(
			'allow', 
			'actions' => array('enviarCorreos'),
			'expression' => array(__CLASS__,'allowEnviarCorreos'),
            ),
			array(
			'allow', 
			'actions' => array('enviarLlamadas'),
			'expression' => array(__CLASS__,'allowEnviarLlamadas'),
            ),
			array(
			'allow', 
			'actions' => array('enviarSms'),
			'expression' => array(__CLASS__,'allowEnviarSms'),
            ),
			array(
			'allow', 
			'actions' => array('guardarOpciones'),
			'expression' => array(__CLASS__,'allowGuardarOpciones'),
            ),
			array(
			'allow', 
			'actions' => array('reporte'),
			'expression' => array(__CLASS__,'allowReporte'),
            ),
			array(
			'allow', 
			'actions' => array('reporteDetallado'),
			'expression' => array(__CLASS__,'allowReporteDetallado'),
            ),
			array(
			'allow', 
			'actions' => array('subir'),
			'expression' => array(__CLASS__,'allowSubir'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
			
		);
	}
        
    public function allowIndex()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'index');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'index'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
		
		return true;
	}
	
	public function allowFormularioSubir()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'formularioSubir'); //Cambiar esto cada ves que lo copie para una accion diferente
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'formularioSubir'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
     
	public function allowFomularioOpciones()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'formularioOpciones');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'formularioOpciones'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
		
		return true;
	}
	
	public function allowEnviarCorreos()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'enviarCorreos');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'enviarCorreos'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return t;
			}
		}
		else
		{
			return true;
		}
	}
	
	public function allowEnviarSms()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'enviarSms');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'enviarSms'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return true;
		}
	}
	
	public function allowEnviarLlamadas()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'enviarLlamadas');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'enviarLlamadas'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return true;
		}
	}
	
	public function allowGuardarOpciones()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'guardarOpciones');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'guardarOpciones'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	public function allowReporte()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'reporte');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'reporte'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	public function allowReporteDetallado()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'reporteDetallado');
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'reporteDetallado'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	public function allowSubir()
	{
		//Descomentar esta parte cuando ya hayan agregado el modulo
		if(Yii::app()->user->name != "Guest"){
			$usuario = SofintUsers::model()->findByPk(Yii::app()->user->id);
			$criteria = new CDbCriteria();            
			$modulo = 'Recordatorios';
			$criteria->compare('perfil', $usuario->perfil);
			$criteria->compare('modulo', $modulo);
			$criteria->compare('accion', 'subir'); //Cambiar esto cada ves que lo copie para una accion diferente
			$permisos = PerfilContenido::model()->find($criteria);
			if(count($permisos) == 1)
			{
				$criteria_log = new CDbCriteria();
				$criteria_log->compare('modulo', $modulo);
				$criteria_log->compare('accion', 'subir'); //Cambiar esto cada ves que lo copie para una accion diferente
				$accion_log = Acciones::model()->find($criteria_log);
				$log = new Logs;
				$log->accion = $accion_log->id;
				$log->usuario = Yii::app()->user->id;
				$log->save();
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
}