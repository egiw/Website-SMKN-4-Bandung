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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'egisolehhasdi',NULL,'asdfasdf','2013-02-12 17:17:02'),(2,'egisolehhasdi',9,'asdfasdf','2013-02-12 17:18:21'),(3,'egisolehhasdi',9,'Hello World Lorem Ipsum dolor sit amet','2013-02-12 17:18:45'),(4,'egisolehhasdi',9,'Hello World','2013-02-12 17:19:42'),(5,'egisolehhasdi',9,'Okay','2013-02-12 17:41:57'),(6,'egisolehhasdi',9,'Hello World','2013-02-12 17:52:25'),(7,'egisolehhasdi',9,'hajkshfjkahd aksjdhf kajhdsf jkahsdfkj ahsdkjf hakjdshf akjsdhf kjasdhf kjahsd kjfakhskdjhf kjahsdkjfh akjhsdkjf hakjsdhf','2013-02-12 17:57:48'),(8,'egisolehhasdi',9,'Hdllo','2013-02-12 17:59:21'),(9,'egisolehhasdi',9,'adf','2013-02-12 18:06:39'),(10,'dwianggoro',9,'oh','2013-02-12 18:23:43'),(11,'egisolehhasdi',9,'The quick brown fox jumps over the lazy dog','2013-02-12 18:34:30'),(12,'egisolehhasdi',9,'Who the hell do you think you are?','2013-02-12 18:34:50');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-12 20:31:27
