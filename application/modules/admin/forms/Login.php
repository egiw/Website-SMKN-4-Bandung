<?php

class Admin_Form_Login extends Zend_Form
{
  public $username;
  public $password;
  public $submit;

  public function init()
  {
    /* Form Elements & Other Definitions Here ... */
    $this->username = new Zend_Form_Element_Text('username');
    $this->password = new Zend_Form_Element_Password('password');
    $this->submit = new Zend_Form_Element_Submit('Login');

    $this->username->setRequired(true)->setAttribs(array(
        'placeholder' => 'Nama Pengguna'
    ));
    $this->password->setRequired(true)->setAttribs(array(
        'placeholder' => 'Kata Sandi'
    ));
    $this->submit->setLabel('Masuk')->setAttribs(array(
        'class' => 'btn btn-inverse pull-right'
    ));

    $this->addElements(array(
        $this->username,
        $this->password,
        $this->submit
    ));

    $this->setElementDecorators(array(
        'ViewHelper'
    ));
  }

}
