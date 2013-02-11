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

      $qid = $post['question_id'];
      $aid = $post['vote'];
      if ($activePolling = $polling->findActive($qid)) {
        $polling->getAdapter()
                ->update('poll_answer', array('total' => 'total+1'), array('id = ?', $aid));
      };
    }
  }

}
