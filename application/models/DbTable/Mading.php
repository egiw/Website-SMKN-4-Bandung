<?php

class Application_Model_DbTable_Mading extends Zend_Db_Table_Abstract {

    protected $_name = 'mading';

    public function findActive($limit = 4) {
        $select = $this->select()->from($this->_name);
        $select->order('sort ASC');
        $select->limit(4);
        $result = $this->fetchAll($select);
        return $result;
    }

}
