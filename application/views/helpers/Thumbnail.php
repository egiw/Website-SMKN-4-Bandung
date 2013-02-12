<?php

class Application_View_Helper_Thumbnail extends Zend_View_Helper_Abstract
{
  protected $format = '<img src="%s" alt="" class="%s" />';
  protected $timthumb = '/timthumb.php?src=%s&w=%s&h=%s&q=%s';

  public function thumbnail($folder, $filename, $default = 'default.png', $w = '100', $h = '100', $q = '100', $class = 'thumbnail')
  {
    $base = $this->view->baseUrl('upload/');
    $url = $base . $folder . '/' . $filename;
    $default = $base . $default;
    $path = UPLOAD_FOLDER . $folder . '/' . $filename;
    if (null === $filename || !file_exists($path)) {
      $url = $default;
    }
    $timthumb = sprintf($this->timthumb, $url, $w, $h, $q);
    $img = sprintf($this->format, $timthumb, $class);
    return $img;
  }

}