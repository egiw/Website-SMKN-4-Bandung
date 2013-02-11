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
    if ($this->getRequest()->isPost() && !$this->getRequest()->getCookie('polls')) {
      $return_uri = $this->getParam('return_uri');
      $post = $this->getRequest()->getPost();
      $polling = new Application_Model_DbTable_Polling();
      $qid = $post['question_id'];
      $aid = $post['vote'];
      if ($activePolling = $polling->findActive($qid)) {
        $data = array('total' => new Zend_Db_Expr('total+1'));
        $polling->getAdapter()
                ->update('poll_answer', $data, array('id = ?' => $aid));
      };
      setcookie('polls', true, time() + 60 * 60 * 24 * 30, '/');
      $this->redirect($return_uri . '#polling-widget');
      return;
    }
    $this->redirect('index');
  }

}
