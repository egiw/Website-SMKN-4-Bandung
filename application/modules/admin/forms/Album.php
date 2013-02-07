<?php

class Admin_Form_Album extends Zend_Form
{
  const MSG_ALBUM_IS_EMPTY = 'Nama album tidak boleh kosong.';

  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $title;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');
    $this->title = new Zend_Form_Element_Text('title');
    $this->submit = new Zend_Form_Element_Submit('Submit');
    $this->title->setLabel('Nama Album');

    $this->title
            ->setRequired(true)
            ->addValidator('NotEmpty', false, array(
                'messages' => array(
                    Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_ALBUM_IS_EMPTY
                )
            ))
            ->setAttrib('class', 'span6 title')
            ->setAttrib('placeholder', 'Tuliskan nama album...');

    $this->submit
            ->setLabel('Simpan')
            ->setAttrib('class', 'btn btn-gebo');

    $this->addElements(array(
        $this->title,
        $this->submit
    ));
    $this->title->setDecorators(array('ViewHelper', 'ControlGroup'));
    $this->submit->setDecorators(array('ViewHelper'));
  }

}
