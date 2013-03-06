<?php

/**
 * This class used for create and update mading.
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Admin_Form_Mading extends Zend_Form {

    const TITLE_IS_EMPTY = 'Silahkan isi judul majalah dinding.';
    const IMAGE_NO_FILE = 'Anda harus menyertakan gambar.';
    const IMAGE_FILE_NOT_FOUND = 'Gambar tidak ditemukan.';
    const IMAGE_FALSE_EXTENSION = 'Ekstensi gambar salah.';
    const IMAGE_HEIGHT_TOO_SMALL = 'Tinggi gambar harus lebih dari 400px';
    const IMAGE_WIDTH_TOO_SMALL = 'Lebar gambar harus lebih dari 300px';

    /**
     *
     * @var Zend_Form_Element_Text
     */
    public $title;
    /**
     *
     * @var Zend_Form_Element_File
     */
    public $image;
    /**
     *
     * @var Zend_Form_Element_Textarea
     */
    public $description;
    /**
     *
     * @var Zend_Form_Element_Submit
     */
    public $submit;

    public function init() {
        /* Form Elements & Other Definitions Here ... */

        $this->addPrefixPath('SITi_Form_Decorator', 'SITi/Form/Decorator', 'Decorator');

        $this->title = new Zend_Form_Element_Text('title');
        $this->description = new Zend_Form_Element_Textarea('description');
        $this->image = new Zend_Form_Element_File('image');
        $this->submit = new Zend_Form_Element_Submit('submit');

        $this->title
        ->setRequired(true)
        ->setLabel('Judul')
        ->setAttrib('class', 'span8')
        ->setValidators(array(
            array('NotEmpty', false, array(
                    'messages' => array(
                        Zend_Validate_NotEmpty::IS_EMPTY => self::TITLE_IS_EMPTY
                    )
                ))
        ));

        $this->description
        ->setLabel('Deskripsi')
        ->setAttrib('style', 'height: 325px')
        ->addFilter(new SITi_Filter_PurifyHTML());

        $this->image
        ->setRequired(true)
        ->setLabel('Gambar')
        ->addValidators(array(
            array('File_ImageSize', false, array(
                    'minwidth'  => 300,
                    'minheight' => 400,
                    'messages'  => array(
                        Zend_Validate_File_ImageSize::WIDTH_TOO_SMALL  => self::IMAGE_WIDTH_TOO_SMALL,
                        Zend_Validate_File_ImageSize::HEIGHT_TOO_SMALL => self::IMAGE_HEIGHT_TOO_SMALL
                    )
                )),
            array('File_Extension', false, array(
                    'extension' => 'jpg,jpeg',
                    'messages'  => array(
                        Zend_Validate_File_Extension::FALSE_EXTENSION => self::IMAGE_FALSE_EXTENSION
                    )
                ))
        ));



        $this->image->getValidator('File_Upload')->setMessage(self::IMAGE_NO_FILE, Zend_Validate_File_Upload::NO_FILE);

        $this->submit->setAttrib('class', 'btn btn-gebo');

        $this->addElements(array(
            $this->title,
            $this->description,
            $this->image,
            $this->submit
        ));


        $this->title->setDecorators(array('ViewHelper', 'ControlGroup'));
        $this->description->setDecorators(array('ViewHelper', 'ControlGroup'));
        $this->image->setDecorators(array('File', array('FileUpload', array(
                    'w'    => 300, 'h'    => 400, 'text' => '300+x+400')), 'ControlGroup'));
        $this->submit->setDecorators(array('ViewHelper'));
    }

    public function populate(array $values) {
        if (null != $values['image']) {
            if (file_exists(UPLOAD_FOLDER . 'mading/' . $values['image'])) {
                $data_image = $this->getView()->baseUrl("upload/mading/" . $values['image']);
                $this->image->setAttrib('data-image', $data_image);
            }
        }
        parent::populate($values);
    }

}
