<?php

class UserController extends Zend_Controller_Action {

    public function init() {
        
    }

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $username = $this->getParam('username');
        if (null !== $username) {
            $model = new Admin_Model_DbTable_User();
            $user = $model->find($username)->current();
            if (null !== $user) {
                $this->view->user = $user->toArray();
            } else {
                Throw new Zend_Http_Exception('Pengguna tidak ditemukan', 404);
            }
        } else {
            Throw new Zend_Http_Exception('Halaman tidak ditemukan', 404);
        }
    }

}

