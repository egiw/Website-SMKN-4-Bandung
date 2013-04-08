<?php

class Application_Model_DbTable_Jobs extends Zend_Db_Table_Abstract
{
  protected $_name = 'jobs';

  public function findLatestJobs($limit = 5)
  {
    $select = $this->select()
            ->from($this->_name, array('title', 'company', 'id'))
            ->order("{$this->_name}.created_on DESC")
            ->limit($limit);

    $result = $this->fetchAll($select);
    return $result;
  }
  
  public function findAll(){
      $select = $this->select()
              ->setIntegrityCheck(false)
              ->from($this->_name)
              ->order('created_on desc');
      
      $result = $this->fetchAll($select);
      
      return $result;
  }

}
