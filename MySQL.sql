-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2022 at 11:08 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryTitle` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryTitle`) VALUES
(10, 'Tikros istorijos'),
(26, 'Fantastika'),
(28, 'Poezija, esė'),
(29, 'Romantika'),
(34, 'Komedija');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_username` varchar(63) NOT NULL,
  `film_id` int(11) NOT NULL,
  `comment` varchar(512) NOT NULL,
  `data` text NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_username`, `film_id`, `comment`, `data`) VALUES
(53, 'admin', 1, 'Man patiko', '2022-07-28 22:10:34'),
(54, 'admin', 3, 'Prastai', '2022-07-28 22:10:43'),
(55, 'petras', 1, 'Filmas labai labai labai geras', '2022-07-28 22:14:00'),
(56, 'zygis', 1, 'Patiko šis filmas. Geresnis lyginant už visas praeitas serijas', '2022-07-28 22:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(63) DEFAULT NULL,
  `summary` varchar(127) DEFAULT NULL,
  `imdb` varchar(63) DEFAULT NULL,
  `category` varchar(63) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`id`, `user_id`, `title`, `summary`, `imdb`, `category`) VALUES
(45, 1, 'Haris Poteris ir paslapčių kambarys', 'Hariui atostogos pas nedorėlius Durslius buvo liūdnos, užtat Hogvartse laukia nauji pavojai ir naujos mįslės. ', '7.7', 'Fantastika'),
(108, 1, 'Haris Poteris ir Išminties akmuo', 'Haris Poteris - vienuolikmetis našlaitis su akinukais, vargstantis klaikioje dėdės ir tetos Durslių šeimynėlėje.', '7.6', 'Fantastika');

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `title` varchar(63) DEFAULT NULL,
  `summary` varchar(127) DEFAULT NULL,
  `imdb` varchar(63) DEFAULT NULL,
  `category` varchar(127) DEFAULT NULL,
  `reservation` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `comments` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `title`, `summary`, `imdb`, `category`, `reservation`, `image`, `comments`) VALUES
(1, 'Haris Poteris ir Išminties akmuo', 'Haris Poteris - vienuolikmetis našlaitis su akinukais, vargstantis klaikioje dėdės ir tetos Durslių šeimynėlėje.', '7.6', 'Fantastika', 1, 'file:/C:/Users/acer/Pictures/testams/3.PNG', NULL),
(3, 'Haris Poteris ir paslapčių kambarys', 'Hariui atostogos pas nedorėlius Durslius buvo liūdnos, užtat Hogvartse laukia nauji pavojai ir naujos mįslės. ', '7.7', 'Fantastika', 2, 'file:/C:/Users/acer/Pictures/testams/1.png', NULL),
(41, 'Parazitas', 'Bedarbis Kitaekas suklastoja dokumentus ir tamp....', '8.5', 'Tikros istorijos', NULL, 'file:/C:/Users/acer/IdeaProjects/Film-Reservation-System/src/main/resources/files/Null.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(63) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `email` varchar(63) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `admin`) VALUES
(1, 'admin', '$2a$12$OdvVI9dpBfEAUWHuHXCISeKasEb2uMjzwae7YxwBLnqfUPNPLqBKO', 'admin@gmail.com', 1),
(2, 'useris', '$2a$12$767AyOr5ebFvnMwhvBgas.PMKs1BiNgW0ZhqzTkyqupDxR1gV0CoK', 'useris@useris.com', 0),
(3, 'vipas', '$2a$12$R8V2ravDCQ1nqo0dxHAHDOWRkfbMC49zhOPjh77MuWW9mV8yEG6AS', 'vipas@vipas.com', 1),
(9, 'petras', '$2a$12$rEFN01XTBST1Vo6f2BZEmORpVUC924JFPdQnNPmglb8ZluMv998EC', 'petras@gmail.com', 0),
(10, 'zygis', '$2a$12$ytiFsNOrB0ye0s4faAuaveGJZhIpwxDiTVtt28gF6vMW3XhRKIXWK', 'zygis@gmail.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
