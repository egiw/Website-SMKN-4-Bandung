
<?php

class Admin_UserController extends Zend_Controller_Action
{
  /**
   *
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
    // action body

    $this->view->messages = $this->_helper->flashMessenger->getMessages();
  }

  public function loginAction()
  {

    $form = new Admin_Form_Login();
    $this->_helper->layout->disableLayout();
    $messages = $this->_helper->flashMessenger->getMessages();
    $this->view->messages = $messages;
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $auth = Zend_Auth::getInstance();
        $adapter = new Zend_Auth_Adapter_DbTable($this->user->getAdapter(), 'user');
        $adapter->setIdentityColumn('username');
        $adapter->setCredentialColumn('password');
        $adapter->setIdentity($data['username']);
        $adapter->setCredential(md5($data['password']));
        $result = $auth->authenticate($adapter);
        if ($result->isValid()) {
          $user = $adapter->getResultRowObject();
          $auth->getStorage()->write($user);
          $this->_helper->redirector('index', 'index');
        } else {
          switch ($result->getCode()) {
            case Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND:
              $this->view->messages[] = 'error|Nama Pengguna tidak ditemukan.';
              break;
            case Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID:
              $this->view->messages[] = 'error|Kata Sandi salah.';
              break;
            default:
              break;
          }
        }
      } else {
        $this->view->messages[] = 'error|Harap isikan semua field.';
      }
    }

    $this->view->form = $form;
  }

  public function logoutAction()
  {
    // action body
    Zend_Auth::getInstance()->clearIdentity();
    $this->_helper->redirector('login');
  }

  public function settingAction()
  {
    $form = new Admin_Form_User();
    $user = $this->user->find(Zend_Auth::getInstance()
                            ->getIdentity()->username)->current();
    $form->populate($user->toArray());

    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        if (null != $form->new_password->getValue()
                && null != $form->confirm_password->getValue()) {
          $user->password = md5($form->new_password->getValue());
        }

        if ($form->avatar->isUploaded()) {
          $info = pathinfo($form->avatar->getFileName());
          $form->avatar->addFilter('Rename', UPLOAD_FOLDER . 'avatar/'
                  . $info['filename'] . '_' . time() . '.' . $info['extension']
          );
          if ($form->avatar->receive()) {
            $user->avatar = $form->avatar->getValue();
          }
        }

        $user->fullname = $form->fullname->getValue();
        $user->email = $form->email->getValue();
        $user->bio = $form->bio->getValue();
        $user->save();

        $auth = Zend_Auth::getInstance()->getStorage()->write($user);

        $this->_helper->flashMessenger->addMessage('success|Akun berhasil disunting.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

}
