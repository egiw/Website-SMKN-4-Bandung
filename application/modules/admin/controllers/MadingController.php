<?php

/**
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 */
class Admin_MadingController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        $this->_helper->layout->setLayout('admin');
    }

    public function indexAction() {
        $model = new Admin_Model_DbTable_Mading();
        $mading = $model->findAll();
        $this->view->mading = $mading->toArray();
    }

    public function createAction() {
        $form = new Admin_Form_Mading();
        $form->submit->setLabel('Simpan');

        if ($this->getRequest()->isPost()) {
            $data = $this->getRequest()->getPost();
            if ($form->isValid($data) && $form->image->isUploaded()) {
                $info = pathinfo($form->image->getFileName());
                $form->image->addFilter('Rename', UPLOAD_FOLDER . 'mading/'
                . $info['filename'] . '_' . time() . '.' . $info['extension']);
                if ($form->image->receive()) {
                    $model = new Admin_Model_DbTable_Mading();
                    $model->insert(array(
                        'title'      => $form->title->getValue(),
                        'image'      => $form->image->getValue(),
                        'created_by' => Zend_Auth::getInstance()->getIdentity()->username,
                        'created_on' => Date('Y-m-d H:i:s'),
                        'sort'       => 0
                    ));
                    $this->_helper->FlashMessenger->addMessage('success|Majalah dinding berhasil ditambahkan.');
                    $this->_helper->Redirector('index');
                }
            }
        }
        $this->view->form = $form;
    }

    public function orderAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $model = new Admin_Model_DbTable_Mading();
        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            $mading = $post['mading'];
            foreach ($mading as $index => $id) {
                $model->update(array('sort' => $index), array('id = ?' => $id));
            }
        }
    }

}
