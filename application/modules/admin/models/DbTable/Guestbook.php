<?php

class Admin_Model_DbTable_Guestbook extends Zend_Db_Table_Abstract
{
  protected $_name = 'guestbook';

  public function findAll($limit = null)
  {
    $select = $this->select()
            ->from($this->_name)
            ->order("{$this->_name}.created_on DESC");
    if (isset($limit)) {
      $select->limit($limit);
    }
    $result = $this->fetchAll($select);
    return $result;
  }

}
