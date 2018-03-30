-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 09, 2018 at 02:22 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `eventID` int(11) NOT NULL,
  `tableID` int(11) NOT NULL,
  `booked` tinyint(1) NOT NULL,
  `noPeople` int(2) NOT NULL,
  `request` varchar(255) NOT NULL,
  `bookingID` int(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Booking`
--

INSERT INTO `Booking` (`eventID`, `tableID`, `booked`, `noPeople`, `request`, `bookingID`, `username`, `status`) VALUES
(1, 1, 1, 1, 'I have no requests', 23, 'angelosUsername', 'pending'),
(1, 2, 0, 0, '', 24, '', ''),
(1, 3, 0, 0, '', 25, '', ''),
(1, 4, 0, 0, '', 26, '', ''),
(1, 5, 0, 0, '', 27, '', ''),
(1, 6, 0, 0, '', 28, '', ''),
(1, 7, 0, 0, '', 29, '', ''),
(1, 8, 0, 0, '', 30, '', ''),
(1, 9, 0, 0, '', 31, '', ''),
(1, 10, 0, 0, '', 32, '', ''),
(1, 11, 0, 0, '', 33, '', ''),
(1, 12, 0, 0, '', 34, '', ''),
(1, 13, 0, 0, '', 35, '', ''),
(1, 14, 0, 0, '', 36, '', ''),
(1, 15, 0, 0, '', 37, '', ''),
(1, 16, 0, 0, '', 38, '', ''),
(1, 17, 0, 0, '', 39, '', ''),
(1, 18, 0, 0, '', 40, '', ''),
(1, 19, 0, 0, '', 41, '', ''),
(1, 20, 0, 0, '', 42, '', ''),
(1, 21, 0, 0, '', 43, '', ''),
(1, 22, 0, 0, '', 44, '', ''),
(1, 23, 0, 0, '', 45, '', ''),
(1, 24, 0, 0, '', 46, '', ''),
(1, 25, 0, 0, '', 47, '', ''),
(1, 26, 0, 0, '', 48, '', ''),
(1, 27, 0, 0, '', 49, '', ''),
(1, 28, 0, 0, '', 50, '', ''),
(1, 29, 0, 0, '', 51, '', ''),
(1, 30, 0, 0, '', 52, '', ''),
(1, 31, 0, 0, '', 53, '', ''),
(1, 32, 0, 0, '', 54, '', ''),
(1, 33, 0, 0, '', 55, '', ''),
(1, 34, 0, 0, '', 56, '', ''),
(1, 35, 0, 0, '', 57, '', ''),
(1, 36, 0, 0, '', 58, '', ''),
(1, 37, 0, 0, '', 59, '', ''),
(1, 38, 0, 0, '', 60, '', ''),
(1, 39, 0, 0, '', 61, '', ''),
(1, 40, 0, 0, '', 62, '', ''),
(1, 41, 0, 0, '', 63, '', ''),
(1, 42, 0, 0, '', 64, '', ''),
(1, 43, 0, 0, '', 65, '', ''),
(1, 44, 0, 0, '', 66, '', ''),
(1, 45, 0, 0, '', 67, '', ''),
(1, 46, 0, 0, '', 68, '', ''),
(1, 47, 0, 0, '', 69, '', ''),
(1, 48, 0, 0, '', 70, '', ''),
(1, 49, 0, 0, '', 71, '', ''),
(1, 50, 0, 0, '', 72, '', ''),
(1, 51, 0, 0, '', 73, '', ''),
(1, 52, 0, 0, '', 74, '', ''),
(1, 53, 0, 0, '', 75, '', ''),
(1, 54, 0, 0, '', 76, '', ''),
(1, 55, 0, 0, '', 77, '', ''),
(1, 56, 0, 0, '', 78, '', ''),
(1, 57, 0, 0, '', 79, '', ''),
(1, 58, 0, 0, '', 80, '', ''),
(1, 59, 0, 0, '', 81, '', ''),
(1, 60, 0, 0, '', 82, '', ''),
(1, 61, 0, 0, '', 83, '', ''),
(1, 62, 0, 0, '', 84, '', ''),
(1, 63, 0, 0, '', 85, '', ''),
(1, 64, 0, 0, '', 86, '', ''),
(1, 65, 0, 0, '', 87, '', ''),
(1, 66, 0, 0, '', 88, '', ''),
(1, 67, 0, 0, '', 89, '', ''),
(1, 68, 0, 0, '', 90, '', ''),
(1, 69, 0, 0, '', 91, '', ''),
(1, 70, 0, 0, '', 92, '', ''),
(1, 71, 0, 0, '', 93, '', ''),
(1, 72, 0, 0, '', 94, '', ''),
(2, 1, 0, 0, '', 95, '', ''),
(2, 2, 0, 0, '', 96, '', ''),
(2, 3, 0, 0, '', 97, '', ''),
(2, 4, 0, 0, '', 98, '', ''),
(2, 5, 0, 0, '', 99, '', ''),
(2, 6, 0, 0, '', 100, '', ''),
(2, 7, 0, 0, '', 101, '', ''),
(2, 8, 0, 0, '', 102, '', ''),
(2, 9, 0, 0, '', 103, '', ''),
(2, 10, 0, 0, '', 104, '', ''),
(2, 11, 0, 0, '', 105, '', ''),
(2, 12, 0, 0, '', 106, '', ''),
(2, 13, 0, 0, '', 107, '', ''),
(2, 14, 0, 0, '', 108, '', ''),
(2, 15, 0, 0, '', 109, '', ''),
(2, 16, 0, 0, '', 110, '', ''),
(2, 17, 0, 0, '', 111, '', ''),
(2, 18, 0, 0, '', 112, '', ''),
(2, 19, 0, 0, '', 113, '', ''),
(2, 20, 0, 0, '', 114, '', ''),
(2, 21, 0, 0, '', 115, '', ''),
(2, 22, 0, 0, '', 116, '', ''),
(2, 23, 0, 0, '', 117, '', ''),
(2, 24, 0, 0, '', 118, '', ''),
(2, 25, 0, 0, '', 119, '', ''),
(2, 26, 0, 0, '', 120, '', ''),
(2, 27, 0, 0, '', 121, '', ''),
(2, 28, 0, 0, '', 122, '', ''),
(2, 29, 0, 0, '', 123, '', ''),
(2, 30, 0, 0, '', 124, '', ''),
(2, 31, 0, 0, '', 125, '', ''),
(2, 32, 0, 0, '', 126, '', ''),
(2, 33, 0, 0, '', 127, '', ''),
(2, 34, 0, 0, '', 128, '', ''),
(2, 35, 0, 0, '', 129, '', ''),
(2, 36, 0, 0, '', 130, '', ''),
(2, 37, 0, 0, '', 131, '', ''),
(2, 38, 0, 0, '', 132, '', ''),
(2, 39, 0, 0, '', 133, '', ''),
(2, 40, 0, 0, '', 134, '', ''),
(2, 41, 0, 0, '', 135, '', ''),
(2, 42, 0, 0, '', 136, '', ''),
(2, 43, 0, 0, '', 137, '', ''),
(2, 44, 0, 0, '', 138, '', ''),
(2, 45, 0, 0, '', 139, '', ''),
(2, 46, 0, 0, '', 140, '', ''),
(2, 47, 0, 0, '', 141, '', ''),
(2, 48, 0, 0, '', 142, '', ''),
(2, 49, 0, 0, '', 143, '', ''),
(2, 50, 0, 0, '', 144, '', ''),
(2, 51, 0, 0, '', 145, '', ''),
(2, 52, 0, 0, '', 146, '', ''),
(2, 53, 0, 0, '', 147, '', ''),
(2, 54, 0, 0, '', 148, '', ''),
(2, 55, 0, 0, '', 149, '', ''),
(2, 56, 0, 0, '', 150, '', ''),
(2, 57, 0, 0, '', 151, '', ''),
(2, 58, 0, 0, '', 152, '', ''),
(2, 59, 0, 0, '', 153, '', ''),
(2, 60, 0, 0, '', 154, '', ''),
(2, 61, 0, 0, '', 155, '', ''),
(2, 62, 0, 0, '', 156, '', ''),
(2, 63, 0, 0, '', 157, '', ''),
(2, 64, 0, 0, '', 158, '', ''),
(2, 65, 0, 0, '', 159, '', ''),
(2, 66, 0, 0, '', 160, '', ''),
(2, 67, 0, 0, '', 161, '', ''),
(2, 68, 0, 0, '', 162, '', ''),
(2, 69, 0, 0, '', 163, '', ''),
(2, 70, 0, 0, '', 164, '', ''),
(2, 71, 0, 0, '', 165, '', ''),
(2, 72, 0, 0, '', 166, '', ''),
(3, 1, 0, 0, '', 167, '', ''),
(3, 2, 0, 0, '', 168, '', ''),
(3, 3, 0, 0, '', 169, '', ''),
(3, 4, 0, 0, '', 170, '', ''),
(3, 5, 0, 0, '', 171, '', ''),
(3, 6, 0, 0, '', 172, '', ''),
(3, 7, 0, 0, '', 173, '', ''),
(3, 8, 0, 0, '', 174, '', ''),
(3, 9, 0, 0, '', 175, '', ''),
(3, 10, 0, 0, '', 176, '', ''),
(3, 11, 0, 0, '', 177, '', ''),
(3, 12, 0, 0, '', 178, '', ''),
(3, 13, 0, 0, '', 179, '', ''),
(3, 14, 0, 0, '', 180, '', ''),
(3, 15, 0, 0, '', 181, '', ''),
(3, 16, 0, 0, '', 182, '', ''),
(3, 17, 0, 0, '', 183, '', ''),
(3, 18, 0, 0, '', 184, '', ''),
(3, 19, 0, 0, '', 185, '', ''),
(3, 20, 0, 0, '', 186, '', ''),
(3, 21, 0, 0, '', 187, '', ''),
(3, 22, 0, 0, '', 188, '', ''),
(3, 23, 0, 0, '', 189, '', ''),
(3, 24, 0, 0, '', 190, '', ''),
(3, 25, 0, 0, '', 191, '', ''),
(3, 26, 0, 0, '', 192, '', ''),
(3, 27, 0, 0, '', 193, '', ''),
(3, 28, 0, 0, '', 194, '', ''),
(3, 29, 0, 0, '', 195, '', ''),
(3, 30, 0, 0, '', 196, '', ''),
(3, 31, 0, 0, '', 197, '', ''),
(3, 32, 0, 0, '', 198, '', ''),
(3, 33, 0, 0, '', 199, '', ''),
(3, 34, 0, 0, '', 200, '', ''),
(3, 35, 0, 0, '', 201, '', ''),
(3, 36, 0, 0, '', 202, '', ''),
(3, 37, 0, 0, '', 203, '', ''),
(3, 38, 0, 0, '', 204, '', ''),
(3, 39, 0, 0, '', 205, '', ''),
(3, 40, 0, 0, '', 206, '', ''),
(3, 41, 0, 0, '', 207, '', ''),
(3, 42, 0, 0, '', 208, '', ''),
(3, 43, 0, 0, '', 209, '', ''),
(3, 44, 0, 0, '', 210, '', ''),
(3, 45, 0, 0, '', 211, '', ''),
(3, 46, 0, 0, '', 212, '', ''),
(3, 47, 0, 0, '', 213, '', ''),
(3, 48, 0, 0, '', 214, '', ''),
(3, 49, 0, 0, '', 215, '', ''),
(3, 50, 0, 0, '', 216, '', ''),
(3, 51, 0, 0, '', 217, '', ''),
(3, 52, 0, 0, '', 218, '', ''),
(3, 53, 0, 0, '', 219, '', ''),
(3, 54, 0, 0, '', 220, '', ''),
(3, 55, 0, 0, '', 221, '', ''),
(3, 56, 0, 0, '', 222, '', ''),
(3, 57, 0, 0, '', 223, '', ''),
(3, 58, 0, 0, '', 224, '', ''),
(3, 59, 0, 0, '', 225, '', ''),
(3, 60, 0, 0, '', 226, '', ''),
(3, 61, 0, 0, '', 227, '', ''),
(3, 62, 0, 0, '', 228, '', ''),
(3, 63, 0, 0, '', 229, '', ''),
(3, 64, 0, 0, '', 230, '', ''),
(3, 65, 0, 0, '', 231, '', ''),
(3, 66, 0, 0, '', 232, '', ''),
(3, 67, 0, 0, '', 233, '', ''),
(3, 68, 0, 0, '', 234, '', ''),
(3, 69, 0, 0, '', 235, '', ''),
(3, 70, 0, 0, '', 236, '', ''),
(3, 71, 0, 0, '', 237, '', ''),
(3, 72, 0, 0, '', 238, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `eventId` int(11) NOT NULL,
  `eventName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`eventId`, `eventName`) VALUES
(1, 'Opening Fiesta'),
(2, 'Cablenet Presents Martin Garrix'),
(3, 'Absolut Vodka presents NERVO');

-- --------------------------------------------------------

--
-- Table structure for table `Table`
--

CREATE TABLE `Table` (
  `tableID` int(11) NOT NULL,
  `tableName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Table`
--

INSERT INTO `Table` (`tableID`, `tableName`) VALUES
(1, 'beach1'),
(2, 'beach2'),
(3, 'beach3'),
(4, 'beach4'),
(5, 'beach5'),
(6, 'beach6'),
(7, 'beach7'),
(8, 'beach8'),
(9, 'beach9'),
(10, 'beach10'),
(11, 'beach11'),
(12, 'beach12'),
(13, 'beach13'),
(14, 'beach14'),
(15, 'viewleft15'),
(16, 'viewleft16'),
(17, 'viewleft17'),
(18, 'viewright18'),
(19, 'viewright19'),
(20, 'viewright20'),
(21, 'balconytwo21'),
(22, 'balconytwo22'),
(23, 'balconytwo23'),
(24, 'balconytwo24'),
(25, 'balconytwo25'),
(26, 'balconytwo26'),
(27, 'balconytwo27'),
(28, 'balconytwo28'),
(29, 'balconytwo29'),
(30, 'balconytwo30'),
(31, 'balconyone31'),
(32, 'balconyone32'),
(33, 'balconyone33'),
(34, 'balconyone34'),
(35, 'balconyone35'),
(36, 'balconyone36'),
(37, 'balconyone37'),
(38, 'behindmain38'),
(39, 'behindmain39'),
(40, 'behindmain40'),
(41, 'behindmain41'),
(42, 'behindmain42'),
(43, 'thetop43'),
(44, 'thetop44'),
(45, 'thetop45'),
(46, 'thetop46'),
(47, 'stage47'),
(48, 'stage48'),
(49, 'stage49'),
(50, 'bobar50'),
(51, 'bobar51'),
(52, 'bobar52'),
(53, 'bobar53'),
(54, 'bobar54'),
(55, 'bobar55'),
(56, 'bobar56'),
(57, 'bobar57'),
(58, 'bobar58'),
(59, 'vip59'),
(60, 'vip60'),
(61, 'vip61'),
(62, 'vip62'),
(63, 'vip63'),
(64, 'vip64'),
(65, 'vip65'),
(66, 'vip66'),
(67, 'vip67'),
(68, 'vip68'),
(69, 'vip69'),
(70, 'vip70'),
(71, 'vip71'),
(72, 'vip72');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `enabled`, `first_name`, `last_name`) VALUES
('admin', '$2a$10$loyJx8LeEor6jbmo.H92A.byaMrdYIo/l44WSrQe6JWJqQBpU4OBC', 1, 'Andreas', 'Neokleous'),
('angelosUsername', '$2a$10$txMfxY2.W2ZwFCONZ.Hr8uM1YXdNp9M9GBnGwfBzDIpmlDSTEUZfC', 1, 'Angelos', 'Christides');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_role_id`, `username`, `role`) VALUES
(6, 'admin', 'ROLE_ADMIN'),
(5, 'angelosUsername', 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`bookingID`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`eventId`);

--
-- Indexes for table `Table`
--
ALTER TABLE `Table`
  ADD PRIMARY KEY (`tableID`),
  ADD UNIQUE KEY `tableID` (`tableID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_role_id`),
  ADD UNIQUE KEY `uni_username_role` (`role`,`username`),
  ADD KEY `fk_username_idx` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Booking`
--
ALTER TABLE `Booking`
  MODIFY `bookingID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
