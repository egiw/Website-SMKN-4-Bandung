<?php

class GuestbookController extends Zend_Controller_Action
{
  public function init()
  {
    /* Initialize action controller here */
  }

  public function indexAction()
  {
    $form = new Application_Form_Guestbook();
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $model = new Application_Model_DbTable_Guestbook();
        $model->insert(array(
            'name' => $form->name->getValue(),
            'email' => $form->email->getValue(),
            'message' => $form->message->getValue(),
            'created_on' => Date('Y-m-d h:i:s')
        ));
        $this->_helper->Redirector('index', 'index');
      }
    }
    $this->view->form = $form;
  }

}
