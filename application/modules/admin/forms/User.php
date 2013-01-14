<?php

class Admin_Form_User extends Zend_Form
{
  const MSG_INVALID_EMAIL_FORMAT = 'Format email harus valid. Contoh: user@domain.com.';
  const MSG_PASSWORD_TOO_SHORT = 'Kata sandi harus lebih dari 6 karakter.';
  const MSG_INVALID_PASSWORD_CONFIRMATION = 'Kata sandi tidak cocok.';
  const MSG_PASSWORD_CONFIRMATION_EMTPY = 'Konfirmasi Kata Sandi Wajib diisi.';
  const MSG_INVALID_AVATAR_EXTENSION = 'Format gambar harus berupa JPG atau PNG';
  const LABEL_CONFIRM_PASSWORD = 'Konfirmasi Kata Sandi';
  const LABEL_EMAIL = 'Email';
  const LABEL_FULLNAME = 'Nama Lengkap';
  const LABEL_NEW_PASSWORD = 'Kata Sandi Baru';
  const LABEL_SUBMIT = 'Simpan';

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

    $this->avatar->addValidator('File_Extension', false, array(
        'extension' => 'jpg,png',
        'messages' => array(
            Zend_Validate_File_Extension::FALSE_EXTENSION => self::MSG_INVALID_AVATAR_EXTENSION)));

    $this->fullname->setLabel(self::LABEL_FULLNAME)
            ->setAttribs(array());

    $this->submit->setLabel(self::LABEL_SUBMIT)->setAttribs(array(
        'class' => 'btn btn-gebo'));

    $this->email
            ->setLabel(self::LABEL_EMAIL)
            ->setAttribs(array('class', 'span6'))
            ->addValidator('EmailAddress', false, array(
                'domain' => false,
                'messages' => array(
                    Zend_Validate_EmailAddress::INVALID_FORMAT => self::MSG_INVALID_EMAIL_FORMAT)));

    $this->new_password
            ->setAttrib('class', 'span10')
            ->setLabel(self::LABEL_NEW_PASSWORD)
            ->addValidator('StringLength', false, array(
                'min' => 6,
                'messages' => array(
                    Zend_Validate_StringLength::TOO_SHORT => self::MSG_PASSWORD_TOO_SHORT)));

    $this->confirm_password
            ->setAttrib('class', 'span10')
            ->setLabel(self::LABEL_CONFIRM_PASSWORD)
            ->addValidator('identical', false, array(
                'messages' => array(
                    Zend_Validate_Identical::NOT_SAME => self::MSG_INVALID_PASSWORD_CONFIRMATION)));

    $this->bio->setAttribs(array(
        'style' => 'width:100%;height:230px'
    ));


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
    $this->email->setDecorators(array('ViewHelper', array('input', array(
                'mode' => SITi_Form_Decorator_Input::MODE_PREPEND,
                'html' => '@')), 'ControlGroup'));

    $this->new_password->setDecorators(array('ViewHelper', array('input', array(
                'mode' => SITi_Form_Decorator_Input::MODE_PREPEND,
                'html' => '<i class="icon-lock"></i>')), 'ControlGroup'));

    $this->confirm_password->setDecorators(array('ViewHelper', array('input', array(
                'mode' => SITi_Form_Decorator_Input::MODE_PREPEND,
                'html' => '<i class="icon-lock"></i>')), 'ControlGroup'));

    $this->submit->setDecorators(array('ViewHelper'));
    $this->avatar->setDecorators(array('File', 'FileUpload', 'ControlGroup'));
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
                      Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_PASSWORD_CONFIRMATION_EMTPY)));
    }
    $this->confirm_password->getValidator('identical')->setToken($data['new_password']);

    return parent::isValid($data);
  }

}
