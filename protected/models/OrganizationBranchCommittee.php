<?php

/**
 * This is the model class for table "organization_branch_committee".
 *
 * The followings are the available columns in table 'organization_branch_committee':
 * @property string $id
 * @property string $organization_branch_id
 * @property string $name
 * @property string $description
 * @property string $agenda
 * @property string $annual_plan
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property OrganizationBranch $organizationBranch
 * @property Owner $owner
 * @property OrganizationBranchCommitteeUser[] $organizationBranchCommitteeUsers
 */
class OrganizationBranchCommittee extends Aulaula
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'organization_branch_committee';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('organization_branch_id, name, description', 'required'),
			array('owner_id', 'length', 'max'=>11),
			array('name', 'length', 'max'=>255),
			array('description', 'length', 'max'=>512),
			array('agenda, annual_plan', 'length', 'max'=>1024),
			array('created_at, updated_at', 'safe'),
			
            array('updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'update'),
            array('created_at, updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on'=>'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, organization_branch_id, name, description, agenda, annual_plan, owner_id, created_at, updated_at', 'safe', 'on'=>'search'),
			
            
            array('organization_id, organization_branch_id', 'safe'),
            array('organization_id',        'default', 'value' => Yii::app()->user->organization_id,        'setOnEmpty' => TRUE ),
            array('organization_branch_id', 'default', 'value' => Yii::app()->user->organization_branch_id, 'setOnEmpty' => TRUE ),
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
		    'organization' => array(self::BELONGS_TO, 'Organization', 'organization_id'),
			'organizationBranch' => array(self::BELONGS_TO, 'OrganizationBranch', 'organization_branch_id'),
			'owner' => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
			'organizationBranchCommitteeUsers' => array(self::HAS_MANY, 'OrganizationBranchCommitteeUser', 'organization_branch_committee_id'),
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
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('organization_branch_country_committee','ID'),
			'organization_branch_id' => Yii::t('organization_branch_country_committee','Organization Branch'),
			'name' => Yii::t('organization_branch_country_committee','Name'),
			'description' => Yii::t('organization_branch_country_committee','Description'),
			'agenda' => Yii::t('organization_branch_country_committee','Agenda'),
			'annual_plan' => Yii::t('organization_branch_country_committee','Annual Plan'),
			'owner_id' => Yii::t('organization_branch_country_committee','Owner'),
			'created_at' => Yii::t('organization_branch_country_committee','Created At'),
			'updated_at' => Yii::t('organization_branch_country_committee','Updated At'),
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
		$criteria->compare('organization_branch_id',$this->organization_branch_id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('agenda',$this->agenda,true);
		$criteria->compare('annual_plan',$this->annual_plan,true);
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
	 * @return OrganizationBranchCommittee the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
    
    public function getOptions() {
        $criteria            = new CDbCriteria;
        $criteria->select    = 'id,name';

        return CHtml::listData($this->findAll($criteria), 'id', 'name');
    }
    
}
