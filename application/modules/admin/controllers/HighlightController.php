<?php

/**
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 *
 */
class Admin_HighlightController extends Zend_Controller_Action
{
  const DELETED_SUCCESSFUL = 'success|Highlight berhasil dihapus.';
  const EDITED_SUCCESSFUL = 'success|Highlight berhasil disunting.';
  const CREATED_SUCCESSFUL = 'success|Highlight berhasil dibuat.';

  /**
   * @var Admin_Model_DbTable_Highlight
   */
    protected $model = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->model = new Admin_Model_DbTable_Highlight();
  }

  public function indexAction()
  {
    $pageNumber = $this->getParam('page');
    $data = $this->model->findAll();
    $paginator = Zend_Paginator::factory($data);
    $paginator->setDefaultItemCountPerPage(10);
    $paginator->setCurrentPageNumber($pageNumber);

    $messages = $this->_helper->flashMessenger->getMessages();
    $this->view->paginator = $paginator;
    $this->view->messages = $messages;
  }

  public function orderAction()
  {
    $this->_helper->layout->disableLayout();
    $this->_helper->viewRenderer->setNoRender();
    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      $images = $post['images'];
      foreach ($images as $index => $id) {
        $this->model->update(array('sort' => $index), array('id = ?' => $id));
      }
    }
  }

  public function createAction()
  {
    $form = new Admin_Form_Highlight();
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $highlight = $this->model->createRow(array(
            'title' => $form->title->getValue(),
            'link' => $form->link->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => Date('Y-m-d H:i:s')));
        if ($form->image->isUploaded()) {
          $info = pathinfo($form->image->getFileName());
          $form->image->addFilter('rename', UPLOAD_FOLDER . 'highlight/'
                  . $info['filename'] . '_' . time() . '.' . $info['extension']);
          if ($form->image->receive()) {
            $highlight['image'] = $form->image->getValue();
          }
        }
        $highlight->save();
        $this->_helper->flashMessenger->addMessage('Highlight berhasil ditambahkan.');
        $this->_helper->redirector('index');
      }
    }
    $this->view->form = $form;
  }

  public function deleteAction()
  {
    $this->_helper->layout->disableLayout();
    $this->_helper->viewRenderer->setNoRender();
    $id = $this->getParam('id');
    if (null !== $id) {
      $highlight = $this->model->find($id)->current();
      if (null !== $highlight) {
        $path = UPLOAD_FOLDER . 'highlight/' . $highlight->image;
        if (file_exists($path)) {
          unlink($path);
        }
        $highlight->delete();
        $this->_helper->FlashMessenger->addMessage(self::DELETED_SUCCESSFUL);
      }
    }
    $this->_helper->Redirector('index');
  }

  public function editAction()
  {
    $id = $this->getParam('id');
    if (null !== $id) {
      $highlight = $this->model->find($id)->current();
      if (null !== $highlight) {
        $form = new Admin_Form_Highlight();
        $form->populate($highlight->toArray());
        if ($this->getRequest()->isPost()) {
          $data = $this->getRequest()->getPost();
          if ($form->isValid($data)) {
            $highlight->setFromArray(array(
                'title' => $form->title->getValue(),
                'link' => $form->link->getValue()
            ));
            if ($form->image->isUploaded()) {
              $info = pathinfo($form->image->getFileName());
              $form->image->addFilter('rename', UPLOAD_FOLDER . 'highlight/'
                      . $info['filename'] . '_' . time() . '.' . $info['extension']);
              if ($form->image->receive()) {
                $path = UPLOAD_FOLDER . 'highlight/' . $highlight->image;
                if (file_exists($path)) {
                  unlink($path);
                }
                $highlight->image = $form->image->getValue();
              }
            }
            $highlight->save();
            $this->_helper->flashMessenger->addMessage(self::EDITED_SUCCESSFUL);
            $this->_helper->redirector('index');
          }
        }
        $this->view->form = $form;
        return;
      }
    }
    $this->_helper->Redirector('index');
  }

}
