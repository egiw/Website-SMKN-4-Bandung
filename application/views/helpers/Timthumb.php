<?php

class Application_View_Helper_Timthumb extends Zend_View_Helper_Abstract {

    protected $format = '<img src="%s" %s/>';

    public function Timthumb($src, $w, $h, $q, array $options = null) {
        $timthumb = $this->view->baseUrl('timthumb.php?src=' . $src . '&w=' . $w . '&h=' . $h . '&q=' . $q);
        $result = sprintf($this->format, $timthumb, $this->htmlAttribs($options));
        return $result;
    }

    public function htmlAttribs(array $attribs) {
        $xhtml = '';
        foreach ((array) $attribs as $key => $value) {
            $xhtml .= $key . '=' . '"' . $value . '"';
        }
        return $xhtml;
    }

}