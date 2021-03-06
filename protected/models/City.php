<?php

/**
 * This is the model class for table "city".
 *
 * The followings are the available columns in table 'city':
 * @property string $id
 * @property string $country_id
 * @property string $name
 * @property string $name_ar
 * @property string $published
 * @property string $population_count
 * @property string $houses_count
 * @property string $distance_to_capital
 * @property string $created_at
 * @property string $updated_at
 *
 * The followings are the available model relations:
 * @property Beneficiary[] $beneficiaries
 * @property Country $country
 * @property Event[] $events
 * @property Mosque[] $mosques
 * @property MosqueAgent[] $mosqueAgents
 * @property OrganizationBranch[] $organizationBranches
 */
class City extends Aulaula
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'city';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('country_id, name, name_ar', 'required'),
			array('country_id, population_count, houses_count, distance_to_capital', 'length', 'max'=>11),
			array('name', 'length', 'max'=>128),
			array('name_ar', 'length', 'max'=>255),
			array('published', 'length', 'max'=>3),
			array('created_at, updated_at', 'safe'),
			
            array('updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on' => 'update'),
            array('created_at, updated_at', 'default', 'value' => new CDbExpression( 'NOW()' ), 'setOnEmpty' => false, 'on'=>'insert'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, country_id, name, name_ar, published, population_count, houses_count, distance_to_capital, created_at, updated_at', 'safe', 'on'=>'search'),
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
			'beneficiaries' => array(self::HAS_MANY, 'Beneficiary', 'city_id'),
			'country' => array(self::BELONGS_TO, 'Country', 'country_id'),
			'events' => array(self::HAS_MANY, 'Event', 'city_id'),
			'mosques' => array(self::HAS_MANY, 'Mosque', 'city_id'),
			'mosqueAgents' => array(self::HAS_MANY, 'MosqueAgent', 'city_id'),
			'organizationBranches' => array(self::HAS_MANY, 'OrganizationBranch', 'city_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('city','ID'),
			'country_id' => Yii::t('city','Country'),
			'name' => Yii::t('city','Name'),
			'name_ar' => Yii::t('city','Name Ar'),
			'published' => Yii::t('city','Published'),
            'population_count' => Yii::t('city','Population Count'),
            'houses_count' => Yii::t('city','Houses Count'),
            'distance_to_capital' => Yii::t('city','Distance To Capital'),
			'created_at' => Yii::t('city','Created At'),
			'updated_at' => Yii::t('city','Updated At'),
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
		$criteria->compare('country_id',$this->country_id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('name_ar',$this->name_ar,true);
		$criteria->compare('published',$this->published,true);
        $criteria->compare('population_count',$this->population_count,true);
        $criteria->compare('houses_count',$this->houses_count,true);
        $criteria->compare('distance_to_capital',$this->distance_to_capital,true);
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
	 * @return City the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
    
    /**
     * Begin Scopes Functions 
     */
    public function published( $published ) {
        $this -> getDbCriteria() -> mergeWith(
        array(
            'condition' => $this -> getTableAlias(false) . ".published = '$published'",
            )
        );
        return $this;
    }
    /**
     * End Scopes Functions 
     */

    public function getOptions( $countryId=null ){
        $criteria         = new CDbCriteria;
        $criteria->select = 'id,name,name_ar';
        $criteria->scopes = array('published' => 'Yes');

        if( $countryId !== null ) {
            $criteria->addCondition('country_id = :country_id');
            $criteria->params=array(':country_id' => $countryId );
        }

        $criteria->order  = (Yii::app()->language == 'en') ? 'name ASC' : 'name_ar ASC';

        return CHtml::listData($this->findAll($criteria), 
                'id', Yii::app()->language == 'en' ? 'name' : 'name_ar');  
    }
    
    
}
