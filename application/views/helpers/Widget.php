<?php

class Application_View_Helper_Widget extends Zend_View_Helper_Abstract {

    private $cache;

    public function __construct() {
        $frontend = new Zend_Cache_Frontend_Class(array(
            'cached_entity' => $this,
            'lifetime'      => 1800
        ));
        $backend = new Zend_Cache_Backend_File();
        $backend->setCacheDir(APPLICATION_PATH . '/cache/');
        $this->cache = Zend_Cache::factory($frontend, $backend);
    }

    /**
     *
     * @param Boolean $cache Default true(artinya fungsi akan di cache), false sebaliknya
     * @return Application_View_Helper_Widget
     */
    public function Widget($cache = true) {
        if ($cache) {
            return $this->cache;
        } else {
            return $this;
        }
    }

    public function getUpcomingEvent() {
        $eventUpComing = new Application_Model_DbTable_Event();
        $dataEventUpComing = $eventUpComing->findUpComingEvent(3);
        return $dataEventUpComing->toArray();
    }

    public function getLatestEvent() {
        $eventLatest = new Application_Model_DbTable_Event();
        $dataEventLatest = $eventLatest->findLatestEvent(2);
        return $dataEventLatest->toArray();
    }

    public function getLatestJobs($limit = 5) {
        $jobs = new Application_Model_DbTable_Jobs();
        $latestJobs = $jobs->findLatestJobs($limit);
        return $latestJobs->toArray();
    }

    public function getActivePolling() {
        $polling = new Application_Model_DbTable_Polling();
        $activePolling = $polling->findActive();
        return $activePolling->toArray();
    }

    public function getTagCloud() {
        $model = new Application_Model_DbTable_Tag();
        $tags = $model->findAll()->toArray();
        array_walk($tags, function(&$item, $key) {
            $item['params'] = array('url' => '/article/index/tag/' . $item['title']);
        });
        $cloud = new Zend_Tag_Cloud(array(
            'tags' => $tags
        ));
        $cloud->getCloudDecorator()->setOptions(array('htmlTags' => array(
                'ul' => array('class' => 'unstyled inline')
        )));

        return $cloud->render();
    }

    public function getActiveMading() {
        $model = new Application_Model_DbTable_Mading();
        $mading = $model->findActive();
        return $mading->toArray();
    }

}