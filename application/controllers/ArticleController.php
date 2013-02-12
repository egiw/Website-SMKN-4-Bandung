<?php

class ArticleController extends Zend_Controller_Action
{
  public function init()
  {
    /* Initialize action controller here */
  }

  public function indexAction()
  {
    
  }

  public function viewAction()
  {
    $id = $this->getParam('id');
    $pageNumber = $this->getParam('page');
    if (null !== $id) {
      $form = new Application_Form_Comment();
      $model = new Application_Model_DbTable_Article();
      $comment = new Application_Model_DbTable_Comment();
      $article = $model->find($id)->current();

      if (null !== $article) {
        if ($this->getRequest()->isPost()) {
          $data = $this->getRequest()->getPost();
          if ($form->isValid($data)) {
            $comment->insert(array(
                'user' => Zend_Auth::getInstance()->getIdentity()->username,
                'created_on' => Date('Y-m-d H:i:s'),
                'content' => $form->content->getValue(),
                'article_id' => $article->id
            ));
            $form->content->setValue('');
          }
        }


        $comments = Zend_Paginator::factory($comment->findArticleComments($article->id));
        $comments->setItemCountPerPage(5);
        $comments->setCurrentPageNumber($pageNumber);

        $this->view->comments = $comments;
        $this->view->article = $article->toArray();
        $this->view->auth = Zend_Auth::getInstance();
        $this->view->form = $form;
      }
    }
  }

}
