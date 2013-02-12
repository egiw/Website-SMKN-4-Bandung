<?php

class Application_Model_DbTable_Comment extends Zend_Db_Table_Abstract
{
  protected $_name = 'comment';
  protected $_user = 'user';

  public function findArticleComments($article_id)
  {
    $select = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_name)
            ->join($this->_user, "{$this->_name}.user = {$this->_user}.username"
                    , array('avatar'))
            ->where("{$this->_name}.article_id = ?", $article_id)
            ->order("{$this->_name}.created_on DESC");
    $result = $this->fetchAll($select);
    return $result;
  }

}
