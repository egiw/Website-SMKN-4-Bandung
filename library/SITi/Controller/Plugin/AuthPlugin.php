<?php

class SITi_Controller_Plugin_AuthPlugin extends Zend_Controller_Plugin_Abstract
{
  
  public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request)
  {
    $auth = Zend_Auth::getInstance();
    if ($request->getModuleName() == 'admin'
            && !$auth->hasIdentity()) {
      if ('login' != $request->getActionName()
              || 'user' != $request->getControllerName()) {
        $this->getResponse()->setRedirect('/admin/user/login');
      }
    } elseif ($auth->hasIdentity()
            && 'user' == $request->getControllerName()
            && 'login' == $request->getActionName()) {
      $this->getResponse()->setRedirect('/admin/index');
    }
  }

}