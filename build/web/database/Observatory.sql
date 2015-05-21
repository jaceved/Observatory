-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 11, 2014 at 05:07 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Observatory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `userID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `userID`) VALUES
('jsabpp', 'fsofgho34h96ty9', '800154020'),
('mjoilk', 'adfgg3591lfg09q', '800424039');

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

CREATE TABLE IF NOT EXISTS `observations` (
  `username` varchar(15) NOT NULL,
  `imageID` varchar(20) NOT NULL,
  `imageType` varchar(20) NOT NULL,
  `imageSize` varchar(20) NOT NULL,
  `requestID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observations`
--

INSERT INTO `observations` (`username`, `imageID`, `imageType`, `imageSize`, `requestID`) VALUES
('jsabpp', 'IC5067', 'jpg', '1600x1200', '3'),
('jacevkl', 'NGC7023', 'png', '1920x1080', '7');

-- --------------------------------------------------------

--
-- Table structure for table `params`
--

CREATE TABLE IF NOT EXISTS `params` (
  `requestID` varchar(10) NOT NULL,
  `STARTDATE` varchar(10) NOT NULL,
  `STARTTIME` varchar(6) NOT NULL,
  `TARGET` varchar(2) NOT NULL,
  `ID` varchar(15) NOT NULL,
  `RA` varchar(20) NOT NULL,
  `DC` varchar(20) NOT NULL,
  `ANGLE` varchar(6) NOT NULL,
  `REPEAT` varchar(3) NOT NULL,
  `FRAME` varchar(3) NOT NULL,
  `FILTER` varchar(2) NOT NULL,
  `EXPOSURE` varchar(6) NOT NULL,
  `BINNING` varchar(2) NOT NULL,
  `COUNT` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `params`
--

INSERT INTO `params` (`requestID`, `STARTDATE`, `STARTTIME`, `TARGET`, `ID`, `RA`, `DC`, `ANGLE`, `REPEAT`, `FRAME`, `FILTER`, `EXPOSURE`, `BINNING`, `COUNT`) VALUES
('1', '10/7/2014', '03:09', '3', 'M110', '0.67280600', '41.68527800', '0.0', '1', '2', 'G', '600', '2', '2'),
('10', '10/2/2014', '06:32', '3', 'CD322', 'DSS333', '32.3322', '3', '0', '33', 'GF', 'Y', 'Y', '3'),
('2', '10/7/2014', '03:09', '3', 'M110', '0.67280600', '41.68527800', '0.0', '1', '3', 'R', '600', '2', '2'),
('3', '10/6/2014', '20:04', '0', 'IC5067', '20.79722200', '44.36666700', '0.0', '1', '1', 'B', '600', '2', '2'),
('4', '10/6/2014', '20:04', '0', 'IC5067', '20.79722200', '44.36666700', '0.0', '1', '2', 'G', '600', '2', '2'),
('5', '10/6/2014', '20:04', '0', 'IC5067', '20.79722200', '44.36666700', '0.0', '1', '3', 'R', '600', '2', '2'),
('6', '10/6/2014', '22:26', '1', 'NGC7023', '21.02652800', '68.16944400', '0.0', '1', '0', 'L', '600', '1', '6'),
('7', '10/6/2014', '22:26', '1', 'NGC7023', '21.02652800', '68.16944400', '0.0', '1', '1', 'B', '600', '2', '2'),
('8', '10/6/2014', '22:26', '1', 'NGC7023', '21.02652800', '68.16944400', '0.0', '1', '2', 'G', '600', '2', '2'),
('9', '10/6/2014', '22:26', '1', 'NGC7023', '21.02652800', '68.16944400', '0.0', '1', '3', 'R', '600', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `username` varchar(15) NOT NULL,
  `STARTDATE` varchar(10) NOT NULL,
  `STARTTIME` varchar(6) NOT NULL,
  `targetID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`username`, `STARTDATE`, `STARTTIME`, `targetID`) VALUES
('jacevkl', '10/6/2014', '20:04', 'IC5067'),
('jsabpp', '10/6/2014', '22:26', 'NGC7023'),
('mjoilk', '10/7/2014', '00:47', 'SH2-140'),
('xcadgw', '10/8/2014', '22:26', 'NGC7023');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `universityID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `universityID`) VALUES
('dsapoi', 'gj1gr8fta9egh9t', '800121939'),
('test', 'password', '800436164'),
('jacevkl', 'df1u35d89af124f', '800920190');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
 ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `observations`
--
ALTER TABLE `observations`
 ADD PRIMARY KEY (`requestID`);

--
-- Indexes for table `params`
--
ALTER TABLE `params`
 ADD PRIMARY KEY (`requestID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
 ADD PRIMARY KEY (`STARTDATE`,`STARTTIME`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`universityID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
