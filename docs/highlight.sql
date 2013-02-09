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
-- Table structure for table `highlight`
--

DROP TABLE IF EXISTS `highlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highlight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `highlight_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight`
--

LOCK TABLES `highlight` WRITE;
/*!40000 ALTER TABLE `highlight` DISABLE KEYS */;
INSERT INTO `highlight` VALUES (18,'Festival Paduan Angklung','http://saung-udjo.com','kasepuh_1360226308.jpg',1,'egisolehhasdi','2013-01-07 14:50:47'),(19,'Kebudayaan yang harus kita lestarikan','http://kebudayaanindonesia.net','featured1_1360223741.jpg',5,'egisolehhasdi','2013-02-07 14:55:40'),(20,'Angklung yang merupakan warisan nenek moyang','http://saung-udjo.com','featured2_1360223878.jpg',4,'egisolehhasdi','2013-02-07 14:57:57'),(23,'Kuda Lumping','http://google.com','featured3_1360224718.jpg',0,'egisolehhasdi','2013-02-07 15:11:57'),(25,'Koteka, Pakaian tradisional Papua','http://kotekapapua.com','koteka_1360226512.jpg',3,'egisolehhasdi','2013-02-07 15:41:51'),(26,'Lorem Ipsum Dolor Sit','','festival_1360226634.jpg',2,'egisolehhasdi','2013-02-07 15:43:53');
/*!40000 ALTER TABLE `highlight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-07 16:14:42
