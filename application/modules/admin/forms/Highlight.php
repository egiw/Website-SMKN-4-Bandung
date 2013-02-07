<?php

class Admin_Form_Highlight extends Zend_Form
{
  const MSG_TITLE_IS_EMPTY = 'Judul tidak boleh kosong.';
  const MSG_LINK_INVALID = 'Link salah.';
  const MSG_IMAGE_IS_EMPTY = 'Pilih gambar.';
  const MSG_IMAGE_FALSE_EXTENSION = 'Ekstensi gambar salah.';
  const MSG_IMAGE_WIDTH_TOO_SMALL = 'Lebar gambar harus lebih dari %minwidth% piksel.';
  const MSG_IMAGE_HEIGHT_TOO_SMALL = 'Panjang gambar harus lebih dari %minheight% piksel.';

  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $title;
  /**
   *
   * @var Zend_Form_Element_Text
   */
  public $link;
  /**
   *
   * @var Zend_Form_Element_File
   */
  public $image;
  /**
   *
   * @var Zend_Form_Element_Submit
   */
  public $submit;

  public function init()
  {
    $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');
    $this->title = new Zend_Form_Element_Text('title');
    $this->link = new Zend_Form_Element_Text('link');
    $this->image = new Zend_Form_Element_File('image');
    $this->submit = new Zend_Form_Element_Submit('submit');

    $this->title
            ->setRequired(true)
            ->setAttrib('class', 'span6 title')
            ->setLabel('Judul')
            ->setValidators(array(
                array('NotEmpty', false, array(
                        'messages' => array(
                            Zend_Validate_NotEmpty::IS_EMPTY => self::MSG_TITLE_IS_EMPTY
                        )
                ))
            ));

    $this->link
            ->setLabel('Link')
            ->setAttrib('class', 'span6')
            ->setAttrib('placeholder', 'http://www.contohnya.com')
            ->setValidators(array(
                array('callback', false, array(
                        'callback' => function($value) {
                          return Zend_Uri::check($value);
                        },
                        'messages' => array(
                            Zend_Validate_Callback::INVALID_VALUE => self::MSG_LINK_INVALID)))
            ));

    $this->submit
            ->setAttrib('class', 'btn btn-gebo')
            ->setLabel('Simpan');

    $this->image
            ->setLabel('Gambar')
            ->addValidators(array(
                array('File_Extension', false, array(
                        'extension' => 'jpg',
                        'messages' => array(
                            Zend_Validate_File_Extension::FALSE_EXTENSION => self::MSG_IMAGE_FALSE_EXTENSION
                        )
                )),
                array('ImageSize', false, array(
                        'minwidth' => 700,
                        'minheight' => 300,
                        'messages' => array(
                            Zend_Validate_File_ImageSize::WIDTH_TOO_SMALL => self::MSG_IMAGE_WIDTH_TOO_SMALL,
                            Zend_Validate_File_ImageSize::HEIGHT_TOO_SMALL => self::MSG_IMAGE_HEIGHT_TOO_SMALL
                        )
                ))
            ))
    ;

    $this->image->getValidator('File_Upload')->setMessages(array(
        Zend_Validate_File_Upload::NO_FILE => self::MSG_IMAGE_IS_EMPTY
    ));

    $this->addElements(array(
        $this->title,
        $this->link,
        $this->image,
        $this->submit
    ));

    $this->setElementDecorators(array('ViewHelper', 'ControlGroup'), array('image', 'submit'), false);
    $this->image->setDecorators(array('File', array('FileUpload', array(
                'w' => 700, 'h' => 300, 'text' => '700+x+300')), 'ControlGroup'));
  }

  public function populate(array $values)
  {
    if (null != $values['image']) {
      if (file_exists(UPLOAD_FOLDER . 'highlight/' . $values['image'])) {
        $data_image = $this->getView()->baseUrl("upload/highlight/" . $values['image']);
        $this->image->setAttrib('data-image', $data_image);
      }
    }
    parent::populate($values);
  }

}
