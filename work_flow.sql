-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2016 at 08:13 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `work_flow`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(30) NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`) VALUES
(1, 'hq'),
(4, 'field');

-- --------------------------------------------------------

--
-- Table structure for table `documents_type`
--

CREATE TABLE IF NOT EXISTS `documents_type` (
  `document_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `documents_type`
--

INSERT INTO `documents_type` (`document_type_id`, `document_type_name`) VALUES
(5, 'imprest '),
(6, 'payment voucher'),
(7, 'voucher');

-- --------------------------------------------------------

--
-- Table structure for table `document_tracking`
--

CREATE TABLE IF NOT EXISTS `document_tracking` (
  `document_tracking_number` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `area_id` varchar(30) NOT NULL,
  `tracking_number` int(11) NOT NULL,
  `time_posted` timestamp NOT NULL,
  `time_started` datetime DEFAULT NULL,
  `time_ended` datetime DEFAULT NULL,
  `accomplished` datetime DEFAULT NULL,
  PRIMARY KEY (`document_tracking_number`),
  KEY `document_tracking_documents_type_FK` (`document_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `document_tracking`
--

INSERT INTO `document_tracking` (`document_tracking_number`, `document_type_id`, `area_id`, `tracking_number`, `time_posted`, `time_started`, `time_ended`, `accomplished`) VALUES
(38, 5, '1', 6678867, '2016-09-05 21:00:00', NULL, NULL, NULL),
(39, 5, '1', 6678867, '2016-09-05 21:00:00', NULL, NULL, NULL),
(40, 5, '1', 76432245, '2016-09-05 21:00:00', NULL, NULL, NULL),
(41, 5, '1', 76432245, '2016-09-05 21:00:00', NULL, NULL, NULL),
(42, 5, '1', 666666666, '2016-09-06 21:00:00', NULL, NULL, NULL),
(43, 5, '1', 666666666, '2016-09-06 21:00:00', NULL, NULL, NULL),
(44, 6, '1', 23233232, '2016-09-07 21:00:00', NULL, NULL, NULL),
(45, 6, '1', 23233232, '2016-09-07 21:00:00', NULL, NULL, NULL),
(46, 6, '1', 9090990, '2016-09-07 21:00:00', NULL, NULL, NULL),
(47, 6, '1', 9090990, '2016-09-07 21:00:00', NULL, NULL, NULL),
(48, 6, '1', 56599, '2016-09-07 21:00:00', NULL, NULL, NULL),
(49, 6, '1', 56599, '2016-09-07 21:00:00', NULL, NULL, NULL),
(50, 7, '1', 8954, '2016-09-10 21:00:00', NULL, NULL, NULL),
(51, 7, '1', 8954, '2016-09-10 21:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE IF NOT EXISTS `processes` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(30) NOT NULL,
  `section_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `process_name` varchar(140) NOT NULL,
  `position` int(30) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL,
  PRIMARY KEY (`process_id`),
  KEY `processes_area_FK` (`area_id`),
  KEY `document_type_id` (`document_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `processes`
--

INSERT INTO `processes` (`process_id`, `document_type_id`, `section_id`, `area_id`, `user_id`, `process_name`, `position`, `visible`, `date_created`) VALUES
(26, 5, 6, 1, 9, 'Check Status ', 1, 1, '2016-09-04 14:49:26'),
(27, 5, 7, 1, 10, 'checks and commits expeniture ', 2, 1, '2016-09-02 21:00:00'),
(28, 5, 9, 1, 12, 'batching', 3, 1, '2016-09-02 21:00:00'),
(29, 5, 10, 1, 15, 'payment', 4, 1, '2016-09-02 21:00:00'),
(33, 6, 9, 1, 9, 'batching', 1, 1, '2016-09-07 21:00:00'),
(35, 7, 7, 1, 9, 'treasury', 1, 1, '2016-09-10 21:00:00'),
(36, 7, 8, 1, 17, 'SIGNING', 2, 1, '2016-09-25 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `process_user`
--

CREATE TABLE IF NOT EXISTS `process_user` (
  `proceess_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`proceess_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'worker'),
(3, 'data_entry');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(40) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`) VALUES
(6, 'Imprest Accountant'),
(7, 'Vote Book'),
(8, 'CPO'),
(9, 'CPO(cashiers)'),
(10, 'Treasury Management'),
(11, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `extension` int(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_section_FK` (`section_id`),
  KEY `user_role_FK` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role_id`, `section_id`, `user_name`, `password`, `extension`, `email`, `date_created`) VALUES
(9, 2, 6, 'Eunice', 'k@m1kaze', 2300, 'eunice@kws.go.ke', '2016-09-03'),
(10, 2, 7, 'Nyaga', 'k@m1kaze', 2301, 'nyaga@kws.go.ke', '2016-09-03'),
(11, 2, 7, 'Ndungu', 'k@m1kaze', 2302, 'ndungu@kws.go.ke', '2016-09-03'),
(12, 2, 9, 'Peris', 'k@m1kaze', 2304, 'peris@kws.go.ke', '2016-09-03'),
(13, 2, 9, 'Aaron', 'k@m1kaze', 2306, 'aaron@kws.go.ke', '2016-09-03'),
(14, 2, 9, 'Jeptha', 'k@m1kaze', 2310, 'jeptha@kws.go.ke', '2016-09-03'),
(15, 2, 10, 'Treasury Manager', 'k@m1kaze', 2323, 'tm@kws.go.ke', '2016-09-03'),
(16, 1, 9, 'Kimani', 'k@m1kaze', 2366, 'briyankmn@yahoo.com', '2016-09-12'),
(17, 2, 7, 'maish', 'k@m1kaze', 888888, 'parinkmn@yahoo.com', '2016-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `document_tracking_number` int(11) NOT NULL,
  `position` int(30) DEFAULT NULL,
  `time_started` timestamp NULL DEFAULT NULL,
  `time_ended` timestamp NULL DEFAULT NULL,
  `accomplished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`work_id`),
  KEY `work_tracking_FK` (`document_tracking_number`),
  KEY `work_document_FK` (`document_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`work_id`, `document_type_id`, `document_tracking_number`, `position`, `time_started`, `time_ended`, `accomplished`) VALUES
(28, 5, 6678867, 1, NULL, NULL, 1),
(29, 5, 6678867, 2, NULL, NULL, 0),
(30, 5, 6678867, 3, NULL, NULL, 0),
(31, 5, 6678867, 4, NULL, NULL, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document_tracking`
--
ALTER TABLE `document_tracking`
  ADD CONSTRAINT `document_tracking_documents_type_FK` FOREIGN KEY (`document_type_id`) REFERENCES `documents_type` (`document_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_area_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  ADD CONSTRAINT `processes_ibfk_1` FOREIGN KEY (`document_type_id`) REFERENCES `documents_type` (`document_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `user_section_FK` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
