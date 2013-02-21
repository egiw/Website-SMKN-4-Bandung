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
          'action' => 'index',
          'tag' => $tag), null, true);
      $links[] = "<a href='{$url}'>{$tag}</a>";
    }
    return implode(', ', $links);
  }

}