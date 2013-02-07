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
        
        
        //action hotthreads
        $news = new Application_Model_DbTable_News();
        $data = $news->findLatestNews(7);
        $this->view->news = $data;
        
        
        
        //action eventLatest
        $eventLatest = new Application_Model_DbTable_Event();
        $dataEventLatest = $eventLatest->findLatestEvent(2);
        $this->view->eventLatest = $dataEventLatest;
        
        
        
        //action eventUpComing
        $eventUpComing = new Application_Model_DbTable_Event();
        $dataEventUpComing = $eventUpComing->findUpComingEvent(3);
        $this->view->eventUpComing = $dataEventUpComing;
        
    }
    

    

}

