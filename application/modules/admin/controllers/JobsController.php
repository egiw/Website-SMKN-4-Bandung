<?php

class Admin_JobsController extends Zend_Controller_Action
{
  /**
   * @var Admin_Form_Jobs
   *
   */
  protected $form = null;
  /**
   * @var Admin_Model_DbTable_Jobs
   *
   */
  protected $jobs = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->form = new Admin_Form_Jobs();
    $this->jobs = new Admin_Model_DbTable_Jobs();
  }

  public function indexAction()
  {
    // action body
    $pageNumber = $this->getParam('page');

    $data = $this->jobs->findAll();
    $paginator = Zend_Paginator::factory($data);
    $paginator->setCurrentPageNumber($pageNumber);

    $messages = $this->_helper->flashMessenger->getMessages();
    $this->view->messages = $messages;
    $this->view->jobs = $paginator;
  }

  public function createAction()
  {
    // action body
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($this->form->isValid($data)) {
        $this->jobs->createRow(array(
            'title' => $this->form->title->getValue(),
            'info' => $this->form->info->getValue(),
            'tags' => $this->form->tags->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => date('Y-m-d H:i:s')
        ))->save();
        $this->_helper->flashMessenger->addMessage('success|Lowongan pekerjaan berhasil diposting');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $this->form;
  }

}
