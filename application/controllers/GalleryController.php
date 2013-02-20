<?php

class GalleryController extends Zend_Controller_Action
{
    /**
     *
     * @var Zend_Cache
     */
    protected $cache;

    public function init()
    {
        /* Initialize action controller here */
        $frontend = new Zend_Cache_Frontend_Class(array(
            'cached_entity' => $this,
            'lifetime'      => 1800,
            'caching'       => true
        ));
        $backend = new Zend_Cache_Backend_File();
        $this->cache = Zend_Cache::factory($frontend, $backend);
    }

    public function indexAction()
    {
        $this->view->albums = $this->cache->getCachedAlbums();
    }

    public function viewAction()
    {
        $id = $this->_getParam('id');
        $pageNumber = $this->getParam('page');
        if (null !== $id) {
            $album = $this->cache->getCachedAlbum($id);
            if (null !== $album) {
                $album['photos'] = Zend_Paginator::factory($album['photos']);
                $album['photos']->setCurrentPageNumber($pageNumber);
                $album['photos']->setItemCountPerPage(10);
                $this->view->album = $album;
                return;
            }
        }
        $this->_helper->redirector('index');
    }

    public function getCachedAlbums()
    {
        $model = new Application_Model_Gallery();
        $albums = $model->getAlbums();
        foreach ($albums as &$album) {
            $album['photos'] = $model->getPhotos($album['id']);
        }
        return $albums;
    }

    public function getCachedAlbum($id)
    {
        $model = new Application_Model_Gallery();
        $album = $model->getAlbum($id);
        return $album;
    }

}
