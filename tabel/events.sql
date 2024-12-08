-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 09:31 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `Time` varchar(50) DEFAULT NULL,
  `Room` varchar(50) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Event` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Setup` varchar(50) DEFAULT NULL,
  `Pax` int(11) DEFAULT NULL,
  `EO_No` varchar(50) DEFAULT NULL,
  `Mgr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `Time`, `Room`, `Company`, `Event`, `Type`, `Setup`, `Pax`, `EO_No`, `Mgr`) VALUES
(1, '10:00 AM', 'Conference Room A', 'ABC Corp', 'Annual Meeting', 'Meeting', 'Theater', 100, 'EO123', 'John Doe'),
(2, '02:00 PM', 'Banquet Hall', 'XYZ Ltd', 'Product Launch', 'Launch', 'Banquet', 150, 'EO456', 'Jane Smith'),
(3, '09:00 AM', 'Board Room', 'Global Inc', 'Board Meeting', 'Meeting', 'U-Shape', 20, 'EO789', 'Alice Brown'),
(4, '08:00 AM', 'Room A', 'ABC Corp', 'Annual Meeting', 'Corporate', 'Theater', 100, 'EO1001', 'John Doe'),
(5, '09:00 AM', 'Room B', 'XYZ Ltd.', 'Product Launch', 'Marketing', 'Banquet', 50, 'EO1002', 'Jane Smith'),
(6, '10:00 AM', 'Room C', 'Tech Innovators', 'AI Workshop', 'Technical', 'Classroom', 30, 'EO1003', 'Alice Johnson'),
(7, '11:00 AM', 'Room D', 'EduWorld', 'Educational Seminar', 'Educational', 'Round Table', 25, 'EO1004', 'Emily Davis'),
(8, '12:00 PM', 'Room E', 'Global Finance', 'Investment Meeting', 'Finance', 'Boardroom', 10, 'EO1005', 'Robert Wilson'),
(9, '01:00 PM', 'Room F', 'MediaWorks', 'Film Screening', 'Entertainment', 'Theater', 200, 'EO1006', 'Laura Lee'),
(10, '02:00 PM', 'Room G', 'Startup Hub', 'Networking Event', 'Social', 'Standing', 75, 'EO1007', 'Chris Martin'),
(11, '03:00 PM', 'Room H', 'Green Energy', 'Sustainability Workshop', 'Technical', 'Classroom', 40, 'EO1008', 'Sandra White'),
(12, '04:00 PM', 'Room I', 'Healthcare Inc.', 'Medical Conference', 'Conference', 'U-Shape', 150, 'EO1009', 'Michael Brown'),
(13, '05:00 PM', 'Room J', 'Legal Experts', 'Law Seminar', 'Legal', 'Classroom', 60, 'EO1010', 'Paul Black'),
(14, '08:30 AM', 'Room K', 'NextGen Tech', 'Startup Pitch', 'Technical', 'Theater', 80, 'EO1011', 'David Green'),
(15, '09:30 AM', 'Room L', 'FinTech World', 'Banking Solutions Workshop', 'Finance', 'Boardroom', 20, 'EO1012', 'Angela Brown'),
(16, '10:30 AM', 'Room M', 'TravelPro', 'Tourism Expo', 'Exhibition', 'Banquet', 300, 'EO1013', 'Rachel White'),
(17, '11:30 AM', 'Room N', 'HealthFirst', 'Wellness Seminar', 'Educational', 'Round Table', 35, 'EO1014', 'Ethan Walker'),
(18, '12:30 PM', 'Room O', 'Fashion Forward', 'Fashion Show', 'Entertainment', 'Runway', 250, 'EO1015', 'Sophia Hill'),
(19, '01:30 PM', 'Room P', 'EcoVision', 'Climate Action Talk', 'Conference', 'U-Shape', 120, 'EO1016', 'Liam Johnson'),
(20, '02:30 PM', 'Room Q', 'Bright Future', 'Career Fair', 'Educational', 'Booths', 500, 'EO1017', 'Olivia Martinez'),
(21, '03:30 PM', 'Room R', 'CodeFest', 'Hackathon', 'Technical', 'Classroom', 45, 'EO1018', 'Lucas Nguyen'),
(22, '04:30 PM', 'Room S', 'AutoDrive', 'Car Expo', 'Exhibition', 'Open Space', 400, 'EO1019', 'Zoe Carter'),
(23, '05:30 PM', 'Room T', 'Culinary Arts', 'Cooking Competition', 'Entertainment', 'Banquet', 150, 'EO1020', 'James King'),
(24, '07:00 AM', 'Room U', 'Global Summit', 'International Conference', 'Conference', 'Theater', 500, 'EO1021', 'Ella Lewis'),
(25, '08:00 AM', 'Room V', 'Bright Ideas', 'Innovation Workshop', 'Technical', 'Classroom', 20, 'EO1022', 'Mason Young'),
(26, '09:00 AM', 'Room W', 'Mega Builders', 'Construction Expo', 'Exhibition', 'Open Space', 600, 'EO1023', 'Isabella Turner'),
(27, '10:00 AM', 'Room X', 'EduLearn', 'Teacher Training', 'Educational', 'Round Table', 50, 'EO1024', 'Benjamin Adams'),
(28, '11:00 AM', 'Room Y', 'GameCon', 'Gaming Convention', 'Entertainment', 'Booths', 1000, 'EO1025', 'Sofia Harris'),
(29, '12:00 PM', 'Room Z', 'BioPharma', 'Pharmaceutical Talk', 'Technical', 'Classroom', 70, 'EO1026', 'Daniel Wood'),
(30, '01:00 PM', 'Room AA', 'SportsWorld', 'Athletics Expo', 'Exhibition', 'Open Space', 350, 'EO1027', 'Victoria Evans'),
(31, '02:00 PM', 'Room BB', 'ArtMasters', 'Art Gallery', 'Exhibition', 'Open Space', 150, 'EO1028', 'Emma Brooks'),
(32, '03:00 PM', 'Room CC', 'CryptoCon', 'Blockchain Summit', 'Finance', 'Theater', 200, 'EO1029', 'Jack Rivera'),
(33, '04:00 PM', 'Room DD', 'FitnessPro', 'Gym Equipment Expo', 'Exhibition', 'Open Space', 100, 'EO1030', 'Hannah Powell'),
(34, '05:00 PM', 'Room EE', 'Literary Fest', 'Book Launch', 'Educational', 'Classroom', 80, 'EO1031', 'Nathan Bell'),
(35, '06:00 PM', 'Room FF', 'AI Future', 'Machine Learning Workshop', 'Technical', 'Classroom', 30, 'EO1032', 'Aaron Price'),
(36, '07:00 PM', 'Room GG', 'CinemaClub', 'Film Festival', 'Entertainment', 'Theater', 150, 'EO1033', 'Sophia Lopez'),
(37, '08:00 PM', 'Room HH', 'MusicFest', 'Concert', 'Entertainment', 'Open Space', 500, 'EO1034', 'Grace Hall'),
(38, '09:00 PM', 'Room II', 'Wedding Bliss', 'Wedding Expo', 'Social', 'Banquet', 250, 'EO1035', 'Liam Baker'),
(39, '10:00 PM', 'Room JJ', 'Carnevale', 'Cultural Night', 'Entertainment', 'Round Table', 100, 'EO1036', 'Olivia Scott'),
(40, '11:00 PM', 'Room KK', 'Civic Meet', 'Town Hall', 'Conference', 'U-Shape', 80, 'EO1037', 'David Ward'),
(41, '12:00 PM', 'Room LL', 'TechNext', 'Future Tech Summit', 'Technical', 'Theater', 300, 'EO1038', 'Lucy Ramirez'),
(42, '01:00 PM', 'Room MM', 'Builders Corp', 'Infrastructure Forum', 'Conference', 'Boardroom', 40, 'EO1039', 'Ethan Davis'),
(43, '02:00 PM', 'Room NN', 'AdventureLife', 'Travel Seminar', 'Social', 'Theater', 60, 'EO1040', 'Charlotte Hughes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
