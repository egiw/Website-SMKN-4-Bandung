<?php

class Admin_Form_Article extends Zend_Form
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
   * @var Zend_Form_Element_Hidden
   */
  public $tags;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $draft;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->title = new Zend_Form_Element_Text('title');
    $this->content = new Zend_Form_Element_Textarea('content');
    $this->submit = new Zend_Form_Element_Submit('submit');
    $this->draft = new Zend_Form_Element_Submit('draft');
    $this->tags = new Zend_Form_Element_Hidden('tags');


    $this->title->setRequired(true)
            ->setAttrib('class', 'span8  title')
            ->setAttrib('placeholder', 'Tulis judul artikel')
            ->setErrorMessages(array(
                'isEmpty' => 'Judul tidak boleh kosong'));

    $this->content->setRequired(true)
            ->setAttrib('rows', 20)
            ->setErrorMessages(array(
                'isEmpty' => 'Konten tidak boleh kosong'));

    $this->draft->setAttribs(array(
        'class' => 'btn'))->setLabel('Simpan Sebagai Draft');
    $this->submit->setAttribs(array(
        'class' => 'btn btn-gebo'))->setLabel('Posting');

    $this->addElements(array(
        $this->tags,
        $this->title,
        $this->content,
        $this->submit,
        $this->draft,
    ));


    $this->title->setDecorators(array('ViewHelper', 'ControlGroup'));
    $this->content->setDecorators(array('ViewHelper', 'ControlGroup'));
    $this->tags->setDecorators(array('ViewHelper'));
    $this->submit->setDecorators(array('ViewHelper'));
    $this->draft->setDecorators(array('ViewHelper'));
  }

}
