<?php
$this->breadcrumbs=array(
	'Mosque Agents'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List MosqueAgent','url'=>array('index')),
	array('label'=>'Create MosqueAgent','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('mosque-agent-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Mosque Agents</h1>

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
	'id'=>'mosque-agent-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'company_name',
		'title',
		'fullname',
		'ssn',
		'gender',
		/*
		'email',
		'home_phone',
		'work_phone',
		'mobile',
		'address',
		'bank_name',
		'bank_branch_name',
		'bank_branch_number',
		'bank_swift_code',
		'bank_account_number',
		'personal_photo_path',
		'country_id',
		'city_id',
		'organization_id',
		'owner_id',
		'created_at',
		'updated_at',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
