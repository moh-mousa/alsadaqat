<?php
$this->breadcrumbs=array(
	Yii::t('app', 'Mail Outboxes')=>array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu=array(
	array('label'=>Yii::t('MailOutbox', 'List Mail Outbox'),'url'=>array('index')),
	array('label'=>Yii::t('MailOutbox', 'Create Mail Outbox'),'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('mail-outbox-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('app', 'Manage Mail Outboxes')?></h1>

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
	'id'=>'mail-outbox-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'organization_id',
		array(
            'name'  => 'mail_type_id',
            'type'  => 'raw',
            'filter'=> MailType::model()->getOptions(),
            'value' => array($model, 'mailTypeFilter'), 
        ),
		'mail_template_id',
		'number',
		'from_mail',
		/*
		'from_name',
		'from_department',
		'to_mail',
		'to_name',
		'to_department',
		'subject',
		'description',
		'send_at',
		'owner_id',
		'created_at',
		'updated_at',
		*/
        array(
            'header'    => 'action',
            //'class'   => 'CButtonColumn',
            'class'     => 'bootstrap.widgets.TbButtonColumn',
            'template'  => '{view}{update}{delete}{gallery}',
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
                    'url'     => 'Yii::app()->createUrl("admin/mailoutbox/createGallery", array("id"=>$data->id))',
                ),
            ),
            
        ),
	),
)); ?>
