<?php

/**
 * Description of NormalizeType
 *
 * @author Egiw
 */
class Admin_View_Helper_NormalizeType extends Zend_View_Helper_Abstract {

    //put your code here

    public function normalizeType($type) {
        switch ($type) {
            case 'article':
                return 'Artikel';
                break;
            case 'news':
                return 'Berita';
                break;
            case 'jobs':
                return 'Lowongan Kerja';
                break;
            case 'event':
                return 'Kegiatan';
                break;
            case 'mading':
                return 'Mading';
                break;
            case 'highlight':
                return 'Highlight';
                break;
            case 'prakerin':
                return 'Prakerin';
                break;
            default:
                break;
        }
    }

}