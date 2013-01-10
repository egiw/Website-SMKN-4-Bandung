README
======

Website SMKN 4 Bandung.

Settingan Virtual Host
=====================

<VirtualHost *:80>
   DocumentRoot "E:/www.smkn4bdg.sch.id/public"
   ServerName .local

   # This should be omitted in the production environment
   SetEnv APPLICATION_ENV development

   <Directory "E:/www.smkn4bdg.sch.id/public">
       Options Indexes MultiViews FollowSymLinks
       AllowOverride All
       Order allow,deny
       Allow from all
   </Directory>

</VirtualHost>


Backup database via CMD
mysqldump -u root smkn4bdg > smkn4bdg.sql

Restore database via CMD
mysql -u root smkn4bdg < smkn4bdg.sql