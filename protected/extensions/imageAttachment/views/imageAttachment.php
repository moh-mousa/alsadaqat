<?php
/**
 * @var ImageAttachmentWidget $this
 */

?>
<?php if ($this->model->isNewRecord): ?>
    <div class="imageAttachment">
        <div class="preview"
             style="width: <?php echo $this->getBehavior()->previewWidth ?>px;
                 height: <?php echo $this->getBehavior()->previewHeight ?>px;">
            <div class="no-image">
                <?php echo Yii::t('ImageAttachmentWidget.main', 'Before image upload<br> save this.'); ?>
            </div>
             <img  src="">
        </div>
    </div>
<?php else: ?>
    <div class="imageAttachment" id="<?php echo $this->id ?>">

        <div class="preview">
            <img  src="">
        </div>
        <div class="btn-toolbar actions-bar">
        <span class="btn btn-success fileinput-button">
            <i class="icon-upload icon-white"></i>
            <span class="file_label"
                  data-replace-text="<?php echo Yii::t('ImageAttachmentWidget.main', 'Replace…'); ?>">

                  </span>
            <input type="file" name="image" class="afile" accept="image/*" multiple="multiple"/>
        </span>

        </div>
        <div class="overlay">
            <div class="overlay-bg">&nbsp;</div>
            <div class="drop-hint">
                <span
                    class="drop-hint-info"><?php echo Yii::t('ImageAttachmentWidget.main', 'Drop Image Here…'); ?></span>
            </div>
        </div>
        <div class="progress-overlay">
            <div class="overlay-bg">&nbsp;</div>
            <div class="progress-modal">
                <div class="info">
                    <h3><?php echo Yii::t('ImageAttachmentWidget.main', 'Uploading…'); ?></h3>

                    <div class="progress progress-striped active">
                        <div class="bar upload-progress"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>
