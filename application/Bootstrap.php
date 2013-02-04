<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
  public function _initAutoload()
  {
    $autoloader = Zend_Loader_Autoloader::getInstance();
    $autoloader->registerNamespace('SITi_');
  }

  public function _initPlugins()
  {
    Zend_Controller_Front::getInstance()->registerPlugin(new SITi_Controller_Plugin_AuthPlugin);
    Zend_Controller_Action_HelperBroker::addHelper(new SITi_Controller_Action_Helper_UserActivity);
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
