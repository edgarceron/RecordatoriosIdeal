<?php

/**
 * This is the model class for table "citas_recordatorios".
 *
 * The followings are the available columns in table 'citas_recordatorios':
 * @property integer $id
 * @property string $nombre_paciente
 * @property string $fecha
 * @property string $nombre_profesional
 * @property string $direccion
 * @property string $mensaje
 * @property string $correo
 * @property string $telefono
 * @property string $sede
 */
class CitasRecordatorios extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'citas_recordatorios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre_paciente, fecha, nombre_profesional, direccion, mensaje', 'required'),
			array('nombre_paciente, nombre_profesional, sede', 'length', 'max'=>30),
			array('direccion', 'length', 'max'=>100),
			array('correo', 'length', 'max'=>255),
			array('telefono', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, nombre_paciente, fecha, nombre_profesional, direccion, mensaje, correo, telefono, sede', 'safe', 'on'=>'search'),
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
			'mensaje' => 'Mensaje',
			'correo' => 'Correo',
			'telefono' => 'Telefono',
			'sede' => 'Sede',
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
		$criteria->compare('mensaje',$this->mensaje,true);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('sede',$this->sede,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CitasRecordatorios the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
