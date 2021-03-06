<?php

/**
 * This is the model class for table "event".
 *
 * The followings are the available columns in table 'event':
 * @property string $id
 * @property string $organization_id
 * @property string $title
 * @property string $description
 * @property integer $number_of_days
 * @property string $event_type_id
 * @property string $country_id
 * @property string $city_id
 * @property integer $gallery_id
 * @property string $address
 * @property string $status
 * @property string $start_at
 * @property string $end_at
 * @property string $published
 * @property string $approved
 * @property string $owner_id
 * @property string $created_at
 * @property string $updated_at
 * @property string $notes
 * @property string $options
 *
 * The followings are the available model relations:
 * @property Organization $organization
 * @property EventType $eventType
 * @property Country $country
 * @property Owner $owner
 * @property City $city
 * @property EventActivity[] $eventActivities
 * @property EventAgenda[] $eventAgendas
 * @property EventPhoto[] $eventPhotos
 */
class Event extends Aulaula
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'event';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('organization_id, organization_branch_id, title, description, event_type_id, country_id, city_id, address, start_at, end_at', 'required'),
			array('gallery_id', 'numerical', 'integerOnly'=>true),
			array('number_of_days', 'numerical', 'integerOnly'=>true),
			array('organization_id, organization_branch_id, event_type_id, country_id, city_id, status, owner_id', 'length', 'max'=>11),
			array('title, address', 'length', 'max'=>255),
			array('description, notes, options', 'length', 'max'=>1024),
			array('published, approved', 'length', 'max'=>3),
			array('created_at, updated_at', 'safe'),
			
            array('updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'update'),
            array('created_at, updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on'=>'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, organization_id, organization_branch_id, title, description, number_of_days, event_type_id, country_id, city_id, gallery_id, address, status, start_at, end_at, published, approved, owner_id, created_at, updated_at, notes, options', 'safe', 'on'=>'search'),
			
            array('owner_id', 'default', 'value' => Yii::app()->user->id, 'setOnEmpty' => false ),
            
            array('organization_id, organization_branch_id', 'safe'),
            array('organization_id',        'default', 'value' => Yii::app()->user->organization_id,        'setOnEmpty' => TRUE ),
            array('organization_branch_id', 'default', 'value' => Yii::app()->user->organization_branch_id, 'setOnEmpty' => TRUE ),
            
		);
	}

	public function defaultScope() {
		return array(    
			'condition' => 	$this->getTableAlias(false, false) . '.organization_id='. Yii::app()->user->organization_id,
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
			'organization'       => array(self::BELONGS_TO, 'Organization', 'organization_id'),
			'organizationBranch' => array(self::BELONGS_TO, 'OrganizationBranch', 'organization_branch_id'),
			'eventType'          => array(self::BELONGS_TO, 'EventType', 'event_type_id'),
			'country'            => array(self::BELONGS_TO, 'Country', 'country_id'),
			'city'               => array(self::BELONGS_TO, 'City', 'city_id'),
			'owner'              => array(self::BELONGS_TO, 'OrganizationUser', 'owner_id'),
			'city'               => array(self::BELONGS_TO, 'City', 'city_id'),
			'eventActivities'    => array(self::HAS_MANY, 'EventActivity', 'event_id'),
			'eventAgendas'       => array(self::HAS_MANY, 'EventAgenda', 'event_id'),
			'eventPhotos'        => array(self::HAS_MANY, 'EventPhoto', 'event_id'),
			'gallery'            => array(self::BELONGS_TO, 'Gallery', 'gallery_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('event','ID'),
			'organization_id' => Yii::t('event','Organization'),
			'organization_branch_id' => Yii::t('event','Organization Branch'),
			'title' => Yii::t('event','Title'),
			'description' => Yii::t('event','Description'),
			'number_of_days' => Yii::t('event','Number Of Days'),
			'event_type_id' => Yii::t('event','Event Type'),
			'country_id' => Yii::t('event','Country'),
			'city_id' => Yii::t('event','City'),
			'address' => Yii::t('event','Address'),
			'gallery_id' => Yii::t('event','Gallery'),
			'status' => Yii::t('event','Status'),
			'start_at' => Yii::t('event','Start At'),
			'end_at' => Yii::t('event','End At'),
			'published' => Yii::t('event','Published'),
			'approved' => Yii::t('event','Approved'),
			'owner_id' => Yii::t('event','Owner'),
			'created_at' => Yii::t('event','Created At'),
			'updated_at' => Yii::t('event','Updated At'),
			'notes' => Yii::t('event','Notes'),
			'options' => Yii::t('event','Options'),
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
		$criteria->compare('number_of_days',$this->number_of_days);
		$criteria->compare('event_type_id',$this->event_type_id,true);
		$criteria->compare('country_id',$this->country_id,true);
		$criteria->compare('city_id',$this->city_id,true);
        $criteria->compare('gallery_id',$this->gallery_id);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('start_at',$this->start_at,true);
		$criteria->compare('end_at',$this->end_at,true);
		$criteria->compare('published',$this->published,true);
		$criteria->compare('approved',$this->approved,true);
		$criteria->compare('owner_id',$this->owner_id,true);
		$criteria->compare('created_at',$this->created_at,true);
		$criteria->compare('updated_at',$this->updated_at,true);
		$criteria->compare('notes',$this->notes,true);
		$criteria->compare('options',$this->options,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Event the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function getOptions(){
        $criteria         = new CDbCriteria;
        $criteria->select = 'id,title';
        //$criteria->addCondition('iso3 is NOT NUll AND iso3 !=""');

        return CHtml::listData($this->findAll($criteria),'id','title');
    }

    public function behaviors()
    {
        return array(
            'galleryBehavior' => array(
                'class' => 'GalleryBehavior',
                'idAttribute' => 'gallery_id',
                'versions' => array(
                    'small' => array(
                        'centeredpreview' => array(98, 98),
                    ),
                    'medium' => array(
                        'resize' => array(100, null),
                    )
                ),
                'name' => true,
                'description' => true,
            )
        );
    }

}
