<?php

class SITi_Form_Decorator_FileUpload extends Zend_Form_Decorator_Abstract
{
  public function render($content)
  {
    $element = $this->getElement();
    $element->addDecorator('HtmlTag', array('tag' => 'div', 'class' => 'fileupload'));

    $data_image = $element->getAttrib('data-image');
    $image = "<img src='http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image'/>";
    if (null != $data_image) {
      $image = "<img src='{$data_image}'/>";
    }

    $tag = new Zend_Form_Decorator_HtmlTag();

    $btn_new = $tag->setTag('span')->setOptions(array(
                'class' => 'fileupload-new'
            ))->render('Pilih Gambar');

    $btn_exists = $tag->setTag('span')->setOptions(array(
                'class' => 'fileupload-exists'
            ))->render('Ubah');

    $btn_file = $tag->setTag('span')->setOptions(array(
                'class' => 'btn btn-file'
            ))->render($btn_new . $btn_exists . $content);

    $btn_remove = $tag->setTag('a')->setOptions(array(
                'class' => 'btn fileupload-exists',
                'href' => '#',
                'data-dismiss' => 'fileupload'
            ))->render('Hapus');

    $controls = $tag->clearOptions()->setTag('div')->render($btn_file . ' ' . $btn_remove);

    $fileupload_new_thumbnail = $tag->clearOptions()->setTag('div')->setOptions(array(
                'class' => 'fileupload-new thumbnail',
                'style' => 'width:200px;height:150px'))->render($image);

    $fileupload_exists_thumbnail = $tag->clearOptions()->setTag('div')->setOptions(array(
                'class' => 'fileupload-preview fileupload-exists thumbnail',
                'style' => 'width: 200px; height: 150px; line-height:20px',
            ))->render('');

    $fileupload = $tag->clearOptions()->setTag('div')->setOptions(array(
                'class' => 'fileupload fileupload-new',
                'data-provides' => 'fileupload'
            ))->render($fileupload_new_thumbnail . $fileupload_exists_thumbnail . $controls);

    return $fileupload;
  }

}