<?php

class Admin_GuestbookController extends Zend_Controller_Action {

    public function init() {
        $this->_helper->layout->setLayout('admin');
    }

    public function indexAction() {
        $model = new Admin_Model_DbTable_Guestbook();
        $data = $model->find();
        $paginator = Zend_Paginator::factory($data);
        $this->view->paginator = $paginator;
    }

}