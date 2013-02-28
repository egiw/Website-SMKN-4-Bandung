<?php

class Application_Model_DbTable_Article extends Zend_Db_Table_Abstract {

    protected $_name = 'article';
    protected $_user = 'user';
    protected $_news = 'news';

    public function findAll($tag = null) {
        $select = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_name)
        ->columns(array('comments' => "(SELECT COUNT(*) FROM article_comments WHERE article_id = {$this->_name}.id)"))
        ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username", array('avatar'))
        ->order('created_on DESC');

        if (null !== $tag) {
            $select->where("{$this->_name}.tags LIKE ?", "%{$tag}%");
        }

        $result = $this->fetchall($select);
        return $result;
    }

    public function findLatestArticles($limit = 5) {
        $select = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_name)
        ->where("{$this->_name}.status = ?", 'publish')
        ->order("{$this->_name}.created_on DESC")
        ->columns(array('comments' => "(SELECT COUNT(*) FROM article_comments WHERE article_id = {$this->_name}.id)"))
        ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username", array(
            'avatar'));
        $result = $this->fetchAll($select);
        return $result;
    }

    public function findByKeyword($q) {
        $select = $this->select()->from($this->_name)
        ->setIntegrityCheck(false)
        ->where("{$this->_name}.title LIKE ?", "%{$q}%")
        ->where("{$this->_name}.status = ?", Admin_Model_Status::PUBLISH)
        ->columns(array('comments' => "(SELECT COUNT(*) FROM article_comments WHERE article_id = {$this->_name}.id)"))
        ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username");
        $result = $this->fetchAll($select);
        return $result;
    }

    public function search($q) {

        $articles = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_name, array('id', 'title', 'views', 'likes', 'tags', 'created_on', 'created_by'))
        ->columns(array(
            'type'     => "('article')",
            'comments' => "(SELECT COUNT(*) FROM article_comments WHERE article_id = article.id)"
        ));

        $news = $this->select()
        ->setIntegrityCheck(false)
        ->from($this->_news, array(
            'id', 'title', 'views', 'likes' => '(null)', 'tags'  => '(null)', 'created_on', 'created_by'
        ))
        ->columns(array(
            'type'     => "('news')",
            'comments' => "(SELECT COUNT(*) FROM news_comments WHERE news_id = news.id)"
        ));

        $select = $this->select()
        ->setIntegrityCheck(false)
        ->from(array(
            'search' => $this->select()->union(array($articles, $news))
        ));

        $select->where("search.title like ?", "%{$q}%")
        ->order('search.created_on DESC');

        return $this->fetchAll($select);
    }

}
