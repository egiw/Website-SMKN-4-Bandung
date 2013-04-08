<?php

class Application_Model_DbTable_Comment extends Zend_Db_Table_Abstract {

    protected $_name = 'comment';
    protected $_article_comments = 'article_comments';
    protected $_news_comments = 'news_comments';
    protected $_user = 'user';
    protected $_article = 'article';

    public function findArticleComments($article_id) {
        $select = $this->select()->setIntegrityCheck(false)->from($this->_name);

        $select->join($this->_user, "{$this->_name}.user = {$this->_user}.username"
                        , array('avatar'))
                ->join($this->_article_comments, "{$this->_name}.id = {$this->_article_comments}.comment_id")
                ->where("{$this->_article_comments}.article_id = ?", $article_id)
                ->order("{$this->_name}.created_on DESC");
        $result = $this->fetchAll($select);

        return $result;
    }

    public function findUserComments($username, $limit = 10) {
        $select = $this->select()->setIntegrityCheck(false)->from($this->_name);

        $select->join($this->_user, "{$this->_name}.user = {$this->_user}.username"
                        , array('avatar'))
                ->join($this->_article_comments, "{$this->_name}.id = {$this->_article_comments}.comment_id")
                ->join($this->_article, "{$this->_article_comments}.article_id = {$this->_article}.id", array('title'))
                ->where("{$this->_name}.user = ?", $username)
                ->order("{$this->_name}.created_on DESC")
                ->limit($limit);

        $result = $this->fetchAll($select);
        return $result;
    }

    public function findNewsComments($news_id) {
        $select = $this->select()->setIntegrityCheck(false)->from($this->_name);

        $select->join($this->_user, "{$this->_name}.user = {$this->_user}.username"
                        , array('avatar'))
                ->join($this->_news_comments, "{$this->_name}.id = {$this->_news_comments}.comment_id")
                ->where("{$this->_news_comments}.news_id = ?", $news_id)
                ->order("{$this->_name}.created_on DESC");
        $result = $this->fetchAll($select);

        return $result;
    }

}
