<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
  public function _initAutoload()
  {
    $autoloader = Zend_Loader_Autoloader::getInstance();
    $autoloader->registerNamespace('SITi_');
  }

  public function _initHelpers()
  {
    $this->bootstrap('view');
    $view = $this->getResource('view');
    $view->addHelperPath(APPLICATION_PATH . '/views/helpers', 'Application_View_Helper');
    $view->addHelperPath(APPLICATION_PATH . '/modues/admin/views/helpers', 'Admin_View_Helper');
  }

  protected function _initNavigation()
  {
    $this->bootstrap('layout');
    $layout = $this->getResource('layout');
    $view = $layout->getView();
    $config = new Zend_Config_Xml(APPLICATION_PATH . '/configs/navigation.xml', 'nav');
    $navigation = new Zend_Navigation($config);
    $view->navigation($navigation);
    $acl = new Zend_Acl();
    $acl->addRole(new Zend_Acl_Role('admin'));
    $acl->addRole(new Zend_Acl_Role('siswa'));
    $acl->add(new Zend_Acl_Resource('event'));
    $acl->add(new Zend_Acl_Resource('news'));
    $view->navigation()->setAcl($acl)->setRole('siswa');
  }

}
