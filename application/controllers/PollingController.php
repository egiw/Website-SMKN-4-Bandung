<?php

class PollingController extends Zend_Controller_Action
{
  public function init()
  {
    /* Initialize action controller here */
  }

  public function indexAction()
  {
    // action body
  }

  public function voteAction()
  {
    $this->_helper->layout->disableLayout();
    $this->_helper->viewRenderer->setNoRender();
    if ($this->getRequest()->isPost()) {
      $post = $this->getRequest()->getPost();
      $polling = new Application_Model_DbTable_Polling();
      $return_uri = $post['return_uri'];
      $qid = $post['question_id'];
      $aid = $post['vote'];
      if ($activePolling = $polling->findActive($qid)) {
        $data = array('total' => new Zend_Db_Expr('total+1'));
        $polling->getAdapter()
                ->update('poll_answer', $data, array('id = ?' => $aid));
      };
      $this->redirect($return_uri . '#polling-widget');
    }
  }

}
