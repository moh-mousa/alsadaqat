<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::encode( $widget->dataProvider->pagination->offset + $index+1 ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('organization_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->organization_id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('mail_type_id')); ?>:</b>
	<?php echo CHtml::encode($data->mail_type_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('mail_template_id')); ?>:</b>
	<?php echo CHtml::encode($data->mail_template_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('number')); ?>:</b>
	<?php echo CHtml::encode($data->number); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('from_mail')); ?>:</b>
	<?php echo CHtml::encode($data->from_mail); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('from_name')); ?>:</b>
	<?php echo CHtml::encode($data->from_name); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('from_department')); ?>:</b>
	<?php echo CHtml::encode($data->from_department); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('to_mail')); ?>:</b>
	<?php echo CHtml::encode($data->to_mail); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('to_name')); ?>:</b>
	<?php echo CHtml::encode($data->to_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('to_department')); ?>:</b>
	<?php echo CHtml::encode($data->to_department); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('subject')); ?>:</b>
	<?php echo CHtml::encode($data->subject); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
	<?php echo CHtml::encode($data->description); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('send_at')); ?>:</b>
	<?php echo CHtml::encode($data->send_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('owner_id')); ?>:</b>
	<?php echo CHtml::encode($data->owner_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_at')); ?>:</b>
	<?php echo CHtml::encode($data->created_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('updated_at')); ?>:</b>
	<?php echo CHtml::encode($data->updated_at); ?>
	<br />

	*/ ?>

</div>