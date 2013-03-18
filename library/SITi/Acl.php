<?php

class SITi_Acl extends Zend_Acl {

//    Roles
    const ROLE_KESISWAAN = 'kesiswaan';
    const ROLE_HUBIN = 'hubin';
    const ROLE_KURIKULUM = 'kurikulum';
    const ROLE_GURU = 'guru';
    const ROLE_SISWA = 'siswa';
    const ROLE_DEVELOPER = 'developer';
//    Resources
    const RES_ARTICLE = 'article';
    const RES_NEWS = 'news';
    const RES_MADING = 'mading';
    const RES_EVENT = 'event';
    const RES_GALLERY = 'gallery';
    const RES_POLLING = 'polling';
    const RES_USER = 'user';
    const RES_JOBS = 'jobs';
    const RES_PRAKERIN = 'prakerin';
    const RES_HIGHLIGHT = 'highlight';
    const RES_ACCOUNT = 'account';
    const RES_ADMIN = 'admin';
    const RES_DASHBOARD_GUESTBOOK = 'dashboard_guestbook';

    public function __construct() {
        $this->addRole(new Zend_Acl_Role(self::ROLE_SISWA))
        ->addRole(new Zend_Acl_Role(self::ROLE_KESISWAAN), self::ROLE_SISWA)
        ->addRole(new Zend_Acl_Role(self::ROLE_HUBIN), self::ROLE_SISWA)
        ->addRole(new Zend_Acl_Role(self::ROLE_KURIKULUM))
        ->addRole(new Zend_Acl_Role(self::ROLE_GURU), self::ROLE_SISWA)
        ->addRole(new Zend_Acl_Role(self::ROLE_DEVELOPER));
//        init resources
        $this->add(new Zend_Acl_Resource(self::RES_ARTICLE))
        ->add(new Zend_Acl_Resource(self::RES_NEWS))
        ->add(new Zend_Acl_Resource(self::RES_EVENT))
        ->add(new Zend_Acl_Resource(self::RES_GALLERY))
        ->add(new Zend_Acl_Resource(self::RES_POLLING))
        ->add(new Zend_Acl_Resource(self::RES_USER))
        ->add(new Zend_Acl_Resource(self::RES_JOBS))
        ->add(new Zend_Acl_Resource(self::RES_PRAKERIN))
        ->add(new Zend_Acl_Resource(self::RES_HIGHLIGHT))
        ->add(new Zend_Acl_Resource(self::RES_MADING))
        ->add(new Zend_Acl_Resource(self::RES_ACCOUNT))
        ->add(new Zend_Acl_Resource(self::RES_ADMIN))
        ->add(new Zend_Acl_Resource(self::RES_DASHBOARD_GUESTBOOK));


        $this->allow(self::ROLE_DEVELOPER);

        $this->allow(self::ROLE_SISWA, array(
            self::RES_ARTICLE,
            self::RES_MADING
        ));

        $this->allow(self::ROLE_KESISWAAN, array(
            self::RES_NEWS,
            self::RES_EVENT,
            self::RES_GALLERY,
            self::RES_POLLING,
            self::RES_ACCOUNT,
            self::RES_HIGHLIGHT,
            self::RES_MADING
        ));

        $this->allow(self::ROLE_HUBIN, array(
            self::RES_JOBS,
            self::RES_PRAKERIN
        ));

        $this->allow(self::ROLE_GURU, array(
            self::RES_GALLERY,
            self::RES_NEWS
        ));

        $this->allow(self::ROLE_KURIKULUM, array(
            self::RES_ARTICLE,
            self::RES_NEWS,
            self::RES_EVENT,
            self::RES_POLLING
        ));
    }

}