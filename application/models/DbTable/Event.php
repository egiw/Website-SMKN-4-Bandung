<?php

class Application_Model_DbTable_Event extends Zend_Db_Table_Abstract {

    protected $_name = 'event';

    public function findLatestEvent($limit = 2) {
        $select = $this->select()->from($this->_name, array('from_date', 'until_date', 'title'));
        $select->limit($limit);
        $select->where("{$this->_name}.status = ?", Admin_Model_Status::PUBLISH);
        $select->where('until_date < now()');
        $select->order('until_date desc');
        $result = $this->fetchAll($select);

        return $result;
    }

    public function findUpComingEvent($limit = 3) {
        $select = $this->select()->from($this->_name, array('from_date', 'until_date', 'title'));
        $select->limit($limit);
        $select->where("{$this->_name}.status = ?", Admin_Model_Status::PUBLISH);
        $select->where('until_date > now()');
        $select->order('until_date asc');
        $result = $this->fetchAll($select);

        return $result;
    }

}
