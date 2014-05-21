<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'mail-attachment-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="help-block"><?php echo Yii::t('app', 'Fields with <span class="required">*</span> are required' )?>.</p>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'mail_id',array('class'=>'span5','maxlength'=>11)); ?>

	<?php echo $form->textFieldRow($model,'name',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'extension',array('class'=>'span5','maxlength'=>5)); ?>

	<?php echo $form->textFieldRow($model,'size',array('class'=>'span5','maxlength'=>11)); ?>

	<?php echo $form->textFieldRow($model,'source_path',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'source_url',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'owner_id',array('class'=>'span5','maxlength'=>11)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
