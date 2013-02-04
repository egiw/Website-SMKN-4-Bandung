<?php

class Admin_Model_DbTable_Jobs extends Zend_Db_Table_Abstract
{
  protected $_name = 'jobs';

  public function findAll($filter = null)
  {
    $select = $this->select()->from($this->_name);
    if (null !== $filter) {
      if (null != $filter['position']) {
        $select->where("{$this->_name}.title LIKE ?", "%{$filter['position']}%");
      }
      if (null != $filter['company']) {
        $select->where("{$this->_name}.company LIKE ?", "%{$filter['company']}%");
      }
    }
    $result = $this->fetchAll($select);
    return $result;
  }

}
