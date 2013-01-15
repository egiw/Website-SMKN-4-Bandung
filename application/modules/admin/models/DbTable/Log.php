<?php

class Admin_Model_DbTable_Log extends Zend_Db_Table_Abstract
{
  protected $_name = 'log';

  public function findAll()
  {
    $select = $this->select()->from($this->_name)->order("log_date DESC");

    $result = $this->fetchAll($select);
    return $result;
  }

}
