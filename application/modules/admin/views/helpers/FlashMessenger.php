<?php

class Admin_View_Helper_FlashMessenger extends Zend_View_Helper_Abstract
{
  protected $format = "<div class='alert %s %s'><a href='#' class='close' data-dismiss='alert'>&times;</a>%s</div>";

  public function FlashMessenger($messages, $class = '')
  {
    $html = '';
    foreach ($messages as $message) {
      $part = explode('|', $message);
      if (isset($part[1])) {
        $message = $part[1];
      }
      switch ($part[0]) {
        case 'error':
          $alert_class = 'alert-error';
          break;
        case 'warning':
          $alert_class = 'alert-warning';
          break;
        case 'success':
          $alert_class = 'alert-success';
          break;
        case 'info':
        default:
          $alert_class = 'alert-info';
          break;
      }

      $html .= sprintf($this->format, $alert_class, $class, $message);
    }

    return $html;
  }

}