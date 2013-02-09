<?php

class Admin_IndexController extends Zend_Controller_Action
{
  /**
   *
   * @var Admin_Model_DbTable_Guestbook
   */
  protected $guestbook;
  /**
   *
   * @var Admin_Model_Analytics
   */
//  protected $analytics;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->guestbook = new Admin_Model_DbTable_Guestbook();
//    $this->analytics = new Admin_Model_Analytics();
  }

  public function indexAction()
  {
    // action body
    $guestbooks = $this->guestbook->findAll(5);
    $this->view->guestbooks = $guestbooks;
  }

}
