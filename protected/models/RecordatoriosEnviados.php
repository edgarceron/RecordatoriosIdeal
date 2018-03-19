<?php

/**
 * This is the model class for table "recordatorios_enviados".
 *
 * The followings are the available columns in table 'recordatorios_enviados':
 * @property integer $id_cita_recordatorio
 * @property string $fecha
 * @property string $tipo
 *
 * The followings are the available model relations:
 * @property CitasRecordatorios $idCitaRecordatorio
 */
class RecordatoriosEnviados extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'recordatorios_enviados';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_cita_recordatorio, fecha, tipo', 'required'),
			array('id_cita_recordatorio', 'numerical', 'integerOnly'=>true),
			array('tipo', 'length', 'max'=>6),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_cita_recordatorio, fecha, tipo', 'safe', 'on'=>'search'),
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
			'idCitaRecordatorio' => array(self::BELONGS_TO, 'CitasRecordatorios', 'id_cita_recordatorio'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_cita_recordatorio' => 'Id Cita Recordatorio',
			'fecha' => 'Fecha',
			'tipo' => 'Tipo',
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

		$criteria->compare('id_cita_recordatorio',$this->id_cita_recordatorio);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('tipo',$this->tipo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return RecordatoriosEnviados the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
