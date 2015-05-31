<?php

class CityController extends RController {
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout = '/layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters() {
		return array(
			'rights', // perform access control for CRUD operations

		);
	}

	public function allowedActions() {
		return 'actionGetCities';
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id) {
		$this->render('view', array(
				'model' => $this->loadModel($id),
			));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
    public function actionCreate() {
       $fancy = false;
        if ( $fancy = Yii::app()->getRequest()->getParam('fancy') AND Yii::app()->getRequest()->getParam('fancy') == '1' ) {
            $fancy = true;
        }

        $model = new City;

        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['City'])) {
            $model->attributes = $_POST['City'];
            
            if ( ! $fancy ) {
                if ($model->save()) {
                    $this->redirect(array('view', 'id' => $model->id));
                }
            } else {

                if ($model->save()) {
                    echo json_encode( array('id' => $model->id) );
                    Yii::app()->end();
                } else {
                    $this->performAjaxValidation($model);
                }

            }

        }
        
        if ( $fancy ) {
            $this->renderPartial('_form',array(
                'model' => $model,
                'fancy' => true,
            ), false, true);
        } else {
            $this->render('create', array(
                'model' => $model,
            ));
        }

    }

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id) {
		$model = $this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if (isset($_POST['City'])) {
			$model->attributes = $_POST['City'];
			if ($model->save()) {
				$this->redirect(array('view', 'id' => $model->id));
			}
		}

		$this->render('update', array(
				'model' => $model,
			));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id) {
		if (Yii::app()->request->isPostRequest) {
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if (!isset($_GET['ajax'])) {
				$this->redirect(isset($_POST['returnUrl'])?$_POST['returnUrl']:array('admin'));
			}
		} else {

			throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex() {
		$dataProvider = new CActiveDataProvider('City');
		$this->render('index', array(
				'dataProvider' => $dataProvider,
			));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin() {
		$model = new City('search');
		$model->unsetAttributes();// clear any default values
		if (isset($_GET['City'])) {
			$model->attributes = $_GET['City'];
		}

		$this->render('admin', array(
				'model' => $model,
			));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id) {
		$model = City::model()->findByPk($id);
		if ($model === null) {
			throw new CHttpException(404, 'The requested page does not exist.');
		}

		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model) {
		if (isset($_POST['ajax']) && $_POST['ajax'] === 'city-form') {
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionGetCities($country_id) {
		if (isset($country_id) AND !empty($country_id)) {
			echo json_encode(City::model()->getOptions((int) $country_id));
		} else {
			echo json_encode(City::model()->getOptions());
		}
		Yii::app()->end();
	}

}
