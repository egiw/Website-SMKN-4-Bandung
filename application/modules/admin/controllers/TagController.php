<?php

class Admin_TagController extends Zend_Controller_Action
{
  /**
   * @var Admin_Model_DbTable_Tag
   *
   */
  protected $tag;

  public function init()
  {
    $this->tag = new Admin_Model_DbTable_Tag();
    /* Initialize action controller here */
  }

  public function indexAction()
  {
    // action body
  }

  public function getAction()
  {
    $query = $this->getParam('q');
    $this->_helper->viewRenderer->setNoRender(true);
    $this->_helper->layout->disableLayout();
    $tags = $this->tag->getAvailableTags($query);
    $availableTags = array('availableTags' => $tags);
    echo json_encode($availableTags);
  }

}
