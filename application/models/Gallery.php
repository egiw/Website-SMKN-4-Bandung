<?php

class Application_Model_Gallery extends Zend_Gdata_Photos
{
  function __construct()
  {
    $service = self::AUTH_SERVICE_NAME;
    $email = 'egi.hasdi@sangkuriang.co.id';
    $password = 'axcldsiox';
    $client = Zend_Gdata_ClientLogin::getHttpClient($email, $password, $service);
    $this->setHttpClient($client);
  }

  public function deleteAlbum($album_id)
  {
    $albumQuery = new Zend_Gdata_Photos_AlbumQuery();
    $albumQuery->setAlbumId($album_id);
    $albumQuery->setType('entry');
    $albumEntry = $this->getAlbumEntry($albumQuery);
    $this->deleteAlbumEntry($albumEntry, true);
  }

  public function createAlbum($title)
  {
    $album = new Zend_Gdata_Photos_AlbumEntry();
    $album->setTitle($this->newTitle($title));
    $this->insertAlbumEntry($album);
  }

  public function getAlbums()
  {
    $albums = array();
    $userFeed = $this->getUserFeed();
    foreach ($userFeed as $albumEntry) {
      /* @var $albumEntry Zend_Gdata_Photos_AlbumEntry */
      $id = $albumEntry->getGphotoId()->getText();
      $title = $albumEntry->getTitle()->getText();
      $albums[] = array(
          'id' => $id,
          'title' => $title
      );
    }
    return $albums;
  }

  public function getAlbum($id)
  {
    $album = array();
    $albumQuery = new Zend_Gdata_Photos_AlbumQuery();
    $albumQuery->setAlbumId($id);
    $albumQuery->setThumbsize(150);
    $albumFeed = $this->getAlbumFeed($albumQuery);
    $album['id'] = $albumFeed->getGphotoId()->getText();
    $album['title'] = $albumFeed->getTitle()->getText();
    $album['photos'] = array();
    foreach ($albumFeed as $photoEntry) {
      /* @var $photoEntry Zend_Gdata_Photos_PhotoEntry */
      $thumbnails = $photoEntry->getMediaGroup()->getThumbnail();
      $album['photos'][] = array(
          'id' => $photoEntry->getGphotoId()->getText(),
          'src' => $thumbnails[0]->getUrl()
      );
    }
    return $album;
  }

  public function getPhotos($album_id, $limit, $thumbsize = 230)
  {
    $photos = array();
    $pEntry = getMediaGroup()->getThumbnail();
    $query = new Zend_Gdata_Photos_AlbumQuery();
    $query->setAlbumId($album_id);
    $query->setThumbsize(230);
    $query->setMaxResults($limit);
    $albumFeed = $this->getAlbumFeed($query);
    foreach ($albumFeed as $photoEntry) {
      /* @var $photoEntry Zend_Gdata_Photos_PhotoEntry */
      $photos[] = $photoEntry->$pEntry[0]->url;
    }
    return $photos;
  }

  public function deletePhoto($album_id, $photo_id)
  {
    $photoQuery = new Zend_Gdata_Photos_PhotoQuery();
    $photoQuery->setAlbumId($album_id);
    $photoQuery->setPhotoId($photo_id);
    $photoQuery->setType('entry');
    $photoEntry = $this->getPhotoEntry($photoQuery);
    $photoEntry->delete();
  }

  public function uploadPhoto($album_id, $tmp_name, $type, $title)
  {
    $fd = $this->newMediaFileSource($tmp_name);
    $fd->setContentType($type);
    $photoEntry = new Zend_Gdata_Photos_PhotoEntry();
    $photoEntry->setMediaSource($fd);
    $photoEntry->setTitle($this->newTitle($title));

    $albumQuery = new Zend_Gdata_Photos_AlbumQuery();
    $albumQuery->setAlbumId($album_id);
    $albumEntry = $this->getAlbumEntry($albumQuery);
    $this->insertPhotoEntry($photoEntry, $albumEntry);
  }

  public function updateTitle($album_id, $title)
  {
    $albumQuery = new Zend_Gdata_Photos_AlbumQuery();
    $albumQuery->setAlbumId($album_id);
    $albumQuery->setType('entry');
    $albumEntry = $this->getAlbumEntry($albumQuery);
    $albumEntry->setTitle(new Zend_Gdata_App_Extension_Title($title));
    $albumEntry->save();
  }

  function getLatestAlbum()
  {
    $latestAlbumWithPhotos = null;
    $getAlbum= $this->getAlbums();
    if ($latestAlbum = $getAlbum[0]) {
      $photos = $this->getPhotos($latestAlbum['id'], 10, 320);
      $latestAlbumWithPhotos = array(
          'title' => $latestAlbum['title'],
          'id' => $latestAlbum['id'],
          'photos' => $photos
      );
    }
    return $latestAlbumWithPhotos;
  }

}
