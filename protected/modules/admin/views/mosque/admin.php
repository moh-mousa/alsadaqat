<?php
$this->breadcrumbs=array(
	Yii::t('app', 'Mosques')=>array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu=array(
	array('label'=>Yii::t('Mosque', 'List Mosque'),'url'=>array('index')),
	array('label'=>Yii::t('Mosque', 'Create Mosque'),'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('mosque-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('app', 'Manage Mosques')?></h1>

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

<?php 
//$this->widget('bootstrap.widgets.TbGridView',array(
$this->widget('yiiwheels.widgets.grid.WhGridView', array(
	'id'=>'mosque-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'responsiveTable' => true,
	'columns'=>array(
       array(
            'name'     => 'id',
            'value'    => '$this->grid->dataProvider->pagination->offset + $row+1',       //  row is zero based
            'filter'   => false,
            'sortable' => false,
        ),
		'name',
		'construction_progress',
        array(
            'name'  => 'agent_id',
            'type'  => 'raw',
            'filter'=> MosqueAgent::model()->getOptions(),
            'value' => array($model, 'mosqueAgentgentFilter'), 
        ),
        array(
            'name'  => 'donator_id',
            'type'  => 'raw',
            'filter'=> Donator::model()->getOptions(),
            'value' => array($model, 'donatorFilter'), 
        ),
        array(
            'name'  => 'country_id',
            'type'  => 'raw',
            'filter'=> Country::model()->getOptions(),
            'value' => array($model, 'countryFilter'), 
        ),
		/*
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
		array(
            'name'  => 'agent_id',
            'type'  => 'raw',
            'filter'=> MosqueAgent::model()->getOptions(),
            'value' => array($model, 'mosqueAgentgentFilter'), 
        ),
		array(
            'name'  => 'mosque_type_id',
            'type'  => 'raw',
            'filter'=> MosqueType::model()->getOptions(),
            'value' => array($model, 'mosqueTypeFilter'), 
        ),
        array(
            'name'  => 'country_id',
            'type'  => 'raw',
            'filter'=> Country::model()->getOptions(),
            'value' => array($model, 'countryFilter'), 
        ),		'city_id',
		'owner_id',
		'created_at',
		'updated_at',
		'notes',
		'options',
		*/
		array(
            'header'    => 'action',
            //'class'   => 'CButtonColumn',
			'class'     => 'bootstrap.widgets.TbButtonColumn',
			'template'  => '{view}{update}{delete}{gallery}{report}',
            'buttons'   => array
            (
                'gallery' => array
                (
                    //'click'   => 'function(){alert("Going down!");}',
                    'label'   => '<i class="icon-picture"></i>',
                    'options' => 
                    array(
                        'title'  => Yii::t('gallery', 'Create Gallery'),
                        //'confirm'=>'Are you want to change status?',
                        //'ajax'   => array('type' => 'get', 'url'=>'js:$(this).attr("href")', 'success' => 'js:function(data) { $.fn.yiiGridView.update("my-grid")}')
                    ),
                    'imageUrl'=> false,
                    'url'     => 'Yii::app()->createUrl("admin/mosque/createGallery", array("id"=>$data->id))',
                ),
                
                'report' => array
                (
                    //'click'   => 'function(){alert("Going down!");}',
                    'label'   => '<i class="icon-tasks"></i>',
                    'options' => 
                    array(
                        'title'  => Yii::t('gallery', 'Create Gallery'),
                        //'confirm'=>'Are you want to change status?',
                        //'ajax'   => array('type' => 'get', 'url'=>'js:$(this).attr("href")', 'success' => 'js:function(data) { $.fn.yiiGridView.update("my-grid")}')
                    ),
                    'imageUrl'=> false,
                    'url'     => 'Yii::app()->createUrl("admin/mosque/report", array("id"=>$data->id))',
                ),
                
            ),
			
		),
	),
)); ?>
