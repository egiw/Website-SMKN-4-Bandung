<?php

class Admin_JobsController extends Zend_Controller_Action
{
  /**
   * @var Admin_Form_Jobs
   *
   *
   *
   */
  protected $form = null;
  /**
   * @var Admin_Model_DbTable_Jobs
   *
   *
   *
   */
  protected $jobs = null;
  /**
   * @var Admin_Model_DbTable_Tag
   *
   *
   */
  protected $tag = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->form = new Admin_Form_Jobs();
    $this->jobs = new Admin_Model_DbTable_Jobs();
    $this->tag = new Admin_Model_DbTable_Tag();
  }

  public function indexAction()
  {
    // action body
    $pageNumber = $this->getParam('page');

    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'delete':
          if (isset($post['jobs'])) {
            $jobs = $post['jobs'];
            foreach ($jobs as $id) {
              $job = $this->jobs->find($id)->current();
              if (null !== $job) {
                $job->delete();
              }
            }
            $this->_helper->flashMessenger->addMessage(count($jobs) . "berhasil dihapus.  ");
          }
          break;

        default:
          break;
      }
    }

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
      var_dump($data);
      if ($this->form->isValid($data)) {
        $this->tag->save($this->form->tags->getValue());
        $job = $this->jobs->createRow(array(
            'title' => $this->form->title->getValue(),
            'company' => $this->form->company->getValue(),
            'website' => $this->form->website->getValue(),
            'info' => $this->form->info->getValue(),
            'tags' => $this->form->tags->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => date('Y-m-d H:i:s')));

        if ($this->form->logo->isUploaded()) {
          $info = pathinfo($this->form->logo->getFileName());
          $this->form->logo->addFilter('rename', UPLOAD_FOLDER . 'company-logo/'
                  . $info['filename'] . '_' . time() . '.' . $info['extension']);
          if ($this->form->logo->receive()) {
            $job['logo'] = $this->form->logo->getValue();
          }
        }

        $job->save();

        $this->_helper->flashMessenger->addMessage('success|Lowongan pekerjaan berhasil diposting');
        $this->_helper->redirector('index');
      }
    }

    $this->view->form = $this->form;
  }

  public function editAction()
  {
    // action body

    $id = $this->getParam('id');
    if (null !== $id) {
      $job = $this->jobs->find($id)->current();
      if (null !== $job) {
        $this->form->populate($job->toArray());

        if ($this->getRequest()->isPost()) {
          $data = $this->getRequest()->getPost();
          if ($this->form->isValid($data)) {
            $this->tag->save($this->form->tags->getValue(), $job->tags);
            $job->setFromArray(array(
                'title' => $this->form->title->getValue(),
                'company' => $this->form->company->getValue(),
                'website' => $this->form->website->getValue(),
                'info' => $this->form->info->getValue(),
                'tags' => $this->form->tags->getValue(),
                'updated_by' => Zend_Auth::getInstance()->getIdentity()->username,
                'updated_on' => date('Y-m-d H:i:s')
            ));

            if ($this->form->logo->isUploaded()) {
              $info = pathinfo($this->form->logo->getFileName());
              $this->form->logo->addFilter('rename', UPLOAD_FOLDER . 'company-logo/'
                      . $info['filename'] . '_' . time() . '.' . $info['extension']);
              if ($this->form->logo->receive()) {
                $job->logo = $this->form->logo->getValue();
              }
            }

            $job->save();

            $this->_helper->flashMessenger('Lowongan Kerja berhasil disunting.');
            $this->_helper->redirector('index');
          }
        }

        $this->view->form = $this->form;
        return;
      }
    }

    $this->_helper->redirector('index');
  }

  public function deleteAction()
  {
    // action body
    $this->_helper->viewRenderer->setNoRender();
    $id = $this->getParam('id');
    if (null !== $id) {
      $job = $this->jobs->find($id)->current();
      if (null !== $job) {
        $job->delete();
        $this->_helper->flashMessenger->addMessage('Lowongan kerja berhasil dihapus.');
      }
    }
    $this->_helper->redirector('index');
  }

}
