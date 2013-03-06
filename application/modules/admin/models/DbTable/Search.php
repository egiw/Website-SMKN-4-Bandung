<?php

class Admin_Model_DbTable_Search extends Zend_Db_Table {

    protected $_name = 'search_admin';
    protected $_primary = 'id';

    public function search($q) {
        $select = $this->select()->from($this->_name);
        $select->where("{$this->_name}.title LIKE ?", "%{$q}%");
        $select->order("{$this->_name}.created_on DESC");
        $result = $this->fetchAll($select);
        return $result;
    }

}
