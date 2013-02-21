<?php

class Application_Model_DbTable_Comment extends Zend_Db_Table_Abstract
{
    protected $_name = 'comment';
    protected $_article_comments = 'article_comments';
    protected $_user = 'user';

    public function findArticleComments($article_id)
    {
        $select = $this->select()->setIntegrityCheck(false)->from($this->_name);

        $select->join($this->_user, "{$this->_name}.user = {$this->_user}.username"
        , array('avatar'))
        ->join($this->_article_comments, "{$this->_name}.id = {$this->_article_comments}.comment_id")
        ->where("{$this->_article_comments}.article_id = ?", $article_id)
        ->order("{$this->_name}.created_on DESC");
        $result = $this->fetchAll($select);

        return $result;
    }

    public function insertArticleComment($data)
    {

    }

}
