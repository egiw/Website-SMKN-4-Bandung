<?php

class Admin_IndexController extends Zend_Controller_Action {

    /**
     *
     * @var Admin_Model_DbTable_Guestbook
     */
    protected $guestbook;
    /**
     *
     * @var Admin_Model_DbTable_Comment
     */
    protected $comment;

    public function init() {
        /* Initialize action controller here */
        $this->_helper->layout->setLayout('admin');
        $this->guestbook = new Admin_Model_DbTable_Guestbook();
        $this->comment = new Admin_Model_DbTable_Comment();
    }

    public function indexAction() {
        // action body
        $username = Zend_Auth::getInstance()->getIdentity()->username;
        $guestbooks = $this->guestbook->findAll(5);
        $latestComments = $this->comment->getUserLatestComments($username);

        $this->view->latestComments = $latestComments;
        $this->view->guestbooks = $guestbooks;
    }

}
