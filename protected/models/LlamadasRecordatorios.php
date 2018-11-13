<?php

/**
 * This is the model class for table "llamadas_recordatorios".
 *
 * The followings are the available columns in table 'llamadas_recordatorios':
 * @property integer $id
 * @property string $nombre_paciente
 * @property string $fecha
 * @property string $nombre_profesional
 * @property string $direccion
 * @property string $servicio
 * @property string $mensaje
 * @property string $correo
 * @property string $telefono
 * @property string $sede
 * @property integer $id_cita_recordatorio
 * @property string $fecha_cita_recordatorio
 */
class LlamadasRecordatorios extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'llamadas_recordatorios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, nombre_paciente, fecha, nombre_profesional, direccion, servicio, mensaje', 'required'),
			array('id, id_cita_recordatorio', 'numerical', 'integerOnly'=>true),
			array('sede', 'length', 'max'=>30),
			array('fecha', 'length', 'max'=>50),
			array('nombre_paciente, nombre_profesional', 'length', 'max'=>60),
			array('direccion', 'length', 'max'=>100),
			array('servicio', 'length', 'max'=>40),
			array('correo', 'length', 'max'=>255),
			array('telefono', 'length', 'max'=>12),
			array('fecha_cita_recordatorio', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, nombre_paciente, fecha, nombre_profesional, direccion, servicio, mensaje, correo, telefono, sede, id_cita_recordatorio, fecha_cita_recordatorio', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre_paciente' => 'Nombre Paciente',
			'fecha' => 'Fecha',
			'nombre_profesional' => 'Nombre Profesional',
			'direccion' => 'Direccion',
			'servicio' => 'Servicio',
			'mensaje' => 'Mensaje',
			'correo' => 'Correo',
			'telefono' => 'Telefono',
			'sede' => 'Sede',
			'id_cita_recordatorio' => 'Id Cita Recordatorio',
			'fecha_cita_recordatorio' => 'Fecha Cita Recordatorio',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('nombre_paciente',$this->nombre_paciente,true);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('nombre_profesional',$this->nombre_profesional,true);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('servicio',$this->servicio,true);
		$criteria->compare('mensaje',$this->mensaje,true);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('sede',$this->sede,true);
		$criteria->compare('id_cita_recordatorio',$this->id_cita_recordatorio);
		$criteria->compare('fecha_cita_recordatorio',$this->fecha_cita_recordatorio,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * @return CDbConnection the database connection used for this class
	 */
	public function getDbConnection()
	{
		return Yii::app()->call_center;
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return LlamadasRecordatorios the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
