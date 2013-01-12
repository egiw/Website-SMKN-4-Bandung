<?php

class SITi_Form_Decorator_Input extends Zend_Form_Decorator_Abstract
{
  const MODE_APPEND = 'input-append';
  const MODE_PREPEND = 'input-prepend';

  public function render($content)
  {

    $element = $this->getElement();
    $options = $this->getOptions();
    $mode = $options['mode'];
    $html = $options['html'];

    if (null == $mode || null == $html) {
      return $content;
    }

    $input = new Zend_Form_Decorator_HtmlTag(array('tag' => 'div', 'class' => $mode));
    $addon = new Zend_Form_Decorator_HtmlTag(array('tag' => 'span', 'class' => 'add-on'));
    $addon = $addon->render($html);

    switch ($mode) {
      case self::MODE_PREPEND:
        return $input->render($addon . $content);
        break;
      case self::MODE_APPEND:
        return $input->render($content . $addon);
      default:
        break;
    }
  }

}