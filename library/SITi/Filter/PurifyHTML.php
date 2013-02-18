<?php

class SITi_Filter_PurifyHTML implements Zend_Filter_Interface
{
    public function filter($value)
    {
        $config = HTMLPurifier_Config::createDefault();
        $purifier = new HTMLPurifier($config);
        return $purifier->purify($value);
    }

}