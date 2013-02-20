<?php

class Application_View_Helper_Timthumb extends Zend_View_Helper_Abstract
{
    protected $format = '<img src="%s" alt="" />';

    public function Timthumb($src, $w, $h, $q)
    {
        $timthumb = $this->view->baseUrl('timthumb.php?src=' . $src . '&w=' . $w . '&h=' . $h . '&q=' . $q);
        $result = sprintf($this->format, $timthumb);
        return $result;
    }

}