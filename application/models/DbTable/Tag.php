<?php

class Application_Model_DbTable_Tag extends Zend_Db_Table_Abstract
{
    protected $_name = 'tag';
    protected $_article = 'article';

    public function findAll()
    {
        $select = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_name, array('title'  => 'name', 'weight' => 'frequency'))
        ->where("{$this->_name}.name != ?", '');
        $result = $this->fetchAll($select);
        return $result;
    }

}
