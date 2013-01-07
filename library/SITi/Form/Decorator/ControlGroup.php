<?php

class SITi_Form_Decorator_ControlGroup extends Zend_Form_Decorator_Abstract
{
  public function render($content)
  {
    $element = $this->getElement();
    $view = $element->getView();
    $label = $element->getLabel();
    $errors = $element->getErrors();
    $messages = $element->getMessages();

    if (null === $view) {
      return $content;
    }

    $controlGroup = new Zend_Form_Decorator_HtmlTag();
    $controlGroup->setTag('div');
    $controlGroup->setOption('class', 'control-group');

    if (!empty($errors)) {
      $controlGroup->setOption('class', 'control-group error');
    }

    if (!empty($messages)) {
      $errors = new Zend_Form_Decorator_Errors();
      $errors->setElement($element);
      $errors->setOption('class', 'text text-error');
      $errors->setOption('placement', 'APPEND');
      $content = $errors->render($content);
    }

    $controls = new Zend_Form_Decorator_HtmlTag();
    $controls->setTag('div');
    $controls->setOption('class', 'controls');
    $controls = $controls->render($content);

    if (null !== $label) {
      $label = new Zend_Form_Decorator_Label();
      $label->setElement($element);
      $label->setOption('class', 'control-label');
      $controls = $label->render($controls);
    }

    $cgroup = $controlGroup->render($controls);



    return $cgroup;
  }

}