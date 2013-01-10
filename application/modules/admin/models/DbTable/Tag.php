<?php

class Admin_Model_DbTable_Tag extends Zend_Db_Table_Abstract
{
  protected $_name = 'tag';

  public function getAvailableTags($query = '')
  {
    $select = $this->select()->from($this->_name, array('name'))
            ->where("name LIKE ?", "%{$query}%");
    $result = $this->getAdapter()->fetchCol($select);
    return $result;
  }

  public function save($tags, $currentTags = null)
  {
    if (is_string($tags)) {
      $tags = explode(',', $tags);
    }

    if (is_string($currentTags)) {
      $currentTags = explode(',', $currentTags);
    }

    if (null !== $currentTags) {
      $removed_tags = array_diff($currentTags, $tags);
      $tags = array_diff($tags, $currentTags);
      foreach ($removed_tags as $remove_tag_name) {
        $remove_tag = $this->find($remove_tag_name)->current();
        if (null !== $remove_tag) {
          $remove_tag->frequency -= 1;
          if ($remove_tag->frequency == 0) {
            $remove_tag->delete();
          } else {
            $remove_tag->save();
          }
        }
      }
    }


    foreach ($tags as $name) {
      $tag = $this->find($name)->current();
      if (null === $tag) {
        $this->insert(array('name' => $name, 'frequency' => 1));
      } else {
        $tag->frequency += 1;
        $tag->save();
      }
    }
  }

}
