<?php

class Admin_Model_DbTable_Answer extends Zend_Db_Table_Abstract
{
  protected $_name = 'poll_answer';
  protected $_polling = 'poll_question';
  protected $_primary = 'id';

  public function getAnswersName($polling_id, $text = null)
  {
    $select = $this->select()->from($this->_name, array('answer'))
            ->where("poll_id = ?", $polling_id);
    if (null != $text) $select->where("answer = ?", $text);

    return $this->getAdapter()->fetchCol($select);
  }

  public function getAllWithResult($poling_id)
  {
    $count = $this->select()->from($this->_name, array('SUM(total)'))
            ->where("poll_id = ?", $poling_id);

    $select = $this->select()->
            setIntegrityCheck(false)
            ->from($this->_name, array('answer', 'id',
                'total', 'percent' => "CONCAT(((total / ($count)) * 100), '%')"))
            ->where("{$this->_name}.poll_id = ?", $poling_id)
            ->join("{$this->_polling}", "{$this->_name}.poll_id = {$this->_polling}.id");
    $result = $this->fetchAll($select);
    return $result;
  }

}