<?php

/**
 * 
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Application_Model_DbTable_Polling extends Zend_Db_Table_Abstract
{
  protected $_name = 'poll_question';
  protected $_answer = 'poll_answer';

  /**
   * Mengembalikan polling yang sedang aktif beserta hasil nya
   * @return Zend_Db_Table_Row_Abstract
   */
  public function findActive($id = null)
  {
    // Query untuk mendapatkan polling yang sedang aktif
    $select = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_name, array('qid' => 'id', 'question'))
            ->join($this->_answer, "{$this->_name}.id = {$this->_answer}.poll_id"
                    , array('answer', 'total', 'aid' => 'id'))
            ->where("{$this->_name}.active = ?", true);

    // Query untuk mendapatkan total dari semua total jawaban polling yang sedang aktif
    $summary = $this->select()
            ->setIntegrityCheck(false)
            ->from($this->_answer, array('SUM(total)'))
            ->where("{$this->_answer}.poll_id = {$this->_name}.id");

    // Query untuk mendapatkan persentase total
    $percent = "CONCAT(({$this->_answer}.total / ({$summary})) * 100, '%')";
    
    $select->columns(array('percent' => $percent));
    
    if (null !== $id) {
      $select->where("{$this->_name}.id = ?", $id);
    }
    
    $result = $this->fetchAll($select);
    return $result;
  }

}
