<?php

class UserController extends Zend_Controller_Action {

    public function init() {
        
    }

    public function viewAction() {
        $username = $this->getParam('username');
        if (null !== $username) {
            $model = new Admin_Model_DbTable_User();
            $user = $model->find($username)->current();
            if (null !== $user) {
                $model = new Application_Model_DbTable_Article();
                $comment = new Application_Model_DbTable_Comment();
                $posts = $model->findLatestArticles(5, $user->username);
                $comments = $comment->findUserComments($user->username, 5);
                $this->view->comments = $comments->toArray();
                $this->view->posts = $posts->toArray();
                $this->view->user = $user;
            } else {
                Throw new Zend_Http_Exception('Pengguna tidak ditemukan', 404);
            }
        } else {
            Throw new Zend_Http_Exception('Halaman tidak ditemukan', 404);
        }
    }

}

