<?php

class Application_Model_DbTable_Polling extends Zend_Db_Table_Abstract
{
  protected $_name = 'poll_question';
  protected $_answer = 'poll_answer';

  public function findActive($id = null)
  {
    $select = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_name, array('id', 'question'))
            ->join("{$this->_answer}", "{$this->_name}.id = {$this->_answer}.poll_id")
            ->where("{$this->_name}.active = ?", true);

    if (null !== $id) {
      $select->where("{$this->_name}.id = ?", $id);
    }

    $result = $this->fetchAll($select);
    return $result;
  }

}
