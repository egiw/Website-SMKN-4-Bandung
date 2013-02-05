<?php

class Admin_NewsController extends Zend_Controller_Action
{
  /**
   * @var Admin_Model_DbTable_News
   *
   *
   *
   */
  protected $news = null;
  /**
   * @var Zend_Session_Namespace
   *
   */
  protected $filter = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->news = new Admin_Model_DbTable_News();
    $this->filter = new Zend_Session_Namespace('filter');
  }

  public function indexAction()
  {
    // action body
    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'delete':
          if (!empty($post['news'])) {
            foreach ($post['news'] as $id) {
              $news = $this->news->find($id)->current();
              if (null !== $news) {
                if (Admin_Model_Status::ARCHIVED === $news->status) {
                  $news->delete();
                } else {
                  $news->status = Admin_Model_Status::ARCHIVED;
                  $news->save();
                }
              }
            }
            $this->_helper->flashMessenger->addMessage('success|Semua berita yang dipilih berhasil dihapus.');
          }
          break;
        case 'filter':
          $this->filter->news = $post['filter'];
          break;
        case 'reset':
          $this->filter->unsetAll();
          break;
        default:
          break;
      }
      $this->_helper->redirector('index');
    }

    $pageNumber = $this->getParam('page');
    $messages = $this->_helper->flashMessenger->getMessages();
    $username = Zend_Auth::getInstance()->getIdentity()->username;
    $data = $this->news->findAll($username, $this->filter->news);

    $paginator = Zend_Paginator::factory($data);
    $paginator->setCurrentPageNumber($pageNumber);
    $paginator->setDefaultItemCountPerPage(5);

    $countStatus = $this->news->countStatus($username);

    if (isset($this->filter->news['row'])) {
      $paginator->setItemCountPerPage($this->filter->news['row']);
    }

    $this->view->countStatus = $countStatus;
    $this->view->filter = $this->filter->news;
    $this->view->messages = $messages;
    $this->view->news = $paginator;
  }

  public function createAction()
  {
    $form = new Admin_Form_News();

    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {

        $status = Admin_Model_Status::ARCHIVED;
        if (isset($data['submit'])) {
          $status = Admin_Model_Status::PUBLISH;
        } else if (isset($data['draft'])) {
          $status = Admin_Model_Status::DRAFT;
        }

        $this->news->createRow(array(
            'title' => $form->title->getValue(),
            'content' => $form->content->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => Date('Y-m-d H:i:s'),
            'status' => $status
        ))->save();

        $this->_helper->flashMessenger->addMessage('success|Berita berhasil diposting.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
    // action body
  }

  public function editAction()
  {
    // action body
    $id = $this->getParam('id');
    $form = new Admin_Form_News();
    if (null == $id) {
      $this->_helper->redirector('index');
    }

    $news = $this->news->find($id)->current();
    if (null == $news) {
      $this->_helper->redirector('index');
    }

    $form->populate($news->toArray());

    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {

        $status = Admin_Model_Status::ARCHIVED;
        if (isset($data['submit'])) {
          $status = Admin_Model_Status::PUBLISH;
        } else if (isset($data['draft'])) {
          $status = Admin_Model_Status::DRAFT;
        }
        $news->setFromArray(array(
            'title' => $form->title->getValue(),
            'content' => $form->content->getValue(),
            'status' => $status
        ))->save();
        $this->_helper->flashMessenger->addMessage('Berita berhasil disunting.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

  public function deleteAction()
  {
    // action body
    $id = $this->getParam('id');
    if (null !== $id) {
      $news = $this->news->find($id)->current();
      if (null !== $news) {
        if (Admin_Model_Status::ARCHIVED == $news->status) {
          $news->delete();
          $this->_helper->flashMessenger->addMessage('success|Berita berhasil dihapus.');
        } else {
          $news->setFromArray(array(
              'status' => Admin_Model_Status::ARCHIVED,
          ))->save();
          $this->_helper->flashMessenger->addMessage('success|Berita dipindahkan ke arsip.');
        }
      }
    }
    $this->_helper->redirector('index');
  }

  public function restoreAction()
  {
    // action body
    $this->_helper->viewRenderer->setNoRender();
    $id = $this->getParam('id');
    if (null !== $id) {
      $news = $this->news->find($id)->current();
      if (null !== $news && Admin_Model_Status::ARCHIVED == $news->status) {
        $news->status = Admin_Model_Status::DRAFT;
        $news->save();
        $this->_helper->flashMessenger('success|Berita berhasil dikembalikan.');
      }
    }
    $this->_helper->redirector('index');
  }

}
