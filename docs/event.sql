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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Sertifikasi Java Fundamental 2013','2013-02-08 00:00:00','2013-02-09 00:00:00','SMK Negeri 4 Bandung','<p>Syarat:&nbsp;</p>\r\n<p>Menyelesaikan Materi mulai dari Section 0 - Section 7</p>\r\n<p>Sudah melaksanakan Mid-Term</p>\r\n<p>&nbsp;</p>\r\n<p>Test dapat dilakukan dirumah masing-masing, melalui http://academy.oracle.com</p>','egisolehhasdi','2013-02-05 21:48:33',0,'publish'),(2,'Sertifikasi TOEIC','1970-01-01 00:00:00','1970-01-01 00:00:00','SMK Negeri 4 Bandung','<p>Syarat:</p>\r\n<p>Menyelesaikan administrasi sebelum tanggal 28 Februari 2013</p>','egisolehhasdi','2013-02-05 21:50:42',0,'publish'),(3,'Sertifikasi MOS (Microsoft Office Specialist)','1970-01-01 00:00:00','1970-01-01 00:00:00','SMK Negeri 4 Bandung','<p>Syarat:</p>\r\n<p>Menyelesaikan administrasi sebelum tanggal 27 Februari 2013</p>','egisolehhasdi','2013-02-05 21:52:42',0,'publish'),(4,'Prakerin Jurusan TI','2012-10-01 00:00:00','1970-01-01 00:00:00','SMK Negeri 4 Bandung','<p>Jurusan</p>\r\n<p>Rekayasa Perangkat Lunak</p>\r\n<p>Tekhnik Komputer Jaringan</p>\r\n<p>Multimedia</p>','egisolehhasdi','2013-02-05 21:59:46',0,'publish'),(5,'Prakerin Jurusan AV dan Listrik','2012-07-01 00:00:00','1970-01-01 00:00:00','SMK Negeri 4 Bandung','<p>Jurusan</p>\r\n<p>Audio Video</p>\r\n<p>Teknik Otomasi Industri</p>\r\n<p>Teknik Instalasi Tenaga Listrik</p>','egisolehhasdi','2013-02-05 22:01:39',0,'publish');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-05 22:03:16
