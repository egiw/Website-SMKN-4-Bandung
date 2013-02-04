<?php

class Admin_View_Helper_SetRowButton extends Zend_View_Helper_FormButton
{
  public function setRowButton($name, $value)
  {
    $attribs = array(
        'type' => 'submit',
        'name' => 'action',
        'value' => 'filter',
        'content' => 'Set',
        'class' => 'btn'
    );
    return $this->formButton($name, $value, $attribs);
  }

}