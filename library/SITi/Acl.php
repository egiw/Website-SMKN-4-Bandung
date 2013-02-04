<?php

class SITi_Acl extends Zend_Acl
{
  public function __construct()
  {
    $this->addRole(new Zend_Acl_Role('anonymous'));
    $this->addRole(new Zend_Acl_Role(SITi_Role::SISWA));
    $this->addRole(new Zend_Acl_Role(SITi_Role::OSIS), SITi_Role::SISWA);
    $this->addRole(new Zend_Acl_Role(SITi_Role::GURU), SITi_Role::OSIS);
    $this->addRole(new Zend_Acl_Role(SITi_Role::ADMIN), SITi_Role::GURU);
    $this->addRole(new Zend_Acl_Role(SITi_Role::DEVELOPER), SITi_Role::ADMIN);


    $this->add(new Zend_Acl_Resource('default'));
    $this->add(new Zend_Acl_Resource('admin:index'));
    $this->add(new Zend_Acl_Resource('admin:user'));
    $this->add(new Zend_Acl_Resource('admin:article'));
    $this->add(new Zend_Acl_Resource('admin:news'));
    $this->add(new Zend_Acl_Resource('admin:event'));
    $this->add(new Zend_Acl_Resource('admin:polling'));
    $this->add(new Zend_Acl_Resource('admin:jobs'));
    $this->add(new Zend_Acl_Resource('admin:prakerin'));
    $this->add(new Zend_Acl_Resource('admin:account'));
    $this->add(new Zend_Acl_Resource('admin:log'));
    $this->add(new Zend_Acl_Resource('default:error'));

    // anonymouse
    $this->allow('anonymous', 'admin:user');

    // Siswa
    $this->allow(SITi_Role::SISWA, 'default');
    $this->allow(SITi_Role::SISWA, 'admin:index');
    $this->allow(SITi_Role::SISWA, 'admin:user');
    $this->allow(SITi_Role::SISWA, 'admin:article');

    // Osis
    $this->allow(SITi_Role::OSIS, 'admin:news');
    $this->allow(SITi_Role::OSIS, 'admin:event');

    // Guru
    $this->allow(SITi_Role::GURU, 'admin:polling');
    $this->allow(SITi_Role::GURU, 'admin:jobs');
    $this->allow(SITi_Role::GURU, 'admin:prakerin');

    // Admin
    $this->allow(SITi_Role::ADMIN, 'admin:account');

    // Developer
    $this->allow(SITi_Role::DEVELOPER, 'admin:log');
  }

}