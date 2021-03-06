<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
    'htmlOptions' => array(
        'class' => 'well',
    ),
)); ?>

	<?php echo $form->textFieldControlGroup($model,'id',array('class'=>'span5','maxlength'=>11)); ?>

	<?php echo $form->dropDownListControlGroup($model, 'has_supplies_card', ENUMHtml::enumItem($model, 'has_supplies_card'), array('class'=>'span5', 'maxlength'=>3)); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_paterfamilias',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_beneficiary_business',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_beneficiary_family_business',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_social_security',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_retirement',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_lands',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_property',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_agriculture',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_national_aid_fund',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_zakat_fund',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_from_charity_fund',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'income_total',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_home_rent',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_food',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_clothes',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_medication',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_smoking',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_education',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_transportation',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_gas_invoice',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_water_invoice',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_elctricity_invoice',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_kerosene',array('class'=>'span5','maxlength'=>10)); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_other',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'spending_total',array('class'=>'span5')); ?>

	<?php echo $form->dropDownListControlGroup($model, 'beneficiary_id', Beneficiary::model()->getOptions(), array('empty' =>$model->getAttributeLabel('beneficiary_id'), 'class'=>'span5', 'maxlength'=>11)); ?>

	<?php echo $form->textFieldControlGroup($model,'owner_id',array('class'=>'span5','maxlength'=>11)); ?>

	<?php echo $form->textFieldControlGroup($model,'created_at',array('class'=>'span5')); ?>

	<?php echo $form->textFieldControlGroup($model,'updated_at',array('class'=>'span5')); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>Yii::t('app', 'Search'),
		)); ?>
	</div>

<?php $this->endWidget(); ?>
