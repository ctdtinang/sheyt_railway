-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 05:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookedDate` date NOT NULL,
  `ticket_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `t_id` int(11) NOT NULL COMMENT 'ticket ID',
  `trainNumber` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Sex` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL COMMENT 'address of passenger',
  `Status` varchar(50) NOT NULL COMMENT 'status of reservation(either confirmed or waiting)',
  `Category` varchar(50) NOT NULL COMMENT 'category for which ticket is booked'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `train_list`
--

CREATE TABLE `train_list` (
  `trainNumber` int(11) NOT NULL,
  `trainName` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `acFair` float(10,2) NOT NULL COMMENT 'fair for AC ticket',
  `genFair` float(10,2) NOT NULL COMMENT 'Fair for general ticket',
  `monAvailable` tinyint(1) NOT NULL COMMENT 'Monday Available',
  `tueAvailable` tinyint(1) NOT NULL COMMENT 'Tuesday Available',
  `wedAvailable` tinyint(1) NOT NULL COMMENT 'Wednesday Available',
  `thurAvailable` tinyint(1) NOT NULL COMMENT 'Thursday Available',
  `friAvailable` tinyint(1) NOT NULL COMMENT 'Friday Available',
  `satAvailable` tinyint(1) NOT NULL COMMENT 'Saturday Available',
  `sunAvailable` tinyint(1) NOT NULL COMMENT 'Sunday Available'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `train_status`
--

CREATE TABLE `train_status` (
  `trainNumber` int(11) NOT NULL,
  `trainDate` date NOT NULL,
  `AC_Seat` varchar(50) NOT NULL COMMENT 'total number of ac seats',
  `GEN_Seat` varchar(50) NOT NULL COMMENT 'total number og gen seats',
  `B_AC_Seat` varchar(50) NOT NULL COMMENT 'number of AC seats booked',
  `B_GEN_Seat` varchar(50) NOT NULL COMMENT 'number of gen seats booked'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD KEY `FK2` (`ticket_ID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `FK1` (`trainNumber`);

--
-- Indexes for table `train_list`
--
ALTER TABLE `train_list`
  ADD PRIMARY KEY (`trainNumber`);

--
-- Indexes for table `train_status`
--
ALTER TABLE `train_status`
  ADD KEY `FK` (`trainNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`ticket_ID`) REFERENCES `passenger` (`t_id`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`trainNumber`) REFERENCES `train_list` (`trainNumber`);

--
-- Constraints for table `train_status`
--
ALTER TABLE `train_status`
  ADD CONSTRAINT `FK` FOREIGN KEY (`trainNumber`) REFERENCES `train_list` (`trainNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
