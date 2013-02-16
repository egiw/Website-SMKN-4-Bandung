<?php

class Application_Model_DbTable_Prakerin extends Zend_Db_Table_Abstract
{
    protected $_name = 'prakerin';

    public function findAll($filter = null)
    {
        $select = $this->select()->from($this->_name);

        if (null !== $filter) {
            if (isset($filter['name']) && null != $filter['name']) {
                $select->where("{$this->_name}.name LIKE ?", "%{$filter['name']}%");
            }
            if (isset($filter['address']) && null != $filter['address']) {
                $select->where("{$this->_name}.address LIKE ?", "%{$filter['address']}%");
            }
            if (isset($filter['category']) && null != $filter['category']) {
                foreach ($filter['category'] as $category) {
                    $select->orWhere("{$this->_name}.category LIKE ?", "%{$category}%");
                }
            }
        }

        $result = $this->fetchAll($select);
        return $result;
    }

}
