<?php

class Admin_GuestbookController extends Zend_Controller_Action {

    public function init() {
        $this->_helper->layout->setLayout('admin');
    }

    public function indexAction() {
        $messages = $this->_helper->flashMessenger->getMessages();
        $model = new Admin_Model_DbTable_Guestbook();
        $pageNumber = $this->getParam('page');
        $data = $model->findAll();
        $paginator = Zend_Paginator::factory($data);
        $paginator->setCurrentPageNumber($pageNumber);
        $paginator->setItemCountPerPage(5);
        $this->view->paginator = $paginator;
        $this->view->messages = $messages;
    }

    public function deleteAction() {
        if ($this->getRequest()->isPost()) {
            $ids = implode(',', $this->getRequest()->getPost('messages'));
            $model = new Admin_Model_DbTable_Guestbook();
            $model->delete(array("id IN ({$ids})"));
        }
        $this->_helper->FlashMessenger->addMessage('success|Beberapa pesan berhasil dihapus.');
        $this->_helper->Redirector('index');
        exit;
    }

    public function deleteallAction() {
        $model = new Admin_Model_DbTable_Guestbook();
        $model->delete(array());
        $this->_helper->FlashMessenger->addMessage('success|Semua pesan berhasil dihapus.');
        $this->_helper->Redirector('index');
        exit;
    }

}

