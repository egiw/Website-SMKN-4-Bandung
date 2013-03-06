<?php

class Admin_Model_DbTable_Mading extends Zend_Db_Table_Abstract {

    protected $_name = 'mading';

    public function findAll() {
        $select = $this->select()->from($this->_name, array(
            'id', 'title', 'created_by', 'created_on', 'image'
        ));
        $select->order("sort ASC");
        $result = $this->fetchAll($select);
        return $result;
    }

}
