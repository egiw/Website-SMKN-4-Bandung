<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        $news = new Application_Model_DbTable_News();
        
        
        $data = $news->findLatestNews(7);
        
        $this->view->news = $data;
        
        $event = new Application_Model_DbTable_Event();
        
        $dataEvent = $event->findLatestEvent();
        
        $this->view->event = $dataEvent;
    }
    

    

}

