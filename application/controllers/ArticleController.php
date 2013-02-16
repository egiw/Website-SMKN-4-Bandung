<?php

class ArticleController extends Zend_Controller_Action
{
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $model = new Application_Model_DbTable_Article();
        $data = $model->findAll();
        $articles = Zend_Paginator::factory($data);
        $this->view->articles = $articles;
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
                            'user'       => Zend_Auth::getInstance()->getIdentity()->username,
                            'created_on' => Date('Y-m-d H:i:s'),
                            'content'    => $form->content->getValue(),
                            'article_id' => $article->id
                        ));
                        $form->content->setValue('');
                    }
                }

                if (!$this->getRequest()->getCookie('view_article_' . $id)) {
                    $article->views += 1;
                    $article->save();
                    setcookie('view_article_' . $id, true, time() + 60 * 60 * 24, '/');
                }
                $comments = Zend_Paginator::factory($comment->findArticleComments($article->id));
                $comments->setItemCountPerPage(15);
                $comments->setCurrentPageNumber($pageNumber);

                $this->view->comments = $comments;
                $this->view->article = $article->toArray();
                $this->view->auth = Zend_Auth::getInstance();
                $this->view->form = $form;
            }
        }
    }

    public function likeAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id = $this->getParam('id');
        if (null !== $id && Zend_Auth::getInstance()->hasIdentity()) {
            $model = new Application_Model_DbTable_Article();
            $article = $model->find($id)->current();
            if (null !== $article) {
                $username = Zend_Auth::getInstance()->getIdentity()->username;
                $likes = array_unique(explode(',', $article->likes));
                if (!in_array($username, $likes)) {
                    $likes[] = $username;
                }
                $article->likes = ltrim(implode(',', $likes), ',');
                $article->save();
            }
        }
        $this->redirect('/article/view/id/' . $id . '#comment');
    }

}
