<?php

class Admin_View_Helper_ItemCountPerPageSelect extends Zend_View_Helper_FormSelect
{
  public function itemCountPerPageSelect($name, $value)
  {
    $attribs = array(
        'style' => 'width: 65px;'
    );
    $options = array(
        5 => 5,
        10 => 10,
        25 => 25,
        50 => 50,
        100 => 100
    );
    return $this->formSelect($name, $value, $attribs, $options);
  }

}