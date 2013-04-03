<?php

class IndexController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function testAction() {
        $this->_helper->viewRenderer->setNoRender();
        $user = $this->getParam('user');
        $model = new Zend_Db_Table(array(
            'name' => 'testing'
        ));
        if ($user = $model->find($user)->current()) {
            $user->setFromArray(array(
                'last_active' => Date('Y-m-d H:i:s')
            ))->save();
        } else {
            $model->insert(array(
                'name' => $user,
                'last_active' => Date('Y-m-d H:i:s')
            ));
        }
    }

    public function indexAction() {
        $frontend = new Zend_Cache_Frontend_Class(array(
            'cached_entity' => $this,
            'lifetime' => 1800,
            'caching' => true
        ));
        $backend = new Zend_Cache_Backend_File();
        $backend->setCacheDir(APPLICATION_PATH . '/cache/');
        $cache = Zend_Cache::factory($frontend, $backend);

        $this->view->sortedHighlight = $cache->getCachedHighlight();
        $this->view->latestAlbumWithPhotos = $cache->getCachedLatestAlbum();
        $this->view->feeds = $cache->getCachedFeed();
        $this->view->news = $this->getCachedLatestNews();
        $this->view->latestArticles = $cache->getCachedLatestArticle();
    }

    public function getCachedLatestArticle() {
        $article = new Application_Model_DbTable_Article();
        $latestArticles = $article->findLatestArticles(5);
        return $latestArticles->toArray();
    }

    public function getCachedLatestNews() {
        $news = new Application_Model_DbTable_News();
        $data = $news->findLatestNews(7);
        return $data->toArray();
    }

    public function getCachedLatestAlbum() {
        $gallery = new Application_Model_Gallery();
        return $gallery->getLatestAlbum();
    }

    public function getCachedHighlight() {
        $highlight = new Application_Model_DbTable_Highlight();
        $sortedHighlight = $highlight->findSortedHighlight(5);
        return $sortedHighlight->toArray();
    }

    public function getCachedFeed() {
        $feed = Zend_Feed_Reader::import('http://www.kompas.com/getrss/edukasi');
        $feeds_array = array();
        foreach ($feed as $index => $news) {
            $feeds_array[$index]['link'] = $news->getLink();
            $feeds_array[$index]['title'] = $news->getTitle();
            $pattern = '#<img(.*)src="([^"]*)"(.*)>#';
            $replacement = '<img$1src="/timthumb.php?src=$2&w=120&h=60&q=100"$3/>';
            $feeds_array[$index]['description'] = preg_replace($pattern, $replacement, $news->getDescription());
        }
        return $feeds_array;
    }

}
