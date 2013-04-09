<?php

class Application_Model_DbTable_Comment extends Zend_Db_Table_Abstract {

    protected $_name = 'comment';
    protected $_article_comments = 'article_comments';
    protected $_news_comments = 'news_comments';
    protected $_user = 'user';
    protected $_article = 'article';
    protected $_news = 'news';

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

    public function findUserComments($username, $limit = 5) {
        $article = $this->select()
                ->setIntegrityCheck(false)
                ->from($this->_article_comments, array('post_id' => 'article_id'))
                ->join($this->_name, "{$this->_article_comments}.comment_id = {$this->_name}.id")
                ->join($this->_article, "{$this->_article_comments}.article_id = {$this->_article}.id", array('title'))
                ->columns(array('type' => '("article")'));

        $news = $this->select()
                ->setIntegrityCheck(false)
                ->from($this->_news_comments, array('post_id' => 'news_id'))
                ->join($this->_name, "{$this->_news_comments}.comment_id = {$this->_name}.id")
                ->join($this->_news, "{$this->_news_comments}.news_id = {$this->_news}.id", array('title'))
                ->columns(array('type' => '("news")'));

        $comment = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('comments' => $this->select()->union(array($article, $news))))
                ->where("comments.user = ?", $username)
                ->order("comments.created_on DESC")
                ->limit($limit);

        return $this->fetchAll($comment);
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
