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
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (191,'egisolehhasdi','admin','log','index','2013-01-15 06:43:59'),(192,'egisolehhasdi','admin','log','index','2013-01-15 06:44:03'),(193,'egisolehhasdi','admin','article','index','2013-01-15 06:44:21'),(194,'egisolehhasdi','admin','news','index','2013-01-15 06:44:24'),(195,'egisolehhasdi','admin','event','index','2013-01-15 06:44:27'),(196,'egisolehhasdi','admin','polling','index','2013-01-15 06:44:30'),(197,'egisolehhasdi','admin','jobs','index','2013-01-15 06:44:34'),(198,'egisolehhasdi','admin','prakerin','index','2013-01-15 06:44:36'),(199,'egisolehhasdi','admin','jobs','index','2013-01-15 06:44:42'),(200,'egisolehhasdi','admin','log','index','2013-01-15 06:44:46'),(201,'egisolehhasdi','admin','log','index','2013-01-15 06:44:52'),(202,'egisolehhasdi','admin','log','index','2013-01-15 06:45:07'),(203,'egisolehhasdi','admin','log','index','2013-01-15 06:45:12'),(204,'egisolehhasdi','admin','jobs','index','2013-01-15 06:46:26'),(205,'egisolehhasdi','admin','article','index','2013-01-15 06:46:32'),(206,'egisolehhasdi','admin','account','index','2013-01-15 06:46:53'),(207,'egisolehhasdi','admin','log','index','2013-01-15 06:47:13'),(208,'egisolehhasdi','admin','article','index','2013-01-15 06:48:52'),(209,'egisolehhasdi','admin','prakerin','index','2013-01-15 06:51:40'),(210,'egisolehhasdi','admin','article','index','2013-01-15 06:51:46'),(211,'egisolehhasdi','admin','article','index','2013-01-15 06:52:12'),(212,'egisolehhasdi','admin','log','index','2013-01-15 06:52:31'),(213,'egisolehhasdi','admin','account','index','2013-01-15 13:06:07'),(214,'egisolehhasdi','admin','account','delete','2013-01-15 13:06:14'),(215,'egisolehhasdi','admin','account','index','2013-01-15 13:06:16'),(216,'egisolehhasdi','admin','account','edit','2013-01-15 13:06:24'),(217,'egisolehhasdi','admin','account','index','2013-01-15 13:06:39'),(218,'egisolehhasdi','admin','article','index','2013-01-15 13:07:59'),(219,'egisolehhasdi','admin','news','index','2013-01-15 13:08:03'),(220,'egisolehhasdi','admin','article','index','2013-01-15 13:08:49'),(221,'egisolehhasdi','admin','log','index','2013-01-15 13:08:53'),(222,'egisolehhasdi','admin','index','index','2013-01-17 20:31:14'),(223,'egisolehhasdi','admin','account','index','2013-01-17 20:31:23'),(224,'egisolehhasdi','admin','log','index','2013-01-17 20:31:33'),(225,'egisolehhasdi','admin','jobs','index','2013-01-17 20:31:39'),(226,'egisolehhasdi','admin','polling','index','2013-01-17 20:31:44'),(227,'egisolehhasdi','admin','log','index','2013-01-17 20:35:03'),(228,'egisolehhasdi','admin','log','index','2013-01-17 20:36:21'),(229,'egisolehhasdi','admin','log','index','2013-01-17 20:36:36'),(230,'egisolehhasdi','admin','log','index','2013-01-17 20:36:46'),(231,'egisolehhasdi','admin','log','index','2013-01-17 20:38:03'),(232,'egisolehhasdi','default','error','error','2013-01-17 20:38:03'),(233,'egisolehhasdi','admin','log','index','2013-01-17 20:40:56'),(234,'egisolehhasdi','admin','log','index','2013-01-17 20:42:20'),(235,'egisolehhasdi','admin','log','index','2013-01-17 20:42:25'),(236,'egisolehhasdi','admin','log','index','2013-01-17 20:42:43'),(237,'egisolehhasdi','admin','log','index','2013-01-17 20:43:18'),(238,'egisolehhasdi','default','error','error','2013-01-17 20:43:18'),(239,'egisolehhasdi','admin','log','index','2013-01-17 20:43:26'),(240,'egisolehhasdi','admin','log','index','2013-01-17 20:43:31'),(241,'egisolehhasdi','admin','log','index','2013-01-17 20:43:48'),(242,'egisolehhasdi','admin','log','index','2013-01-17 20:43:52'),(243,'egisolehhasdi','admin','log','index','2013-01-17 20:44:39'),(244,'egisolehhasdi','admin','log','index','2013-01-17 20:44:50'),(245,'egisolehhasdi','admin','log','index','2013-01-17 20:45:07'),(246,'egisolehhasdi','admin','log','index','2013-01-17 20:45:20'),(247,'egisolehhasdi','admin','log','index','2013-01-17 20:45:58'),(248,'egisolehhasdi','admin','log','index','2013-01-17 20:46:06'),(249,'egisolehhasdi','admin','log','index','2013-01-17 20:46:10'),(250,'egisolehhasdi','admin','log','index','2013-01-17 20:46:14'),(251,'egisolehhasdi','admin','log','index','2013-01-17 20:46:20'),(252,'egisolehhasdi','admin','log','index','2013-01-17 20:46:23'),(253,'egisolehhasdi','admin','log','index','2013-01-17 20:46:29'),(254,'egisolehhasdi','admin','log','index','2013-01-17 20:46:35'),(255,'egisolehhasdi','admin','news','index','2013-01-17 20:47:10'),(256,'egisolehhasdi','admin','article','index','2013-01-17 20:47:12'),(257,'egisolehhasdi','admin','article','edit','2013-01-17 20:53:25'),(258,'egisolehhasdi','admin','tag','get','2013-01-17 20:53:27'),(259,'egisolehhasdi','admin','article','index','2013-01-17 20:53:38'),(260,'egisolehhasdi','admin','article','index','2013-01-17 20:54:14'),(261,'egisolehhasdi','admin','article','index','2013-01-17 20:54:34'),(262,'egisolehhasdi','admin','article','create','2013-01-17 20:57:05'),(263,'egisolehhasdi','admin','tag','get','2013-01-17 20:57:08'),(264,'egisolehhasdi','admin','article','index','2013-01-17 20:57:37'),(265,'egisolehhasdi','admin','article','index','2013-01-17 20:57:43'),(266,'egisolehhasdi','admin','article','index','2013-01-17 20:57:56'),(267,'egisolehhasdi','admin','article','index','2013-01-17 20:58:06'),(268,'egisolehhasdi','admin','article','index','2013-01-17 20:58:41'),(269,'egisolehhasdi','admin','article','index','2013-01-17 20:58:53'),(270,'egisolehhasdi','admin','article','index','2013-01-17 20:59:02'),(271,'egisolehhasdi','admin','news','index','2013-01-17 20:59:13'),(272,'egisolehhasdi','admin','news','create','2013-01-17 20:59:16'),(273,'egisolehhasdi','admin','news','index','2013-01-17 20:59:39'),(274,'egisolehhasdi','admin','news','index','2013-01-17 21:00:35'),(275,'egisolehhasdi','admin','news','index','2013-01-17 21:01:15'),(276,'egisolehhasdi','admin','event','index','2013-01-17 21:02:35'),(277,'egisolehhasdi','admin','polling','index','2013-01-17 21:03:12'),(278,'egisolehhasdi','admin','polling','create','2013-01-17 21:03:20'),(279,'egisolehhasdi','admin','polling','create','2013-01-17 21:04:37'),(280,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:16'),(281,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:24'),(282,'egisolehhasdi','admin','polling','create','2013-01-17 21:05:52'),(283,'egisolehhasdi','admin','polling','create','2013-01-17 21:06:23'),(284,'egisolehhasdi','admin','polling','create','2013-01-17 21:06:43'),(285,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:11'),(286,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:16'),(287,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:52'),(288,'egisolehhasdi','admin','polling','create','2013-01-17 21:07:55'),(289,'egisolehhasdi','admin','polling','create','2013-01-17 21:08:08'),(290,'egisolehhasdi','admin','polling','create','2013-01-17 21:08:14'),(291,'egisolehhasdi','admin','polling','create','2013-01-17 21:09:41'),(292,'egisolehhasdi','admin','polling','index','2013-01-17 21:09:56'),(293,'egisolehhasdi','admin','event','index','2013-01-17 21:10:01'),(294,'egisolehhasdi','admin','account','index','2013-01-17 21:10:07'),(295,'egisolehhasdi','admin','log','index','2013-01-17 21:10:18'),(296,'egisolehhasdi','admin','article','index','2013-01-17 21:10:30'),(297,'egisolehhasdi','admin','article','index','2013-01-17 21:10:52'),(298,'egisolehhasdi','admin','news','index','2013-01-17 21:12:41'),(299,'egisolehhasdi','admin','event','index','2013-01-17 21:12:47'),(300,'egisolehhasdi','admin','polling','index','2013-01-17 21:12:51'),(301,'egisolehhasdi','admin','article','index','2013-01-17 21:13:32'),(302,'egisolehhasdi','admin','news','index','2013-01-17 21:13:53'),(303,'egisolehhasdi','admin','article','index','2013-01-17 21:22:52'),(304,'egisolehhasdi','admin','jobs','index','2013-01-17 21:26:06'),(305,'egisolehhasdi','admin','article','index','2013-01-17 21:26:11'),(306,'egisolehhasdi','admin','news','index','2013-01-17 21:26:12'),(307,'egisolehhasdi','admin','event','index','2013-01-17 21:26:51'),(308,'egisolehhasdi','admin','article','index','2013-01-17 21:26:56'),(309,'egisolehhasdi','admin','polling','index','2013-01-17 21:27:07'),(310,'egisolehhasdi','admin','account','index','2013-01-17 21:27:15'),(311,'egisolehhasdi','admin','user','setting','2013-01-17 21:27:35'),(312,'egisolehhasdi','default','index','index','2013-01-17 21:27:44'),(313,'egisolehhasdi','default','error','error','2013-01-17 21:27:45'),(314,'egisolehhasdi','admin','user','setting','2013-01-17 21:27:48'),(315,'egisolehhasdi','admin','article','index','2013-01-17 21:27:52'),(316,'egisolehhasdi','admin','article','index','2013-01-17 21:30:04'),(317,'egisolehhasdi','admin','news','index','2013-01-17 21:30:08'),(318,'egisolehhasdi','admin','news','index','2013-01-17 21:30:12'),(319,'egisolehhasdi','admin','event','index','2013-01-17 21:30:13'),(320,'egisolehhasdi','admin','account','index','2013-01-17 21:30:25'),(321,'egisolehhasdi','admin','log','index','2013-01-17 21:30:34'),(322,'egisolehhasdi','admin','article','index','2013-01-17 21:30:51'),(323,'egisolehhasdi','admin','article','create','2013-01-17 21:30:53'),(324,'egisolehhasdi','admin','tag','get','2013-01-17 21:30:55'),(325,'egisolehhasdi','admin','news','index','2013-01-17 21:31:16'),(326,'egisolehhasdi','admin','event','index','2013-01-17 21:31:26'),(327,'egisolehhasdi','admin','polling','index','2013-01-17 21:31:36'),(328,'egisolehhasdi','admin','polling','index','2013-01-17 21:32:18'),(329,'egisolehhasdi','admin','article','index','2013-01-17 21:32:22'),(330,'egisolehhasdi','admin','news','index','2013-01-17 21:32:25'),(331,'egisolehhasdi','admin','event','index','2013-01-17 21:32:29'),(332,'egisolehhasdi','admin','polling','index','2013-01-17 21:32:34'),(333,'egisolehhasdi','admin','article','index','2013-01-17 21:32:43'),(334,'egisolehhasdi','admin','log','index','2013-01-17 21:34:07');
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

-- Dump completed on 2013-01-18 20:55:49
