<?php

class Admin_Form_Prakerin extends Zend_Form
{
  const LABEL_NAME = 'Nama Perusahaan';
  const PLACEHOLDER_NAME = 'Mis. PT.Sangkuriang Internasional';
  const MSG_NAME_IS_EMPTY = 'Nama perusahaan tidak boleh kosong.';
  const LABEL_ADDRESS = 'Alamat';
  const MSG_ADDRESS_IS_EMPTY = 'Alamat perusahaan tidak boleh kosong.';
  const WEBSITE_INVALID = 'Alamat website tidak benar.';
  const WEBSITE_PLACEHOLDER = 'Contoh: http://www.sangkuriang.co.id';
  const WEBSITE_LABEL = 'Website';
  const CONTACT_IS_EMPTY = 'Harap isikan kontak.';
  const CATEGORY_IS_EMPTY = 'Pilih minimal satu jurusan.';

  /**
   *
   * @var Zend_Form_Element_Hidden
   */
  public $id;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $name;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $address;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $website;
  /**
   *
   * @var Zend_Form_Element_Multiselect
   */
  public $category;
  /**
   *
   * @var Zend_Form_Element_Textarea
   */
  /**
   *
   * @var Zend_Form_Element_Hidden
   */
  public $lat;
  /**
   *
   * @var Zend_Form_Element_Hidden
   */
  public $lng;
  public $contact;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->id = new Zend_Form_Element_Hidden('id');
    $this->name = new Zend_Form_Element_Text('name');
    $this->address = new Zend_Form_Element_Textarea('address');
    $this->website = new Zend_Form_Element_Text('website');
    $this->category = new Zend_Form_Element_Multiselect('category');
    $this->contact = new Zend_Form_Element_Text('contact');
    $this->lat = new Zend_Form_Element_Hidden('lat');
    $this->lng = new Zend_Form_Element_Hidden('lng');
    $this->submit = new Zend_Form_Element_Submit('submit');
    $this->name
            ->setRequired(true)
            ->setLabel(self::LABEL_NAME)
            ->setAttribs(array(
                'class' => 'span12',
                'placeholder' => self::PLACEHOLDER_NAME
            ))
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_NAME_IS_EMPTY)))
            ));

    $this->address
            ->setRequired(true)
            ->setLabel(self::LABEL_ADDRESS)
            ->setAttribs(array(
                'rows' => 4,
                'class' => 'span12'
            ))
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_ADDRESS_IS_EMPTY)))
            ));

    $this->website
            ->setLabel(self::WEBSITE_LABEL)
            ->setAttribs(array(
                'placeholder' => self::WEBSITE_PLACEHOLDER,
                'class' => 'span12'
            ))
            ->setValidators(array(
                array('callback', false, array(
                        'callback' => function($value) {
                          return Zend_Uri::check($value);
                        },
                        'messages' => array(
                            Zend_Validate_Callback::INVALID_VALUE => self::WEBSITE_INVALID)))
            ));

    $this->category
            ->setRegisterInArrayValidator(false)
            ->setRequired(true)
            ->setAttrib('style', 'height:130px')
            ->setLabel('Kategori Jurusan')
            ->addMultiOptions(array(
                'RPL' => 'Rekayasa Perangkat Lunak',
                'TKJ' => 'Teknik Komputer Jaringan',
                'MM' => 'Multimedia',
                'TOI' => 'Teknik Otomasi Industri',
                'TITL' => "Teknik Instalasi Tenaga Listrik",
                'AV' => "Teknik Audio Video"
            ))
            ->setAttribs(array(
                'class' => 'span12'
            ))
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::CATEGORY_IS_EMPTY
                        )
                ))
            ));

    $this->contact
            ->setRequired(true)
            ->setLabel('Kontak')
            ->setAttrib('class', 'span12')
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::CONTACT_IS_EMPTY
                        )
                ))
            ));

    $this->addElements(array(
        $this->id,
        $this->name,
        $this->lat,
        $this->lng,
        $this->address,
        $this->website,
        $this->category,
        $this->contact,
        $this->submit
    ));

    $this->setElementDecorators(array('ViewHelper', 'ControlGroup'));

    $this->submit
            ->setAttrib('class', 'btn btn-gebo')
            ->setLabel('Simpan')
            ->setDecorators(array('ViewHelper'));
    $this->id->setDecorators(array('ViewHelper'));
  }

}
