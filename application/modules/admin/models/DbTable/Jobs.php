<?php

class Admin_Model_DbTable_Jobs extends Zend_Db_Table_Abstract
{
  protected $_name = 'jobs';

  public function findAll()
  {
    $select = $this->select()->from($this->_name);
    $result = $this->fetchAll($select);
    return $result;
  }

}
