<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    public function _initAutoload() {
        $autoloader = Zend_Loader_Autoloader::getInstance();
        $autoloader->registerNamespace('SITi_');
    }

    public function _initPlugins() {
        $front = Zend_Controller_Front::getInstance();
        $front->registerPlugin(new SITi_Controller_Plugin_AuthPlugin());
    }

    public function _initHelpers() {
        $this->bootstrap('view');
        $view = $this->getResource('view');
        $view->addHelperPath(APPLICATION_PATH . '/views/helpers', 'Application_View_Helper');
        $view->addHelperPath(APPLICATION_PATH . '/modues/admin/views/helpers', 'Admin_View_Helper');
    }

    public function _initRoute() {
        $router = Zend_Controller_Front::getInstance()->getRouter();
        $router->addRoute('user', new Zend_Controller_Router_Route('user/:username', array('controller' => 'user', 'action' => 'index', 'username' => null)));
    }

}
