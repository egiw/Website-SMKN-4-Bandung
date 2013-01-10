<?php

class SITi_Form_Decorator_Datepicker extends Zend_Form_Decorator_Abstract
{
  public function render($content)
  {
    $id = $this->getOption('id');

    $tag = new Zend_Form_Decorator_HtmlTag();

    $icon = $tag
            ->clearOptions()
            ->setTag('i')
            ->setOption('class', 'icon-calendar')
            ->render('');
    $addon = $tag
            ->clearOptions()
            ->setTag('span')
            ->setOption('class', 'add-on')
            ->render($icon);

    $date = $tag
            ->clearOptions()
            ->setTag('div')
            ->setOption('class', 'input-append date');

    if (null !== $id) {
      $date->setOption('id', $id);
    }

    $date = $date->render($content . $addon);


    return $date;
  }

}