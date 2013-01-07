<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
  public function _initAutoload()
  {
    $autoloader = Zend_Loader_Autoloader::getInstance();
    $autoloader->registerNamespace('SITi_');
  }

  public function _initAuthPlugin()
  {
    Zend_Controller_Front::getInstance()->registerPlugin(new SITi_Controller_Plugin_AuthPlugin);
  }

}
