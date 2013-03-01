<?php

class Application_Form_Guestbook extends Zend_Form {

    const CAPTCHA_NOT_VALID = 'Captcha salah.';
    const MESSAGE_IS_EMPTY = 'Harap isikan pesan anda.';
    const NAME_IS_EMPTY = 'Harap isikan nama anda.';
    const EMAIL_IS_EMPTY = 'Harap isikan Email anda.';
    const EMAIL_INVALID_FORMAT = 'Format email salah.';

    /**
     *
     * @var Zend_Form_Element_Text
     */
    public $name;
    /**
     *
     * @var Zend_Form_Element_Text
     */
    public $email;
    /**
     *
     * @var Zend_Form_Element_Textarea
     */
    public $message;
    /**
     *
     * @var Zend_Form_Element_Captcha
     */
    public $captcha;
    /**
     *
     * @var Zend_Form_Element_Submit
     */
    public $submit;

    public function init() {
        $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

        $this->name = new Zend_Form_Element_Text('name');
        $this->email = new Zend_Form_Element_Text('email');
        $this->message = new Zend_Form_Element_Textarea('message');
        $this->submit = new Zend_Form_Element_Submit('submit');

        $dumb = new MyCaptcha();
        $dumb
        ->setWordlen(5)
        ->setUseNumbers(false)
        ->setMessages(array(
            Zend_Captcha_Dumb::BAD_CAPTCHA => self::CAPTCHA_NOT_VALID
        ));

        $dumb->setLabel('Ketikan kata berikut ini secara terbalik <br />');

        $this->captcha = new Zend_Form_Element_Captcha('captcha', array('captcha' => $dumb));
        $this->captcha->setLabel('Ketikan kata berikut ini dari belakang');

        $this->name
        ->setRequired(true)
        ->setLabel('Nama')
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::NAME_IS_EMPTY
                    )
                ))
        ))
        ->setFilters(array(
            array('HtmlEntities'),
            array('StringTrim'),
        ));

        $this->email
        ->setRequired(true)
        ->setLabel('Email')
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::EMAIL_IS_EMPTY
                    )
                )),
            array('EmailAddress', false, array(
                    'messages' => array(
                        Zend_Validate_EmailAddress::INVALID_FORMAT => self::EMAIL_INVALID_FORMAT
                    )
                ))
        ));

        $this->submit
        ->setLabel('Kirim')
        ->setAttribs(array('class' => 'btn btn-success'));

        $this->message
        ->setRequired(true)
        ->setLabel('Pesan')
        ->setAttribs(array('rows'  => 10, 'style' => 'width:96%;'))
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::MESSAGE_IS_EMPTY
                    )
                ))
        ))
        ->setFilters(array(
            array('HtmlEntities'),
            array('StripNewlines')
        ));

        $this->addElements(array(
            $this->name,
            $this->email,
            $this->message,
            $this->captcha,
            $this->submit
        ));

        $this->setElementDecorators(array('ViewHelper', 'ControlGroup'), array('captcha'), false);
        $this->captcha->setDecorators(array(array('HtmlTag', array('tag'   => 'div', 'class' => 'input-prepend')), 'ControlGroup'));
        $this->submit->setDecorators(array('ViewHelper', array('HtmlTag', array('tag'   => 'div', 'class' => 'form-actions'))));
    }

}

class MyCaptcha extends Zend_Captcha_Dumb {

    public function render(\Zend_View_Interface $view = null, $element = null) {
        return '<div class="add-on" style="border-radius:0">'
        . strrev($this->getWord())
        . '</div>';
    }

}