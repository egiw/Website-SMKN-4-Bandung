<?php

class JobsController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $model = new Application_Model_DbTable_Jobs;
        $data = $model->findAll();

        $this->view->jobs = $data;
    }

    public function viewAction() {

        $id = $this->getParam('id');
        
        if (null !== $id) {
            $model = new Application_Model_DbTable_Jobs;
            $jobs = $model->find($id)->current();

            $this->view->jobs = $jobs->toArray();
        } else {
            throw new Exxception('Halaman tidak ditemukan', 404);
        }
    }

}

