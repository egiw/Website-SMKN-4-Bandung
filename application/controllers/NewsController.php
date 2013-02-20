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
            $model = new Application_Model_DbTable_News;

            $news = $model->find($id)->current();
            
            if(null != $news){
                
                if($this->getRequest()->isPost()){
                    
                    $data = $this->getRequest()->getPost();
                    
                    
                }
                
                $this->view->auth = Zend_Auth::getInstance();
                $this->view->news = $news->toArray();
                
            }
            
        }
    }

}

