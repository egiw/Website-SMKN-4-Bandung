<?php

class Admin_Model_Analytics extends Zend_Gdata_Analytics
{
  public function __construct()
  {
    $email = 'egi.hasdi@sangkuriang.co.id';
    $password = 'axcldsiox';
    $client = Zend_Gdata_ClientLogin::getHttpClient($email, $password, self::AUTH_SERVICE_NAME);
    $this->setHttpClient($client);
  }

  /**
   * 
   * @return Zend_Gdata_Analytics
   */
  public function getReport()
  {
    $query = new Zend_Gdata_Analytics_DataQuery();
    $query->addMetric(Zend_Gdata_Analytics_DataQuery::METRIC_BOUNCES);
    $query->addMetric(Zend_Gdata_Analytics_DataQuery::METRIC_VISITORS);
    $query->addMetric(Zend_Gdata_Analytics_DataQuery::METRIC_NEW_VISITS);
    $query->setProfileId('ga:68845843');
    $query->setStartDate('2013-02-08');
    $query->setEndDate(Date('Y-m-d'));
    $result = $this->getDataFeed($query);
    return $result;
  }

}
