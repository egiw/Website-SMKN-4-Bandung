<?php

class Admin_Form_Account extends Zend_Form
{
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $username;
  /**
   *
   * @var Zend_Form_Element_Password
   */
  public $password;
  /**
   *
   * @var Zend_Form_Element_Password
   */
  public $confirm_password;
  /**
   *
   * @var Zend_Form_Element_Select
   */
  public $role;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */
    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

    $this->username = new Zend_Form_Element_Text('username');
    $this->password = new Zend_Form_Element_Password('password');
    $this->confirm_password = new Zend_Form_Element_Password('confirm_password');
    $this->role = new Zend_Form_Element_Select('role');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->username
            ->setRequired(true)
            ->setLabel('Nama User')
            ->setValidators(array(
                array('NotEmpty', 'false', array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Nama User wajib diisi.'))),
                array('StringLength', 'false', array(
                        'min' => 6,
                        'max' => 20,
                        'messages' => array(
                            Zend_Validate_StringLength::TOO_SHORT => 'Nama User harus lebih dari 6 karakter.',
                            Zend_Validate_StringLength::TOO_LONG => 'Nama User tidak boleh lebih dari 20 karakter.'))),
                array('Db_NoRecordExists', false, array(
                        'table' => 'user',
                        'field' => 'username',
                        'messages' => array(
                            Zend_Validate_Db_Abstract::ERROR_RECORD_FOUND => 'Nama User sudah ada.'))),
                array('Regex', false, array(
                        'pattern' => '/^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/',
                        'messages' => array(
                            Zend_Validate_Regex::NOT_MATCH => 'Nama User mengandung karakter tidak valid.')))
            ));

    $this->password
            ->setLabel('Kata Sandi')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Kata Sandi wajib diisi.'))),
                array('StringLength', false, array(
                        'min' => 6,
                        'messages' => array(
                            Zend_Validate_StringLength::TOO_SHORT => 'Kata Sandi harus lebih dari 6 karakter.')))
            ));

    $this->confirm_password
            ->setLabel('Konfirmasi Kata Sandi')
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Konfirmasi Kata Sandi wajib diisi'))),
                array('Identical', false, array(
                        'messages' => array(
                            Zend_Validate_Identical::NOT_SAME => 'Kata Sandi tidak cocok.')))
            ));

    $this->role
            ->setlabel('Role')
            ->setRequired(true)
            ->setMultiOptions(array(
                null => '--Pilih Role',
                Admin_Model_Role::SISWA => 'Siswa',
                Admin_Model_Role::OSIS => 'Osis',
                Admin_Model_Role::GURU => 'Guru',
                Admin_Model_Role::ADMIN => 'Admin'
            ))
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => 'Pilih salah satu Role.'))),
                array('InArray', false, array(
                        'haystack' => array_keys($this->role->getMultiOptions()),
                        'messages' => array(
                            Zend_Validate_InArray::NOT_IN_ARRAY => '\'%value%\' bukan role yang benar.')))
            ));

    $this->submit
            ->setLabel('Buat')
            ->setAttribs(array(
                'class' => 'btn btn-gebo'
            ));

    $this->addElements(array(
        $this->username,
        $this->password,
        $this->confirm_password,
        $this->role,
        $this->submit
    ));

    $this->setElementDecorators(array(
        'ViewHelper', 'ControlGroup'
            ), array('submit'), false);
    $this->submit->setDecorators(array('ViewHelper'));
  }

  public function isValid($data)
  {
    $this->confirm_password->getValidator('identical')->setToken($data['password']);
    return parent::isValid($data);
  }

}
