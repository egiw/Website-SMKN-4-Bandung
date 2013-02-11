<?php

class Application_View_Helper_Tags extends Zend_View_Helper_Abstract
{
  public function tags($tags)
  {
    $tags = explode(',', $tags);
    $links = array();
    foreach ($tags as $tag) {
      $url = $this->view->url(array(
          'module' => 'default',
          'controller' => 'article',
          'tag' => $tag));
      $links[] = "<small><a href='{$url}' target='_blank'>{$tag}</a></small>";
    }
    return implode(', ', $links);
  }

}