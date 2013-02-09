<?php

class SITi_Controller_Action_Helper_UserActivity extends Zend_Controller_Action_Helper_Abstract
{
  public function postDispatch()
  {
    $auth = Zend_Auth::getInstance();
    if ($auth->hasIdentity() && $this->getRequest() !== 'error') {
      $log = new Admin_Model_DbTable_Log();
      $log->createRow(array(
          'username' => $auth->getIdentity()->username,
          'module' => $this->getRequest()->getModuleName(),
          'controller' => $this->getRequest()->getControllerName(),
          'action' => $this->getRequest()->getActionName(),
          'log_date' => Date('Y-m-d H:i:s')))->save();
    }
  }

}