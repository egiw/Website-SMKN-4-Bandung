<?php

class Application_Model_DbTable_Event extends Zend_Db_Table_Abstract
{

    protected $_name = 'event';

    public function findLatestEvent(){
        $select = $this->select()->from($this->_name);
        
        $result = $this->fetchAll($select);
        
        return $result;
    }

}

