<?php

class Application_View_Helper_TimeSince extends Zend_View_Helper_Abstract
{
  function TimeSince($since)
  {
    $chunks = array(
        array(60 * 60 * 24 * 365, 'tahun'),
        array(60 * 60 * 24 * 30, 'bulan'),
        array(60 * 60 * 24 * 7, 'minggu'),
        array(60 * 60 * 24, 'hari'),
        array(60 * 60, 'jam'),
        array(60, 'menit'),
        array(1, 'detik')
    );

    for ($i = 0, $j = count($chunks); $i < $j; $i++) {
      $seconds = $chunks[$i][0];
      $name = $chunks[$i][1];
      if (($count = floor($since / $seconds)) != 0) {
        break;
      }
    }
    $print = $count . ' ' . $name . ' yang lalu.';
//    $print = ($count == 1) ? '1 ' . $name : "$count {$name}s";
    return $print;
  }

}