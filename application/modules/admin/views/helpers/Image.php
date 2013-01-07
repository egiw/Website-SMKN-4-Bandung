<?php

class Admin_View_Helper_Image extends Zend_View_Helper_Abstract
{
  protected $format = '<img src="%s" alt="" class="thumbnail" width="%s" height="%" title="%s" />';

  public function image($folder, $image)
  {
    $base = $this->view->baseUrl('upload/');
    $url = $base . $folder . '/' . $image;
    $path = UPLOAD_FOLDER . $folder . '/' . $image;

    if (null !== $image && file_exists($path)) {
      $src = $url;
    } else {
    }

    $img = sprintf($this->format, $src, 32, 32, $src);
    return $img;
  }

}