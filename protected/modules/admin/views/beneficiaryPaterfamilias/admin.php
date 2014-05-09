<?php
$this->breadcrumbs=array(
	'Beneficiary Paterfamiliases'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List BeneficiaryPaterfamilias','url'=>array('index')),
	array('label'=>'Create BeneficiaryPaterfamilias','url'=>array('create')),
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

<h1>Manage Beneficiary Paterfamiliases</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
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
		'id',
		'paterfamilias_first_name',
		'paterfamilias_middle_name',
		'paterfamilias_grandfather_name',
		'paterfamilias_family_name',
		'paterfamilias_date_of_birth',
		/*
		'ssn',
		'beneficiary_relation_id',
		'beneficiary_id',
		'owner_id',
		'created_at',
		'updated_at',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
