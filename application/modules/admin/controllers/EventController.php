<?php

class Admin_EventController extends Zend_Controller_Action
{
  
  /**
   * @var Admin_Model_DbTable_Event
   *
   *
   */
  protected $event = null;
  /**
   *
   * @var Zend_Session_Namespace
   */
  protected $filter;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->event = new Admin_Model_DbTable_Event();
    $this->filter = new Zend_Session_Namespace();
  }

  public function indexAction()
  {
    // action body
    $pageNumber = $this->getParam('page');

    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'delete':
          if (!empty($post['events'])) {
            $count = count($post['events']);
            $archivedCount = 0;
            $deletedCount = 0;
            foreach ($post['events'] as $index => $id) {
              $event = $this->event->find($id)->current();
              if (null !== $event) {
                if (Admin_Model_Status::ARCHIVED === $event->status) {
                  $event->delete();
                  $deletedCount++;
                } else {
                  $event->status = Admin_Model_Status::ARCHIVED;
                  $event->save();
                  $archivedCount++;
                }
              }
            }
            if (0 !== $archivedCount) {
              $this->_helper->flashMessenger->addMessage("success|{$archivedCount} Kegiatan berhasil diarsipkan.");
            }
            if (0 !== $deletedCount) {
              $this->_helper->flashMessenger->addMessage("success|{$deletedCount} Kegiatan berhasil dihapus.");
            }
          }
          break;
        case 'filter':
          $this->filter->event = $post['filter'];
          break;
        case 'reset':
          $this->filter->unsetAll();
          break;
        default:
          break;
      }
      $this->_helper->redirector('index');
    }

    var_dump($this->filter->event);
    $username = Zend_Auth::getInstance()->getIdentity()->username;
    $data = $this->event->findAll($username, $this->filter->event);
    $paginator = Zend_Paginator::factory($data);
    $paginator->setDefaultItemCountPerPage(5);
    $paginator->setCurrentPageNumber($pageNumber);

    $countStatus = $this->event->countStatus();

    if (isset($this->filter->event['row'])) {
      $paginator->setItemCountPerPage($this->filter->event['row']);
    }

    $messages = $this->_helper->flashMessenger->getMessages();
    $this->view->countStatus = $countStatus;
    $this->view->filter = $this->filter->event;
    $this->view->events = $paginator;
    $this->view->messages = $messages;
  }

  public function createAction()
  {
    // action body
    $form = new Admin_Form_Event();
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {

        $status = Admin_Model_Status::ARCHIVED;
        if (isset($data['submit'])) {
          $status = Admin_Model_Status::PUBLISH;
        } else if (isset($data['draft'])) {
          $status = Admin_Model_Status::DRAFT;
        }

        $this->event->createRow(array(
            'title' => $form->title->getValue(),
            'from_date' => Date('Y-d-m', strtotime($form->from_date->getValue())),
            'until_date' => Date('Y-d-m', strtotime($form->until_date->getValue())),
            'location' => $form->location->getValue(),
            'info' => $form->info->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => Date('Y-m-d H:i:s'),
            'status' => $status
        ))->save();
        $this->_helper->flashMessenger->addMessage('success|Kegiatan berhasil ditambahkan.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

  public function editAction()
  {
    // action body
    $form = new Admin_Form_Event();
    $id = $this->getParam('id');
    if (null === $id) {
      $this->_helper->redirector('index');
    }

    $event = $this->event->find($id)->current();
    if (null === $event) {
      $this->_helper->redirector('index');
    }

    $form->populate($event->toArray());

    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {

        $status = Admin_Model_Status::ARCHIVED;
        if (isset($data['submit'])) {
          $status = Admin_Model_Status::PUBLISH;
        } else if (isset($data['draft'])) {
          $status = Admin_Model_Status::DRAFT;
        }

        $event->setFromArray(array(
            'title' => $form->title->getValue(),
            'from_date' => Date('Y-d-m', strtotime($form->from_date->getValue())),
            'until_date' => Date('Y-d-m', strtotime($form->until_date->getValue())),
            'location' => $form->location->getValue(),
            'info' => $form->info->getValue(),
            'status' => $status
        ))->save();
        $this->_helper->flashMessenger->addMessage('success|Kegiatan berhasil disunting.');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $form;
  }

  public function deleteAction()
  {
    // action body
    $this->_helper->viewRenderer->setNoRender();
    $id = $this->getParam('id');
    if (null !== $id) {
      $event = $this->event->find($id)->current();
      if (null !== $event) {
        if (Admin_Model_Status::ARCHIVED === $event->status) {
          $event->delete();
          $this->_helper->flashMessenger->addMessage('success|Kegiatan berhasil dihapus.');
        } else {
          $event->status = Admin_Model_Status::ARCHIVED;
          $event->save();
          $this->_helper->flashMessenger->addMessage('success|Kegiatan dipindahkan ke arsip.');
        }
      }
    }
    $this->_helper->redirector('index');
  }

}
