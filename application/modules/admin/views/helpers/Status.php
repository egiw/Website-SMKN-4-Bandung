<?php

class Admin_View_Helper_Status extends Zend_View_Helper_Abstract
{
  protected $format = '<span class="text %s">%s</span>';

  public function status($status)
  {
    switch ($status) {
      case Admin_Model_Status::PENDING:
        $class = 'text-warning';
        $content = 'Menunggu Persetujuan';
        break;
      case Admin_Model_Status::PUBLISH:
        $class = 'text-success';
        $content = 'Diterbitkan';
        break;
      case Admin_Model_Status::ARCHIVED:
        $class = 'muted';
        $content = 'Diarsipkan';
        break;
      case Admin_Model_Status::DRAFT:
      default:
        $class = 'muted';
        $content = 'Draft';
        break;
    }
    $status = sprintf($this->format, $class, $content);
    return $status;
  }

}