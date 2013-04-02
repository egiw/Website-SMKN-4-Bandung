<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Application_Model_DbTable_News extends Zend_Db_Table_Abstract {

    protected $_name = 'news';
    protected $_user = 'user';

    public function findLatestNews($limit = 5) {
        $select = $this->select()->from($this->_name, array('title', 'id'));
        $select->limit($limit);
        $select->order('created_on asc');
        $select->where("{$this->_name}.status = ?", Admin_Model_Status::PUBLISH);
        $result = $this->fetchAll($select);

        return $result;
    }

    public function findAll() {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from($this->_name)
                ->columns(array('comments' => "(SELECT COUNT(*) FROM news_comments WHERE news_id = {$this->_name}.id)"))
                ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username")
                ->order('created_on DESC');

        $select->where("{$this->_name}.status = ?", 'publish');

        $result = $this->fetchall($select);
        return $result;
    }

    public function findById($news_id) {

        $select = $this->select()
                ->from($this->_name)
                ->where("{$this->_name}.id =", $news_id);

        $result = $this->fetchRow($select);

        return $result;
    }

}

?>
