<?php

class PrakerinController extends Zend_Controller_Action
{
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        
    }

    public function getAction()
    {
        if ($this->getRequest()->isXMLHttpRequest() && $this->getRequest()->isGet()) {
            $filter = array();
            $model = new Application_Model_DbTable_Prakerin;
            $filter['name'] = $this->getParam('name');
            $filter['category'] = explode(',', $this->getParam('category'));
            $this->_helper->viewRenderer->setNoRender();
            $this->_helper->layout->disableLayout();
            $this->getResponse()->setHeader('Content-Type', 'application/json');
            $data = $model->findAll($filter);
            echo json_encode($data->toArray());
            return;
        }
    }

}
