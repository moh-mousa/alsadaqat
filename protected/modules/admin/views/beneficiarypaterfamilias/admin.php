<?php
$this->breadcrumbs=array(
	Yii::t('app', 'Beneficiary Paterfamiliases')=>array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu=array(
	array('label'=>Yii::t('BeneficiaryPaterfamilias', 'List Beneficiary Paterfamilias'),'url'=>array('index')),
	array('label'=>Yii::t('BeneficiaryPaterfamilias', 'Create Beneficiary Paterfamilias'),'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('beneficiary-paterfamilias-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('app', 'Manage Beneficiary Paterfamiliases')?></h1>

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
	'id'=>'beneficiary-paterfamilias-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
       array(
            'name'     => 'id',
            'value'    => '$this->grid->dataProvider->pagination->offset + $row+1',       //  row is zero based
            'filter'   => false,
            'sortable' => false,
        ),
		'paterfamilias_first_name',
		'paterfamilias_middle_name',
		'paterfamilias_grandfather_name',
		'paterfamilias_family_name',
		'paterfamilias_date_of_birth',
		/*
		'ssn',
		array(
            'name'  => 'beneficiary_relation_id',
            'type'  => 'raw',
            'filter'=> BeneficiaryRelation::model()->getOptions(),
            'value' => array($model, 'beneficiaryRelationNameFilter'), 
        ),
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
