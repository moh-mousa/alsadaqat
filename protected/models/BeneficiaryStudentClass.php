<?php

/**
 * This is the model class for table "beneficiary_student_class".
 *
 * The followings are the available columns in table 'beneficiary_student_class':
 * @property string $id
 * @property string $class_name
 * @property string $major_name
 * @property string $school_name
 * @property string $address
 * @property string $start_at
 * @property string $end_at
 * @property string $beneficiary_id
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property Beneficiary $beneficiary
 * @property OrganizationUser $owner
 */
class BeneficiaryStudentClass extends Aulaula
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'beneficiary_student_class';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('class_name, major_name, school_name, address, start_at, end_at, beneficiary_id', 'required'),
			array('class_name, major_name, school_name, address', 'length', 'max'=>255),
			array('beneficiary_id, owner_id', 'length', 'max'=>11),
			array('created_at, updated_at', 'safe'),
			
            array('updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'update'),
            array('created_at, updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on'=>'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, class_name, major_name, school_name, address, start_at, end_at, beneficiary_id, owner_id, created_at, updated_at', 'safe', 'on'=>'search'),

            array('owner_id', 'default', 'value' => Yii::app()->user->id, 'setOnEmpty' => false ),
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
			'beneficiary' => array(self::BELONGS_TO, 'Beneficiary', 'beneficiary_id'),
			'owner' => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('beneficiary_student_class','ID'),
			'class_name' => Yii::t('beneficiary_student_class','Class Name'),
			'major_name' => Yii::t('beneficiary_student_class','Major Name'),
			'school_name' => Yii::t('beneficiary_student_class','School Name'),
			'address' => Yii::t('beneficiary_student_class','Address'),
			'start_at' => Yii::t('beneficiary_student_class','Start At'),
			'end_at' => Yii::t('beneficiary_student_class','End At'),
			'beneficiary_id' => Yii::t('beneficiary_student_class','Beneficiary'),
			'owner_id' => Yii::t('beneficiary_student_class','Owner'),
			'created_at' => Yii::t('beneficiary_student_class','Created At'),
			'updated_at' => Yii::t('beneficiary_student_class','Updated At'),
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
		$criteria->compare('class_name',$this->class_name,true);
		$criteria->compare('major_name',$this->major_name,true);
		$criteria->compare('school_name',$this->school_name,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('start_at',$this->start_at,true);
		$criteria->compare('end_at',$this->end_at,true);
		$criteria->compare('beneficiary_id',$this->beneficiary_id,true);
		$criteria->compare('owner_id',$this->owner_id,true);
		$criteria->compare('created_at',$this->created_at,true);
		$criteria->compare('updated_at',$this->updated_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return BeneficiaryStudentClass the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
