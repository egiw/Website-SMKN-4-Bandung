<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Application_Model_DbTable_News extends Zend_Db_Table_Abstract{
    protected $_name = 'news';
    
    public function findLatestNews($limit=5){
        $select = $this->select()->from($this->_name, array('title', 'id'));
        $select->limit($limit);
        $select->order('created_on desc');
        $select->where('status = "publish"');
        $result = $this->fetchAll($select);
        
        return $result;
        
        
    }
}

?>
