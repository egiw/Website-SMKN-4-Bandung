<?php

class Admin_PollingController extends Zend_Controller_Action
{
  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
  }

  public function indexAction()
  {
    // action body
  }

  public function createAction()
  {
    // action body
    $form = new Admin_Form_Polling();


    $this->view->form = $form;
  }

}
