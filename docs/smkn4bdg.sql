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
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `approved_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `status` enum('archived','draft','pending','publish') COLLATE utf8_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`),
  CONSTRAINT `article_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,'Lorem Ipsum Dolor Sit Amet','<p>Lorem Ipsum dolor sit amet, The quick brown fox jumps over the lazy dog.</p>','CSS3,HTML5','egisolehhasdi','2013-01-17 20:57:35',NULL,NULL,NULL,NULL,0,'draft');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
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
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (191,'egisolehhasdi','admin','log','index','2013-01-15 06:43:59'),(192,'egisolehhasdi','admin','log','index','2013-01-15 06:44:03'),(193,'egisolehhasdi','admin','article','index','2013-01-15 06:44:21'),(194,'egisolehhasdi','admin','news','index','2013-01-15 06:44:24'),(195,'egisolehhasdi','admin','event','index','2013-01-15 06:44:27'),(196,'egisolehhasdi','admin','polling','index','2013-01-15 06:44:30'),(197,'egisolehhasdi','admin','jobs','index','2013-01-15 06:44:34'),(198,'egisolehhasdi','admin','prakerin','index','2013-01-15 06:44:36'),(199,'egisolehhasdi','admin','jobs','index','2013-01-15 06:44:42'),(200,'egisolehhasdi','admin','log','index','2013-01-15 06:44:46'),(201,'egisolehhasdi','admin','log','index','2013-01-15 06:44:52'),(202,'egisolehhasdi','admin','log','index','2013-01-15 06:45:07'),(203,'egisolehhasdi','admin','log','index','2013-01-15 06:45:12'),(204,'egisolehhasdi','admin','jobs','index','2013-01-15 06:46:26'),(205,'egisolehhasdi','admin','article','index','2013-01-15 06:46:32'),(206,'egisolehhasdi','admin','account','index','2013-01-15 06:46:53'),(207,'egisolehhasdi','admin','log','index','2013-01-15 06:47:13'),(208,'egisolehhasdi','admin','article','index','2013-01-15 06:48:52'),(209,'egisolehhasdi','admin','prakerin','index','2013-01-15 06:51:40'),(210,'egisolehhasdi','admin','article','index','2013-01-15 06:51:46'),(211,'egisolehhasdi','admin','article','index','2013-01-15 06:52:12'),(212,'egisolehhasdi','admin','log','index','2013-01-15 06:52:31'),(213,'egisolehhasdi','admin','account','index','2013-01-15 13:06:07'),(214,'egisolehhasdi','admin','account','delete','2013-01-15 13:06:14'),(215,'egisolehhasdi','admin','account','index','2013-01-15 13:06:16'),(216,'egisolehhasdi','admin','account','edit','2013-01-15 13:06:24'),(217,'egisolehhasdi','admin','account','index','2013-01-15 13:06:39'),(218,'egisolehhasdi','admin','article','index','2013-01-15 13:07:59'),(219,'egisolehhasdi','admin','news','index','2013-01-15 13:08:03'),(220,'egisolehhasdi','admin','article','index','2013-01-15 13:08:49'),(221,'egisolehhasdi','admin','log','index','2013-01-15 13:08:53'),(222,'egisolehhasdi','admin','index','index','2013-01-17 20:31:14'),(223,'egisolehhasdi','admin','account','index','2013-01-17 20:31:23'),(224,'egisolehhasdi','admin','log','index','2013-01-17 20:31:33'),(225,'egisolehhasdi','admin','jobs','index','2013-01-17 20:31:39'),(226,'egisolehhasdi','admin','polling','index','2013-01-17 20:31:44'),(227,'egisolehhasdi','admin','log','index','2013-01-17 20:35:03'),(228,'egisolehhasdi','admin','log','index','2013-01-17 20:36:21'),(229,'egisolehhasdi','admin','log','index','2013-01-17 20:36:36'),(230,'egisolehhasdi','admin','log','index','2013-01-17 20:36:46'),(231,'egisolehhasdi','admin','log','index','2013-01-17 20:38:03'),(232,'egisolehhasdi','default','error','error','2013-01-17 20:38:03'),(233,'egisolehhasdi','admin','log','index','2013-01-17 20:40:56'),(234,'egisolehhasdi','admin','log','index','2013-01-17 20:42:20'),(235,'egisolehhasdi','admin','log','index','2013-01-17 20:42:25'),(236,'egisolehhasdi','admin','log','index','2013-01-17 20:42:43'),(237,'egisolehhasdi','admin','log','index','2013-01-17 20:43:18'),(238,'egisolehhasdi','default','error','error','2013-01-17 20:43:18'),(239,'egisolehhasdi','admin','log','index','2013-01-17 20:43:26'),(240,'egisolehhasdi','admin','log','index','2013-01-17 20:43:31'),(241,'egisolehhasdi','admin','log','index','2013-01-17 20:43:48'),(242,'egisolehhasdi','admin','log','index','2013-01-17 20:43:52'),(243,'egisolehhasdi','admin','log','index','2013-01-17 20:44:39'),(244,'egisolehhasdi','admin','log','index','2013-01-17 20:44:50'),(245,'egisolehhasdi','admin','log','index','2013-01-17 20:45:07'),(246,'egisolehhasdi','admin','log','index','2013-01-17 20:45:20'),(247,'egisolehhasdi','admin','log','index','2013-01-17 20:45:58'),(248,'egisolehhasdi','admin','log','index','2013-01-17 20:46:06'),(249,'egisolehhasdi','admin','log','index','2013-01-17 20:46:10'),(250,'egisolehhasdi','admin','log','index','2013-01-17 20:46:14'),(251,'egisolehhasdi','admin','log','index','2013-01-17 20:46:20'),(252,'egisolehhasdi','admin','log','index','2013-01-17 20:46:23'),(253,'egisolehhasdi','admin','log','index','2013-01-17 20:46:29'),(254,'egisolehhasdi','admin','log','index','2013-01-17 20:46:35'),(255,'egisolehhasdi','admin','news','index','2013-01-17 20:47:10'),(256,'egisolehhasdi','admin','article','index','2013-01-17 20:47:12'),(257,'egisolehhasdi','admin','article','edit','2013-01-17 20:53:25'),(258,'egisolehhasdi','admin','tag','get','2013-01-17 20:53:27'),(259,'egisolehhasdi','admin','article','index','2013-01-17 20:53:38'),(260,'egisolehhasdi','admin','article','index','2013-01-17 20:54:14'),(261,'egisolehhasdi','admin','article','index','2013-01-17 20:54:34'),(262,'egisolehhasdi','admin','article','create','2013-01-17 20:57:05'),(263,'egisolehhasdi','admin','tag','get','2013-01-17 20:57:08'),(264,'egisolehhasdi','admin','article','index','2013-01-17 20:57:37'),(265,'egisolehhasdi','admin','article','index','2013-01-17 20:57:43'),(266,'egisolehhasdi','admin','article','index','2013-01-17 20:57:56'),(267,'egisolehhasdi','admin','article','index','2013-01-17 20:58:06'),(268,'egisolehhasdi','admin','article','index','2013-01-17 20:58:41'),(269,'egisolehhasdi','admin','article','index','2013-01-17 20:58:53'),(270,'egisolehhasdi','admin','article','index','2013-01-17 20:59:02'),(271,'egisolehhasdi','admin','news','index','2013-01-17 20:59:13'),(272,'egisolehhasdi','admin','news','create','2013-01-17 20:59:16'),(273,'egisolehhasdi','admin','news','index','2013-01-17 20:59:39'),(274,'egisolehhasdi','admin','news','index','2013-01-17 21:00:35'),(275,'egisolehhasdi','admin','news','index','2013-01-17 21:01:15'),(276,'egisolehhasdi','admin','event','index','2013-01-17 21:02:35'),(277,'egisolehhasdi','admin','polling','index','2013-01-17 21:03:12'),(278,'egisolehhasdi','admin','polling','create','2013-01-17 21:03:20'),(279,'egisolehhasdi','admin','polling','create','2013-01-17 21:04:37'),(280,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:16'),(281,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:24'),(282,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:52'),(283,'egisolehhasdi','admin','polling','create','2013-01-17 21:06:23'),(284,'egisolehhasdi','admin','polling','create','2013-01-17 21:06:43'),(285,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:11'),(286,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:16'),(287,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:52'),(288,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:55'),(289,'egisolehhasdi','admin','polling','create','2013-01-17 21:08:08'),(290,'egisolehhasdi','admin','polling','create','2013-01-17 21:08:14'),(291,'egisolehhasdi','admin','polling','create','2013-01-17 21:09:41'),(292,'egisolehhasdi','admin','polling','index','2013-01-17 21:09:56'),(293,'egisolehhasdi','admin','event','index','2013-01-17 21:10:01'),(294,'egisolehhasdi','admin','account','index','2013-01-17 21:10:07'),(295,'egisolehhasdi','admin','log','index','2013-01-17 21:10:18'),(296,'egisolehhasdi','admin','article','index','2013-01-17 21:10:30'),(297,'egisolehhasdi','admin','article','index','2013-01-17 21:10:52'),(298,'egisolehhasdi','admin','news','index','2013-01-17 21:12:41'),(299,'egisolehhasdi','admin','event','index','2013-01-17 21:12:47'),(300,'egisolehhasdi','admin','polling','index','2013-01-17 21:12:51'),(301,'egisolehhasdi','admin','article','index','2013-01-17 21:13:32'),(302,'egisolehhasdi','admin','news','index','2013-01-17 21:13:53'),(303,'egisolehhasdi','admin','article','index','2013-01-17 21:22:52'),(304,'egisolehhasdi','admin','jobs','index','2013-01-17 21:26:06'),(305,'egisolehhasdi','admin','article','index','2013-01-17 21:26:11'),(306,'egisolehhasdi','admin','news','index','2013-01-17 21:26:12'),(307,'egisolehhasdi','admin','event','index','2013-01-17 21:26:51'),(308,'egisolehhasdi','admin','article','index','2013-01-17 21:26:56'),(309,'egisolehhasdi','admin','polling','index','2013-01-17 21:27:07'),(310,'egisolehhasdi','admin','account','index','2013-01-17 21:27:15'),(311,'egisolehhasdi','admin','user','setting','2013-01-17 21:27:35'),(312,'egisolehhasdi','default','index','index','2013-01-17 21:27:44'),(313,'egisolehhasdi','default','error','error','2013-01-17 21:27:45'),(314,'egisolehhasdi','admin','user','setting','2013-01-17 21:27:48'),(315,'egisolehhasdi','admin','article','index','2013-01-17 21:27:52'),(316,'egisolehhasdi','admin','article','index','2013-01-17 21:30:04'),(317,'egisolehhasdi','admin','news','index','2013-01-17 21:30:08'),(318,'egisolehhasdi','admin','news','index','2013-01-17 21:30:12'),(319,'egisolehhasdi','admin','event','index','2013-01-17 21:30:13'),(320,'egisolehhasdi','admin','account','index','2013-01-17 21:30:25'),(321,'egisolehhasdi','admin','log','index','2013-01-17 21:30:34'),(322,'egisolehhasdi','admin','article','index','2013-01-17 21:30:51'),(323,'egisolehhasdi','admin','article','create','2013-01-17 21:30:53'),(324,'egisolehhasdi','admin','tag','get','2013-01-17 21:30:55'),(325,'egisolehhasdi','admin','news','index','2013-01-17 21:31:16'),(326,'egisolehhasdi','admin','event','index','2013-01-17 21:31:26'),(327,'egisolehhasdi','admin','polling','index','2013-01-17 21:31:36'),(328,'egisolehhasdi','admin','polling','index','2013-01-17 21:32:18'),(329,'egisolehhasdi','admin','article','index','2013-01-17 21:32:22'),(330,'egisolehhasdi','admin','news','index','2013-01-17 21:32:25'),(331,'egisolehhasdi','admin','event','index','2013-01-17 21:32:29'),(332,'egisolehhasdi','admin','polling','index','2013-01-17 21:32:34'),(333,'egisolehhasdi','admin','article','index','2013-01-17 21:32:43'),(334,'egisolehhasdi','admin','log','index','2013-01-17 21:34:07'),(335,'egisolehhasdi','admin','index','index','2013-01-19 11:54:55'),(336,'egisolehhasdi','admin','prakerin','index','2013-01-19 11:55:25'),(337,'egisolehhasdi','admin','prakerin','index','2013-01-19 11:55:49'),(338,'egisolehhasdi','admin','prakerin','index','2013-01-19 11:56:23'),(339,'egisolehhasdi','admin','prakerin','index','2013-01-19 11:58:42'),(340,'egisolehhasdi','default','error','error','2013-01-19 11:58:44'),(341,'egisolehhasdi','admin','prakerin','index','2013-01-19 11:58:49'),(342,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:01:23'),(343,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:01:59'),(344,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:02:39'),(345,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:02:52'),(346,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:03:05'),(347,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:03:17'),(348,'egisolehhasdi','admin','prakerin','index','2013-01-19 12:04:23'),(349,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:05:22'),(350,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:09:03'),(351,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:11:44'),(352,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:11:59'),(353,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:12:26'),(354,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:12:32'),(355,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:13:04'),(356,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:13:19'),(357,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:13:38'),(358,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:13:43'),(359,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:14:02'),(360,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:14:19'),(361,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:14:39'),(362,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:14:48'),(363,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:15:58'),(364,'egisolehhasdi','admin','prakerin','index','2013-01-19 13:16:05'),(365,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:04:02'),(366,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:04:33'),(367,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:04:39'),(368,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:04:44'),(369,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:12:13'),(370,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:13:45'),(371,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:14:53'),(372,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:15:42'),(373,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:17:37'),(374,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:18:15'),(375,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:19:03'),(376,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:20:20'),(377,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:20:46'),(378,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:22:29'),(379,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:23:37'),(380,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:23:58'),(381,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:25:00'),(382,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:25:51'),(383,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:27:41'),(384,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:28:06'),(385,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:36:45'),(386,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:37:24'),(387,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:39:43'),(388,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:40:05'),(389,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:42:07'),(390,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:42:59'),(391,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:45:38'),(392,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:46:13'),(393,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:47:38'),(394,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:48:35'),(395,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:53:16'),(396,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:55:42'),(397,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:59:12'),(398,'egisolehhasdi','admin','prakerin','index','2013-01-19 14:59:43'),(399,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:00:27'),(400,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:01:21'),(401,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:08:01'),(402,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:11:37'),(403,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:18:43'),(404,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:20:16'),(405,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:20:35'),(406,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:20:48'),(407,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:23:49'),(408,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:25:56'),(409,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:47:25'),(410,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:47:45'),(411,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:49:16'),(412,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:50:57'),(413,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:52:44'),(414,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:53:44'),(415,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:55:00'),(416,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:55:46'),(417,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:56:14'),(418,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:56:48'),(419,'egisolehhasdi','default','error','error','2013-01-19 15:56:50'),(420,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:56:59'),(421,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:57:11'),(422,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:57:30'),(423,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:57:40'),(424,'egisolehhasdi','default','error','error','2013-01-19 15:57:42'),(425,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:58:10'),(426,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:59:04'),(427,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:59:14'),(428,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:59:21'),(429,'egisolehhasdi','admin','prakerin','index','2013-01-19 15:59:38'),(430,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:00:23'),(431,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:00:39'),(432,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:01:22'),(433,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:02:10'),(434,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:02:24'),(435,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:02:33'),(436,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:03:25'),(437,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:05:13'),(438,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:05:54'),(439,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:07:34'),(440,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:15:17'),(441,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:17:53'),(442,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:19:28'),(443,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:20:40'),(444,'egisolehhasdi','default','error','error','2013-01-19 16:25:18'),(445,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:25:22'),(446,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:25:35'),(447,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:25:44'),(448,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:25:51'),(449,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:30:26'),(450,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:30:39'),(451,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:30:48'),(452,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:32:00'),(453,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:32:07'),(454,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:32:15'),(455,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:32:22'),(456,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:33:06'),(457,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:33:22'),(458,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:34:19'),(459,'egisolehhasdi','admin','prakerin','create','2013-01-19 16:34:37'),(460,'egisolehhasdi','default','error','error','2013-01-19 16:34:39'),(461,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:34:42'),(462,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:36:04'),(463,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:38:08'),(464,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:38:37'),(465,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:39:12'),(466,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:39:37'),(467,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:40:47'),(468,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:41:05'),(469,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:45:58'),(470,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:47:34'),(471,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:48:34'),(472,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:53:14'),(473,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:54:15'),(474,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:58:22'),(475,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:59:02'),(476,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:59:25'),(477,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:59:41'),(478,'egisolehhasdi','admin','prakerin','index','2013-01-19 16:59:46'),(479,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:00:01'),(480,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:00:26'),(481,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:01:10'),(482,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:02:55'),(483,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:03:05'),(484,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:13:03'),(485,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:13:33'),(486,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:13:37'),(487,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:18:33'),(488,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:19:02'),(489,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:19:23'),(490,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:21:56'),(491,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:22:44'),(492,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:22:54'),(493,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:23:36'),(494,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:23:49'),(495,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:33:47'),(496,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:36:15'),(497,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:37:01'),(498,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:38:05'),(499,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:38:18'),(500,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:38:35'),(501,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:39:17'),(502,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:39:23'),(503,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:39:47'),(504,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:40:46'),(505,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:44:24'),(506,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:48:20'),(507,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:48:27'),(508,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:48:39'),(509,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:48:52'),(510,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:49:12'),(511,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:49:45'),(512,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:51:45'),(513,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:51:59'),(514,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:52:22'),(515,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:52:32'),(516,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:52:39'),(517,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:52:52'),(518,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:52:59'),(519,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:53:04'),(520,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:53:15'),(521,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:53:32'),(522,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:53:40'),(523,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:53:43'),(524,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:54:11'),(525,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:54:36'),(526,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:54:46'),(527,'egisolehhasdi','admin','prakerin','index','2013-01-19 17:55:41'),(528,'egisolehhasdi','admin','jobs','index','2013-01-19 18:02:41'),(529,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:05:55'),(530,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:06:20'),(531,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:06:25'),(532,'egisolehhasdi','default','error','error','2013-01-19 18:06:26'),(533,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:06:41'),(534,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:07:19'),(535,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:07:26'),(536,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:08:25'),(537,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:08:30'),(538,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:08:40'),(539,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:09:09'),(540,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:09:14'),(541,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:09:22'),(542,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:11:09'),(543,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:11:13'),(544,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:49:56'),(545,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:51:35'),(546,'egisolehhasdi','default','error','error','2013-01-19 18:51:37'),(547,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:51:54'),(548,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:53:30'),(549,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:54:40'),(550,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:55:12'),(551,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:55:39'),(552,'egisolehhasdi','default','error','error','2013-01-19 18:55:41'),(553,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:56:19'),(554,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:57:45'),(555,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:59:19'),(556,'egisolehhasdi','admin','prakerin','index','2013-01-19 18:59:26'),(557,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:01:22'),(558,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:01:41'),(559,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:02:31'),(560,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:02:36'),(561,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:04:22'),(562,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:04:44'),(563,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:05:41'),(564,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:07:04'),(565,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:07:58'),(566,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:08:18'),(567,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:09:34'),(568,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:11:12'),(569,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:11:52'),(570,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:12:41'),(571,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:13:20'),(572,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:13:42'),(573,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:17:24'),(574,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:18:33'),(575,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:18:45'),(576,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:19:39'),(577,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:21:48'),(578,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:21:57'),(579,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:22:12'),(580,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:24:13'),(581,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:24:20'),(582,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:24:26'),(583,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:24:31'),(584,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:24:35'),(585,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:25:37'),(586,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:25:41'),(587,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:25:43'),(588,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:25:50'),(589,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:26:15'),(590,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:27:17'),(591,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:27:32'),(592,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:27:52'),(593,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:28:33'),(594,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:30:16'),(595,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:34:25'),(596,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:37:42'),(597,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:37:45'),(598,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:38:15'),(599,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:45:57'),(600,'egisolehhasdi','default','error','error','2013-01-19 19:46:13'),(601,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:46:20'),(602,'egisolehhasdi','default','error','error','2013-01-19 19:47:02'),(603,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:47:57'),(604,'egisolehhasdi','default','error','error','2013-01-19 19:48:10'),(605,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:49:29'),(606,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:49:40'),(607,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:50:31'),(608,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:50:45'),(609,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:51:43'),(610,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:51:53'),(611,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:52:30'),(612,'egisolehhasdi','default','error','error','2013-01-19 19:52:58'),(613,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:53:02'),(614,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:53:20'),(615,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:54:21'),(616,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:54:31'),(617,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:54:45'),(618,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:56:51'),(619,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:57:13'),(620,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:58:49'),(621,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:59:05'),(622,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:59:15'),(623,'egisolehhasdi','admin','prakerin','create','2013-01-19 19:59:38'),(624,'egisolehhasdi','admin','prakerin','index','2013-01-19 19:59:54'),(625,'egisolehhasdi','admin','prakerin','index','2013-01-19 20:02:22'),(626,'egisolehhasdi','admin','prakerin','create','2013-01-19 20:02:25'),(627,'egisolehhasdi','admin','prakerin','index','2013-01-19 20:02:43'),(628,'egisolehhasdi','admin','prakerin','index','2013-01-19 20:03:24');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `approved_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `status` enum('archived','draft','pending','publish') COLLATE utf8_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Lorem Ipsum Dolor Sit Amet','<p>Lorem Ipsum dolor sit amet, The quick brown fox jumps over the lazy dog</p>','egisolehhasdi','2013-01-17 20:59:37',NULL,NULL,NULL,NULL,0,'publish');
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
-- Table structure for table `prakerin`
--

DROP TABLE IF EXISTS `prakerin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prakerin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `prakerin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prakerin_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prakerin`
--

LOCK TABLES `prakerin` WRITE;
/*!40000 ALTER TABLE `prakerin` DISABLE KEYS */;
/*!40000 ALTER TABLE `prakerin` ENABLE KEYS */;
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
INSERT INTO `tag` VALUES ('',1),('CSS3',2),('Dolor',2),('HTML5',2),('Ipsum',2),('Jumps Over',1),('Lorem Ipsum DOlor',2),('MYSQL',1),('Pemrogramman',2),('PHP',2),('Sit Amet',1),('The Quick Brown Fox',2),('Web Developer',2),('Zend Framework',2);
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
INSERT INTO `user` VALUES ('egisolehhasdi','02045b2d50c0b377db4e4f66eee5b1e4','Egi Soleh Hasdi','asdf_1358049442.jpg','egi.hasdi@sangkuriang.co.id','Hello world, Lorem ipsum dolor sit amet :)','admin'),('jvthaashaar','d63d82fce1036237bfdcef362360b18c',NULL,NULL,NULL,NULL,'admin'),('wildanfath15','70df79a831a068bf314e1962f113aafa',NULL,NULL,NULL,NULL,'admin');
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

-- Dump completed on 2013-01-19 20:04:51
