<?php

class Admin_Form_Account extends Zend_Form {

//  Messages
    const MSG_USERNAME_IS_EMPTY = 'Nama Pengguna harus diisi.';
    const MSG_USERNAME_TOO_SHORT = 'Nama Pengguna minimal 6 karakter.';
    const MSG_USERNAME_TOO_LONG = 'Nama Pengguna maksimal 20 karakter.';
    const MSG_USERNAME_RECORD_FOUND = 'Nama Pengguna sudah ada.';
    const MSG_USERNAME_NOT_VALID = 'Nama Pengguna menggunakan karakter tidak valid.';
    const MSG_PASSWORD_IS_EMPTY = 'Kata Sandi harus diisi.';
    const MSG_PASSWORD_LENGTH_TOO_SHORT = 'Kata Sandi minimal 6 karakter.';
    const MSG_CONFIRM_PASSWORD_IS_EMPTY = 'Konfirmasi Kata Sandi harus diisi.';
    const MSG_CONFIRM_PASSWORD_NOT_SAME = 'Konfirmasi Kata Sandi tidak cocok.';
    const MSG_ROLE_IS_EMPTY = 'Pilih salah satu Role.';
    const MSG_ROLE_NOT_IN_ARRAY = '\'%value%\' bukan role yang benar.';

//  Label
    const LABEL_USERNAME = 'Nama Pengguna';
    const LABEL_PASSWORD = 'Kata Sandi';
    const LABEL_CONFIRM_PASSWORD = 'Konfirmasi Kata Sandi';
    const LABEL_ROLE = 'Role';
    const LABEL_SUBMIT = 'Buat';

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

    public function init() {
        /* Form Elements & Other Definitions Here ... */
        $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

        $this->username = new Zend_Form_Element_Text('username');
        $this->password = new Zend_Form_Element_Password('password');
        $this->confirm_password = new Zend_Form_Element_Password('confirm_password');
        $this->role = new Zend_Form_Element_Select('role');
        $this->submit = new Zend_Form_Element_Submit('submit');

        $this->username
        ->setRequired(true)
        ->setLabel(self::LABEL_USERNAME)
        ->setValidators(array(
            array('NotEmpty', 'false', array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_USERNAME_IS_EMPTY))),
            array('StringLength', 'false', array(
                    'min'      => 6,
                    'max'      => 20,
                    'messages' => array(
                        Zend_Validate_StringLength::TOO_SHORT => self::MSG_USERNAME_TOO_SHORT,
                        Zend_Validate_StringLength::TOO_LONG  => self::MSG_USERNAME_TOO_LONG))),
            array('Db_NoRecordExists', false, array(
                    'table'    => 'user',
                    'field'    => 'username',
                    'messages' => array(
                        Zend_Validate_Db_Abstract::ERROR_RECORD_FOUND => self::MSG_USERNAME_RECORD_FOUND))),
            array('Regex', false, array(
                    'pattern'  => '/^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/',
                    'messages' => array(
                        Zend_Validate_Regex::NOT_MATCH => self::MSG_USERNAME_NOT_VALID)))
        ));

        $this->password
        ->setLabel(self::LABEL_PASSWORD)
        ->setRequired(true)
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_PASSWORD_IS_EMPTY))),
            array('StringLength', false, array(
                    'min'      => 6,
                    'messages' => array(
                        Zend_Validate_StringLength::TOO_SHORT => self::MSG_PASSWORD_LENGTH_TOO_SHORT)))
        ));

        $this->confirm_password
        ->setLabel(self::LABEL_CONFIRM_PASSWORD)
        ->setRequired(true)
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_CONFIRM_PASSWORD_IS_EMPTY))),
            array('Identical', false, array(
                    'messages' => array(
                        Zend_Validate_Identical::NOT_SAME => self::MSG_CONFIRM_PASSWORD_NOT_SAME)))
        ));

        $this->role
        ->setlabel(self::LABEL_ROLE)
        ->setRequired(true)
        ->setMultiOptions(array(
            null                     => '--Pilih Role',
            SITi_Acl::ROLE_SISWA     => 'Siswa',
            SITi_Acl::ROLE_GURU      => 'Guru',
            SITi_Acl::ROLE_HUBIN     => 'Hubin',
            SITi_Acl::ROLE_KURIKULUM => 'Kurikulum',
            SITi_Acl::ROLE_KESISWAAN => 'Kesiswaan'
        ))
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_ROLE_IS_EMPTY))),
            array('InArray', false, array(
                    'haystack' => array_keys($this->role->getMultiOptions()),
                    'messages' => array(
                        Zend_Validate_InArray::NOT_IN_ARRAY => self::MSG_ROLE_NOT_IN_ARRAY)))
        ));

        $this->submit
        ->setLabel(self::LABEL_SUBMIT)
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

    public function isValid($data) {
        $this->confirm_password->getValidator('identical')->setToken($data['password']);
        return parent::isValid($data);
    }

}
