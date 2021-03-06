<?php

/**
 * This is the model class for table "organization_position".
 *
 * The followings are the available columns in table 'organization_position':
 * @property string $id
 * @property string $organization_id
 * @property string $title
 * @property string $description
 * @property string $qualifications
 * @property string $responsibilities
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property Organization $organization
 * @property OrganizationUser $owner
 * @property OrganizationBranch $organizationBranch
 */
class OrganizationPosition extends Aulaula
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'organization_position';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, description', 'required'),
			array('organization_id, organization_branch_id, owner_id', 'length', 'max'=>11),
			array('title, qualifications, responsibilities', 'length', 'max'=>255),
			array('description', 'length', 'max'=>512),
			array('created_at, updated_at', 'safe'),
			
            array('updated_at',             'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'update'),
            array('created_at, updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, organization_id, organization_branch_id, title, description, qualifications, responsibilities, owner_id, created_at, updated_at', 'safe', 'on'=>'search'),
			
            array('organization_id, organization_branch_id', 'safe'),
            array('owner_id',               'default', 'value' => Yii::app()->user->id,                     'setOnEmpty' => FALSE ),
            array('organization_id',        'default', 'value' => Yii::app()->user->organization_id,        'setOnEmpty' => TRUE ),
            array('organization_branch_id', 'default', 'value' => Yii::app()->user->organization_branch_id, 'setOnEmpty' => TRUE ),
		);
	}

	public function defaultScope() {
	    if( ! Yii::app()->user->isSuperuser ) {
	        return array(    
                'condition' =>  $this->getTableAlias(false, false) . '.organization_id='. Yii::app()->user->organization_id,
            );
	    } else {
	        return array();
	    }
		
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			//'organizationBranchCommitteeUsers' => array(self::HAS_MANY, 'OrganizationBranchCommitteeUser', 'organization_position_id'),
			//'organization' => array(self::BELONGS_TO, 'Organization', 'organization_id'),
			//'owner' => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
			
            'organization' => array(self::BELONGS_TO, 'Organization', 'organization_id'),
            'owner' => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
            'organizationBranch' => array(self::BELONGS_TO, 'OrganizationBranch', 'organization_branch_id'),
            
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('organization_position','ID'),
			'organization_id' => Yii::t('organization_position','Organization'),
			'organization_branch_id' => Yii::t('organization_position','Organization Branch'),
			'title' => Yii::t('organization_position','Title'),
			'description' => Yii::t('organization_position','Description'),
			'qualifications' => Yii::t('organization_position','Qualifications'),
			'responsibilities' => Yii::t('organization_position','Responsibilities'),
			'owner_id' => Yii::t('organization_position','Owner'),
			'created_at' => Yii::t('organization_position','Created At'),
			'updated_at' => Yii::t('organization_position','Updated At'),
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
		$criteria->compare('organization_id',$this->organization_id,true);
        $criteria->compare('organization_branch_id',$this->organization_branch_id,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('qualifications',$this->qualifications,true);
		$criteria->compare('responsibilities',$this->responsibilities,true);
		$criteria->compare('owner_id',$this->owner_id,true);
		$criteria->compare('created_at',$this->created_at,true);
		$criteria->compare('updated_at',$this->updated_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
    
    public function getOptions() {
        $criteria            = new CDbCriteria;
        $criteria->select    = 'id,title';
        $criteria->condition = 'organization_id = '.Yii::app()->user->organization_id;

        return CHtml::listData($this->findAll($criteria), 'id', 'title');
    }

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return OrganizationPosition the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
