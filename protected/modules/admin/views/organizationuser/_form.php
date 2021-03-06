<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
		'id'                     => 'organization-user-form',
		'enableAjaxValidation'   => false,
		'enableClientValidation' => true,
		'htmlOptions'            => array(
			'class'                 => 'well',
			'enctype'               => 'multipart/form-data',
		),
		'clientOptions'     => array(
			'validateOnSubmit' => true,
			'afterValidate'    => 'js:function(form, data, hasError) {
            if(hasError) {
              for(var i in data){
                $("html, body").animate({
                  scrollTop: $("div.error").offset().top - 100
                 }, 1000);
                 return false;
              }
           }else{
            return true;
           }
        }',
		),
	));?>

	<p class="help-block"><?php echo Yii::t('app', 'Fields with <span class="required">*</span> are required')?>.</p>
    
    <?php echo $form->errorSummary($model);?>
    
    <?php echo $form->textFieldControlGroup($model, 'username', array('class' => 'span5', 'maxlength' => 32));?>
    
    <?php echo $form->passwordFieldControlGroup($model, 'password', array('class' => 'span5', 'maxlength' => 32));?>
    
    <?php echo $form->dropDownListControlGroup($model, 'title', ENUMHtml::enumItem($model, 'title'), array('class' => 'span5', 'maxlength' => 4));?>
    
    <?php echo $form->textFieldControlGroup($model, 'fullname', array('class' => 'span5', 'maxlength' => 255));?>
    
    <?php echo $form->textFieldControlGroup($model, 'ssn', array('class' => 'span5', 'maxlength' => 32));?>
    
    <?php echo $form->dropDownListControlGroup($model, 'gender', ENUMHtml::enumItem($model, 'gender'), array('class' => 'span5', 'maxlength' => 6));?>
    
    <?php echo $form->textFieldControlGroup($model, 'email', array('class' => 'span5', 'maxlength' => 255));?>
    
    
    <?php
    $datePicker = $this->widget('yiiwheels.widgets.datepicker.WhDatePicker', array(
    	//'name' => 'date_of_birth',
    	'model'         => $model,
    	'attribute'     => 'date_of_birth',
    	'pluginOptions' => array(
    		'language'     => (Yii::app()->language == 'ar')?Yii::app()->language:'',
    		'format'       => 'yyyy-mm-dd'
    	),
    	'htmlOptions' => array(
    		'class'      => 'span5',
    	)
    ), TRUE);
    ?>
    
    <?php echo TbHtml::customActiveControlGroup($datePicker, $model, 'date_of_birth');?>
    <?php $form->error($model, 'date_of_birth')?>
    <?php //echo $form->textFieldControlGroup($model,'date_of_birth',array('class'=>'span5')); ?>
    
    
    <?php echo $form->textFieldControlGroup($model, 'home_phone', array('class' => 'span5', 'maxlength' => 17));?>
    
    <?php echo $form->textFieldControlGroup($model, 'work_phone', array('class' => 'span5', 'maxlength' => 17));?>
    
    <?php echo $form->textFieldControlGroup($model, 'local_mobile', array('class' => 'span5', 'maxlength' => 17));?>
    
    <?php echo $form->textFieldControlGroup($model, 'international_mobile', array('class' => 'span5', 'maxlength' => 17));?>
    
    <?php echo $form->dropDownListControlGroup($model, 'nationality_id', Country::model()->getOptions(), array('empty' => $model->getAttributeLabel('nationality_id'), 'class' => 'span5', 'maxlength' => 11));?>
    
    <?php if( Yii::app()->user->isSuperuser ): ?>
        <?php echo $form->dropDownListControlGroup($model, 'organization_id', Organization::model()->getOptions(), array('empty' =>$model->getAttributeLabel('organization_id'), 'class'=>'span5', 'maxlength'=>11)); ?>
        <?php echo $form->dropDownListControlGroup($model, 'organization_branch_id', OrganizationBranch::model()->getOptions(), array('empty' => $model->getAttributeLabel('organization_branch_id'), 'class' => 'span5', 'maxlength' => 11));?>
    <?php endif ?>
    
    <?php //echo $form->textFieldControlGroup($model, 'organization_id', array('class' => 'span5', 'maxlength' => 11));?>
    <?php //echo $form->dropDownListControlGroup($model, 'organization_branch_id', OrganizationBranch::model()->getOptions(), array('empty' => $model->getAttributeLabel('organization_branch_id'), 'class' => 'span5', 'maxlength' => 11));?>
    
    <?php //echo $form->textFieldControlGroup($model,'personal_photo_path',array('class'=>'span5','maxlength'=>255)); ?>
    <div>
        <?php echo $form->label($model, 'personal_photo_path')?>
        <?php echo CHtml::activeFileField($model, 'image');?>
        <?php echo $form->error($model, 'image');?>
    </div>
    <?php
    if ($model->preview->hasImage()) {
    	echo '<div>'.CHtml::image($model->preview->getUrl('large'), 'Large image version').'</div>';
    } else {
    	echo '<div>'.Yii::t('app', 'No image uploaded').'</div>';
    }
    ?>
    
    <?php //echo $form->textFieldControlGroup($model,'passport_photo_path',array('class'=>'span5','maxlength'=>255)); ?>
    <div>
        <?php echo $form->label($model, 'passport_photo_path')?>
        <?php echo CHtml::activeFileField($model, 'passport');?>
        <?php echo $form->error($model, 'passport');?>
    </div>
    <?php
    if ($model->passpor->hasImage()) {
    	echo '<div>'.CHtml::image($model->passpor->getUrl('large'), 'Large passport version').'</div>';
    } else {
    	echo '<div>'.Yii::t('app', 'No image uploaded').'</div>';
    }
    ?>
    
    <?php echo $form->dropDownListControlGroup($model, 'blocked', ENUMHtml::enumItem($model, 'blocked'), array('class' => 'span5', 'maxlength' => 3));?>
    
    <?php //echo $form->textFieldControlGroup($model, 'last_login_date', array('class' => 'span5'));?>
    
    <?php //echo $form->textFieldControlGroup($model, 'last_login_ip', array('class' => 'span5', 'maxlength' => 15));?>
    
    <div class="form-actions">
    <?php echo TbHtml::submitButton($model->isNewRecord?Yii::t('app', 'Create'):Yii::t('app', 'Save'), array(
    	'color' => TbHtml::BUTTON_COLOR_PRIMARY,
    	'size'  => TbHtml::BUTTON_SIZE_LARGE,
    ));?>
    </div>

<?php $this->endWidget();?>
