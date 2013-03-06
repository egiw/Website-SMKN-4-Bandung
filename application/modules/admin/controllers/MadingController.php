<?php

/**
 * @author Egi Hasdi <egi.hasdi@sangkuriang.co.id>
 *
 *
 */
class Admin_MadingController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        $this->_helper->layout->setLayout('admin');
    }

    public function indexAction() {
        $model = new Admin_Model_DbTable_Mading();
        $mading = $model->findAll();
        $messages = $this->_helper->FlashMessenger->getMessages();
        $this->view->messages = $messages;
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
                        'title'       => $form->title->getValue(),
                        'image'       => $form->image->getValue(),
                        'created_by'  => Zend_Auth::getInstance()->getIdentity()->username,
                        'created_on'  => Date('Y-m-d H:i:s'),
                        'description' => $form->description->getValue(),
                        'sort'        => 0
                    ));
                    $this->_helper->FlashMessenger->addMessage('success|Majalah dinding berhasil ditambahkan.');
                    $this->_helper->Redirector('index');
                }
            }
        }
        $this->view->form = $form;
    }

    public function orderAction() {
        $this->disableLayoutAndView();
        $model = new Admin_Model_DbTable_Mading();
        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            $mading = $post['mading'];
            $ids = implode(',', $mading);
            $sort = 'CASE id ';
            foreach ($mading as $index => $id) {
                $sort .= "WHEN {$id} THEN {$index} ";
            }
            $sort .= 'END';
            $model->getAdapter()->query("UPDATE mading SET sort = {$sort} WHERE id IN($ids)");
        }
    }

    public function deleteAction() {
        $request = $this->getRequest();
        if ($request->isXMLHttpRequest() && $request->isPost()) {
            $id = $request->getPost('id');
            if (null !== $id) {
                $model = new Admin_Model_DbTable_Mading();
                $mading = $model->find($id)->current();
                if (null !== $mading) {
                    $path = UPLOAD_FOLDER . 'mading/' . $mading->image;
                    if ($mading->delete()) {
                        if (file_exists($path)) {
                            unlink($path);
                        }
                        $this->_helper->json->sendJson(array(
                            'message' => 'success'
                        ));
                    };
                }
            }
        }
    }

    private function disableLayoutAndView() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function editAction() {
        $id = $this->getParam('id');
        if (null !== $id) {
            $model = new Admin_Model_DbTable_Mading();
            $mading = $model->find($id)->current();
            if (null !== $mading) {
                $form = new Admin_Form_Mading();
                $form->populate($mading->toArray());
                $form->image->setRequired(false);
                $form->submit->setLabel('Simpan');
                if ($this->getRequest()->isPost()) {
                    $data = $this->getRequest()->getPost();
                    if ($form->isValid($data)) {
                        if ($form->image->isUploaded()) {
                            $form->image->addFilter('Rename', UPLOAD_FOLDER . 'mading/'
                            . $info['filename'] . '_' . time() . '.' . $info['extension']);
                            if ($form->image->receive()) {
                                $mading->image = $form->image->getValue();
                            }
                        }
                        $mading->title = $form->title->getValue();
                        $mading->description = $form->description->getValue();
                        if ($mading->save()) {
                            $this->_helper->FlashMessenger->addMessage('success|Majalah dinding berhasil diperbaharui.');
                            $this->_helper->Redirector('index');
                        }
                    }
                }
                $this->view->form = $form;
            }
        }
    }

}
