<?php

class Application_View_Helper_Widget extends Zend_View_Helper_Abstract
{
  private $cache;

  public function __construct()
  {
    $frontend = new Zend_Cache_Frontend_Class(array(
                'cached_entity' => $this,
                'lifetime' => 1800
            ));
    $backend = new Zend_Cache_Backend_File();
    $backend->setCacheDir(APPLICATION_PATH . '/cache/');
    $this->cache = Zend_Cache::factory($frontend, $backend);
  }

  public function Widget()
  {
    return $this->cache;
  }

  public function getUpcomingEvent()
  {
    $eventUpComing = new Application_Model_DbTable_Event();
    $dataEventUpComing = $eventUpComing->findUpComingEvent(3);
    return $dataEventUpComing->toArray();
  }

  public function getLatestEvent()
  {
    $eventLatest = new Application_Model_DbTable_Event();
    $dataEventLatest = $eventLatest->findLatestEvent(2);
    return $dataEventLatest->toArray();
  }

}