<?php

/**
 * This is the model class for table "beneficiary_poor".
 *
 * The followings are the available columns in table 'beneficiary_poor':
 * @property string $id
 * @property string $father_full_name
 * @property string $is_father_alive
 * @property string $father_job
 * @property string $father_date_of_birth
 * @property string $father_date_of_death
 * @property string $father_reason_of_death
 * @property string $father_death_certificate_path
 * @property string $mother_full_name
 * @property string $is_mother_alive
 * @property string $mother_job
 * @property string $mother_date_of_birth
 * @property string $mother_date_of_death
 * @property string $mother_reason_of_death
 * @property string $mother_death_certificate_path
 * @property integer $number_of_brothers
 * @property integer $number_of_sisters
 * @property string $beneficiary_id
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property Beneficiary $beneficiary
 * @property OrganizationUser $owner
 */
class BeneficiaryPoor extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'beneficiary_poor';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('father_full_name, father_job, mother_full_name, mother_job, number_of_brothers, number_of_sisters, beneficiary_id, owner_id', 'required'),
			array('number_of_brothers, number_of_sisters', 'numerical', 'integerOnly'=>true),
			array('father_full_name, father_job, father_reason_of_death, father_death_certificate_path, mother_full_name, mother_job, mother_reason_of_death, mother_death_certificate_path', 'length', 'max'=>255),
			array('is_father_alive, is_mother_alive', 'length', 'max'=>3),
			array('beneficiary_id, owner_id', 'length', 'max'=>11),
			array('father_date_of_birth, father_date_of_death, mother_date_of_birth, mother_date_of_death, created_at, updated_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, father_full_name, is_father_alive, father_job, father_date_of_birth, father_date_of_death, father_reason_of_death, father_death_certificate_path, mother_full_name, is_mother_alive, mother_job, mother_date_of_birth, mother_date_of_death, mother_reason_of_death, mother_death_certificate_path, number_of_brothers, number_of_sisters, beneficiary_id, owner_id, created_at, updated_at', 'safe', 'on'=>'search'),
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
			'id' => Yii::t('beneficiary_poor','ID'),
			'father_full_name' => Yii::t('beneficiary_poor','Father Full Name'),
			'is_father_alive' => Yii::t('beneficiary_poor','Is Father Alive'),
			'father_job' => Yii::t('beneficiary_poor','Father Job'),
			'father_date_of_birth' => Yii::t('beneficiary_poor','Father Date Of Birth'),
			'father_date_of_death' => Yii::t('beneficiary_poor','Father Date Of Death'),
			'father_reason_of_death' => Yii::t('beneficiary_poor','Father Reason Of Death'),
			'father_death_certificate_path' => Yii::t('beneficiary_poor','Father Death Certificate Path'),
			'mother_full_name' => Yii::t('beneficiary_poor','Mother Full Name'),
			'is_mother_alive' => Yii::t('beneficiary_poor','Is Mother Alive'),
			'mother_job' => Yii::t('beneficiary_poor','Mother Job'),
			'mother_date_of_birth' => Yii::t('beneficiary_poor','Mother Date Of Birth'),
			'mother_date_of_death' => Yii::t('beneficiary_poor','Mother Date Of Death'),
			'mother_reason_of_death' => Yii::t('beneficiary_poor','Mother Reason Of Death'),
			'mother_death_certificate_path' => Yii::t('beneficiary_poor','Mother Death Certificate Path'),
			'number_of_brothers' => Yii::t('beneficiary_poor','Number Of Brothers'),
			'number_of_sisters' => Yii::t('beneficiary_poor','Number Of Sisters'),
			'beneficiary_id' => Yii::t('beneficiary_poor','Beneficiary'),
			'owner_id' => Yii::t('beneficiary_poor','Owner'),
			'created_at' => Yii::t('beneficiary_poor','Created At'),
			'updated_at' => Yii::t('beneficiary_poor','Updated At'),
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
		$criteria->compare('father_full_name',$this->father_full_name,true);
		$criteria->compare('is_father_alive',$this->is_father_alive,true);
		$criteria->compare('father_job',$this->father_job,true);
		$criteria->compare('father_date_of_birth',$this->father_date_of_birth,true);
		$criteria->compare('father_date_of_death',$this->father_date_of_death,true);
		$criteria->compare('father_reason_of_death',$this->father_reason_of_death,true);
		$criteria->compare('father_death_certificate_path',$this->father_death_certificate_path,true);
		$criteria->compare('mother_full_name',$this->mother_full_name,true);
		$criteria->compare('is_mother_alive',$this->is_mother_alive,true);
		$criteria->compare('mother_job',$this->mother_job,true);
		$criteria->compare('mother_date_of_birth',$this->mother_date_of_birth,true);
		$criteria->compare('mother_date_of_death',$this->mother_date_of_death,true);
		$criteria->compare('mother_reason_of_death',$this->mother_reason_of_death,true);
		$criteria->compare('mother_death_certificate_path',$this->mother_death_certificate_path,true);
		$criteria->compare('number_of_brothers',$this->number_of_brothers);
		$criteria->compare('number_of_sisters',$this->number_of_sisters);
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
	 * @return BeneficiaryPoor the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}