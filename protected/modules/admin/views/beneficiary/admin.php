<?php
$this->breadcrumbs = array(
	Yii::t('app', 'Beneficiaries')=> array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu = array(
	array('label' => Yii::t('beneficiary', 'List Beneficiary'), 'url' => array('index')),
	array('label' => Yii::t('beneficiary', 'Create Beneficiary'), 'url' => array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('beneficiary-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('beneficiary', 'Manage Beneficiaries')?></h1>

<p>
<?php echo Yii::t('app', 'You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.')?>
</p>

<?php echo CHtml::link(Yii::t('app', 'Advanced Search'), '#', array('class' => 'search-button btn'));?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search', array(
		'model' => $model,
	));?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView', array(
		'id'           => 'beneficiary-grid',
		'dataProvider' => $model->search(),
		'filter'       => $model,
		'columns'      => array(
           array(
                'name'     => 'id',
                'value'    => '$this->grid->dataProvider->pagination->offset + $row+1',       //  row is zero based
                'filter'   => false,
                'sortable' => false,
            ),
			'full_name',
			'ssn',
			array(
				'name'  => 'gender',
				'value' => array($model, 'getTranslatedGender'),
			),
			'date_of_birth',
			'email',
			/*
			'home_phone',
			'mobile',
			'address',
			'personal_photo_path',
			array(
			'name'  => 'nationality_id',
			'type'  => 'raw',
			'filter'=> Country::model()->getOptions(),
			'value' => array($model, 'nationalityFilter'),
			),
			array(
			'name'  => 'country_id',
			'type'  => 'raw',
			'filter'=> Country::model()->getOptions(),
			'value' => array($model, 'countryFilter'),
			),		'city_id',
			'beneficiary_type',
			'has_paterfamilias',
			'has_family_members',
			'has_home',
			'has_income',
			'organization_id',
			array(
			'name'  => 'organization_branch_id',
			'type'  => 'raw',
			'filter'=> OrganizationBranch::model()->getOptions(),
			'value' => array($model, 'organizationBranchFilter'),
			),
			array(
			'name'  => array(
			'name'  => 'beneficiary_id',
			'type'  => 'raw',
			'filter'=> Beneficiary::model()->getOptions(),
			'value' => array($model, 'beneficiaryFullNameFilter'),
			),
			'type'  => 'raw',
			'filter'=> Donator::model()->getOptions(),
			'value' => array($model, 'donatorFilter'),
			),
			'owner_id',
			'created_at',
			'updated_at',
			'notes',
			'options',
			 */
			array(
				'class' => 'bootstrap.widgets.TbButtonColumn',
			),
		),
	));?>
