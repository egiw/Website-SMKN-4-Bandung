<?php

class Admin_TagControllerTest extends Zend_Test_PHPUnit_ControllerTestCase
{
  public function setUp()
  {
    $this->bootstrap = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
    parent::setUp();
  }

  public function testIndexAction()
  {
    $params = array('action' => 'index', 'controller' => 'Tag', 'module' => 'admin');
    $urlParams = $this->urlizeOptions($params);
    $url = $this->url($urlParams);
    $this->dispatch($url);

    // assertions
    $this->assertModule($urlParams['module']);
    $this->assertController($urlParams['controller']);
    $this->assertAction($urlParams['action']);
    $this->assertQueryContentContains(
            'div#view-content p', 'View script for controller <b>' . $params['controller'] . '</b> and script/action name <b>' . $params['action'] . '</b>'
    );
  }

  public function testGetAction()
  {
    
    $tag = new Admin_Model_DbTable_Tag();
    $tags = $tag->getAvailableTags();
    $availableTags = array('availableTags' => $tags);
    return json_encode($availableTags);
  }

}
