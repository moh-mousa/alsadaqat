<?php

/**
 * This is the model class for table "mosque_type".
 *
 * The followings are the available columns in table 'mosque_type':
 * @property string $id
 * @property string $name
 * @property double $construction_area
 * @property double $construction_cost
 * @property integer $construction_time
 * @property string $construction_type
 * @property string $furniture_type
 * @property integer $number_of_people
 * @property integer $number_of_restrooms
 * @property integer $number_of_floors
 * @property integer $number_of_entrances
 * @property string $has_female_area
 * @property string $has_sound_system
 * @property string $has_air_condition
 * @property string $agent_id
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property Mosque[] $mosques
 * @property MosqueAgent $agent
 * @property OrganizationUser $owner
 */
class MosqueType extends Aulaula {
	/**
	 * @return string the associated database table name
	 */
	public function tableName() {
		return 'mosque_type';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules() {
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, construction_area, construction_cost, construction_time, construction_type, number_of_people, number_of_restrooms, number_of_floors, number_of_entrances, agent_id, organization_id, organization_branch_id', 'required'),
			array('construction_time, number_of_people, number_of_restrooms, number_of_floors, number_of_entrances', 'numerical', 'integerOnly' => true),
			array('construction_cost', 'numerical'),
			array('name, construction_type, furniture_type', 'length', 'max'              => 255),
			array('has_female_area, has_sound_system, has_air_condition', 'length', 'max' => 3),
			array('organization_id, organization_branch_id, agent_id, owner_id', 'length', 'max'                                   => 11),
			array('created_at, updated_at', 'safe'),

			array('updated_at', 'default', 'value'             => new CDbExpression('NOW()'), 'setOnEmpty'             => false, 'on'             => 'update'),
			array('created_at, updated_at', 'default', 'value' => new CDbExpression('NOW()'), 'setOnEmpty' => false, 'on' => 'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, construction_area, construction_cost, construction_time, construction_type, furniture_type, number_of_people, number_of_restrooms, number_of_floors, number_of_entrances, has_female_area, has_sound_system, has_air_condition, agent_id, owner_id, organization_id, organization_branch_id, created_at, updated_at', 'safe', 'on' => 'search'),

			array('owner_id', 'default', 'value' => Yii::app()->user->id, 'setOnEmpty' => false),
			
            array('organization_id, organization_branch_id', 'safe'),
            array('organization_id',        'default', 'value' => Yii::app()->user->organization_id,        'setOnEmpty' => TRUE ),
            array('organization_branch_id', 'default', 'value' => Yii::app()->user->organization_branch_id, 'setOnEmpty' => TRUE ),
            
		);
	}

	public function defaultScope() {
		return array(
			'condition' => $this->getTableAlias(false, false).'.owner_id='.Yii::app()->user->id,
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations() {
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'mosques'            => array(self::HAS_MANY, 'Mosque', 'mosque_type_id'),
			'agent'              => array(self::BELONGS_TO, 'MosqueAgent', 'agent_id'),
			'owner'              => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
			'organization'       => array(self::BELONGS_TO, 'Organization', 'organization_id'),
            'organizationBranch' => array(self::BELONGS_TO, 'OrganizationBranch', 'organization_branch_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels() {
		return array(
			'id'                     => Yii::t('mosque_type', 'ID'),
			'organization_id'        => Yii::t('mosque_type','Organization'),
            'organization_branch_id' => Yii::t('mosque_type','Organization Branch'),
			'name'                => Yii::t('mosque_type', 'Name'),
			'construction_area'   => Yii::t('mosque_type', 'Construction Area'),
			'construction_cost'   => Yii::t('mosque_type', 'Construction Cost'),
			'construction_time'   => Yii::t('mosque_type', 'Construction Time'),
			'construction_type'   => Yii::t('mosque_type', 'Construction Type'),
			'furniture_type'      => Yii::t('mosque_type', 'Furniture Type'),
			'number_of_people'    => Yii::t('mosque_type', 'Number Of People'),
			'number_of_restrooms' => Yii::t('mosque_type', 'Number Of Restrooms'),
			'number_of_floors'    => Yii::t('mosque_type', 'Number Of Floors'),
			'number_of_entrances' => Yii::t('mosque_type', 'Number Of Entrances'),
			'has_female_area'     => Yii::t('mosque_type', 'Has Female Area'),
			'has_sound_system'    => Yii::t('mosque_type', 'Has Sound System'),
			'has_air_condition'   => Yii::t('mosque_type', 'Has Air Condition'),
			'agent_id'            => Yii::t('mosque_type', 'Agent'),
			'owner_id'            => Yii::t('mosque_type', 'Owner'),
			'created_at'          => Yii::t('mosque_type', 'Created At'),
			'updated_at'          => Yii::t('mosque_type', 'Updated At'),
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
	public function search() {
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria = new CDbCriteria;

		$criteria->compare('id', $this->id, true);
		$criteria->compare('name', $this->name, true);
		$criteria->compare('construction_area', $this->construction_area);
		$criteria->compare('construction_cost', $this->construction_cost);
		$criteria->compare('construction_time', $this->construction_time);
		$criteria->compare('construction_type', $this->construction_type, true);
		$criteria->compare('furniture_type', $this->furniture_type, true);
		$criteria->compare('number_of_people', $this->number_of_people);
		$criteria->compare('number_of_restrooms', $this->number_of_restrooms);
		$criteria->compare('number_of_floors', $this->number_of_floors);
		$criteria->compare('number_of_entrances', $this->number_of_entrances);
		$criteria->compare('has_female_area', $this->has_female_area, true);
		$criteria->compare('has_sound_system', $this->has_sound_system, true);
		$criteria->compare('has_air_condition', $this->has_air_condition, true);
		$criteria->compare('agent_id', $this->agent_id, true);
		$criteria->compare('owner_id', $this->owner_id, true);
        $criteria->compare('organization_id',$this->organization_id,true);
        $criteria->compare('organization_branch_id',$this->organization_branch_id,true);
		$criteria->compare('created_at', $this->created_at, true);
		$criteria->compare('updated_at', $this->updated_at, true);

		return new CActiveDataProvider($this, array(
				'criteria' => $criteria,
			));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return MosqueType the static model class
	 */
	public static function model($className = __CLASS__) {
		return parent::model($className);
	}

	public function getOptions() {
		$criteria         = new CDbCriteria;
		$criteria->select = 'id,name';
		//$criteria->addCondition('iso3 is NOT NUll AND iso3 !=""');

		return CHtml::listData($this->findAll($criteria), 'id', 'name');
	}
    
    public function getOptionsLabel() {
        $result = $this->findAll();
        $mosqueType = array();

        if ( $result ) {
            foreach ($result as $value) {
                $mosqueType[$value->id] = array( 'label' => 'tooltips', 'title' => $this->getAttributeLabel('construction_area') . ': ' . $value->construction_area . ', ' . $this->getAttributeLabel('number_of_people') . ': ' . $value->number_of_people );
            }
        }
        return $mosqueType;
    }
    
}
