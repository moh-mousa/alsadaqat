<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id'));?>:</b>
<?php echo CHtml::encode( $widget->dataProvider->pagination->offset + $index+1 ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('title'));?>:</b>
<?php echo CHtml::link(CHtml::encode(Yii::t('enumItem', $data->title)), array('view', 'id' => $data->id));?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description'));?>:</b>
<?php echo CHtml::encode($data->description);?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_at'));?>:</b>
<?php echo CHtml::encode($data->created_at);?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('updated_at'));?>:</b>
<?php echo CHtml::encode($data->updated_at);?>
	<br />


</div>