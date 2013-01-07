<?php

class Admin_Form_User extends Zend_Form
{
  /**
   *
   * @var Zend_Form_Element_File
   */
  public $avatar;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $fullname;
  /**
   *
   * @var Zend_Form_Element_Password
   */
  public $new_password;
  /**
   *
   * @var Zend_Form_Element_Password
   */
  public $confirm_password;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $email;
  /**
   *
   * @var Zend_Form_Element_Textarea
   */
  public $bio;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */

    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->avatar = new Zend_Form_Element_File('avatar');
    $this->fullname = new Zend_Form_Element_Text('fullname');
    $this->new_password = new Zend_Form_Element_Password('new_password');
    $this->confirm_password = new Zend_Form_Element_Password('confirm_password');
    $this->email = new Zend_Form_Element_Text('email');
    $this->bio = new Zend_Form_Element_Textarea('bio');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->fullname->setLabel('Nama Lengkap')
            ->setAttribs(array());

    $this->submit->setLabel('Simpan')->setAttribs(array(
        'class' => 'btn btn-gebo'));

    $this->email->setLabel('Email')->setAttribs(array())
            ->addValidator('EmailAddress', false, array(
                'messages' => array(
                    Zend_Validate_EmailAddress::INVALID => 'Format email harus valid. Contoh: user@domain.com.')));

    $this->new_password->setLabel('Kata Sandi Baru')
            ->addValidator('StringLength', false, array(
                'min' => 6,
                'messages' => array(
                    Zend_Validate_StringLength::TOO_SHORT => 'Kata sandi harus lebih dari 6 karakter.')));

    $this->confirm_password->setLabel('Konfirmasi Kata Sandi')
            ->addValidator('identical', false, array(
                'messages' => array(
                    Zend_Validate_Identical::NOT_SAME => 'Kata sandi tidak cocok.')));

    $this->bio->setAttribs(array(
        'style' => 'width:100%;height:230px'
    ))->setValue("Tulis tentang anda disini...");


    $this->addElements(array(
        $this->avatar,
        $this->fullname,
        $this->new_password,
        $this->confirm_password,
        $this->email,
        $this->bio,
        $this->submit
    ));

    $this->setElementDecorators(array('ViewHelper', 'ControlGroup'), array('submit', 'avatar'), FALSE);
    $this->submit->setDecorators(array('ViewHelper'));
    $this->avatar->setDecorators(array('File', 'FileUpload'));
  }

  public function populate(array $values)
  {
    if (null != $values['avatar']) {
      if (file_exists(UPLOAD_FOLDER . 'avatar/' . $values['avatar'])) {
        $data_image = $this->getView()->baseUrl("upload/avatar/" . $values['avatar']);
        $this->avatar->setAttrib('data-image', $data_image);
      }
    }
    parent::populate($values);
  }

  public function isValid($data)
  {
    if ('' != $data['new_password']) {
      $this->confirm_password->setRequired(true)
              ->addValidator('NotEmpty', false, array(
                  'messages' => array(
                      Zend_Validate_NotEmpty::IS_EMPTY => 'Konfirmasi Kata Sandi Wajib diisi.')));
    }
    $this->confirm_password->getValidator('identical')->setToken($data['new_password']);

    return parent::isValid($data);
  }

}
