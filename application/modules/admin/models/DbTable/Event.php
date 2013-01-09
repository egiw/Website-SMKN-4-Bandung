<?php

class Admin_Model_DbTable_Event extends Zend_Db_Table_Abstract
{
  protected $_name = 'event';

  public function findAll($username = null, $filter = null)
  {
    $select = $this->select()->from($this->_name);

    if (null !== $username) {
      $select->where("{$this->_name}.created_by = ?", $username);
    }

    if (Admin_Model_Status::ARCHIVED != $filter['status']) {
      $select->where("{$this->_name}.status != ?", Admin_Model_Status::ARCHIVED);
    }

    if (null !== $filter) {
      if (null != $filter['title']) {
        $select->where("{$this->_name}.title LIKE ?", "%{$filter['title']}%");
      }
      if (null != $filter['status']) {
        $select->where("{$this->_name}.status = ?", $filter['status']);
      }
      if (null != $filter['location']) {
        $select->where("{$this->_name}.location LIKE ?", "%{$filter['location']}%");
      }

      if (null != $filter['from_date']) {
        $filter['from_date'] = Date('Y-d-m', strtotime($filter['from_date']));
        $select->where("{$this->_name}.from_date LIKE ?", "%{$filter['from_date']}%");
      }
    }

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
