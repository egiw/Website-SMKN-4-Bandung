<?php

class SITi_Controller_Plugin_AuthPlugin extends Zend_Controller_Plugin_Abstract
{
  public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request)
  {
    if ('admin' === $request->getModuleName()) {
      $auth = Zend_Auth::getInstance();
      if (!$auth->hasIdentity()) {
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

  public function preDispatch(\Zend_Controller_Request_Abstract $request)
  {
    if ('admin' === $request->getModuleName()) {
      $acl = new SITi_Acl();
      $resource = $request->getModuleName();

      if (Zend_Auth::getInstance()->hasIdentity()) {
        $role = Zend_Auth::getInstance()->getIdentity()->role;
      } else {
        $role = 'anonymous';
      }

      $resource = $request->getModuleName() . ':' . $request->getControllerName();
//    if (!$acl->isAllowed($role, $resource)) {
//      $request->setModuleName('admin');
//      $request->setControllerName('error');
//      $request->setActionName('index');
//    }
    }
  }

}