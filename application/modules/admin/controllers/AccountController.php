<?php

class Admin_AccountController extends Zend_Controller_Action
{
  const MSG_ACCOUNT_CREATED = 'success|Akun dengan nama pengguna \'%s\' berhasil dibuat.';
  const MSG_ACCOUNT_EDITED = 'success|Akun dengan nama pengguna \'%s\' berhasil disimpan.';
  const MSG_ACCOUNT_DELETED = 'success|Akun dengan nama pengguna \'%s\' berhasil dihapus.';
  const MSG_SELECTED_ACCOUNTS_DELTED = 'success|%d Akun berhasil dihapus.';

  /**
   * @var Admin_Model_DbTable_User
   *
   *
   */
  protected $user = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->user = new Admin_Model_DbTable_User();
  }

  public function indexAction()
  {
    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'delete':
          if (isset($post['accounts'])) {
            $accounts = $post['accounts'];
            foreach ($accounts as $id) {
              $account = $this->user->find($id)->current();
              if (null !== $account) {
                $account->delete();
              }
            }
            $this->_helper->flashMessenger->addMessage(
                    sprintf(self::MSG_SELECTED_ACCOUNTS_DELTED, count($accounts)));
          }
          break;
        default:
          break;
      }
      $this->_helper->redirector('index');
    }

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
        $this->_helper->flashMessenger->addMessage(sprintf(self::MSG_ACCOUNT_CREATED, $form->username->getValue()));
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

  public function editAction()
  {
    $id = $this->getParam('id');
    if (null !== $id) {
      $account = $this->user->find($id)->current();
      if (null !== $account) {
        $form = new Admin_Form_Account();
        $form->submit->setLabel('Simpan');
        $form->password->setRequired(false);
        $form->confirm_password->setRequired(false);
        $form->populate($account->toArray());

        if ($this->getRequest()->isPost()) {
          $data = $this->getRequest()->getPost();
          if ($data['username'] === $account->username) {
            $form->username->removeValidator('Db_NoRecordExists');
          }
          if ($form->isValid($data)) {
            if ($form->password->getValue() !== ''
                    && $form->confirm_password->getValue() !== '') {
              $account->password = md5($form->password->getValue());
            }
            $account->username = $form->username->getValue();
            $account->role = $form->role->getValue();
            $account->save();

            $this->_helper->flashMessenger->addMessage(sprintf(self::MSG_ACCOUNT_EDITED, $account->username));
            $this->_helper->redirector('index');
          }
        }

        $this->view->form = $form;
        return;
      }
    }
    $this->_helper->redirector("index");
  }

  public function deleteAction()
  {
    $this->_helper->viewRenderer->setNoRender(true);
    $id = $this->getParam('id');
    if (null !== $id) {
      $account = $this->user->find($id)->current();
      if (null !== $account) {
        $username = $account->username;
        $account->delete();
        $this->_helper->flashMessenger->addMessage(sprintf(self::MSG_ACCOUNT_DELETED, $username));
      }
    }
    $this->_helper->redirector('index');
  }

}
