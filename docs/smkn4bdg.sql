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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1379 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (671,'egisolehhasdi','admin','log','index','2013-01-20 13:38:37'),(672,'egisolehhasdi','admin','user','index','2013-01-20 13:39:26'),(673,'egisolehhasdi','admin','account','index','2013-01-20 13:39:31'),(674,'egisolehhasdi','admin','account','create','2013-01-20 13:39:41'),(675,'egisolehhasdi','admin','index','index','2013-01-20 18:37:46'),(676,'egisolehhasdi','admin','news','index','2013-01-20 18:37:52'),(677,'egisolehhasdi','admin','news','create','2013-01-20 18:37:55'),(678,'egisolehhasdi','admin','news','index','2013-01-20 18:38:00'),(679,'egisolehhasdi','admin','news','edit','2013-01-20 18:38:07'),(680,'egisolehhasdi','admin','news','index','2013-01-20 18:38:34'),(681,'egisolehhasdi','admin','account','index','2013-01-20 18:46:17'),(682,'egisolehhasdi','admin','prakerin','index','2013-01-20 18:46:17'),(683,'egisolehhasdi','admin','prakerin','index','2013-01-20 18:51:24'),(684,'egisolehhasdi','admin','prakerin','create','2013-01-20 18:51:27'),(685,'egisolehhasdi','admin','index','index','2013-01-21 13:47:26'),(686,'egisolehhasdi','admin','index','index','2013-01-21 13:47:59'),(687,'egisolehhasdi','admin','article','index','2013-01-21 13:48:23'),(688,'egisolehhasdi','admin','article','index','2013-01-21 13:48:48'),(689,'egisolehhasdi','default','index','index','2013-01-21 13:48:49'),(690,'egisolehhasdi','default','error','error','2013-01-21 13:48:51'),(691,'egisolehhasdi','admin','index','index','2013-01-21 13:48:53'),(692,'egisolehhasdi','default','index','index','2013-01-21 13:56:57'),(693,'egisolehhasdi','default','index','index','2013-01-21 13:56:59'),(694,'egisolehhasdi','default','error','error','2013-01-21 13:57:00'),(695,'egisolehhasdi','default','index','index','2013-01-21 13:57:06'),(696,'egisolehhasdi','default','error','error','2013-01-21 13:57:08'),(697,'egisolehhasdi','default','index','index','2013-01-21 13:58:12'),(698,'egisolehhasdi','default','error','error','2013-01-21 13:58:14'),(699,'egisolehhasdi','default','index','index','2013-01-21 13:58:33'),(700,'egisolehhasdi','default','error','error','2013-01-21 13:58:35'),(701,'egisolehhasdi','default','index','index','2013-01-21 13:58:41'),(702,'egisolehhasdi','default','error','error','2013-01-21 13:58:43'),(703,'egisolehhasdi','default','index','index','2013-01-21 13:59:53'),(704,'egisolehhasdi','default','error','error','2013-01-21 13:59:55'),(705,'egisolehhasdi','default','index','index','2013-01-21 14:00:24'),(706,'egisolehhasdi','default','error','error','2013-01-21 14:00:25'),(707,'egisolehhasdi','default','index','index','2013-01-21 14:01:59'),(708,'egisolehhasdi','default','error','error','2013-01-21 14:02:01'),(709,'egisolehhasdi','admin','index','index','2013-01-21 14:02:41'),(710,'egisolehhasdi','admin','index','index','2013-01-21 14:04:05'),(711,'egisolehhasdi','admin','index','index','2013-01-21 14:04:17'),(712,'egisolehhasdi','admin','index','index','2013-01-21 14:04:22'),(713,'egisolehhasdi','default','error','error','2013-01-21 14:04:23'),(714,'egisolehhasdi','admin','index','index','2013-01-21 14:04:25'),(715,'egisolehhasdi','admin','index','index','2013-01-21 14:04:45'),(716,'egisolehhasdi','admin','index','index','2013-01-21 14:11:11'),(717,'egisolehhasdi','admin','index','index','2013-01-21 14:11:56'),(718,'egisolehhasdi','admin','index','index','2013-01-21 14:12:19'),(719,'egisolehhasdi','admin','index','index','2013-01-21 14:17:35'),(720,'egisolehhasdi','admin','index','index','2013-01-21 14:22:07'),(721,'egisolehhasdi','admin','index','index','2013-01-21 14:22:34'),(722,'egisolehhasdi','admin','index','index','2013-01-21 14:24:08'),(723,'egisolehhasdi','admin','index','index','2013-01-21 14:26:01'),(724,'egisolehhasdi','admin','index','index','2013-01-21 14:27:17'),(725,'egisolehhasdi','default','error','error','2013-01-21 14:27:18'),(726,'egisolehhasdi','default','error','error','2013-01-21 14:27:18'),(727,'egisolehhasdi','admin','index','index','2013-01-21 14:27:42'),(728,'egisolehhasdi','admin','index','index','2013-01-21 14:29:32'),(729,'egisolehhasdi','admin','article','index','2013-01-21 14:29:38'),(730,'egisolehhasdi','admin','news','index','2013-01-21 14:29:44'),(731,'egisolehhasdi','admin','event','index','2013-01-21 14:29:49'),(732,'egisolehhasdi','admin','article','index','2013-01-21 14:29:58'),(733,'egisolehhasdi','admin','news','index','2013-01-21 14:30:03'),(734,'egisolehhasdi','admin','event','index','2013-01-21 14:30:38'),(735,'egisolehhasdi','admin','article','index','2013-01-21 14:30:52'),(736,'egisolehhasdi','admin','article','index','2013-01-21 14:32:25'),(737,'egisolehhasdi','admin','news','index','2013-01-21 14:32:30'),(738,'egisolehhasdi','admin','index','index','2013-01-21 14:32:34'),(739,'egisolehhasdi','admin','article','index','2013-01-21 14:32:42'),(740,'egisolehhasdi','admin','index','index','2013-01-21 14:32:45'),(741,'egisolehhasdi','admin','index','index','2013-01-21 14:33:07'),(742,'egisolehhasdi','admin','polling','index','2013-01-21 14:33:12'),(743,'egisolehhasdi','admin','article','index','2013-01-21 14:33:18'),(744,'egisolehhasdi','admin','article','index','2013-01-21 14:34:07'),(745,'egisolehhasdi','admin','news','index','2013-01-21 14:34:11'),(746,'egisolehhasdi','admin','news','index','2013-01-21 14:34:44'),(747,'egisolehhasdi','admin','news','index','2013-01-21 14:34:50'),(748,'egisolehhasdi','admin','news','index','2013-01-21 14:35:21'),(749,'egisolehhasdi','admin','news','index','2013-01-21 14:35:36'),(750,'egisolehhasdi','default','error','error','2013-01-21 14:35:36'),(751,'egisolehhasdi','default','error','error','2013-01-21 14:35:37'),(752,'egisolehhasdi','admin','news','index','2013-01-21 14:35:40'),(753,'egisolehhasdi','admin','news','index','2013-01-21 14:35:51'),(754,'egisolehhasdi','admin','news','index','2013-01-21 14:36:16'),(755,'egisolehhasdi','admin','news','index','2013-01-21 14:36:24'),(756,'egisolehhasdi','admin','index','index','2013-01-21 14:36:32'),(757,'egisolehhasdi','admin','index','index','2013-01-21 14:37:00'),(758,'egisolehhasdi','admin','index','index','2013-01-21 14:38:45'),(759,'egisolehhasdi','default','error','error','2013-01-21 14:38:46'),(760,'egisolehhasdi','default','error','error','2013-01-21 14:38:47'),(761,'egisolehhasdi','admin','index','index','2013-01-21 14:39:02'),(762,'egisolehhasdi','admin','event','index','2013-01-21 14:39:10'),(763,'egisolehhasdi','admin','event','index','2013-01-21 14:39:46'),(764,'egisolehhasdi','admin','event','index','2013-01-21 14:40:57'),(765,'egisolehhasdi','admin','event','index','2013-01-21 14:41:05'),(766,'egisolehhasdi','default','error','error','2013-01-21 14:41:05'),(767,'egisolehhasdi','default','error','error','2013-01-21 14:41:06'),(768,'egisolehhasdi','admin','event','index','2013-01-21 14:41:09'),(769,'egisolehhasdi','admin','event','index','2013-01-21 14:44:00'),(770,'egisolehhasdi','admin','event','index','2013-01-21 14:44:16'),(771,'egisolehhasdi','admin','event','index','2013-01-21 14:45:20'),(772,'egisolehhasdi','admin','news','index','2013-01-21 14:45:25'),(773,'egisolehhasdi','admin','article','index','2013-01-21 14:51:55'),(774,'egisolehhasdi','admin','news','index','2013-01-21 14:56:02'),(775,'egisolehhasdi','admin','event','index','2013-01-21 14:56:05'),(776,'egisolehhasdi','admin','article','index','2013-01-21 14:56:09'),(777,'egisolehhasdi','admin','jobs','index','2013-01-21 14:57:10'),(778,'egisolehhasdi','admin','jobs','index','2013-01-21 14:58:08'),(779,'egisolehhasdi','admin','jobs','index','2013-01-21 14:58:19'),(780,'egisolehhasdi','admin','jobs','index','2013-01-21 14:58:46'),(781,'egisolehhasdi','admin','jobs','index','2013-01-21 14:58:54'),(782,'egisolehhasdi','admin','jobs','index','2013-01-21 14:59:08'),(783,'egisolehhasdi','admin','jobs','index','2013-01-21 15:00:16'),(784,'egisolehhasdi','admin','jobs','index','2013-01-21 15:00:57'),(785,'egisolehhasdi','admin','jobs','index','2013-01-21 15:01:38'),(786,'egisolehhasdi','admin','jobs','index','2013-01-21 15:02:34'),(787,'egisolehhasdi','admin','jobs','index','2013-01-21 15:03:05'),(788,'egisolehhasdi','admin','jobs','index','2013-01-21 15:03:15'),(789,'egisolehhasdi','admin','jobs','index','2013-01-21 15:04:00'),(790,'egisolehhasdi','admin','jobs','index','2013-01-21 15:04:08'),(791,'egisolehhasdi','admin','event','index','2013-01-21 15:04:14'),(792,'egisolehhasdi','admin','news','index','2013-01-21 15:05:37'),(793,'egisolehhasdi','admin','news','index','2013-01-21 15:07:50'),(794,'egisolehhasdi','admin','news','index','2013-01-21 15:11:56'),(795,'egisolehhasdi','admin','news','index','2013-01-21 15:12:09'),(796,'egisolehhasdi','admin','news','index','2013-01-21 15:12:22'),(797,'egisolehhasdi','admin','news','index','2013-01-21 15:12:33'),(798,'egisolehhasdi','admin','news','index','2013-01-21 15:12:46'),(799,'egisolehhasdi','admin','news','index','2013-01-21 15:13:02'),(800,'egisolehhasdi','admin','news','index','2013-01-21 15:13:42'),(801,'egisolehhasdi','admin','news','index','2013-01-21 15:13:50'),(802,'egisolehhasdi','admin','news','index','2013-01-21 15:18:29'),(803,'egisolehhasdi','admin','news','index','2013-01-21 15:20:55'),(804,'egisolehhasdi','admin','news','index','2013-01-21 15:22:41'),(805,'egisolehhasdi','admin','article','index','2013-01-21 15:22:50'),(806,'egisolehhasdi','admin','article','index','2013-01-21 16:11:00'),(807,'egisolehhasdi','admin','article','index','2013-01-21 16:12:24'),(808,'egisolehhasdi','admin','article','index','2013-01-21 16:12:42'),(809,'egisolehhasdi','admin','article','index','2013-01-21 16:12:55'),(810,'egisolehhasdi','admin','article','index','2013-01-21 16:13:30'),(811,'egisolehhasdi','admin','article','index','2013-01-21 16:13:50'),(812,'egisolehhasdi','admin','article','index','2013-01-21 16:13:55'),(813,'egisolehhasdi','admin','article','index','2013-01-21 16:14:00'),(814,'egisolehhasdi','admin','article','index','2013-01-21 16:15:10'),(815,'egisolehhasdi','admin','article','index','2013-01-21 16:16:40'),(816,'egisolehhasdi','admin','article','index','2013-01-21 16:16:48'),(817,'egisolehhasdi','admin','article','index','2013-01-21 16:17:47'),(818,'egisolehhasdi','admin','article','index','2013-01-21 16:17:55'),(819,'egisolehhasdi','admin','article','index','2013-01-21 16:23:17'),(820,'egisolehhasdi','admin','article','index','2013-01-21 16:23:28'),(821,'egisolehhasdi','admin','article','index','2013-01-21 16:23:36'),(822,'egisolehhasdi','admin','article','index','2013-01-21 16:23:40'),(823,'egisolehhasdi','admin','article','index','2013-01-21 16:24:06'),(824,'egisolehhasdi','admin','article','index','2013-01-21 16:24:24'),(825,'egisolehhasdi','admin','article','index','2013-01-21 16:24:31'),(826,'egisolehhasdi','admin','article','index','2013-01-21 16:25:26'),(827,'egisolehhasdi','admin','article','index','2013-01-21 16:25:33'),(828,'egisolehhasdi','admin','article','index','2013-01-21 16:25:42'),(829,'egisolehhasdi','admin','article','index','2013-01-21 16:25:52'),(830,'egisolehhasdi','admin','article','index','2013-01-21 16:26:22'),(831,'egisolehhasdi','admin','article','index','2013-01-21 16:26:39'),(832,'egisolehhasdi','admin','article','index','2013-01-21 16:27:22'),(833,'egisolehhasdi','admin','article','index','2013-01-21 16:27:37'),(834,'egisolehhasdi','admin','article','index','2013-01-21 16:28:25'),(835,'egisolehhasdi','admin','news','index','2013-01-21 16:30:24'),(836,'egisolehhasdi','admin','article','index','2013-01-21 16:30:30'),(837,'egisolehhasdi','admin','article','index','2013-01-21 16:30:46'),(838,'egisolehhasdi','admin','article','index','2013-01-21 16:30:52'),(839,'egisolehhasdi','admin','article','index','2013-01-21 16:31:28'),(840,'egisolehhasdi','admin','article','index','2013-01-21 16:33:21'),(841,'egisolehhasdi','admin','article','index','2013-01-21 16:34:21'),(842,'egisolehhasdi','admin','article','index','2013-01-21 16:38:08'),(843,'egisolehhasdi','admin','article','index','2013-01-21 16:40:23'),(844,'egisolehhasdi','admin','article','index','2013-01-21 16:41:58'),(845,'egisolehhasdi','admin','article','index','2013-01-21 16:42:19'),(846,'egisolehhasdi','admin','article','index','2013-01-21 16:42:55'),(847,'egisolehhasdi','admin','article','index','2013-01-21 16:43:05'),(848,'egisolehhasdi','default','index','index','2013-01-21 16:44:12'),(849,'egisolehhasdi','default','error','error','2013-01-21 16:44:13'),(850,'egisolehhasdi','admin','index','index','2013-01-21 16:44:17'),(851,'egisolehhasdi','admin','article','index','2013-01-21 16:44:26'),(852,'egisolehhasdi','admin','article','index','2013-01-21 16:44:38'),(853,'egisolehhasdi','admin','article','index','2013-01-21 16:45:34'),(854,'egisolehhasdi','admin','article','index','2013-01-21 16:45:49'),(855,'egisolehhasdi','admin','article','index','2013-01-21 16:53:37'),(856,'egisolehhasdi','admin','article','index','2013-01-21 16:53:46'),(857,'egisolehhasdi','admin','article','index','2013-01-21 16:54:00'),(858,'egisolehhasdi','admin','article','index','2013-01-21 16:54:22'),(859,'egisolehhasdi','admin','article','index','2013-01-21 16:54:29'),(860,'egisolehhasdi','admin','article','index','2013-01-21 16:54:47'),(861,'egisolehhasdi','default','error','error','2013-01-21 16:54:49'),(862,'egisolehhasdi','default','error','error','2013-01-21 16:54:51'),(863,'egisolehhasdi','admin','article','index','2013-01-21 16:54:54'),(864,'egisolehhasdi','default','error','error','2013-01-21 16:54:57'),(865,'egisolehhasdi','default','error','error','2013-01-21 16:54:58'),(866,'egisolehhasdi','admin','article','index','2013-01-21 16:55:01'),(867,'egisolehhasdi','default','error','error','2013-01-21 16:55:11'),(868,'egisolehhasdi','default','error','error','2013-01-21 16:55:12'),(869,'egisolehhasdi','admin','jobs','create','2013-01-21 16:55:14'),(870,'egisolehhasdi','admin','tag','get','2013-01-21 16:55:18'),(871,'egisolehhasdi','admin','jobs','index','2013-01-21 16:55:19'),(872,'egisolehhasdi','default','error','error','2013-01-21 16:55:23'),(873,'egisolehhasdi','default','error','error','2013-01-21 16:55:24'),(874,'egisolehhasdi','default','error','error','2013-01-21 16:55:30'),(875,'egisolehhasdi','default','error','error','2013-01-21 16:55:32'),(876,'egisolehhasdi','admin','index','index','2013-01-21 16:55:41'),(877,'egisolehhasdi','admin','index','index','2013-01-21 16:55:53'),(878,'egisolehhasdi','admin','prakerin','index','2013-01-21 16:55:56'),(879,'egisolehhasdi','admin','prakerin','index','2013-01-21 16:58:19'),(880,'egisolehhasdi','admin','jobs','index','2013-01-21 16:58:34'),(881,'egisolehhasdi','admin','jobs','index','2013-01-21 16:59:12'),(882,'egisolehhasdi','admin','jobs','index','2013-01-21 16:59:28'),(883,'egisolehhasdi','admin','jobs','index','2013-01-21 16:59:34'),(884,'egisolehhasdi','default','error','error','2013-01-21 16:59:34'),(885,'egisolehhasdi','admin','jobs','index','2013-01-21 16:59:51'),(886,'egisolehhasdi','admin','jobs','index','2013-01-21 17:00:11'),(887,'egisolehhasdi','admin','jobs','index','2013-01-21 17:00:26'),(888,'egisolehhasdi','admin','event','index','2013-01-21 17:00:34'),(889,'egisolehhasdi','admin','jobs','index','2013-01-21 17:00:38'),(890,'egisolehhasdi','admin','jobs','index','2013-01-21 17:03:19'),(891,'egisolehhasdi','admin','jobs','index','2013-01-21 17:03:56'),(892,'egisolehhasdi','admin','jobs','index','2013-01-21 17:04:05'),(893,'egisolehhasdi','admin','jobs','index','2013-01-21 17:04:29'),(894,'egisolehhasdi','admin','jobs','index','2013-01-21 17:04:31'),(895,'egisolehhasdi','default','error','error','2013-01-21 17:04:31'),(896,'egisolehhasdi','admin','jobs','index','2013-01-21 17:06:15'),(897,'egisolehhasdi','admin','jobs','index','2013-01-21 17:06:45'),(898,'egisolehhasdi','admin','jobs','index','2013-01-21 17:06:56'),(899,'egisolehhasdi','admin','jobs','index','2013-01-21 17:07:51'),(900,'egisolehhasdi','admin','jobs','index','2013-01-21 17:08:04'),(901,'egisolehhasdi','admin','jobs','index','2013-01-21 17:09:14'),(902,'egisolehhasdi','admin','jobs','index','2013-01-21 17:09:28'),(903,'egisolehhasdi','admin','jobs','index','2013-01-21 17:11:20'),(904,'egisolehhasdi','admin','jobs','index','2013-01-21 17:11:28'),(905,'egisolehhasdi','admin','jobs','index','2013-01-21 17:12:23'),(906,'egisolehhasdi','admin','jobs','index','2013-01-21 17:12:44'),(907,'egisolehhasdi','admin','jobs','index','2013-01-21 17:13:10'),(908,'egisolehhasdi','admin','jobs','index','2013-01-21 17:14:11'),(909,'egisolehhasdi','admin','jobs','index','2013-01-21 17:15:14'),(910,'egisolehhasdi','admin','jobs','index','2013-01-21 17:16:15'),(911,'egisolehhasdi','admin','jobs','index','2013-01-21 17:16:32'),(912,'egisolehhasdi','admin','jobs','index','2013-01-21 17:18:00'),(913,'egisolehhasdi','admin','jobs','index','2013-01-21 17:19:26'),(914,'egisolehhasdi','admin','article','index','2013-01-21 17:20:01'),(915,'egisolehhasdi','admin','article','index','2013-01-21 17:20:24'),(916,'egisolehhasdi','admin','article','index','2013-01-21 17:23:54'),(917,'egisolehhasdi','admin','article','index','2013-01-21 17:24:14'),(918,'egisolehhasdi','admin','article','index','2013-01-21 17:25:51'),(919,'egisolehhasdi','admin','article','index','2013-01-21 17:26:09'),(920,'egisolehhasdi','admin','article','index','2013-01-21 17:26:20'),(921,'egisolehhasdi','admin','article','index','2013-01-21 17:26:40'),(922,'egisolehhasdi','admin','article','index','2013-01-21 17:27:07'),(923,'egisolehhasdi','admin','article','index','2013-01-21 17:29:29'),(924,'egisolehhasdi','admin','article','index','2013-01-21 17:30:22'),(925,'egisolehhasdi','admin','article','index','2013-01-21 17:30:32'),(926,'egisolehhasdi','admin','article','index','2013-01-21 17:31:30'),(927,'egisolehhasdi','admin','article','index','2013-01-21 17:32:15'),(928,'egisolehhasdi','admin','article','index','2013-01-21 17:33:07'),(929,'egisolehhasdi','admin','article','index','2013-01-21 17:34:43'),(930,'egisolehhasdi','admin','article','index','2013-01-21 17:35:44'),(931,'egisolehhasdi','admin','article','index','2013-01-21 17:38:12'),(932,'egisolehhasdi','admin','article','index','2013-01-21 17:38:58'),(933,'egisolehhasdi','admin','article','index','2013-01-21 17:40:02'),(934,'egisolehhasdi','admin','article','index','2013-01-21 17:41:34'),(935,'egisolehhasdi','admin','article','index','2013-01-21 17:42:12'),(936,'egisolehhasdi','admin','article','index','2013-01-21 17:44:10'),(937,'egisolehhasdi','admin','article','index','2013-01-21 18:11:57'),(938,'egisolehhasdi','admin','article','index','2013-01-21 18:13:58'),(939,'egisolehhasdi','admin','article','index','2013-01-21 18:14:12'),(940,'egisolehhasdi','admin','article','index','2013-01-21 18:14:27'),(941,'egisolehhasdi','admin','article','index','2013-01-21 18:14:47'),(942,'egisolehhasdi','admin','jobs','index','2013-01-21 18:15:55'),(943,'egisolehhasdi','admin','polling','index','2013-01-21 18:15:58'),(944,'egisolehhasdi','admin','event','index','2013-01-21 18:16:08'),(945,'egisolehhasdi','admin','news','index','2013-01-21 18:16:12'),(946,'egisolehhasdi','admin','article','index','2013-01-21 18:16:16'),(947,'egisolehhasdi','admin','polling','index','2013-01-21 18:16:20'),(948,'egisolehhasdi','admin','jobs','index','2013-01-21 18:16:35'),(949,'egisolehhasdi','admin','news','index','2013-01-21 18:16:38'),(950,'egisolehhasdi','admin','event','index','2013-01-21 18:16:52'),(951,'egisolehhasdi','admin','polling','index','2013-01-21 18:17:57'),(952,'egisolehhasdi','admin','jobs','index','2013-01-21 18:21:57'),(953,'egisolehhasdi','admin','news','index','2013-01-21 18:22:04'),(954,'egisolehhasdi','admin','event','index','2013-01-21 18:22:23'),(955,'egisolehhasdi','admin','event','index','2013-01-21 18:24:00'),(956,'egisolehhasdi','admin','jobs','index','2013-01-21 18:24:05'),(957,'egisolehhasdi','admin','article','index','2013-01-21 18:24:09'),(958,'egisolehhasdi','admin','article','index','2013-01-21 18:25:01'),(959,'egisolehhasdi','admin','article','index','2013-01-21 18:26:17'),(960,'egisolehhasdi','admin','article','index','2013-01-21 18:26:21'),(961,'egisolehhasdi','admin','jobs','index','2013-01-21 18:26:25'),(962,'egisolehhasdi','admin','jobs','index','2013-01-21 18:34:24'),(963,'egisolehhasdi','admin','jobs','index','2013-01-21 18:35:59'),(964,'egisolehhasdi','admin','jobs','index','2013-01-21 18:36:29'),(965,'egisolehhasdi','admin','jobs','index','2013-01-21 18:36:48'),(966,'egisolehhasdi','admin','jobs','index','2013-01-21 18:38:38'),(967,'egisolehhasdi','admin','jobs','index','2013-01-21 18:40:04'),(968,'egisolehhasdi','admin','index','index','2013-01-21 18:40:20'),(969,'egisolehhasdi','admin','index','index','2013-01-21 18:41:17'),(970,'egisolehhasdi','admin','index','index','2013-01-21 18:42:36'),(971,'egisolehhasdi','admin','index','index','2013-01-21 18:43:03'),(972,'egisolehhasdi','admin','index','index','2013-01-21 18:44:23'),(973,'egisolehhasdi','admin','index','index','2013-01-21 18:45:53'),(974,'egisolehhasdi','admin','index','index','2013-01-21 18:46:01'),(975,'egisolehhasdi','admin','index','index','2013-01-21 18:48:02'),(976,'egisolehhasdi','default','error','error','2013-01-21 18:48:04'),(977,'egisolehhasdi','admin','index','index','2013-01-21 18:48:18'),(978,'egisolehhasdi','default','error','error','2013-01-21 18:48:20'),(979,'egisolehhasdi','admin','index','index','2013-01-21 18:49:33'),(980,'egisolehhasdi','admin','index','index','2013-01-21 18:49:49'),(981,'egisolehhasdi','admin','index','index','2013-01-21 18:50:35'),(982,'egisolehhasdi','admin','index','index','2013-01-21 18:51:43'),(983,'egisolehhasdi','admin','index','index','2013-01-21 18:52:21'),(984,'egisolehhasdi','admin','news','index','2013-01-21 18:52:29'),(985,'egisolehhasdi','admin','news','index','2013-01-21 18:52:41'),(986,'egisolehhasdi','admin','news','index','2013-01-21 18:53:09'),(987,'egisolehhasdi','admin','event','index','2013-01-21 18:53:14'),(988,'egisolehhasdi','admin','polling','index','2013-01-21 18:55:26'),(989,'egisolehhasdi','admin','polling','index','2013-01-21 18:55:27'),(990,'egisolehhasdi','admin','polling','create','2013-01-21 18:55:30'),(991,'egisolehhasdi','admin','article','index','2013-01-21 18:55:37'),(992,'egisolehhasdi','admin','article','index','2013-01-21 18:55:56'),(993,'egisolehhasdi','admin','article','index','2013-01-21 18:58:39'),(994,'egisolehhasdi','admin','article','index','2013-01-21 19:00:33'),(995,'egisolehhasdi','admin','article','index','2013-01-21 19:01:41'),(996,'egisolehhasdi','admin','article','index','2013-01-21 19:02:38'),(997,'egisolehhasdi','admin','article','index','2013-01-21 19:02:48'),(998,'egisolehhasdi','admin','article','index','2013-01-21 19:04:33'),(999,'egisolehhasdi','admin','article','index','2013-01-21 19:05:02'),(1000,'egisolehhasdi','admin','article','index','2013-01-21 19:05:26'),(1001,'egisolehhasdi','admin','news','index','2013-01-21 19:05:30'),(1002,'egisolehhasdi','admin','news','index','2013-01-21 19:06:02'),(1003,'egisolehhasdi','admin','news','index','2013-01-21 19:06:30'),(1004,'egisolehhasdi','admin','news','index','2013-01-21 19:11:11'),(1005,'egisolehhasdi','admin','news','index','2013-01-21 19:12:21'),(1006,'egisolehhasdi','admin','news','index','2013-01-21 19:14:00'),(1007,'egisolehhasdi','admin','news','index','2013-01-21 19:15:18'),(1008,'egisolehhasdi','admin','news','index','2013-01-21 19:15:50'),(1009,'egisolehhasdi','admin','news','index','2013-01-21 19:15:58'),(1010,'egisolehhasdi','admin','news','index','2013-01-21 19:18:01'),(1011,'egisolehhasdi','admin','news','index','2013-01-21 19:18:13'),(1012,'egisolehhasdi','default','error','error','2013-01-21 19:18:13'),(1013,'egisolehhasdi','default','error','error','2013-01-21 19:18:13'),(1014,'egisolehhasdi','admin','news','index','2013-01-21 19:18:32'),(1015,'egisolehhasdi','admin','news','index','2013-01-21 19:18:46'),(1016,'egisolehhasdi','admin','news','index','2013-01-21 19:20:35'),(1017,'egisolehhasdi','admin','news','index','2013-01-21 19:21:24'),(1018,'egisolehhasdi','admin','news','index','2013-01-21 19:23:09'),(1019,'egisolehhasdi','admin','article','index','2013-01-21 19:23:13'),(1020,'egisolehhasdi','admin','polling','index','2013-01-21 19:23:21'),(1021,'egisolehhasdi','admin','news','index','2013-01-21 19:23:27'),(1022,'egisolehhasdi','admin','index','index','2013-01-21 22:38:42'),(1023,'egisolehhasdi','admin','prakerin','index','2013-01-21 22:38:57'),(1024,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:39:03'),(1025,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:48:10'),(1026,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:50:05'),(1027,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:52:39'),(1028,'egisolehhasdi','default','error','error','2013-01-21 22:52:40'),(1029,'egisolehhasdi','default','error','error','2013-01-21 22:52:41'),(1030,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:52:44'),(1031,'egisolehhasdi','default','error','error','2013-01-21 22:52:45'),(1032,'egisolehhasdi','default','error','error','2013-01-21 22:52:47'),(1033,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:52:54'),(1034,'egisolehhasdi','default','error','error','2013-01-21 22:52:56'),(1035,'egisolehhasdi','default','error','error','2013-01-21 22:52:57'),(1036,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:53:07'),(1037,'egisolehhasdi','default','error','error','2013-01-21 22:53:08'),(1038,'egisolehhasdi','default','error','error','2013-01-21 22:53:09'),(1039,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:53:23'),(1040,'egisolehhasdi','default','error','error','2013-01-21 22:53:25'),(1041,'egisolehhasdi','default','error','error','2013-01-21 22:53:26'),(1042,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:55:09'),(1043,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:56:15'),(1044,'egisolehhasdi','default','error','error','2013-01-21 22:57:44'),(1045,'egisolehhasdi','admin','prakerin','create','2013-01-21 22:57:49'),(1046,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:00:48'),(1047,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:02:39'),(1048,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:03:03'),(1049,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:03:19'),(1050,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:03:41'),(1051,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:04:01'),(1052,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:04:45'),(1053,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:05:09'),(1054,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:05:17'),(1055,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:05:55'),(1056,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:06:23'),(1057,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:06:33'),(1058,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:06:47'),(1059,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:07:08'),(1060,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:07:14'),(1061,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:07:20'),(1062,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:07:43'),(1063,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:07:57'),(1064,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:08:16'),(1065,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:08:36'),(1066,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:08:44'),(1067,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:09:37'),(1068,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:10:36'),(1069,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:10:37'),(1070,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:11:10'),(1071,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:13:37'),(1072,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:14:00'),(1073,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:14:13'),(1074,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:14:15'),(1075,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:14:45'),(1076,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:15:23'),(1077,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:15:43'),(1078,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:16:50'),(1079,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:17:05'),(1080,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:17:21'),(1081,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:17:29'),(1082,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:17:53'),(1083,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:18:17'),(1084,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:18:27'),(1085,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:18:38'),(1086,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:18:39'),(1087,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:22:14'),(1088,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:23:26'),(1089,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:26:13'),(1090,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:26:44'),(1091,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:26:45'),(1092,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:28:50'),(1093,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:31:04'),(1094,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:31:12'),(1095,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:32:07'),(1096,'egisolehhasdi','admin','prakerin','index','2013-01-21 23:33:35'),(1097,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:34:01'),(1098,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:36:23'),(1099,'egisolehhasdi','admin','article','index','2013-01-21 23:37:02'),(1100,'egisolehhasdi','admin','article','create','2013-01-21 23:37:04'),(1101,'egisolehhasdi','admin','tag','get','2013-01-21 23:37:07'),(1102,'egisolehhasdi','admin','jobs','index','2013-01-21 23:37:23'),(1103,'egisolehhasdi','admin','prakerin','index','2013-01-21 23:37:26'),(1104,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:37:30'),(1105,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:38:12'),(1106,'egisolehhasdi','default','error','error','2013-01-21 23:42:25'),(1107,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:42:35'),(1108,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:43:08'),(1109,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:45:22'),(1110,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:45:26'),(1111,'egisolehhasdi','default','error','error','2013-01-21 23:45:32'),(1112,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:45:40'),(1113,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:49:25'),(1114,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:50:27'),(1115,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:50:49'),(1116,'egisolehhasdi','default','error','error','2013-01-21 23:51:09'),(1117,'egisolehhasdi','admin','prakerin','create','2013-01-21 23:51:48'),(1118,'egisolehhasdi','default','error','error','2013-01-21 23:52:05'),(1119,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:52:12'),(1120,'egisolehhasdi','default','error','error','2013-01-21 23:55:00'),(1121,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:55:13'),(1122,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:55:21'),(1123,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:55:44'),(1124,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:56:43'),(1125,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:56:47'),(1126,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:57:31'),(1127,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:58:24'),(1128,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:58:30'),(1129,'egisolehhasdi','admin','prakerin','edit','2013-01-21 23:59:58'),(1130,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:00:42'),(1131,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:02:46'),(1132,'egisolehhasdi','default','error','error','2013-01-22 00:03:05'),(1133,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:03:14'),(1134,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:03:20'),(1135,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:03:35'),(1136,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:10:23'),(1137,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:10:39'),(1138,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:10:54'),(1139,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:11:12'),(1140,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:11:53'),(1141,'egisolehhasdi','default','error','error','2013-01-22 00:13:04'),(1142,'egisolehhasdi','default','error','error','2013-01-22 00:17:23'),(1143,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:17:35'),(1144,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:17:55'),(1145,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:18:20'),(1146,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:18:36'),(1147,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:18:44'),(1148,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:18:55'),(1149,'egisolehhasdi','admin','prakerin','create','2013-01-22 00:19:30'),(1150,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:19:47'),(1151,'egisolehhasdi','default','error','error','2013-01-22 00:20:42'),(1152,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:20:48'),(1153,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:21:06'),(1154,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:21:13'),(1155,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:22:01'),(1156,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:22:52'),(1157,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:23:07'),(1158,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:29:24'),(1159,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:30:04'),(1160,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:30:12'),(1161,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:30:32'),(1162,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:30:50'),(1163,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:30:51'),(1164,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:31:06'),(1165,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:31:19'),(1166,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:31:37'),(1167,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:46:46'),(1168,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:47:15'),(1169,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:49:49'),(1170,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:54:07'),(1171,'egisolehhasdi','admin','prakerin','index','2013-01-22 00:54:24'),(1172,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:55:01'),(1173,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:55:13'),(1174,'egisolehhasdi','admin','prakerin','edit','2013-01-22 00:55:22'),(1175,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:04:24'),(1176,'egisolehhasdi','default','error','error','2013-01-22 01:09:05'),(1177,'egisolehhasdi','admin','prakerin','delete','2013-01-22 01:09:19'),(1178,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:09:25'),(1179,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:10:02'),(1180,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:10:32'),(1181,'egisolehhasdi','admin','prakerin','create','2013-01-22 01:10:48'),(1182,'egisolehhasdi','admin','prakerin','create','2013-01-22 01:10:55'),(1183,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:11:18'),(1184,'egisolehhasdi','admin','log','index','2013-01-22 01:18:27'),(1185,'egisolehhasdi','admin','log','index','2013-01-22 01:18:43'),(1186,'egisolehhasdi','admin','log','index','2013-01-22 01:18:48'),(1187,'egisolehhasdi','admin','prakerin','index','2013-01-22 01:18:58'),(1188,'egisolehhasdi','admin','article','index','2013-01-22 01:31:45'),(1189,'egisolehhasdi','admin','news','index','2013-01-22 01:31:52'),(1190,'egisolehhasdi','admin','event','index','2013-01-22 01:31:56'),(1191,'egisolehhasdi','admin','index','index','2013-01-23 09:14:45'),(1192,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:14:51'),(1193,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:21:03'),(1194,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:22:18'),(1195,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:22:44'),(1196,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:24:26'),(1197,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:24:38'),(1198,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:24:47'),(1199,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:24:59'),(1200,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:26:29'),(1201,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:26:57'),(1202,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:28:01'),(1203,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:28:12'),(1204,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:42:39'),(1205,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:43:35'),(1206,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:43:53'),(1207,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:43:57'),(1208,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:44:16'),(1209,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:44:28'),(1210,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:44:42'),(1211,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:45:00'),(1212,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:45:03'),(1213,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:45:17'),(1214,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:45:21'),(1215,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:45:38'),(1216,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:46:09'),(1217,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:46:22'),(1218,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:46:43'),(1219,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:48:10'),(1220,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:48:13'),(1221,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:48:44'),(1222,'egisolehhasdi','admin','prakerin','create','2013-01-23 09:48:48'),(1223,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:49:04'),(1224,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:49:49'),(1225,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:50:03'),(1226,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:50:51'),(1227,'egisolehhasdi','admin','event','index','2013-01-23 09:52:03'),(1228,'egisolehhasdi','admin','news','index','2013-01-23 09:52:13'),(1229,'egisolehhasdi','admin','news','index','2013-01-23 09:54:25'),(1230,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:54:29'),(1231,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:54:38'),(1232,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:54:43'),(1233,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:54:50'),(1234,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:54:57'),(1235,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:56:18'),(1236,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:58:02'),(1237,'egisolehhasdi','admin','prakerin','index','2013-01-23 09:58:55'),(1238,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:00:36'),(1239,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:02:20'),(1240,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:02:27'),(1241,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:03:13'),(1242,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:03:23'),(1243,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:08:23'),(1244,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:08:54'),(1245,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:08:55'),(1246,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:09:17'),(1247,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:09:41'),(1248,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:09:47'),(1249,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:09:51'),(1250,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:10:56'),(1251,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:11:00'),(1252,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:11:45'),(1253,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:12:57'),(1254,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:13:04'),(1255,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:13:30'),(1256,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:14:27'),(1257,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:14:32'),(1258,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:14:42'),(1259,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:14:49'),(1260,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:14:57'),(1261,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:15:04'),(1262,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:15:08'),(1263,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:15:37'),(1264,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:15:45'),(1265,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:15:51'),(1266,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:17:45'),(1267,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:19:53'),(1268,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:20:08'),(1269,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:26:27'),(1270,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:26:37'),(1271,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:27:04'),(1272,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:27:57'),(1273,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:28:30'),(1274,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:28:37'),(1275,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:00'),(1276,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:08'),(1277,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:13'),(1278,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:27'),(1279,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:35'),(1280,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:43'),(1281,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:29:56'),(1282,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:31:04'),(1283,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:31:15'),(1284,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:31:24'),(1285,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:31:35'),(1286,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:31:55'),(1287,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:32:11'),(1288,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:34:46'),(1289,'egisolehhasdi','default','error','error','2013-01-23 10:53:18'),(1290,'egisolehhasdi','default','error','error','2013-01-23 10:53:31'),(1291,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:53:45'),(1292,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:54:12'),(1293,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:54:23'),(1294,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:54:28'),(1295,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:54:32'),(1296,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:54:39'),(1297,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:55:38'),(1298,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:56:03'),(1299,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:56:13'),(1300,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:56:35'),(1301,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:56:47'),(1302,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:57:35'),(1303,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:57:43'),(1304,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:58:25'),(1305,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:58:34'),(1306,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:58:45'),(1307,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:58:51'),(1308,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:58:58'),(1309,'egisolehhasdi','admin','prakerin','index','2013-01-23 10:59:47'),(1310,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:00:04'),(1311,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:00:10'),(1312,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:00:16'),(1313,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:00:21'),(1314,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:00:26'),(1315,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:02:00'),(1316,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:02:09'),(1317,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:02:31'),(1318,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:02:49'),(1319,'egisolehhasdi','admin','polling','index','2013-01-23 11:15:49'),(1320,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:15:54'),(1321,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:16:41'),(1322,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:17:30'),(1323,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:17:41'),(1324,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:19:06'),(1325,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:21:18'),(1326,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:21:54'),(1327,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:22:31'),(1328,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:22:39'),(1329,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:22:49'),(1330,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:23:12'),(1331,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:23:28'),(1332,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:23:42'),(1333,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:23:58'),(1334,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:24:14'),(1335,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:24:27'),(1336,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:29:25'),(1337,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:29:31'),(1338,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:29:35'),(1339,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:36:27'),(1340,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:36:27'),(1341,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:36:38'),(1342,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:36:39'),(1343,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:36:45'),(1344,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:36:46'),(1345,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:37:41'),(1346,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:37:42'),(1347,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:37:51'),(1348,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:37:52'),(1349,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:39:20'),(1350,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:39:20'),(1351,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:42:24'),(1352,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:42:26'),(1353,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:42:42'),(1354,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:42:43'),(1355,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:42:48'),(1356,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:42:49'),(1357,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:45:01'),(1358,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:45:02'),(1359,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:45:10'),(1360,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:45:11'),(1361,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:46:43'),(1362,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:46:44'),(1363,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:46:52'),(1364,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:46:53'),(1365,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:47:41'),(1366,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:47:41'),(1367,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:47:50'),(1368,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:47:51'),(1369,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:49:40'),(1370,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:49:40'),(1371,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:52:57'),(1372,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:52:58'),(1373,'egisolehhasdi','admin','prakerin','index','2013-01-23 11:53:04'),(1374,'egisolehhasdi','admin','prakerin','data','2013-01-23 11:53:04'),(1375,'egisolehhasdi','admin','prakerin','index','2013-01-23 14:25:10'),(1376,'egisolehhasdi','admin','prakerin','data','2013-01-23 14:25:12'),(1377,'egisolehhasdi','admin','prakerin','index','2013-01-23 14:25:23'),(1378,'egisolehhasdi','admin','prakerin','data','2013-01-23 14:25:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=9039 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prakerin`
--

LOCK TABLES `prakerin` WRITE;
/*!40000 ALTER TABLE `prakerin` DISABLE KEYS */;
INSERT INTO `prakerin` VALUES (9033,'PT Sangkuriang Internasional','Jalan Sampurna, Bandung, Indonesia','http://www.sangkuriang.co.id/','RPL','(022) 2041802','-6.891231','107.60069599999997','egisolehhasdi','2013-01-23 09:44:59',NULL,NULL),(9034,'PT. Melvar Lintasnusa','Jl. Pasirkaliki No. 25 - 27 Pasirkaliki Cicendo Bandung Jawa Barat, Indonesia','http://www.melsa.net.id/','RPL,TKJ','(022) 30002022','-6.914732','107.59670699999992','egisolehhasdi','2013-01-23 09:45:16',NULL,NULL),(9035,'PT. INTI Persero','Jl. Moh. Toha No. 77 Cigereleng Regol Bandung Jawa Barat, Indonesia','http://www.inti.co.id/','RPL,TKJ,MM','(022) 70711271','-6.914985','107.60849600000006','egisolehhasdi','2013-01-23 09:45:37',NULL,NULL),(9036,'Telkom','Jl Dr Setiabudhi N0 87 Cipedes Bandung, Tlp 022-2014151, Indonesia','','RPL,TKJ','(022) 2014151','-6.87533','107.596','egisolehhasdi','2013-01-23 09:48:09',NULL,NULL),(9037,'Bandung Electronic Center','Jl. Purnawarman No. 13 - 15 Bandung, Bandung, Indonesia','http://www.istanabec.com/','RPL,TKJ,MM,TOI,TITL,AV','(022) 4205100','-6.90752','107.60899999999992','egisolehhasdi','2013-01-23 09:48:43',NULL,NULL),(9038,'Sanbe Farma','Jl. Tamansari No. 10 Tamansari Bandung Wetan Bandung Jawa Barat, Indonesia','http://sanbe-farma.com/','TKJ,TOI,TITL,AV','(022) 4207725','-6.90426','107.60899999999992','egisolehhasdi','2013-01-23 09:49:03',NULL,NULL);
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
INSERT INTO `tag` VALUES ('',2),('CSS3',1),('Dolor',2),('HTML5',1),('Ipsum',2),('Jumps Over',1),('Lorem Ipsum DOlor',2),('MYSQL',1),('Pemrogramman',2),('PHP',2),('Sit Amet',1),('The Quick Brown Fox',2),('Web Developer',2),('Zend Framework',2);
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

-- Dump completed on 2013-01-23 14:36:41
