<?php

class Admin_Form_Polling extends Zend_Form
{
  public $question;
  public $status;
  public $submit;
  /**
   *
   * @var Admin_Form_AnswerForm
   */
  public $answerSubForm;

  public function init()
  {

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->setName('polling');
    $this->setIsArray(true);
    $this->setDecorators(array('FormElements', 'Form'));

    $this->question = new Zend_Form_Element_Text('question');
    $this->status = new Zend_Form_Element_Checkbox('showstatus');
    $this->submit = new Zend_Form_Element_Submit('Simpan');


    $this->submit->setAttrib('class', 'btn btn-gebo');
    $this->question->setRequired(true);

    $this->answerSubForm = new Admin_Form_AnswerForm();

    $this->answerSubForm->setDecorators(array(
        'FormElements',
        'Polling',
    ));

    $this->answerSubForm->setElementDecorators(array(
        'ViewHelper',
        'Label',
        'PollingAnswer',
    ));

    $this->question
            ->setLabel('Pertanyaan')
            ->setAttrib('placeholder', 'Tulis pertanyaan')
            ->setAttrib('class', 'span5 title')
            ->setAttrib('style', 'font-size:14px;padding: 10px;')
            ->setDecorators(array('ViewHelper', 'ControlGroup'));

    $this->status->setLabel('Cek jika polling ingin ditampilkan pada Halaman Utama');
    $this->status->setDecorators(array('ViewHelper', 'CheckboxLabel'));


    $this->addElement($this->question);
    $this->addElement($this->status);
    $this->addSubForm($this->answerSubForm, 'answer');
    $this->addElement($this->submit);
  }

}

class Admin_Form_AnswerForm extends Zend_Form_SubForm
{
  public function init()
  {
    
  }

  public function populate(array $values)
  {
    $elements = array();
    foreach ($values as $key => $value) {
      $answer = new Zend_Form_Element_Hidden("{$key}");
      $answer->setValue($value)->setLabel($value);
      $elements[] = $answer;
    }
    $this->setElements($elements);
    $this->setElementDecorators(array(
        'ViewHelper',
        'Label',
        'PollingAnswer',
    ));
  }

  public function isValid($data)
  {
    if (isset($data['answer'])) {
      $this->populate($data['answer']);
      if (sizeof($data['answer']) < 2) {
        $this->addError('Minimal 2 jawaban');
      }
    } else {
      $this->addError('Jawaban tidak boleh kosong');
      $this->clearElements();
    }
    return parent::isValid($data);
  }

}