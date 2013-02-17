<?php

/**
 * @author Egi Soleh Hasdi <egi.hasdi@sangkuriang.co.id>
 *
 *
 */
class Admin_PrakerinController extends Zend_Controller_Action
{
    const MSG_DATA_CREATED = 'success|Data Info Prakerin berhasil ditambahkan.';
    const MSG_DATA_UPDATED = 'success|Data Info Prakerin berhasil disunting.';
    const MSG_DATA_DELETED = 'success|Data Info Prakerin berhasil dihapus.';
    const MSG_SELECTED_DATA_DELETED = 'success|%s Data Info Prakerin berhasil dihapus.';

    /**
     * @var Admin_Model_DbTable_Prakerin
     *
     *
     */
    protected $model = null;
    /**
     *
     * @var Zend_Session_Namespace
     */
    protected $filter;

    public function init()
    {
        /* Initialize action controller here */
        $this->_helper->layout->setLayout('admin');
        $this->model = new Admin_Model_DbTable_Prakerin();
        $this->filter = new Zend_Session_Namespace('filter');
    }

    public function indexAction()
    {
        $pageNumber = $this->getParam('page');

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
        } elseif ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            switch ($post['action']) {
                case 'delete':
                    $count = 0;
                    foreach ($post['prakerin'] as $id) {
                        $prakerin = $this->model->find($id)->current();
                        if (null !== $prakerin) {
                            $prakerin->delete();
                            $count++;
                        }
                    }
                    $this->_helper->FlashMessenger->addMessage(sprintf(self::MSG_SELECTED_DATA_DELETED, $count));
                    break;
                case 'filter': $this->filter->prakerin = $post['filter'];
                    break;
                case 'reset': $this->filter->unsetAll();
                    break;
                default:
                    break;
            }
            $this->_helper->Redirector('index');
        }

        $messages = $this->_helper->FlashMessenger->getMessages();
        $data = $this->model->findAll($this->filter->prakerin);
        $paginator = Zend_Paginator::factory($data);
        $paginator->setCurrentPageNumber($pageNumber);
        $paginator->setDefaultItemCountPerPage(5);
        if ($row = $this->filter->prakerin['row']) {
            $paginator->setItemCountPerPage($row);
        }

        $this->view->messages = $messages;
        $this->view->paginator = $paginator;
        $this->view->filter = $this->filter->prakerin;
    }

    public function createAction()
    {
        $form = new Admin_Form_Prakerin();
        if ($this->getRequest()->isPost()) {
            $data = $this->getRequest()->getPost();
            if ($form->isValid($data)) {
                $prakerin = $this->model->createRow($form->getValues());
                $prakerin->setFromArray(array(
                    'category'   => implode(',', $form->category->getValue()),
                    'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
                    'created_on' => Date('Y-m-d H:i:s')
                ));
                $prakerin->save();
                $this->_helper->FlashMessenger->addMessage(self::MSG_DATA_CREATED);
                $this->_helper->Redirector('index');
            }
        }

        $this->view->form = $form;
    }

    public function editAction()
    {
        $id = $this->getParam('id');
        if (null !== $id) {
            $prakerin = $this->model->find($id)->current();
            if (null !== $prakerin) {
                $form = new Admin_Form_Prakerin();
                $form->populate($prakerin->toArray());
                if ($this->getRequest()->isPost()) {
                    $data = $this->getRequest()->getPost();
                    if ($form->isValid($data)) {
                        $prakerin->setFromArray($form->getValues());
                        $prakerin->setFromArray(array(
                            'category'   => implode(',', $form->category->getValue()),
                            'updated_by' => Zend_Auth::getInstance()->getIdentity()->username,
                            'updated_on' => Date('Y-m-d H:i:s')
                        ));
                        $prakerin->save();
                        $this->_helper->FlashMessenger->addMessage(self::MSG_DATA_UPDATED);
                        $this->_helper->redirector('index');
                    }
                }
                $this->view->form = $form;
                return;
            }
        }
        $this->_helper->redirector('index');
    }

    public function deleteAction()
    {
        $this->_helper->viewRenderer->setNoRender();
        $id = $this->getParam('id');
        if (null !== $id) {
            $prakerin = $this->model->find($id)->current();
            if (null !== $prakerin) {
                $prakerin->delete();
                $this->_helper->FlashMessenger->addMessage(self::MSG_DATA_DELETED);
            }
        }
        $this->_helper->redirector('index');
    }

}
