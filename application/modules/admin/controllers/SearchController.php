<?php

class Admin_SearchController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        $this->_helper->Layout->setLayout('admin');
    }

    public function indexAction() {
        $username = Zend_Auth::getInstance()->getIdentity()->username;
        $model = new Admin_Model_DbTable_Search();
        $q = $this->getParam('query');
//        $pageNumber = $this->getParam('page');

        $results = Zend_Paginator::factory($model->search($q, $username));
        $results->setItemCountPerPage(-1);
//        $results->setCurrentPageNumber($pageNumber);
        $this->view->results = $results;
        $this->view->q = $q;
    }

}
