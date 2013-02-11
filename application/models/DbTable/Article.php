<?php

class Application_Model_DbTable_Article extends Zend_Db_Table_Abstract
{
  protected $_name = 'article';
  protected $_user = 'user';

  public function findLatestArticles($limit = 5)
  {
    $select = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_name)
            ->where("{$this->_name}.status = ?", 'publish')
            ->order("{$this->_name}.created_on DESC")
            ->join($this->_user, "{$this->_name}.created_by = {$this->_user}.username", array(
        'avatar'));
    $result = $this->fetchAll($select);
    return $result;
  }

}
