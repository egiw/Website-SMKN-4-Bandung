<?php

class NewsController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        
        $model = new Application_Model_DbTable_News();
        $data = $model->findAll();
        
        $this->view->newss = $data;
        
    }


}

