<?php

class NewsController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body

        $model = new Application_Model_DbTable_News();
        $data = $model->findAll();

        $this->view->newss = $data;
    }

    public function viewAction() {

        $id = $this->getParam('id');
        $pageNumber = $this->getParam('page');

        if (null != $id) {
            $model = new Application_Model_DbTable_News;
            $news = $model->find($id)->current();
            if (null !== $news) {
//                if (!$this->getRequest()->getCookie('view_news_' . $id)) {
//                    $news->views += 1;
//                    $news->save();
//                    setcookie('view_news_' . $id, true, time() + 60 * 60 * 24, '/');
//                }
                
                $form = new Application_Form_Comment();
                
                $pageNumber = $this->getParam('page');
                $comment = new Application_Model_DbTable_Comment();

                $comments = Zend_Paginator::factory($comment->findNewsComments($news->id));
                $comments->setItemCountPerPage(15);
                $comments->setCurrentPageNumber($pageNumber);

                $this->view->auth = Zend_Auth::getInstance();
                $this->view->news = $news->toArray();
                $this->view->form = $form;
                $this->view->comments = $comments;
            }
        }
    }

    public function likeAction() {
        
    }

    public function commentAction() {
        $this->_helper->viewRendere->setNoRender();
        $this->_helper->layout->disableLayout();
        $id = $this->getParam('id');
        $return = $this->getParam('return');

        if ($this->getRequest()->isPost() && null !== $id) {
            $model = new Application_Model_DbTable_Comment();
            $news = $model->find($id)->current();
            if (null != $news) {
                $form = new Application_Form_Comment();
                $data = $this->getRequest()->getPost();

                if ($form->isValid($data)) {
                    $comment = new Application_Model_DbTable_Comment();
                    $id = $comment->insert(array(
                        'user' => Zend_Auth::getInstance()->getIdentity()->username,
                        'created_on' => Date('Y-m-d H:i:s'),
                        'content' => $form->content->getValue(),
                            ));

                    $comment->getAdapter()->insert('news_comments', array(
                        'news_id' => $news->id,
                        'comment_id' => $id
                    ));
                }
            }
        }

        $this->redirect(str_replace('|', '/', $return));
    }

}

