<?php

class ArticleController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $tag = $this->getParam('tag');
        $pageNumber = $this->getParam('page');
        $model = new Application_Model_DbTable_Article();
        $data = $model->findAll($tag);
        $articles = Zend_Paginator::factory($data);
        $articles->setCurrentPageNumber($pageNumber);
        $this->view->articles = $articles;
        $this->view->tag = $tag;
        $this->view->auth = Zend_Auth::getInstance();
    }

    public function viewAction() {
        $id = $this->getParam('id');
        if (null !== $id) {
            $model = new Application_Model_DbTable_Article();
            $user = Zend_Auth::getInstance()->getIdentity();
            $acl = new SITi_Acl();
            $article = $model->find($id)->current();

            // Apakah artikel ditemukan
            $isFound = null !== $article;

            // Apakah artikel berstatus "publish"
            $isPublish = $article->status == Admin_Model_Status::PUBLISH;

            // Apakah artikel milik user yang sedang login
            $isBelongs = $article->created_by == $user->username;

            // Apakah user yang sedang login dapat menyetujui artikel (guru/admin)
            $allowedToApprove = $acl->isAllowed($user->role, SITi_Acl::RES_ARTICLE, 'approve');

            // Jika artikel ditemukan dan artikel nya harus berstatus publish
            // atau juga jika artikel milik pengguna yang sedang online dengan semua status
            // yang berarti artikel yang ditampilkan akan dalam mode pratinjau.
            if ($isFound && ($isPublish || $isBelongs || $allowedToApprove)) {
                // views hanya akan ditambahkan jika status nya publish (tidak dalam mode pratinjau)
                if ($isPublish) {
                    if (!$this->getRequest()->getCookie('view_article_' . $id)) {
                        $article->views += 1;
                        $article->save();
                        setcookie('view_article_' . $id, true, time() + 60 * 60 * 24, '/');
                    }
                }

                $form = new Application_Form_Comment();

                $pageNumber = $this->getParam('page');
                $comment = new Application_Model_DbTable_Comment();
                $comments = Zend_Paginator::factory($comment->findArticleComments($article->id));
                $comments->setItemCountPerPage(15);
                $comments->setCurrentPageNumber($pageNumber);

                $this->view->comments = $comments;
                $this->view->article = $article->toArray();
                $this->view->auth = Zend_Auth::getInstance();
                $this->view->form = $form;
            } else {
                throw new Exception('Halaman tidak ditemukan', 404);
            }
        }
    }

    public function likeAction() {
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

    public function commentAction() {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        $id = $this->getParam('id');
        $return = $this->getParam('return');
        if ($this->getRequest()->isPost() && null !== $id) {
            $model = new Application_Model_DbTable_Article();
            $article = $model->find($id)->current();
            if (null !== $article) {
                $form = new Application_Form_Comment();
                $data = $this->getRequest()->getPost();
                if ($form->isValid($data)) {
                    $comment = new Application_Model_DbTable_Comment();
                    $id = $comment->insert(array(
                        'user'       => Zend_Auth::getInstance()->getIdentity()->username,
                        'created_on' => Date('Y-m-d H:i:s'),
                        'content'    => $form->content->getValue(),
                    ));

                    $comment->getAdapter()->insert('article_comments', array(
                        'article_id' => $article->id,
                        'comment_id' => $id
                    ));
                }
            }
        }
        $this->redirect(str_replace('|', '/', $return));
    }

}
