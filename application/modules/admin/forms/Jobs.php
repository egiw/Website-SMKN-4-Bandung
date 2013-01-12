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
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $company;
  /**
   *
   * @var Zend_Form_Element_File
   */
  public $logo;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $website;
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
    $this->company = new Zend_Form_Element_Text('company');
    $this->logo = new Zend_Form_Element_File('logo');
    $this->website = new Zend_Form_Element_Text('website');
    $this->info = new Zend_Form_Element_Textarea('info');
    $this->tags = new Zend_Form_Element_Hidden('tags');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->title->setRequired(true)
            ->setAttrib('class', 'span12 title')
            ->setAttrib('placeholder', 'Posisi pekerjaan, Contoh: Web Developer, Online Marketer')
            ->addValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Isikan nama lowongan pekerjaan.')))
            ));


    $this->company
            ->setAttrib('class', 'span11')
            ->setLabel('Nama Perusahaan');

    $this->logo
            ->addValidator('File_Extension', false, array(
                'extension' => 'jpg,png',
                'messages' => array(
                    Zend_Validate_File_Extension::FALSE_EXTENSION => 'Ekstensi gambar harus berupa JPG atau PNG')))
            ->setLabel('Logo');

    $this->website
            ->setLabel('Alamat Website')
            ->setAttrib('class', 'span10')
            ->setAttrib('placeholder', 'contoh: http://perusahaan.com')
            ->addValidator('callback', false, array(
                'callback' => function($value) {
                  return Zend_Uri::check($value);
                },
                'messages' => array(
                    Zend_Validate_Callback::INVALID_VALUE => 'Alamat website tidak benar.')));

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
        $this->company,
        $this->logo,
        $this->website,
        $this->info,
        $this->tags,
        $this->submit
    ));

    $this->setElementDecorators(array(
        'ViewHelper', 'ControlGroup'
            ), array('logo'), false);

    $this->website->setDecorators(array('ViewHelper', array(
            'input', array(
                'mode' => SITi_Form_Decorator_Input::MODE_PREPEND,
                'html' => '<i class="icon-globe"></i>')),
        'ControlGroup'));

    $this->logo->setDecorators(array('File', 'FileUpload', 'ControlGroup'));
    $this->submit->setDecorators(array('ViewHelper'));
  }

  public function populate(array $values)
  {
    if (null != $values['logo']) {
      if (file_exists(UPLOAD_FOLDER . 'company-logo/' . $values['logo'])) {
        $data_image = $this->getView()->baseUrl("upload/company-logo/" . $values['logo']);
        $this->logo->setAttrib('data-image', $data_image);
      }
    }
    parent::populate($values);
  }

}
