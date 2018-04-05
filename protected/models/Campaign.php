<?php

/**
 * This is the model class for table "campaign".
 *
 * The followings are the available columns in table 'campaign':
 * @property string $id
 * @property string $name
 * @property string $datetime_init
 * @property string $datetime_end
 * @property string $daytime_init
 * @property string $daytime_end
 * @property string $retries
 * @property string $trunk
 * @property string $context
 * @property string $queue
 * @property string $max_canales
 * @property string $num_completadas
 * @property string $promedio
 * @property string $desviacion
 * @property string $script
 * @property string $estatus
 * @property string $id_url
 *
 * The followings are the available model relations:
 * @property CallProgressLog[] $callProgressLogs
 * @property Calls[] $calls
 * @property CampaignExternalUrl $idUrl
 * @property Form[] $forms
 */
class Campaign extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'campaign';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, datetime_init, datetime_end, daytime_init, daytime_end, context, queue, script', 'required'),
			array('name', 'length', 'max'=>64),
			array('retries, max_canales, num_completadas, promedio, desviacion, id_url', 'length', 'max'=>10),
			array('trunk', 'length', 'max'=>255),
			array('context', 'length', 'max'=>32),
			array('queue', 'length', 'max'=>16),
			array('estatus', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, datetime_init, datetime_end, daytime_init, daytime_end, retries, trunk, context, queue, max_canales, num_completadas, promedio, desviacion, script, estatus, id_url', 'safe', 'on'=>'search'),
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
			'callProgressLogs' => array(self::HAS_MANY, 'CallProgressLog', 'id_campaign_outgoing'),
			'calls' => array(self::HAS_MANY, 'Calls', 'id_campaign'),
			'idUrl' => array(self::BELONGS_TO, 'CampaignExternalUrl', 'id_url'),
			'forms' => array(self::MANY_MANY, 'Form', 'campaign_form(id_campaign, id_form)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'datetime_init' => 'Datetime Init',
			'datetime_end' => 'Datetime End',
			'daytime_init' => 'Daytime Init',
			'daytime_end' => 'Daytime End',
			'retries' => 'Retries',
			'trunk' => 'Trunk',
			'context' => 'Context',
			'queue' => 'Queue',
			'max_canales' => 'Max Canales',
			'num_completadas' => 'Num Completadas',
			'promedio' => 'Promedio',
			'desviacion' => 'Desviacion',
			'script' => 'Script',
			'estatus' => 'Estatus',
			'id_url' => 'Id Url',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('datetime_init',$this->datetime_init,true);
		$criteria->compare('datetime_end',$this->datetime_end,true);
		$criteria->compare('daytime_init',$this->daytime_init,true);
		$criteria->compare('daytime_end',$this->daytime_end,true);
		$criteria->compare('retries',$this->retries,true);
		$criteria->compare('trunk',$this->trunk,true);
		$criteria->compare('context',$this->context,true);
		$criteria->compare('queue',$this->queue,true);
		$criteria->compare('max_canales',$this->max_canales,true);
		$criteria->compare('num_completadas',$this->num_completadas,true);
		$criteria->compare('promedio',$this->promedio,true);
		$criteria->compare('desviacion',$this->desviacion,true);
		$criteria->compare('script',$this->script,true);
		$criteria->compare('estatus',$this->estatus,true);
		$criteria->compare('id_url',$this->id_url,true);

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
	 * @return Campaign the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
