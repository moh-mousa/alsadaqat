<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	//public $layout='//layouts/column1';
	public $layout=null;
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs=array();
    
    private $isAdmin            = false;
    //private $isCircleManager    = false;
    //private $isLeader           = false;
    //private $isMember           = false;
    private $isGuest            = false;

    /*public function getIsMember() {
        $this -> isMember = !Yii::app()->user->getIsGuest() && Yii::app()->user->role == 'Team Member';
        return $this->isMember;
    }

    public function getIsLeader() {
        $this -> isLeader = !Yii::app()->user->getIsGuest() && Yii::app()->user->role == 'Team Leader';
        return $this->isLeader;
    }

    public function getIsCircleManager() {
        $this -> isCircleManager = !Yii::app()->user->getIsGuest() && Yii::app()->user->role == 'Circle Manager';
        return $this->isCircleManager;
    }*/

    public function getIsAdmin() {
        $this -> isAdmin = !Yii::app()->user->getIsGuest() && Yii::app()->user->role == 'Super Admin';
        return $this->isAdmin;
    }
    
    public function getIsGuest() {
        $this -> isGuest = Yii::app()->user->getIsGuest() ;
        return $this->isGuest;
    }
    
}