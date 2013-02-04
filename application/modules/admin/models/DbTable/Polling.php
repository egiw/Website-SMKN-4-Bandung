<?php

class Admin_Model_DbTable_Polling extends Zend_Db_Table_Abstract
{
  protected $_name = 'poll_question';
  protected $_answer = 'poll_answer';
  protected $_primary = 'id';

  public function getAll()
  {
    $select = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_name)
            ->join(array('answer' => $this->_answer), "{$this->_name}.id = answer.poll_id", array(
                'total' => '(SUM(answer.total))'
            ))
            ->group("{$this->_name}.id")
            ->order("{$this->_name}.active DESC");

    $result = $this->fetchAll($select);
    return $result;
  }

  public function getActivePolling()
  {
    $select = $this->select()->from($this->_name)->where('active = ?', 1);
    return $this->fetchRow($select);
  }

}
