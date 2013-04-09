<?php

class NewsController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
        
        $pageNumber = $this->getParam('page');

        $model = new Application_Model_DbTable_News();
        $data = $model->findAll();
        
        $newss = Zend_Paginator::factory($data);
        $newss->setItemCountPerPage(3);
        $newss->setCurrentPageNumber($pageNumber);
        

        $this->view->newss = $newss;
    }

    public function viewAction() {

        $id = $this->getParam('id');
        $pageNumber = $this->getParam('page');

        if (null != $id) {
            $model = new Application_Model_DbTable_News;
            $news = $model->find($id)->current();
            if (null !== $news && ($news->status == Admin_Model_Status::PUBLISH || $news->created_by == $user->username || $news->status == Admin_Model_Status::DRAFT || $news->status == Admin_Model_Status::ARCHIVED)) {
                if (!$this->getRequest()->getCookie('view_news_' . $id)) {
                    $news->views += 1;
                    $news->save();
                    setcookie('view_news_' . $id, true, time() + 60 * 60 * 24, '/');
                }

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
            } else {
                throw new Exception('Halaman tidak ditemukan');
            }
        }
    }

    public function likeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id = $this->getParam('id');
        if (null !== $id && Zend_Auth::getInstance()->hasIdentity()) {
            $model = new Application_Model_DbTable_News();
            $news = $model->find($id)->current();
            if (null !== $news) {
                $username = Zend_Auth::getInstance()->getIdentity()->username;
                $likes = array_unique(explode(',', $news->likes));
                if (!in_array($username, $likes)) {
                    $likes[] = $username;
                }
                $news->likes = ltrim(implode(',', $likes), ',');
                $news->save();
            }
        }
        $this->redirect('/news/view/id/' . $id . '#comment');
    }

    public function commentAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
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

