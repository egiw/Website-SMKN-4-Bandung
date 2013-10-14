<?php

class Application_Model_Gallery extends Zend_Gdata_Photos
{
    function __construct()
    {
        $service = self::AUTH_SERVICE_NAME;
        $email = '';
        $password = '';
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
            $date = $albumEntry->getUpdated()->getText();
            $albums[] = array(
                'id'    => $id,
                'title' => $title,
                'date'  => $date
            );
        }
        return $albums;
    }

    public function getAlbum($id)
    {
        $album = array();
        $albumQuery = new Zend_Gdata_Photos_AlbumQuery();
        $albumQuery->setAlbumId($id);
        $albumFeed = $this->getAlbumFeed($albumQuery);
        $album['id'] = $albumFeed->getGphotoId()->getText();
        $album['title'] = $albumFeed->getTitle()->getText();
        $album['photos'] = array();
        foreach ($albumFeed as $photoEntry) {
            /* @var $photoEntry Zend_Gdata_Photos_PhotoEntry */
            $src = $photoEntry->getContent()->getSrc();
            $album['photos'][] = array(
                'id'  => $photoEntry->getGphotoId()->getText(),
                'src' => $src
            );
        }
        return $album;
    }

    public function getPhotos($album_id, $thumbsize = 230)
    {
        $photos = array();
        $query = new Zend_Gdata_Photos_AlbumQuery();
        $query->setAlbumId($album_id);
        $albumFeed = $this->getAlbumFeed($query);
        foreach ($albumFeed as $photoEntry) {
            $photos[] = $photoEntry->getContent()->getSrc();
        }
        return $photos;
    }

    function getLatestAlbum()
    {
        $latestAlbumWithPhotos = null;
        $latest = $this->getAlbums();
        $latest = $latest[0];
        if ($latestAlbum = $latest) {
            $photos = $this->getPhotos($latestAlbum['id'], 10, 320);
            $latestAlbumWithPhotos = array(
                'title'  => $latestAlbum['title'],
                'id'     => $latestAlbum['id'],
                'photos' => $photos
            );
        }
        return $latestAlbumWithPhotos;
    }

}
