<?php

class SearchController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $keyword = $this->getParam('q');
        $article_model = new Application_Model_DbTable_Article();
        $articles = $article_model->findByKeyword($keyword);
        $this->view->keyword= $keyword;
        $this->view->articles = $articles->toArray();
    }

}