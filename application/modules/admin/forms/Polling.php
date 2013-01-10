<?php

class Admin_Form_Polling extends Zend_Form
{
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $question;
  /**
   *
   * @var Zend_Form_Element_Hidden
   */
  public $answers;
  /**
   *
   * @var Zend_Form_Element_Checkbox
   */
  public $active;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $save;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->question = new Zend_Form_Element_Text('question');
    $this->answers = new Zend_Form_Element_Hidden('answers');
    $this->active = new Zend_Form_Element_Checkbox('active');
    $this->submit = new Zend_Form_Element_Submit('submit');
    $this->save = new Zend_Form_Element_Submit('save');

    $this->question
            ->setAttrib('class', 'span6 title')
            ->setAttrib('placeholder', 'Tuliskan pertanyaan...');

    $this->submit
            ->setAttrib('class', 'btn btn-gebo')
            ->setLabel('Posting');

    $this->save
            ->setAttrib('class', 'btn')
            ->setLabel('Simpan');

    $this->addElements(array(
        $this->question,
        $this->answers,
        $this->active,
        $this->save,
    ));

    $this->setElementDecorators(array(
        'ViewHelper', 'ControlGroup'
    ));

    $this->submit->setDecorators(array(
        'ViewHelper'
    ));
    
    $this->save->setDecorators(array(
        'ViewHelper'
    ));
  }

}
