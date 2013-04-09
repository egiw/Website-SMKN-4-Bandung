<?php

class JobsController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $pageNumber = $this->getParam('page');
        $model = new Application_Model_DbTable_Jobs;
        $data = $model->findAll();
        
        $jobs = Zend_Paginator::factory($data);
        $jobs->setItemCountPerPage(10);
        $jobs->setCurrentPageNumber($pageNumber);

        
        $this->view->jobs = $jobs;
    }

    public function viewAction() {

        $id = $this->getParam('id');
        
        if (null !== $id) {
            $model = new Application_Model_DbTable_Jobs;
            $jobs = $model->find($id)->current();

            $this->view->jobs = $jobs->toArray();
        } else {
            throw new Exception('Halaman tidak ditemukan', 404);
        }
    }

}

