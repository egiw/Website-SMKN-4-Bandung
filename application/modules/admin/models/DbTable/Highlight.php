<?php

class Admin_Model_DbTable_Highlight extends Zend_Db_Table_Abstract
{
  protected $_name = 'highlight';

  public function findAll($limit = 10)
  {
    $select = $this->select()->from($this->_name);
    $select
            ->order("{$this->_name}.sort ASC")
            ->order("{$this->_name}.created_on DESC")
            ->limit($limit);
    $result = $this->fetchAll($select);
    return $result;
  }

}
