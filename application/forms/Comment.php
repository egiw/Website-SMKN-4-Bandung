<?php

class Application_Form_Comment extends Zend_Form
{
  const CONTENT_IS_EMPTY = 'Komentar tidak boleh kosong.';

  /**
   *
   * @var Zend_Form_Element_Textarea
   */
  public $content;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');
    $this->content = new Zend_Form_Element_Textarea('content');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->content
            ->setRequired(true)
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::CONTENT_IS_EMPTY
                        )
                ))
            ))
            ->setFilters(array(
                array('StringTrim'),
                array('StripNewlines'),
                array('HtmlEntities'),
            ));

    $this->submit
            ->setLabel('Kirim')
            ->setAttrib('class', 'btn');

    $this->addElements(array(
        $this->content,
        $this->submit
    ));
    $this->submit->setDecorators(array('ViewHelper'));
    $this->content->setDecorators(array('ViewHelper', array('Errors', array(
                'class' => 'alert alert-error unstyled', 'style' => 'font-size: 12px'))));
  }

}
