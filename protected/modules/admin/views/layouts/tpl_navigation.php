<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
    <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
     
          <!-- Be sure to leave the brand out there if you want it shown -->
          <a class="brand" href="/admin"><?php echo Yii::t('app', 'Alsadaqat'); ?></a>
          
          <div class="nav-collapse">
			<?php 

                $translate=Yii::app()->translate;
                $translateLink = $translationStyle = '';
                $translateReady = true;
                if( $translate->hasMessages() ) {
                    $translateReady = false;
                    $translateLink = $translate->translateLink('ترجمة العبارات المتبقية');
                    $translationStyle = 'position: relative; top: -20px;';
                }
                //link to the page where you edit the translations
                $editLink = $translate->editLink('صفحة العبارات المترجمة');
                //link to the page where you check for all unstranslated messages of the system
                $missingLink = $translate->missingLink('صفحة العبارات المتبقية');

                $this->widget('zii.widgets.CMenu',array(
                    'htmlOptions'=>array('class'=>'pull-right nav'),
                    'submenuHtmlOptions'=>array('class'=>'dropdown-menu'),
					'itemCssClass'=>'item-test',
                    'encodeLabel'=>false,
                    'items'=> 
                        array(
                            array('label'=> Yii::t('app', 'Dashboard'), 'url'=>array('/admin/default')),
                            array('label'=> Yii::t('app', 'Beneficiary') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Main Info') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Create Beneficiary') , 'url'=>'/admin/beneficiary/create'),
                                    array('label' => Yii::t('app', 'List all Beneficiaries') , 'url'=>'/admin/beneficiary/index'),
                                    array('label' => Yii::t('app', 'Manage Beneficiaries') , 'url'=>'/admin/beneficiary/admin'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Specific Type') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Poors') , 'url'=>'/admin/beneficiarypoor/index'),
                                    array('label' => Yii::t('app', 'Manage Disabled') , 'url'=>'/admin/beneficiarydisabled/index'),
                                    array('label' => Yii::t('app', 'Manage Orphan') , 'url'=>'/admin/beneficiaryorphan/index'),
                                    array('label' => Yii::t('app', 'Manage Student') , 'url'=>'/admin/beneficiarystudent/index'),
                                    array('label' => Yii::t('app', 'Manage StudentClass') , 'url'=>'/admin/beneficiarystudentclass/index'),
                                    array('label' => Yii::t('app', 'Manage Teacher') , 'url'=>'/admin/beneficiaryteacher/index'),
                                    array('label' => Yii::t('app', 'Manage Widow') , 'url'=>'/admin/beneficiarywidow/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Common Details') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage ResearchNotes') , 'url'=>'/admin/beneficiaryresearchnotes/index'),
                                    array('label' => Yii::t('app', 'Manage Finance State') , 'url'=>'/admin/beneficiaryfinance/index'),
                                    array('label' => Yii::t('app', 'Manage Relations') , 'url'=>'/admin/beneficiaryrelation/index'),
                                    array('label' => Yii::t('app', 'Manage Family Members') , 'url'=>'/admin/beneficiaryfamilymembers/index'),
                                    array('label' => Yii::t('app', 'Manage Paterfamilias') , 'url'=>'/admin/beneficiarypaterfamilias/index'),
                                    array('label' => Yii::t('app', 'Manage Home Details') , 'url'=>'/admin/beneficiaryhome/index'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Events & Tasks') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Events') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Events') , 'url'=>'/admin/event/index'),
                                    array('label' => Yii::t('app', 'Manage Event Agenda') , 'url'=>'/admin/eventagenda/index'),
                                    array('label' => Yii::t('app', 'Manage Event Activities') , 'url'=>'/admin/eventactivity/index'),
                                    array('label' => Yii::t('app', 'Manage Event Types') , 'url'=>'/admin/eventtype/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Tasks') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Tasks') , 'url'=>'/admin/task/index'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Mail') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Locations') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Mail Inbox') , 'url'=>'/admin/mailinbox/index'),
                                    array('label' => Yii::t('app', 'Manage Mail Outbox') , 'url'=>'/admin/mailoutbox/index'),
                                    array('label' => Yii::t('app', 'Manage Mail Attachments') , 'url'=>'/admin/mailattachment/index'),
                                    array('label' => Yii::t('app', 'Manage Mail Templates') , 'url'=>'/admin/mailtemplate/index'),
                                    array('label' => Yii::t('app', 'Manage Mail Types') , 'url'=>'/admin/mailtype/index'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Donators') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => Yii::t('app', 'Create Donator') , 'url'=>'/admin/donator/create'),
                                    array('label' => Yii::t('app', 'List all Donators') , 'url'=>'/admin/donator/index'),
                                    array('label' => Yii::t('app', 'Manage Donators') , 'url'=>'/admin/donator/admin'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Projects') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Mosques') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Mosques') , 'url'=>'/admin/mosque/index'),
                                    array('label' => Yii::t('app', 'Manage Mosque Types') , 'url'=>'/admin/mosquetype/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Wells') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Wells') , 'url'=>'/admin/well/index'),
                                    array('label' => Yii::t('app', 'Manage Wells Types') , 'url'=>'/admin/welltype/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Agents') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Agents') , 'url'=>'/admin/mosqueagent/index'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Organization') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Organization Info') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Create Organization') , 'url'=>'/admin/organization/create'),
                                    array('label' => Yii::t('app', 'List all Organization') , 'url'=>'/admin/organization/index'),
                                    array('label' => Yii::t('app', 'Manage Organization') , 'url'=>'/admin/organization/admin'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Organization Details') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Organization Branch') , 'url'=>'/admin/organizationbranch/index'),
                                    //array('label' => Yii::t('app', 'Manage Organization Branch Country') , 'url'=>'/admin/organizationbranchcountry/index'),
                                    array('label' => Yii::t('app', 'Manage Organization Branch Committee') , 'url'=>'/admin/organizationbranchcommittee/index'),
                                    array('label' => Yii::t('app', 'Manage Organization Branch Committee User') , 'url'=>'/admin/organizationbranchcommitteeuser/index'),
                                    array('label' => Yii::t('app', 'Manage Organization Positions') , 'url'=>'/admin/organizationposition/index'),
                                    array('label' => Yii::t('app', 'Manage Organization Types') , 'url'=>'/admin/organizationtype/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Organization ACL') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Organization Users') , 'url'=>'/admin/organizationuser/index'),
                                    //array('label' => Yii::t('app', 'Manage Organization Users Access Level') , 'url'=>'/admin/organizationuseraccesslevel/index'),
                                    //array('label' => Yii::t('app', 'Manage Organization Access Level') , 'url'=>'/admin/organizationaccesslevelpermission/index'),
                                    //array('label' => Yii::t('app', 'Manage Organization Access Level Permission') , 'url'=>'/admin/organizationaccesslevelpermission/index'),
                                ),
                            ),
                            array('label'=> Yii::t('app', 'Settings') . '<span class="caret"></span>', 
                                'url'=>'#',
                                'itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),
                                'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                                'items'=>array(
                                    array('label' => 'Rights', 'url'=>array('/rights'), 'visible'=>Yii::app()->user->checkAccess(Rights::module()->superuserName)),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Locations') . '</i></strong>'),
                                    array('label' => Yii::t('app', 'Manage Countries') , 'url'=>'/admin/country/index'),
                                    array('label' => Yii::t('app', 'Manage Cities') , 'url'=>'/admin/city/index'),
                                    array('label' => '&nbsp;&nbsp;<strong><i>' . Yii::t('app', 'Manage Translation') . '</i></strong>'),
                                    array('label' => $translateLink),
                                    array('label' => $editLink, 'linkOptions'=>array('style'=>$translationStyle)),
                                    array('label' => $missingLink, 'linkOptions'=>array('style'=>$translationStyle)),
                                ),
                            ),
                            array('label'=>Yii::t('app', 'Login'), 'url'=>array('/admin/default/login'), 'visible'=>$this->isGuest),
                            array('label'=>Yii::t('app', 'Logout') .' ('.Yii::app()->user->name.')', 'url'=>array('/admin/default/logout'), 'visible'=>!$this->isGuest),
                            array(
                                'label'       => $this -> languageSwitcher, 
                                'url'         => array_merge(array(Yii::app()->controller->id . '/' . Yii::app()->controller->action->id, 'lang' => $this -> oppositeCurrentLanguage),$_GET) , 
                                'itemOptions' => array('title' => $this -> languageSwitcher,)
                            ),
                        ),
                    )
                );
                ?>
    	</div>
    </div>
	</div>
</div>

<div class="subnav navbar navbar-fixed-top">
    <div class="navbar-inner">
    	<div class="container">
        
        	<div class="style-switcher pull-left">
                <a href="javascript:chooseStyle('style1', 60)"><span class="style" style="background-color:#0088CC;"></span></a>
                <a href="javascript:chooseStyle('style2', 60)"><span class="style" style="background-color:#7c5706;"></span></a>
                <a href="javascript:chooseStyle('style3', 60)"><span class="style" style="background-color:#468847;"></span></a>
                <a href="javascript:chooseStyle('style4', 60)"><span class="style" style="background-color:#4e4e4e;"></span></a>
                <a href="javascript:chooseStyle('style5', 60)"><span class="style" style="background-color:#d85515;"></span></a>
                <a href="javascript:chooseStyle('style6', 60)"><span class="style" style="background-color:#a00a69;"></span></a>
                <a href="javascript:chooseStyle('style7', 60)" checked="checked"><span class="style" style="background-color:#a30c22;"></span></a>
          	</div>
           <form class="navbar-search pull-right" action="">
           	 
           <input type="text" class="search-query span2" placeholder="Search">
           
           </form>
    	</div><!-- container -->
    </div><!-- navbar-inner -->
</div><!-- subnav -->