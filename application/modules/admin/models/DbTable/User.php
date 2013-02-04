<?php

/**
 * 
 * @author Egi Soleh Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Admin_Model_DbTable_User extends Zend_Db_Table_Abstract
{
  protected $_name = 'user';

  /**
   * Retrieve all accounts with specified filter if provided
   * @param Array $filter
   * @return Zend_Db_Table_Rowset
   */
  public function findAll($filter = null)
  {
    $select = $this->select()->from($this->_name);

    if (null !== $filter) {
      if ($username = $filter['username']) {
        $select->where("{$this->_name}.username LIKE ?", "%{$username}%");
      }
      if ($fullname = $filter['fullname']) {
        $select->where("{$this->_name}.fullname LIKE ?", "%{$fullname}%");
      }
      if ($email = $filter['email']) {
        $select->where("{$this->_name}.email LIKE ?", "%{$email}%");
      }
      if ($role = $filter['role']) {
        $select->where("{$this->_name}.role = ?", $role);
      }
    }

    $result = $this->fetchAll($select);
    return $result;
  }

  /**
   * Retrieves all roles count and each role count
   * @return Array.
   */
  public function countRoles()
  {
    $select = $this->select()->from($this->_name, array(
        'all' => 'COUNT(role)',
        Admin_Model_Role::ADMIN => 'SUM(role = "admin")',
        Admin_Model_Role::GURU => 'SUM(role = "guru")',
        Admin_Model_Role::OSIS => 'SUM(role = "osis")',
        Admin_Model_Role::SISWA => 'SUM(role = "siswa")'));
    $result = $this->getAdapter()->fetchRow($select);
    return $result;
  }

}
