<?php

class Admin_Model_DbTable_News extends Zend_Db_Table_Abstract {

    protected $_name = 'news';

    public function findAll($username = null, $filter = null) {
        $select = $this->select()->from($this->_name);

        $select->columns(array('comments' => "(SELECT COUNT(*) FROM news_comments WHERE news_id = {$this->_name}.id)"));

        if (Admin_Model_Status::ARCHIVED != $filter['status']) {
            $select->where("{$this->_name}.status != ?", Admin_Model_Status::ARCHIVED);
        }

        if (null != $username) {
            $select->where("{$this->_name}.created_by = ?", $username);
        }
        if (null !== $filter) {
            if (null != $filter['title']) {
                $select->where("{$this->_name}.title like ?", "%{$filter['title']}%");
            }
            if (null != $filter['status']) {
                $select->where("{$this->_name}.status = ?", $filter['status']);
            }
        }

        $result = $this->fetchAll($select);
        return $result;
    }

    public function countStatus($username = null) {
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
