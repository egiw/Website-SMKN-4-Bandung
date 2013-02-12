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
    if (null !== $id) {
      $model = new Application_Model_DbTable_Article();
      $article = $model->find($id)->current();
      if (null !== $article) {
        $this->view->article = $article->toArray();
      }
    }
  }

}
