<?php

class NewsController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body

        $model = new Application_Model_DbTable_News();
        $data = $model->findAll();

        $this->view->newss = $data;
    }

    public function viewAction() {

        $id = $this->getParam('id');

        if (null != $id) {
            $form = new Application_Form_Comment();
            $model = new Application_Model_DbTable_News;
            $comment = new Application_Model_DbTable_Comment();
            $news = $model->find($id)->current();

            if (null != $news) {

                if ($this->getRequest()->isPost()) {

                    $data = $this->getRequest()->getPost();
                }

                $this->view->auth = Zend_Auth::getInstance();
                $this->view->news = $news->toArray();
                $this->view->form = $form;
                $this->view->comments = $comment;
            }
        }
    }

}

