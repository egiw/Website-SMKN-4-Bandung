-- MySQL dump 10.13  Distrib 5.5.25a, for Win32 (x86)
--
-- Host: localhost    Database: smkn4bdg
-- ------------------------------------------------------
-- Server version	5.5.25a

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `status` enum('archived','draft','pending','publish') COLLATE utf8_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Lorem Ipsum Dolor Sit Amet :)','<p>The quick brown fox jumps over the lazy dog.</p>\r\n<p><img src=\"../../../../file-manager/upload/image/Affandi.jpg\" alt=\"\" width=\"145\" height=\"192\" /></p>','Dolor,Ipsum,Pemrogramman','egisolehhasdi','2013-01-05 06:13:49',115,'draft'),(2,'Postingan Artikel2','<p>Hello. Lorem Ipsum Dolor Sit Amet.</p>','Lorem Ipsum DOlor,Sit Amet',NULL,'2013-01-05 07:26:07',0,'pending'),(3,'Lorem Ipsum Dolor Sit Amet','<p>&nbsp;</p>\r\n<p><img style=\"margin-right: 10px; float: left; margin-top: 0px; margin-bottom: 0px;\" src=\"../../../../file-manager/upload/image/Affandi.jpg\" alt=\"\" width=\"145\" height=\"192\" />Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.</p>\r\n<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.</p>\r\n<p>Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>','The Quick Brown Fox,Jumps Over','egisolehhasdi','2013-01-05 14:46:17',0,'publish'),(6,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:41:55',0,'draft'),(7,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:18',0,'draft'),(8,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:20',0,'draft'),(9,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:22',0,'draft'),(10,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:22',0,'draft'),(11,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:22',0,'draft'),(12,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:22',0,'draft'),(13,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:23',0,'draft'),(14,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:23',0,'draft'),(15,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:23',0,'draft'),(16,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:23',0,'draft'),(17,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:23',0,'draft'),(18,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:24',0,'draft'),(19,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:24',0,'draft'),(20,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:24',0,'draft'),(21,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:24',0,'draft'),(22,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:25',0,'draft'),(23,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:25',0,'draft'),(24,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:25',0,'draft'),(25,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:25',0,'draft'),(26,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:25',0,'draft'),(27,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:26',0,'draft'),(28,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:26',0,'draft'),(29,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:26',0,'draft'),(30,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:26',0,'draft'),(31,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:27',0,'draft'),(32,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:27',0,'draft'),(33,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:27',0,'draft'),(34,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:27',0,'draft'),(35,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:28',0,'draft'),(36,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:28',0,'draft'),(37,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:28',0,'draft'),(38,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:28',0,'draft'),(39,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:29',0,'draft'),(40,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:29',0,'draft'),(41,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:29',0,'draft'),(42,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:29',0,'draft'),(43,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:29',0,'draft'),(44,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:30',0,'draft'),(45,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:30',0,'draft'),(46,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:30',0,'draft'),(47,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:30',0,'draft'),(48,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:31',0,'draft'),(49,'Lorem Ipsum','Lorem Ipsum Dolor Sit Amet, The quick brown fox jumps over the lazy dog','Lorem,Ipsum,Dolor','egisolehhasdi','2013-01-06 02:42:31',0,'draft'),(50,'Tutorial membuat form login sederhana','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.</p>\r\n<p>Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.</p>\r\n<p>Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.</p>\r\n<p>&nbsp;&nbsp;</p>','Pemrogramman','wildanfm','2013-01-08 11:22:48',0,'publish');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `until_date` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `status` enum('archived','draft','pending','publish') COLLATE utf8_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (23,'Jalan santai dan Car Free Day','2013-01-08 23:23:20','2013-01-08 23:23:20','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:20',26,'archived'),(24,'Jalan santai dan Car Free Day','2013-01-08 23:23:20','2013-01-08 23:23:20','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:20',26,'archived'),(25,'Jalan santai dan Car Free Day','2013-01-08 23:23:20','2013-01-08 23:23:20','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:20',26,'archived'),(26,'Jalan santai dan Car Free Day','2013-01-08 23:23:21','2013-01-08 23:23:21','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:21',26,'archived'),(27,'Jalan santai dan Car Free Day','2013-01-08 23:23:21','2013-01-08 23:23:21','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:21',26,'archived'),(28,'Jalan santai dan Car Free Day','2013-01-08 23:23:21','2013-01-08 23:23:21','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:21',26,'archived'),(29,'Jalan santai dan Car Free Day','2013-01-08 23:23:21','2013-01-08 23:23:21','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:21',26,'archived'),(30,'Jalan santai dan Car Free Day','2013-01-08 23:23:22','2013-01-08 23:23:22','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:22',26,'archived'),(31,'Jalan santai dan Car Free Day','2013-01-08 23:23:22','2013-01-08 23:23:22','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:22',26,'archived'),(32,'Jalan santai dan Car Free Day','2013-01-08 23:23:22','2013-01-08 23:23:22','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:22',26,'publish'),(33,'Jalan santai dan Car Free Day','2013-01-08 00:00:00','2013-01-08 00:00:00','Lap. Gasibu Bandung','<p>Lorem Ipsum Dolor Sit Amet</p>','egisolehhasdi','2013-01-08 23:23:22',26,'publish'),(34,'Jalan santai dan Car Free Day','2013-01-08 23:23:23','2013-01-08 23:23:23','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:23',26,'publish'),(35,'Jalan santai dan Car Free Day','2013-01-08 23:23:23','2013-01-08 23:23:23','Lap. Gasibu Bandung','Lorem Ipsum Dolor Sit Amet','egisolehhasdi','2013-01-08 23:23:23',26,'publish'),(36,'Jalan santai dan Car Free Day','2013-01-09 00:00:00','2013-01-10 00:00:00','Jalan Kliningan No.6','<p>Hello world lorem ipsum dolor sit amet</p>','egisolehhasdi','2013-01-09 03:29:29',0,'publish'),(37,'Car Free Night Tahun baru di Masjid Agung Bandung','2013-01-09 00:00:00','2013-01-10 00:00:00','Masjid Agung Alun2 bandung','<p>Lorem Ipsum Dolor Sit Amet&nbsp;</p>','egisolehhasdi','2013-01-09 03:31:16',0,'publish');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (2,'Web DeveloperEdited','PT. Sangkuriang Internasional Edited','asdf_1357978057.jpg','http://www.sangkuriang.co.ids','<p>Edoted</p>','MYSQL,PHP,Web Developer','egisolehhasdi','2013-01-12 08:33:16','egisolehhasdi','2013-01-12 09:09:29'),(3,'Web Developer','PT. Sangkuriang Internasional','sangkuriang_1357976282.jpg','http://www.sangkuriang.co.id','<div id=\"row1-career\" style=\"font-family: pt_sansregular, arial, tahoma; font-size: 14.666666984558105px; background-color: #4d4039; margin: 0px auto; padding: 0px; border-width: 1px 0px 0px; border-top-style: solid; border-top-color: #5e4e46; font: inherit; vertical-align: baseline; width: 960px; height: auto; color: #404040; line-height: 21px;\">\r\n<div id=\"career-content-1\" style=\"margin: 0px; padding: 70px 8.5em 0px; border: 0px; font: inherit; vertical-align: baseline; color: #ffffff; line-height: 1.2em; text-shadow: #2e2826 0px 1px;\"><span class=\"position-text\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 20px; font: inherit; vertical-align: baseline; font-weight: bold;\">Position Name : Web Developer</span><br /><br /><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Vacant for 7 people</span><br /><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">The jobs to be performed are:</span><br /><br />\r\n<ul class=\"career-details\" style=\"margin: 0px 0px 0px 2.5em; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline; list-style-image: url(\'http://sangkuriang.co.id/wp-content/themes/holding/images/about-us-ul.png\'); list-style-position: initial; letter-spacing: 0.7px;\">\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Develop web application.</li>\r\n</ul>\r\n<span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Requirements</span><br /><br />\r\n<ul class=\"career-details\" style=\"margin: 0px 0px 0px 2.5em; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline; list-style-image: url(\'http://sangkuriang.co.id/wp-content/themes/holding/images/about-us-ul.png\'); list-style-position: initial; letter-spacing: 0.7px;\">\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Excellent knowledge of PHP5, MySQL, Javascript.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with MySQL relational database.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with Object Oriented Concepts.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with the MVC framework, preferably the Zend Framework.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with javascript framework, preferably jQuery.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with subversion (svn or Git).</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with HTML 5 , CSS3 is a bonus.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Familiar with Unix environment is a bonus.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">High Flexibility and meet Deadlines.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Minimum of 3 years experience for senior position.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Minimum of 1 years experience for intermediate position.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Fresh graduate is welcome for junior position.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Work Location: Bandung (Ready to be placed outside the city).</li>\r\n</ul>\r\n<br /><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Soft Skills</span><br /><br />\r\n<ul class=\"career-details\" style=\"margin: 0px 0px 0px 2.5em; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline; list-style-image: url(\'http://sangkuriang.co.id/wp-content/themes/holding/images/about-us-ul.png\'); list-style-position: initial; letter-spacing: 0.7px;\">\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">High Analytical skills.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Hard Worker.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Able to work overtime.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Open-minded personality.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Able to communicate clearly.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Friendly and Easy going.</li>\r\n<li style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Able to adapt to our work Environment.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div id=\"row2-career\" style=\"font-size: 14.666666984558105px; background-color: #4d4039; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #404040; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; line-height: 21px;\">\r\n<div id=\"career-footer\" style=\"margin: 0px; padding: 50px 0px 0px 8.5em; border: 0px; font: inherit; vertical-align: baseline; font-family: pt_sansregular, arial, tahoma; color: #ffffff; line-height: 1.2em; text-shadow: #2e2826 0px 1px; width: 960px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">If you are interested, please send your CV and portfolio to:&nbsp;<a style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline; text-decoration: initial; color: #b66f48; text-shadow: #0e0e0e 0px 1px;\" href=\"mailto:hr@sangkuriang.co.id\">hr@sangkuriang.co.id</a></span><br /><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">Be sure to include the position and your contact number</span><br /><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 14.666666984558105px; font: inherit; vertical-align: baseline;\">We are looking forward to see you.</span></div>\r\n</div>','Web Developer,PHP,MYSQL,Zend Framework','egisolehhasdi','2013-01-12 08:38:02',NULL,NULL);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `status` enum('archived','draft','pending','publish') COLLATE utf8_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Lebih baik banyak bicara atau banyak bicara ???','<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\"><strong>T:</strong>&nbsp;Ibu Ainy, mana yang lebih baik, sedikit atau banyak bicara? Bagaimana cara berkomunikasi lebih menyenangkan kepada pembeli di toko saya? Sejauhmana kita perlu berbicara, apakah perlu atau tidak kita berbicara terlalu banyak mengenai berbagai topik dengan pembeli di toko yang saya miliki?<em>(Dorika, 37)</em></p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\"><strong>J:</strong>&nbsp;Mbak Dorika yang luar biasa,<br />Senangnya mengetahui Mbak memiliki toko sendiri. Selamat ya Mbak. Sebagai pemilik toko, tentu Anda ingin memberikan yang terbaik. Itulah sebabnya Anda berusaha berbicara dengan pembeli tentang berbagai topik.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Pertanyaannya, mana yang lebih baik, banyak bicara dengan klien tentang berbagai topic atau sedikit bicara? Sebenarnya, tidak ada yang salah dengan banyak bicara atau pun sedikit bicara. Karena semuanya bergantung pada kondisi. Khususnya kondisi pembeli.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Ada pembeli yang senang ketika pemilik tokonya banyak bicara. Namun Ada juga pembeli yang lebih suka jika sang pemilik toko tidak banyak bicara. Lalu, bagaimana cara menyikapinya?</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Pertama, kenali kondisi pembeli. Apakah ia tipe pembeli yang senang diajak banyak bicara atau sebaliknya. Caranya? Sapalah dengan ramah pembeli tersebut. Lihatlah reaksinya, apakah pembeli nampak senang dengan sapaan Anda yang ramah itu, atau biasa-biasa saja.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Jika wajahnya nampak biasa-biasa saja atau bahkan dalam kondisi terburu-buru, ini pertanda bahwa sang pembeli sedang dalam kondisi tidak ingin banyak bicara. Untuk menghadapi pembeli yang sedang tidak ingin banyak bicara, Anda sebaiknya tidak banyak bicara, tetapi tetap tersenyum tulus. Karena tersenyum tulus ini memberikan banyak arti, khususnya mengajak sang pembeli untuk merasakan keramahan Anda yang sepenuh hati.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Lalu bagaimana jika sang pembeli nampak senang dengan sapaan Anda yang ramah? Ini berarti Anda bisa melanjutkan obrolan Anda ke tahap kedua.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Tahap kedua, bicarakan hal yang berhubungan dengan &lsquo;barang&rsquo; yang dibutuhkan pembeli tersebut. Anda bisa membicarakan manfaat &lsquo;barang&rsquo; yang akan dibeli pembeli tersebut berikut pengalaman orang lain yang telah membelinya. Jika Anda juga pernah menggunakan alat tersebut, ceritakanlah. Karena pengalaman Anda menambah informasi sekaligus keyakinan pembeli akan manfaatnya. Jangan lupa berbagi tips berkaitan dengan barang tersebut.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Ketiga, selalu ucapkan terima kasih dengan tulus pada setiap pembeli. Ucapan terima kasih yang tulus ini adalah jembatan Anda dalam membina hubungan yang baik dengan pembeli sekaligus memberikan pelayanan yang terbaik, penuh ketulusan.</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Selamat melangkah, ya!</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">Ainy Fauziyah, CPC<br />Leadership Motivator &amp; Coach<br />Penulis Buku Best Seller &lsquo;Dahsyatnya Kemauan&rsquo;</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin-top: 0px; line-height: 20px; color: #5d5d5d; font-family: \'Lucida Grande\', Arial; font-size: 14px;\">editor : Egi Soleh Hasdi</p>','egisolehhasdi','2013-01-07 13:56:39',0,'draft'),(6,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:34',0,'archived'),(7,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:34',0,'archived'),(8,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:34',0,'archived'),(9,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:35',0,'archived'),(10,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:35',0,'publish'),(11,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:35',0,'publish'),(12,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:35',0,'publish'),(13,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:35',0,'publish'),(14,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:36',0,'publish'),(15,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:36',0,'publish'),(16,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:36',0,'publish'),(17,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:36',0,'publish'),(18,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:37',0,'publish'),(19,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:37',0,'publish'),(20,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:37',0,'publish'),(21,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:37',0,'publish'),(22,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:37',0,'publish'),(23,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:38',0,'publish'),(24,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:38',0,'publish'),(25,'Lorem Ipsum dolor','Lorem ipsum dolor sit amet, the quick brown fox jumps over the lazy dog','egisolehhasdi','2013-01-07 23:36:38',0,'publish'),(26,'Seorang wanita terlindas truk kontainer','<p>$status = Admin_Model_Status::ARCHIVED;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; if (isset($data[\'submit\'])) {</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $status = Admin_Model_Status::PUBLISH;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; } else if (isset($data[\'draft\'])) {</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $status = Admin_Model_Status::DRAFT;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; }</p>','wildanfm','2013-01-08 11:26:56',0,'publish');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`),
  CONSTRAINT `poll_answer_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll_question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_question`
--

DROP TABLE IF EXISTS `poll_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_question`
--

LOCK TABLES `poll_question` WRITE;
/*!40000 ALTER TABLE `poll_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('Dolor',2),('Ipsum',2),('Jumps Over',1),('Lorem Ipsum DOlor',2),('MYSQL',1),('Pemrogramman',2),('PHP',1),('Sit Amet',1),('The Quick Brown Fox',2),('Web Developer',1),('Zend Framework',1);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `role` enum('siswa','osis','guru','admin') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('egisolehhasdi','d0340104388b8c53cba242fd27909129','Egi Soleh Hasdi','asdf_1357406774.jpg','egi.hasdi@sangkuriang.co.id','Hello World :)','admin'),('jvthaashaar','jvthaashaar',NULL,NULL,NULL,NULL,'admin'),('miksan','ae2b1fca515949e5d54fb22b8ed95575','Muhammad Iksan','Affandi_1357479829.jpg','m.iksan@sangkuriang.co.id','Hello Namaku iksan :)','osis'),('wildanfm','9146d26348bfbc4526082192095916c8',NULL,NULL,NULL,NULL,'osis');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-12 19:16:54
