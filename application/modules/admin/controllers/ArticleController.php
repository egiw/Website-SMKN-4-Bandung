<?php

class Admin_ArticleController extends Zend_Controller_Action {

    //  messages
    const MSG_SELECTED_ARTICLES_DELETED = 'success|Artikel yang dipilih berhasil dihapus.';
    const MSG_ARTICLE_CREATED = 'success|Artikel berhasil diterbitkan.';
    const MSG_ARTICLE_PENDING = 'success|Artikel berhasil dibuat, anda harus menunggu persetujuan admin untuk diterbitkan.';
    const MSG_ARTICLE_ARCHIVED = 'success|Artikel dipindahkan ke arsip.';
    const MSG_ARTICLE_EDITED = 'success|Artikel berhasil disunting.';
    const MSG_ARTICLE_DELETED = 'success|Artikel berhasil dihapus.';
    const MSG_ARTICLE_RESTORED = 'success|Artikel berhasil dikembalikan.';
    const MSG_SELECTED_ARTICLES_APPROVED = 'success|%s artikel berhasil disetujui.';

    /**
     * @var Admin_Form_Article
     *
     *
     *
     *
     */
    protected $form = null;
    /**
     * @var Admin_Model_DbTable_Article
     *
     *
     *
     *
     */
    protected $article = null;
    /**
     * @var Admin_Model_DbTable_Tag
     *
     *
     */
    protected $tag = null;
    /**
     * @var Zend_Session_Namespace
     *
     *
     */
    protected $filter = null;

    public function init() {
        $this->_helper->layout->setLayout('admin');
        $this->form = new Admin_Form_Article();
        $this->article = new Admin_Model_DbTable_Article();
        $this->tag = new Admin_Model_DbTable_Tag();
        $this->filter = new Zend_Session_Namespace('filter');
        /* Initialize action controller here */
    }

    public function indexAction() {
        $pageNumber = $this->getParam('page');

        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            switch ($post['action']) {
                case 'delete':
                    foreach ($post['articles'] as $id) {
                        $article = $this->article->find($id)->current();
                        if (null != $article) {
                            $article->delete();
                        }
                    }
                    $this->_helper->flashMessenger->addMessage(
                    self::MSG_SELECTED_ARTICLES_DELETED);
                    break;
                case 'filter':
                    $this->filter->article = $post['filter'];
                    break;
                case 'reset':
                    $this->filter->unsetAll();
                default:
                    break;
            }

            $this->_helper->redirector('index');
        }

        $messages = $this->_helper->flashMessenger->getMessages();
        $username = Zend_Auth::getInstance()->getIdentity()->username;
        $data = $this->article->findAll($username, $this->filter->article);

        $countStatus = $this->article->countStatus($username);

        $paginator = Zend_Paginator::factory($data);
        $paginator->setCurrentPageNumber($pageNumber);
        $paginator->setDefaultItemCountPerPage(5);

        if (null != $this->filter->article['row']) {
            $paginator->setItemCountPerPage($this->filter->article['row']);
        }

        $this->view->countStatus = $countStatus;
        $this->view->filter = $this->filter->article;
        $this->view->articles = $paginator;
        $this->view->messages = $messages;
    }

    public function createAction() {
// action body
        if ($this->getRequest()->isPost()) {
            $data = $this->getRequest()->getPost();
            if ($this->form->isValid($data)) {
                $user = Zend_Auth::getInstance()->getIdentity();
                $acl = new SITi_Acl();
                $status = Admin_Model_Status::ARCHIVED;
                if (isset($data['submit'])) {
                    if ($acl->isAllowed($user->role, SITi_Acl::RES_ARTICLE, 'publish')) {
                        $status = Admin_Model_Status::PUBLISH;
                    } else {
                        $status = Admin_Model_Status::PENDING;
                    }
                } else if (isset($data['draft'])) {
                    $status = Admin_Model_Status::DRAFT;
                }

                $this->tag->save($this->form->tags->getValue());
                $this->article->insert(array(
                    'title'      => $this->form->title->getValue(),
                    'content'    => $this->form->content->getValue(),
                    'tags'       => $this->form->tags->getValue(),
                    'created_by' => $user->username,
                    'created_on' => Date('Y-m-d H:i:s'),
                    'status'     => $status
                ));


                if ($acl->isAllowed($user->role, SITi_Acl::RES_ARTICLE, 'publish')) {
                    $this->_helper->flashMessenger->addMessage(self::MSG_ARTICLE_CREATED);
                } else {
                    $this->_helper->flashMessenger->addMessage(self::MSG_ARTICLE_PENDING);
                };
                $this->_helper->redirector('index');
            }
        }
        $this->view->form = $this->form;
    }

    public function editAction() {
// action body
        $id = $this->getParam('id');
        $return = $this->getParam('return');
        if ($return == 'approve') {
            $this->form->submit->setLabel('Simpan dan terbitkan.');
        }
        if (null !== $id) {
            $article = $this->article->find($id)->current();
            if (null !== $article) {
                $this->form->populate($article->toArray());

                if ($this->getRequest()->isPost()) {
                    $data = $this->getRequest()->getPost();
                    if ($this->form->isValid($data)) {

                        $this->tag->save($this->form->tags->getValue(), $article->tags);
                        $status = Admin_Model_Status::ARCHIVED;
                        if (isset($data['submit'])) {
                            $status = Admin_Model_Status::PUBLISH;
                        } else if (isset($data['draft'])) {
                            $status = Admin_Model_Status::DRAFT;
                        }

                        $article->setFromArray(array(
                            'title'      => $this->form->title->getValue(),
                            'content'    => $this->form->content->getValue(),
                            'tags'       => $this->form->tags->getValue(),
                            'status'     => $status,
                            'updated_by' => Zend_Auth::getInstance()->getIdentity()->username,
                            'updated_on' => Date('Y-m-d H:i:s')
                        ))->save();

                        $this->_helper->flashMessenger->addMessage
                        (self::MSG_ARTICLE_EDITED);
                        if (null !== $return) {
                            $this->_helper->redirector($return);
                        } else {
                            $this->_helper->redirector('index');
                        }
                    }
                }
                $this->view->form = $this->form;
                return;
            }
        }
        $this->_helper->redirector('index');
    }

    public function deleteAction() {
        $this->_helper->viewRenderer->setNoRender();
        $id = $this->getParam('id');
        $return = $this->getParam('return');
        if (null !== $id) {
            $article = $this->article->find($id)->current();
            if (null !== $article) {
                if (Admin_Model_Status::ARCHIVED === $article->status) {
                    $this->tag->save('', $article->tags);
                    $article->delete();
                    $this->_helper->flashMessenger->addMessage
                    (self::MSG_ARTICLE_DELETED);
                } else {
                    $article->status = Admin_Model_Status::ARCHIVED;
                    $article->save();
                    $this->_helper->flashMessenger->addMessage
                    (self::MSG_ARTICLE_ARCHIVED);
                }
            }
        }
        if (null !== $return) {
            $this->_helper->redirector($return);
        } else {

            $this->_helper->redirector('index');
        }
    }

    public function restoreAction() {
        // action body
        $this->_helper->viewRenderer->setNoRender();
        $id = $this->getParam('id');
        if (null !== $id) {
            $article = $this->article->find($id)->current();
            if (null !== $article && Admin_Model_Status::ARCHIVED === $article->status) {
                $article->status = Admin_Model_Status::DRAFT;
                $article->save();
                $this->_helper->flashMessenger->addMessage(self::MSG_ARTICLE_RESTORED);
            }
        }
        $this->_helper->redirector('index');
    }

    public function approveAction() {
        $pageNumber = $this->getParam('page');
        $id = $this->getParam('id');

        if (null !== $id) {
            $article = $this->article->find($id)->current();
            $user = Zend_Auth::getInstance()->getIdentity();
            if (null !== $article && $article->status == Admin_Model_Status::PENDING) {
                $article->status = Admin_Model_Status::PUBLISH;
                $article->approved_by = $user->username;
                $article->approved_on = Date('Y-m-d H:i:s');
                $article->save();
                $this->_helper->flashMessenger->addMessage('success|Artikel berhasil disetujui.');
            }
            $this->_helper->redirector('approve');
            exit();
        }

        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            switch ($post['action']) {
                case 'delete':
                    foreach ($post['articles'] as $id) {
                        $article = $this->article->find($id)->current();
                        if (null != $article) {
                            $article->delete();
                        }
                    }
                    $this->_helper->flashMessenger->addMessage(
                    self::MSG_SELECTED_ARTICLES_DELETED);
                    break;
                case 'approve':
                    $articles = $post['articles'];
                    $ids = implode(',', $articles);
                    $this->article->update(array(
                        'status' => Admin_Model_Status::PUBLISH
                    ), array("id IN({$ids})"));
                    $this->_helper->flashMessenger->addMessage(
                    sprintf(self::MSG_SELECTED_ARTICLES_APPROVED, count($articles))
                    );
                    break;
                case 'filter':
                    $this->filter->article = $post['filter'];
                    break;
                default:
                    break;
            }
            $this->_helper->redirector('approve');
        }

        $messages = $this->_helper->flashMessenger->getMessages();
        $username = Zend_Auth::getInstance()->getIdentity()->username;
        $data = $this->article->findPendingArticles();

        $paginator = Zend_Paginator::factory($data);
        $paginator->setCurrentPageNumber($pageNumber);
        $paginator->setDefaultItemCountPerPage(5);

        if (null != $this->filter->article['row']) {
            $paginator->setItemCountPerPage($this->filter->article['row']);
        }

        $this->view->filter = $this->filter->article;
        $this->view->articles = $paginator;
        $this->view->messages = $messages;
    }

    public function allAction() {
        $pageNumber = $this->getParam('page');

        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            switch ($post['action']) {
                case 'delete':
                    foreach ($post['articles'] as $id) {
                        $article = $this->article->find($id)->current();
                        if (null != $article) {
                            $article->delete();
                        }
                    }
                    $this->_helper->flashMessenger->addMessage(
                    self::MSG_SELECTED_ARTICLES_DELETED);
                    break;
                case 'filter':
                    $this->filter->article = $post['filter'];
                    break;
                case 'reset':
                    $this->filter->unsetAll();
                default:
                    break;
            }

            $this->_helper->redirector('index');
        }

        $messages = $this->_helper->flashMessenger->getMessages();
        $username = Zend_Auth::getInstance()->getIdentity()->username;
        $data = $this->article->findAll(null, $this->filter->article);

        $countStatus = $this->article->countStatus($username);

        $paginator = Zend_Paginator::factory($data);
        $paginator->setCurrentPageNumber($pageNumber);
        $paginator->setDefaultItemCountPerPage(5);

        if (null != $this->filter->article['row']) {
            $paginator->setItemCountPerPage($this->filter->article['row']);
        }

        $this->view->countStatus = $countStatus;
        $this->view->filter = $this->filter->article;
        $this->view->articles = $paginator;
        $this->view->messages = $messages;
    }

}
