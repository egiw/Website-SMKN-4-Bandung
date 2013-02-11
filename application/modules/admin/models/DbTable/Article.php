<?php

class Admin_Model_DbTable_Article extends Zend_Db_Table_Abstract
{
  protected $_name = 'article';

  public function findAll($user = null, $filter = NULL)
  {
    $select = $this->select()->setIntegrityCheck(false)
            ->from($this->_name);

    if (null !== $user) {
      $select->where("{$this->_name}.created_by = ?", $user);
    }

    if (Admin_Model_Status::ARCHIVED != $filter['status']) {
      $select->where("{$this->_name}.status != ?", Admin_Model_Status::ARCHIVED);
    }

    if (null !== $filter) {
      if (null != $filter ['title']) {
        $select->where("{$this->_name}.title like ?", "%{$filter['title']}%");
      }
      if (null != $filter['tag']) {
        $select->where("{$this->_name}.tags like ?", "%{$filter['tag']}%");
      }
      if (null != $filter['status']) {
        $select->where("{$this->_name}.status = ?", $filter['status']);
      }
    }
    
    $select->order("{$this->_name}.created_on DESC");

    $result = $this->fetchAll($select);
    return $result;
  }

  public function countStatus($username = null)
  {
    $select = $this->select()->from($this->_name, array(
        'archived' => "SUM(status = 'archived')",
        'draft' => "SUM(status = 'draft')",
        'pending' => "SUM(status = 'pending')",
        'publish' => "SUM(status = 'publish')"));

    if (null !== $username) {
      $select->where("{$this->_name}.created_by = ?", $username);
    }

    $result = $this->getAdapter()->fetchRow($select);
    return $result;
  }

}
