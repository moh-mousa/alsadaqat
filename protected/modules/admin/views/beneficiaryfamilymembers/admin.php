<?php
$this->breadcrumbs=array(
	Yii::t('app', 'Beneficiary Family Members')=>array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu=array(
	array('label'=> Yii::t('BeneficiaryFamilyMembers', 'List Family Members'),'url'=>array('index')),
	array('label'=> Yii::t('BeneficiaryFamilyMembers', 'Create Family Members'),'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('beneficiary-family-members-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('app', 'Manage Beneficiary Family Members')?></h1>

<p>
<?php echo Yii::t('app', 'You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.' ) ?>

</p>

<?php echo CHtml::link(Yii::t('app', 'Advanced Search'),'#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'beneficiary-family-members-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
       array(
            'name'     => 'id',
            'value'    => '$this->grid->dataProvider->pagination->offset + $row+1',       //  row is zero based
            'filter'   => false,
            'sortable' => false,
        ),
		'full_name',
		'ssn',
		'date_of_birth',
		array(
            'name'  => 'beneficiary_relation_id',
            'type'  => 'raw',
            'filter'=> BeneficiaryRelation::model()->getOptions(),
            'value' => array($model, 'beneficiaryRelationNameFilter'), 
        ),
		'marital_status',
		/*
		'educational_status',
		'health_status',
		'business',
		'other',
		array(
            'name'  => 'beneficiary_id',
            'type'  => 'raw',
            'filter'=> Beneficiary::model()->getOptions(),
            'value' => array($model, 'beneficiaryFullNameFilter'), 
        ),
		'owner_id',
		'created_at',
		'updated_at',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
