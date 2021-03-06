 <div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::encode( $widget->dataProvider->pagination->offset + $index+1 ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('organization_branch_committee_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->organizationBranchCommittee->name),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('organization_user_id')); ?>:</b>
	<?php echo isset($data->organizationUser) ? CHtml::encode($data->organizationUser->fullname) : ''; ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('organization_position_id')); ?>:</b>
	<?php echo isset($data->organizationPosition) ? CHtml::encode($data->organizationPosition->title) : ''; ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('owner_id')); ?>:</b>
	<?php echo isset($data->owner) ? CHtml::encode($data->owner->fullname) : ''; ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_at')); ?>:</b>
	<?php echo CHtml::encode($data->created_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('updated_at')); ?>:</b>
	<?php echo CHtml::encode($data->updated_at); ?>
	<br />


</div>