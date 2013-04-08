<?php

class EventController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {

        $model = new Application_Model_DbTable_Event();
        $data = $model->findAll();

        $this->view->events = $data;
    }

    public function viewAction() {
        $id = $this->getParam('id');

        if (null !== $id) {
            if ($this->getRequest()->isXMLHttpRequest()) {
                $this->_helper->layout->disableLayout();
                $model = new Admin_Model_DbTable_Event();
                $event = $model->find($id)->current();
                $this->view->event = $event->toArray();
            } else {
                Throw new Exception('Halaman tidak ditemukan', 404);
            }
        } else {
            Throw new Exception('Halaman tidak ditemukan', 404);
        }
    }

}

