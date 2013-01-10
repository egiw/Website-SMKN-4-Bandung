<?php

class Admin_AccountController extends Zend_Controller_Action
{
  /**
   * @var Admin_Model_DbTable_User
   */
  protected $user;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->user = new Admin_Model_DbTable_User();
  }

  public function indexAction()
  {
    $data = $this->user->findAll();
    $users = Zend_Paginator::factory($data);

    $messages = $this->_helper->flashMessenger->getMessages();
    $this->view->messages = $messages;
    $this->view->users = $users;
  }

  public function createAction()
  {
    // action body
    $form = new Admin_Form_Account();

    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $this->user->createRow(array(
            'username' => $form->username->getValue(),
            'password' => md5($form->username->getValue()),
            'role' => $form->role->getValue()
        ))->save();
        $this->_helper->flashMessenger->addMessage('success|Akun berhasil dibuat.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

}
