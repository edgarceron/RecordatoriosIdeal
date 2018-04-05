<?php

/**
 * This is the model class for table "calls".
 *
 * The followings are the available columns in table 'calls':
 * @property string $id
 * @property string $id_campaign
 * @property string $phone
 * @property string $status
 * @property string $uniqueid
 * @property string $fecha_llamada
 * @property string $start_time
 * @property string $end_time
 * @property string $retries
 * @property string $duration
 * @property string $id_agent
 * @property string $transfer
 * @property string $datetime_entry_queue
 * @property integer $duration_wait
 * @property integer $dnc
 * @property string $date_init
 * @property string $date_end
 * @property string $time_init
 * @property string $time_end
 * @property string $agent
 * @property string $failure_cause
 * @property string $failure_cause_txt
 * @property string $datetime_originate
 * @property string $trunk
 * @property integer $scheduled
 *
 * The followings are the available model relations:
 * @property CallAttribute[] $callAttributes
 * @property CallProgressLog[] $callProgressLogs
 * @property CallRecording[] $callRecordings
 * @property Campaign $idCampaign
 * @property Agent $idAgent
 * @property CurrentCalls[] $currentCalls
 * @property FormDataRecolected[] $formDataRecolecteds
 */
class Calls extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'calls';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_campaign, phone', 'required'),
			array('duration_wait, dnc, scheduled', 'numerical', 'integerOnly'=>true),
			array('id_campaign, retries, duration, id_agent, failure_cause', 'length', 'max'=>10),
			array('phone, status, uniqueid, agent, failure_cause_txt', 'length', 'max'=>32),
			array('transfer', 'length', 'max'=>6),
			array('trunk', 'length', 'max'=>20),
			array('fecha_llamada, start_time, end_time, datetime_entry_queue, date_init, date_end, time_init, time_end, datetime_originate', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_campaign, phone, status, uniqueid, fecha_llamada, start_time, end_time, retries, duration, id_agent, transfer, datetime_entry_queue, duration_wait, dnc, date_init, date_end, time_init, time_end, agent, failure_cause, failure_cause_txt, datetime_originate, trunk, scheduled', 'safe', 'on'=>'search'),
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
			'callAttributes' => array(self::HAS_MANY, 'CallAttribute', 'id_call'),
			'callProgressLogs' => array(self::HAS_MANY, 'CallProgressLog', 'id_call_outgoing'),
			'callRecordings' => array(self::HAS_MANY, 'CallRecording', 'id_call_outgoing'),
			'idCampaign' => array(self::BELONGS_TO, 'Campaign', 'id_campaign'),
			'idAgent' => array(self::BELONGS_TO, 'Agent', 'id_agent'),
			'currentCalls' => array(self::HAS_MANY, 'CurrentCalls', 'id_call'),
			'formDataRecolecteds' => array(self::HAS_MANY, 'FormDataRecolected', 'id_calls'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_campaign' => 'Id Campaign',
			'phone' => 'Phone',
			'status' => 'Status',
			'uniqueid' => 'Uniqueid',
			'fecha_llamada' => 'Fecha Llamada',
			'start_time' => 'Start Time',
			'end_time' => 'End Time',
			'retries' => 'Retries',
			'duration' => 'Duration',
			'id_agent' => 'Id Agent',
			'transfer' => 'Transfer',
			'datetime_entry_queue' => 'Datetime Entry Queue',
			'duration_wait' => 'Duration Wait',
			'dnc' => 'Dnc',
			'date_init' => 'Date Init',
			'date_end' => 'Date End',
			'time_init' => 'Time Init',
			'time_end' => 'Time End',
			'agent' => 'Agent',
			'failure_cause' => 'Failure Cause',
			'failure_cause_txt' => 'Failure Cause Txt',
			'datetime_originate' => 'Datetime Originate',
			'trunk' => 'Trunk',
			'scheduled' => 'Scheduled',
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
		$criteria->compare('id_campaign',$this->id_campaign,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('uniqueid',$this->uniqueid,true);
		$criteria->compare('fecha_llamada',$this->fecha_llamada,true);
		$criteria->compare('start_time',$this->start_time,true);
		$criteria->compare('end_time',$this->end_time,true);
		$criteria->compare('retries',$this->retries,true);
		$criteria->compare('duration',$this->duration,true);
		$criteria->compare('id_agent',$this->id_agent,true);
		$criteria->compare('transfer',$this->transfer,true);
		$criteria->compare('datetime_entry_queue',$this->datetime_entry_queue,true);
		$criteria->compare('duration_wait',$this->duration_wait);
		$criteria->compare('dnc',$this->dnc);
		$criteria->compare('date_init',$this->date_init,true);
		$criteria->compare('date_end',$this->date_end,true);
		$criteria->compare('time_init',$this->time_init,true);
		$criteria->compare('time_end',$this->time_end,true);
		$criteria->compare('agent',$this->agent,true);
		$criteria->compare('failure_cause',$this->failure_cause,true);
		$criteria->compare('failure_cause_txt',$this->failure_cause_txt,true);
		$criteria->compare('datetime_originate',$this->datetime_originate,true);
		$criteria->compare('trunk',$this->trunk,true);
		$criteria->compare('scheduled',$this->scheduled);

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
	 * @return Calls the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
