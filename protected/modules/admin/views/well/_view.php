<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::encode( $widget->dataProvider->pagination->offset + $index+1 ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->name),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address')); ?>:</b>
	<?php echo CHtml::encode($data->address); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('contract_date')); ?>:</b>
	<?php echo CHtml::encode($data->contract_date); ?>
	<br />

	<!-- <b><?php //echo CHtml::encode($data->getAttributeLabel('contract_photo_path')); ?>:</b>
	<?php //echo CHtml::encode($data->contract_photo_path); ?>
	<br /> -->
	
    <b><?php echo CHtml::encode($data->getAttributeLabel('real_construction_cost')); ?>:</b>
    <?php echo CHtml::encode($data->real_construction_cost); ?>
    <br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('construction_progress')); ?>:</b>
	<?php echo CHtml::encode($data->construction_progress); ?>
	<?php echo TbHtml::animatedProgressBar( $data->construction_progress, array('color' => TbHtml::PROGRESS_COLOR_SUCCESS) )?>
	

	<b><?php echo CHtml::encode($data->getAttributeLabel('donator_id')); ?>:</b>
	<?php echo CHtml::encode($data->donatorFilter($data)); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('agent_id')); ?>:</b>
	<?php echo CHtml::encode($data->mosqueAgentgentFilter($data)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('mosque_type_id')); ?>:</b>
	<?php echo CHtml::encode($data->mosque_type_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('country_id')); ?>:</b>
	<?php echo CHtml::encode($data->countryFilter($data)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('city_id')); ?>:</b>
	<?php echo CHtml::encode($data->city_id); ?>
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('notes')); ?>:</b>
	<?php echo CHtml::encode($data->notes); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('options')); ?>:</b>
	<?php echo CHtml::encode($data->options); ?>
	<br />

	*/ ?>

</div>