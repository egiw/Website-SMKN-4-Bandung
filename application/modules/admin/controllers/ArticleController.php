<?php

class Admin_ArticleController extends Zend_Controller_Action
{
  /**
   * @var Admin_Form_Article
   *
   *
   *
   */
  protected $form = null;
  /**
   * @var Admin_Model_DbTable_Article
   *
   *
   *
   */
  protected $article = null;
  /**
   * @var Admin_Model_DbTable_Tag
   *
   */
  protected $tag = null;
  /**
   * @var Zend_Session_Namespace
   *
   */
  protected $filter = null;

  public function init()
  {
    $this->_helper->layout->setLayout('admin');
    $this->form = new Admin_Form_Article();
    $this->article = new Admin_Model_DbTable_Article();
    $this->tag = new Admin_Model_DbTable_Tag();
    $this->filter = new Zend_Session_Namespace('filter');
    /* Initialize action controller here */
  }

  public function indexAction()
  {
    $pageNumber = $this->getParam('page');

    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      switch ($post['action']) {
        case 'delete':
          foreach ($post['articles'] as $id) {
            $article = $this->article->find($id)->current();
            if (null != $article) {
              $article->delete();
            }
          }
          $this->_helper->flashMessenger->addMessage(
                  'info|Artikel yang dipilih berhasil dihapus.');
          break;
        case 'filter':
          $this->filter->article = $post['filter'];
          break;
        case 'reset':
          $this->filter->unsetAll();
        default:
          break;
      }

      $this->_helper->redirector('index');
    }

    var_dump($this->filter->article);
// action body
    $messages = $this->_helper->flashMessenger->getMessages();
    $username = Zend_Auth::getInstance()->getIdentity()->username;
    $data = $this->article->findAll($username, $this->filter->article);

    $countStatus = $this->article->countStatus($username);

    $paginator = Zend_Paginator::factory($data);
    $paginator->setCurrentPageNumber($pageNumber);
    $paginator->setDefaultItemCountPerPage(5);

    if (null != $this->filter->article['row']) {
      $paginator->setItemCountPerPage($this->filter->article['row']);
    }

    $this->view->countStatus = $countStatus;
    $this->view->filter = $this->filter->article;
    $this->view->articles = $paginator;
    $this->view->messages = $messages;
  }

  public function createAction()
  {
// action body
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($this->form->isValid($data)) {

        $status = Admin_Model_Status::ARCHIVED;
        if (isset($data['submit'])) {
          $status = Admin_Model_Status::PUBLISH;
        } else if (isset($data['draft'])) {
          $status = Admin_Model_Status::DRAFT;
        }

        $this->tag->save($this->form->tags->getValue());
        $this->article->insert(array(
            'title' => $this->form->title->getValue(),
            'content' => $this->form->content->getValue(),
            'tags' => $this->form->tags->getValue(),
            'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
            'created_on' => Date('Y-m-d H:i:s'),
            'status' => $status
        ));

        $this->_helper->flashMessenger->addMessage
                ('Artikel berhasil dibuat.');
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
      $article = $this->article->find($id)->current();
      if (null !== $article) {
        $this->form->populate($article->toArray());

        if ($this->getRequest()->isPost()) {
          $data = $this->getRequest()->getPost();
          if ($this->form->isValid($data)) {

            $this->tag->save($this->form->tags->getValue(), $article->tags);
            $status = Admin_Model_Status::ARCHIVED;
            if (isset($data['submit'])) {
              $status = Admin_Model_Status::PUBLISH;
            } else if (isset($data['draft'])) {
              $status = Admin_Model_Status::DRAFT;
            }

            $article->setFromArray(array(
                'title' => $this->form->title->getValue(),
                'content' => $this->form->content->getValue(),
                'tags' => $this->form->tags->getValue(),
                'status' => $status
            ))->save();

            $this->_helper->flashMessenger->addMessage
                    ('Artikel berhasil disunting.');
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
    $this->_helper->viewRenderer->setNoRender();
    $id = $this->getParam('id');
    if (null !== $id) {
      $article = $this->article->find($id)->current();
      if (null !== $article) {
        $this->tag->save('', $article->tags);
        $article->delete();
        $this->_helper->flashMessenger->addMessage
                ('Artikel berhasil dihapus.');
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
      $article = $this->article->find($id)->current();
      if (null !== $article && Admin_Model_Status::ARCHIVED === $article->status) {
        $article->status = Admin_Model_Status::DRAFT;
        $article->save();
        $this->_helper->flashMessenger->addMessage('success|Artikel berhasil dikembalikan.');
      }
    }
    $this->_helper->redirector('index');
  }

}
