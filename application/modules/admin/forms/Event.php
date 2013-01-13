<?php

class Admin_Form_Event extends Zend_Form
{
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $title;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $from_date;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $until_date;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $location;
  /**
   *
   * @var Zend_Form_Element_Textarea
   */
  public $info;
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
    $this->from_date = new Zend_Form_Element_Text('from_date');
    $this->until_date = new Zend_Form_Element_Text('until_date');
    $this->location = new Zend_Form_Element_Text('location');
    $this->info = new Zend_Form_Element_Textarea('info');
    $this->submit = new Zend_Form_Element_Submit('submit');
    $this->draft = new Zend_Form_Element_Submit('draft');

    $this->title
            ->setAttrib('class', 'span8 title')
            ->setAttrib('placeholder', 'Tulis judul kegiatan...')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Judul kegiatan tidak boleh kosong.')))));

    $this->location
            ->setAttrib('class', 'span6 ')
            ->setAttrib('placeholder', 'Lokasi kegiatan')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Tentukan lokasi kegiatan.')))));

    $this->from_date
            ->setLabel('Tanggal Mulai *')
            ->setAttrib('readonly', 'readonly')
            ->setRequired(true)
            ->setValidators(array(
                array('date', false, array(
                        'format' => 'dd/mm/yyyy',
                        'messages' => array(
                            Zend_Validate_Date::FALSEFORMAT => 'Format tanggal salah'))),
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Tentukan tanggal dimulainya kegiatan.')))));

    $this->until_date
            ->setLabel('Tanggal Selesai *')
            ->setAttrib('readonly', 'readonly')
            ->setRequired(true)
            ->setValidators(array(
                array('date', false, array(
                        'format' => 'dd/mm/yyyy',
                        'messages' => array(
                            Zend_Validate_Date::FALSEFORMAT => 'Format tanggal salah'))),
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Tentukan tanggal selesainya kegiatan.')))));

    $this->info
            ->setAttrib('rows', '18')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Tuliskan sedikitnya informasi kegiatan.')))));

    $this->submit
            ->setLabel('Posting')
            ->setAttrib('class', 'btn btn-gebo');

    $this->draft
            ->setLabel('Simpan sebagai draft')
            ->setAttrib('class', 'btn');

    $this->addElements(array(
        $this->title,
        $this->from_date,
        $this->until_date,
        $this->location,
        $this->info,
        $this->submit
    ));

    $this->setElementDecorators(array(
        'ViewHelper', 'ControlGroup'
    ));

    $this->submit->setDecorators(array('ViewHelper'));
    $this->draft->setDecorators(array('ViewHelper'));
    $this->from_date->setDecorators(array(
        'ViewHelper', array('Datepicker', array('id' => 'dp_start')), 'ControlGroup'
    ));

    $this->location->setDecorators(array('ViewHelper', array('input', array(
                'mode' => SITi_Form_Decorator_Input::MODE_PREPEND,
                'html' => '<i class="icon-map-marker"></i>')), 'ControlGroup'));

    $this->until_date->setDecorators(array(
        'ViewHelper', array('Datepicker', array('id' => 'dp_end')), 'ControlGroup'
    ));
  }

  public function populate(array $values)
  {
    $values['from_date'] = Date('d/m/Y', strtotime($values['from_date']));
    $values['until_date'] = Date('d/m/Y', strtotime($values['until_date']));
    parent::populate($values);
  }

}
