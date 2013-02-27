<?php

/**
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Admin_Model_DbTable_Comment extends Zend_Db_Table_Abstract {

    protected $_name = 'comment';
    protected $_article_comments = 'article_comments';
    protected $_article = 'article';
    protected $_user = 'user';

    /**
     * Get current logged in user's latest comments
     * Available properties:
     * [comment_id]
     * [comment_content]
     * [created_on]
     * [article_id]
     * [article_title]
     * [username]
     * [fullname]
     * [avatar]
     * @param String $username
     * @return Zend_Db_Table_Rowset
     */
    public function getUserLatestComments($username, $limit = 25) {

        // Basic select on comment table, we only need comment id, content and
        // created date.
        $select = $this->select()->from($this->_name, array(
            'comment_id'      => 'id',
            'comment_content' => 'content',
            'created_on'
        ));

        // Set the integrity check
        $select->setIntegrityCheck(false);

        // Join with article_comments to get article which comment belongs to
        // We don't need any column since this table is reference table.
        $cond = "{$this->_name}.id = {$this->_article_comments}.comment_id";
        $select->join($this->_article_comments, $cond, array());

        // Connect between comment table with article using article_comments
        // We only need article id and article title
        $cond = "{$this->_article_comments}.article_id = {$this->_article}.id";
        $select->join($this->_article, $cond, array(
            'article_id'    => 'id',
            'article_title' => 'title'
        ));

        // Since we wanted to retrieve current logged in user latest comments on
        // their article, we need to add some condition
        $select->where("{$this->_article}.created_by = ?", $username);

        // The article status must be published
        $select->where("{$this->_article}.status = ?", Admin_Model_Status::PUBLISH);

        // we want to get information about user who comment.
        $cond = "{$this->_name}.user = {$this->_user}.username";
        $select->join($this->_user, $cond, array(
            'username', 'fullname', 'avatar'
        ));

        // exclude current logged in user's comments
        $select->where("{$this->_name}.user != ?", $username);

        $select->order("{$this->_name}.created_on DESC");

        $select->limit($limit);


        $result = $this->fetchAll($select);

        return $result;
    }

}
