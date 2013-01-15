<?php

class Admin_LogController extends Zend_Controller_Action
{
  const MSG_ALL_LOGS_DELETED = 'success|%d log berhasil dihapus.';

  /**
   * @var Admin_Model_DbTable_Log
   *
   */
  protected $log = null;
  /**
   * @var Zend_Session_Namespace
   *
   */
  protected $filter = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->log = new Admin_Model_DbTable_Log();
    $this->_helper->layout->setLayout('admin');
    $this->filter = new Zend_Session_Namespace('filter');
  }

  public function indexAction()
  {

    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'filter':
          $this->filter->log = $post['filter'];
          break;
        case 'clear':
          $this->forward('clear');
          break;
        default :
          break;
      }
    }

    $pageNumber = $this->getParam('page');
    $data = $this->log->findAll();
    $paginator = Zend_Paginator::factory($data);
    $paginator->setCurrentPageNumber($pageNumber);
    $messages = $this->_helper->flashMessenger->getMessages();

    if ($itemCountPerPage = $this->filter->log['row']) {
      $paginator->setItemCountPerPage($itemCountPerPage);
    } else {
      $paginator->setDefaultItemCountPerPage(5);
    }

    $this->view->filter = $this->filter->log;
    $this->view->logs = $paginator;
    $this->view->messages = $messages;
  }

  public function clearAction()
  {
    $this->_helper->viewRenderer->setNoRender();
    $count = $this->log->delete();
    $this->_helper->flashMessenger->addMessage(sprintf(self::MSG_ALL_LOGS_DELETED, $count));
    $this->_helper->redirector('index');
  }

}
