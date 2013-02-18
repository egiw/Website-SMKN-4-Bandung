<?php

class Application_Model_DbTable_Article extends Zend_Db_Table_Abstract
{
    protected $_name = 'article';
    protected $_user = 'user';

    public function findAll()
    {
        $select = $this->select()
        ->from($this->_name);
        $result = $this->fetchall($select);
        return $result;
    }

    public function findLatestArticles($limit = 5)
    {
        $select = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_name)
        ->where("{$this->_name}.status = ?", 'publish')
        ->order("{$this->_name}.created_on DESC")
        ->columns(array('comments' => "(SELECT COUNT(*) FROM comment WHERE article_id = {$this->_name}.id)"))
        ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username", array(
            'avatar'));
        $result = $this->fetchAll($select);
        return $result;
    }

    public function findById($article_id)
    {
        $select = $this->select()
        ->from($this->_name)
        ->where("{$this->_name}.id = ?", $article_id)
//        ->where("{$this->_name}.status =", Admin_Model_Status::PUBLISH)
        ->columns(array('comments_count' => "(SELECT COUNT(*) FROM comment WHERE article_id = {$article_id})"));
        $result = $this->fetchRow($select);
        return $result;
    }

}
