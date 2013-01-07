<?php

class Admin_Model_DbTable_Article extends Zend_Db_Table_Abstract
{
  protected $_name = 'article';

  public function findAll($user = null)
  {
    $select = $this->select()->setIntegrityCheck(false)
            ->from($this->_name);

    if (null !== $user) {
      $select->where("{$this->_name}.created_by = ?", $user);
    }

    $result = $this->fetchAll($select);
    return $result;
  }

}
