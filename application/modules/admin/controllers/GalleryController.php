<?php

class Admin_GalleryController extends Zend_Controller_Action
{
  const MSG_PHOTO_DELETED = 'success|Foto berhasil dihapus.';
  const MSG_NO_PHOTO_DELETED = 'warning|Tidak ada foto terpilih.';
  const MSG_PHOTOS_DELETED = 'success|%s foto berhasil dihapus.';

  /**
   * @var Zend_Gdata_Photos
   *
   *
   *
   *
   *
   */
  protected $service = null;
  /**
   * @var Admin_Model_Gallery
   *
   *
   *
   */
  protected $gallery = null;

  public function init()
  {
    /* Initialize action controller here */
    $this->_helper->layout->setLayout('admin');
    $this->gallery = new Admin_Model_Gallery();

    //  Picasa Web Album Service Initialization
    $service = Zend_Gdata_Photos::AUTH_SERVICE_NAME;
    $user = 'egi.hasdi@sangkuriang.co.id';
    $password = 'axcldsiox';
    $client = Zend_Gdata_ClientLogin::getHttpClient($user, $password, $service);
    $this->service = new Zend_Gdata_Photos($client);
  }

  public function indexAction()
  {
    // action body
    $albums = $this->gallery->getAlbums();
    foreach ($albums as &$album) {
      $album['photos'] = $this->gallery->getPhotos($album['id'], 4);
    }
    $this->view->albums = $albums;
  }

  public function createAction()
  {
    // action body
    $form = new Admin_Form_Album();
    if ($this->getRequest()->isPost()) {
      $data = $this->getRequest()->getPost();
      if ($form->isValid($data)) {
        $this->gallery->createAlbum($form->title->getValue());
        $this->_helper->Redirector('index');
      }
    }
    $this->view->form = $form;
  }

  public function deleteAction()
  {
    $this->_helper->viewRenderer->setNoRender();
    $album_id = $this->getParam('id');
    if (null !== $album_id) {
      $this->gallery->deleteAlbum($album_id);
    }
    $this->_helper->redirector('index');
  }

  public function manageAction()
  {
    $id = $this->getParam('id');
    $pageNumber = $this->getParam('page');
    if (null !== $id) {
      if ($this->getRequest()->isPost()) {
        $post = $this->getRequest()->getPost();
        switch ($post['action']) {
          case 'delete':
            $photo_ids = $post['photos'];
            if (!empty($photo_ids)) {
              foreach ($photo_ids as $photo_id) {
                $this->gallery->deletePhoto($id, $photo_id);
              }
              $this->_helper->FlashMessenger->addMessage(sprintf(self::MSG_PHOTOS_DELETED, count($photo_ids)));
            } else {
              $this->_helper->FlashMessenger->addMessage(self::MSG_NO_PHOTO_DELETED);
            }
            break;
          default:
            break;
        }
        $this->_helper->Redirector('manage', 'gallery', 'admin', array('id' => $id));
      } elseif ($this->getRequest()->isGet()) {
        $album = $this->gallery->getAlbum($id);
        $album['photos'] = Zend_Paginator::factory($album['photos']);
        $album['photos']->setCurrentPageNumber($pageNumber);
        $album['photos']->setItemCountPerPage(10);
        $messages = $this->_helper->flashMessenger->getMessages();
        $this->view->messages = $messages;
        $this->view->album = $album;
      }
    } else {
      $this->_helper->redirector('index');
    }
  }

  public function uploadAction()
  {
    $this->_helper->Layout->disableLayout();
    $this->_helper->ViewRenderer->setNoRender();
    $album_id = $this->getParam('id');
    if ($this->getRequest()->isPost()) {
      $file = $_FILES['file'];
      $type = $file['type'];
      $name = $file['name'];
      $tmp_name = $file['tmp_name'];
      $this->gallery->uploadPhoto($album_id, $tmp_name, $type, $name);
    } else {
      $this->_helper->Redirector('index');
    }
  }

  public function editAction()
  {
    $album_id = $this->getParam('id');
    if (null !== $album_id) {
      $album = $this->gallery->getAlbum($album_id);
      $form = new Admin_Form_Album();
      $form->submit->setLabel('Simpan');
      $form->title->setValue($album['title']);

      if ($this->getRequest()->isPost()) {
        $data = $this->getRequest()->getPost();
        if ($form->isValid($data)) {
          $this->gallery->updateTitle($album_id, $form->title->getValue());
          $this->_helper->redirector('manage', 'gallery', 'admin', array(
              'id' => $album_id
          ));
        }
      }

      $this->view->form = $form;
    }
  }

}
