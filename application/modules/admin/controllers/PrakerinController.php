<?php

/**
 * @author Egi Soleh Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Admin_PrakerinController extends Zend_Controller_Action
{
  const MSG_DATA_CREATED = 'success|Informasi prakerin berhasil dibambahkan';

  /**
   *
   * @var Admin_Model_DbTable_Prakerin
   */
  protected $model;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->model = new Admin_Model_DbTable_Prakerin();
  }

  public function indexAction()
  {
    $messages = $this->_helper->FlashMessenger->getMessages();
    $this->view->messages = $messages;
  }

  public function createAction()
  {
    $form = new Admin_Form_Prakerin();
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $prakerin = $this->model->createRow(array(
                    'name' => $form->name->getValue(),
                    'address' => $form->address->getValue(),
                    'website' => $form->website->getValue(),
                    'category' => implode(',', $form->category->getValue()),
                    'contact' => $form->contact->getValue(),
                    'lat' => $form->lat->getValue(),
                    'lng' => $form->lng->getValue(),
                    'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
                    'created_on' => Date('Y-m-d H:i:s')
                ))->save();
        $this->_helper->FlashMessenger->addMessage(self::MSG_DATA_CREATED);
        $this->_helper->Redirector('index');
      }
    }

    $this->view->form = $form;
  }

}
