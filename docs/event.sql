-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2013 at 03:32 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `smkn4bdg`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
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
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `from_date`, `until_date`, `location`, `info`, `created_by`, `created_on`, `views`, `status`) VALUES
(1, 'Sertifikasi Java Fundamental 2013', '2013-02-08 00:00:00', '2013-02-09 00:00:00', 'SMK Negeri 4 Bandung', '<p>Syarat:&nbsp;</p>\n<p>Menyelesaikan Materi mulai dari Section 0 - Section 7</p>\n<p>Sudah melaksanakan Mid-Term</p>\n<p>&nbsp;</p>\n<p>Test dapat dilakukan dirumah masing-masing, melalui http://academy.oracle.com</p>', 'egisolehhasdi', '2013-02-05 21:48:33', 0, 'publish'),
(2, 'Sertifikasi TOEIC', '2011-01-01 00:00:00', '2011-01-12 00:00:00', 'SMK Negeri 4 Bandung', '<p>Syarat:</p>\r\n<p>Menyelesaikan administrasi sebelum tanggal 28 Februari 2013</p>', 'egisolehhasdi', '2013-02-05 21:50:42', 0, 'publish'),
(3, 'Sertifikasi MOS (Microsoft Office Specialist)', '2013-06-03 00:00:00', '2013-07-03 00:00:00', 'SMK Negeri 4 Bandung', '<p>Syarat:</p>\r\n<p>Menyelesaikan administrasi sebelum tanggal 27 Februari 2013</p>', 'egisolehhasdi', '2013-02-05 21:52:42', 0, 'publish'),
(4, 'Prakerin Jurusan TI', '2012-10-01 00:00:00', '2012-11-01 00:00:00', 'SMK Negeri 4 Bandung', '<p>Jurusan</p>\r\n<p>Rekayasa Perangkat Lunak</p>\r\n<p>Tekhnik Komputer Jaringan</p>\r\n<p>Multimedia</p>', 'egisolehhasdi', '2013-02-05 21:59:46', 0, 'publish'),
(5, 'Prakerin Jurusan AV dan Listrik', '2012-07-01 00:00:00', '2012-09-03 00:00:00', 'SMK Negeri 4 Bandung', '<p>Jurusan</p>\r\n<p>Audio Video</p>\r\n<p>Teknik Otomasi Industri</p>\r\n<p>Teknik Instalasi Tenaga Listrik</p>', 'egisolehhasdi', '2013-02-05 22:01:39', 0, 'publish'),
(6, 'Produk', '2013-07-08 00:00:00', '2013-07-10 00:00:00', 'SMKN 8 BANDUNG', '<p>Syarat:&nbsp;</p>\r\n<p>Menyelesaikan Materi mulai dari Section 0 - Section 7</p>\r\n<p>Sudah melaksanakan Mid-Term</p>\r\n<p>&nbsp;</p>\r\n<p>Test dapat dilakukan dirumah masing-masing, melalui http://academy.oracle.com</p>', 'egisolehhasdi', '2013-02-07 00:00:00', 0, 'publish'),
(7, 'Membunuh Babi Liar', '2013-06-28 00:00:00', '2013-07-29 00:00:00', NULL, '<p>Syarat:&nbsp;</p>\r\n<p>Menyelesaikan Materi mulai dari Section 0 - Section 7</p>\r\n<p>Sudah melaksanakan Mid-Term</p>\r\n<p>&nbsp;</p>\r\n<p>Test dapat dilakukan dirumah masing-masing, melalui http://academy.oracle.com</p>', 'egisolehhasdi', '2013-02-13 00:00:00', 0, 'publish');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
