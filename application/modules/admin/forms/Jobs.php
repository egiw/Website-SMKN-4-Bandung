<?php

class Admin_Form_Jobs extends Zend_Form
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
  public $info;
  /**
   *
   * @var Zend_Form_Element_Hidden
   */
  public $tags;
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
    $this->info = new Zend_Form_Element_Textarea('info');
    $this->tags = new Zend_Form_Element_Hidden('tags');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->title->setRequired(true)
            ->setAttrib('class', 'span8 title')
            ->setAttrib('placeholder', 'Nama lowongan kerja')
            ->addValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Isikan nama lowongan pekerjaan.')))
            ));

    $this->info
            ->setRequired(true)
            ->addValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Isikan sedikitnya informasi tentang lowongan pekerjaan.')))
            ))
            ->setAttribs(array(
                'rows' => '15',
                'style' => 'width:100%'
            ));

    $this->submit->setAttrib('class', 'btn btn-gebo')
            ->setLabel('Posting');

    $this->addElements(array(
        $this->title,
        $this->info,
        $this->tags,
        $this->submit
    ));

    $this->setElementDecorators(array(
        'ViewHelper', 'ControlGroup'
    ));

    $this->submit->setDecorators(array('ViewHelper'));
  }

}
