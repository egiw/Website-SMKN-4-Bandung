<?php

class Admin_Form_News extends Zend_Form
{
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $title;
  /**
   *
   * @var Zend_Form_Element_Textarea
   */
  public $content;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $draft;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->title = new Zend_Form_Element_Text('title');
    $this->content = new Zend_Form_Element_Textarea('content');
    $this->draft = new Zend_Form_Element_Submit('draft');
    $this->submit = new Zend_Form_Element_Submit('submit');


    $this->title
            ->setRequired(true)
            ->setAttribs(array(
                'class' => 'span8 title',
                'placeholder' => 'Judul Berita'))
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Judul tidak boleh kosong')))));

    $this->content
            ->setAttrib('rows', '20')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Konten tidak boleh kosong')))))
            
            ->addFilter(new SITi_Filter_PurifyHTML());


    $this->submit
            ->setAttrib('class', 'btn btn-gebo')
            ->setLabel('Tambah');

    $this->draft
            ->setAttrib('class', 'btn')
            ->setLabel('Simpan sebagai Konsep');

    $this->addElements(array(
        $this->title,
        $this->content,
        $this->draft,
        $this->submit
    ));

    $this->setElementDecorators(array('ViewHelper', 'ControlGroup'));
    $this->submit->setDecorators(array('ViewHelper'));
    $this->draft->setDecorators(array('ViewHelper'));
  }

}
