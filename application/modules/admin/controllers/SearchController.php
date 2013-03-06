<?php

class Admin_SearchController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        $this->_helper->Layout->setLayout('admin');
    }

    public function indexAction() {
        $model = new Admin_Model_DbTable_Search();
        $q = $this->getParam('query');
        $page = $this->getParam('page');
        $results = Zend_Paginator::factory($model->search($q));
        $results->setItemCountPerPage(9999);
        $this->view->results = $results;
        $this->view->q = $q;
    }

}
