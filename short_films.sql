-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2021 at 10:30 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `short_films`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `type`, `value`) VALUES
(1, 'Language', 'English'),
(2, 'Genre', 'Action'),
(3, 'Language', 'Hindi'),
(4, 'Genre', 'Comedy'),
(5, 'Language', 'Marathi'),
(6, 'Genre', 'Crime'),
(7, 'Genre', 'Thriller'),
(8, 'Genre', 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `featured_image` int(10) NOT NULL,
  `movie_length` int(10) NOT NULL DEFAULT 0,
  `movie_release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `featured_image`, `movie_length`, `movie_release_date`) VALUES
(1, 'Jurassic World', 'A movie about dinosaurs', 1, 90, '2015-06-14'),
(2, 'Kick', 'Salman Khan movie', 2, 120, '2014-04-15'),
(3, 'Mission Impossible 3', 'Tom Cruise movie', 3, 200, '2008-10-12'),
(4, 'Sinhasan', ' The film is based on two novels - one of the same name and the other named Mumbai Dinank by writer and freelance journalist Arun Sadhu. The cast of the film included Nilu Phule, Arun Sarnaik, Shriram Lagoo, Mohan Agashe, Reema Lagoo, Nana Patekar, Usha N', 4, 250, '1981-07-22'),
(5, 'Kahaani', 'It stars Vidya Balan as Vidya Bagchi, a pregnant woman searching for her missing husband in Kolkata during the festival of Durga Puja, assisted by Satyoki \"Rana\" Sinha (Parambrata Chatterjee) and Khan (Nawazuddin Siddiqui).', 5, 122, '2012-06-19'),
(6, 'Johnny English Strikes Again', 'A sequel to Johnny English Reborn (2011), it is the third and final instalment of the Johnny English series. The film stars Rowan Atkinson in the title role, alongside Ben Miller, Olga Kurylenko, Jake Lacy and Emma Thompson. The film follows the titular M', 6, 89, '2020-09-09'),
(7, 'Natsamrat', 'Indian Marathi-language drama film starring Nana Patekar in the leading role. Based on a play by the same written by playwright Kusumagraj, the film depicts the tragic family life of a stage actor who has retired from acting but is unable to forget his fo', 7, 166, '2015-03-30'),
(8, 'Pink', 'The film is produced by Rising Sun Films on a total budget of ₹30 crore, with screenplay by Shah and music composition by Shantanu Moitra and Anupam Roy.[4] Pink features an ensemble cast, which includes Amitabh Bachchan, Taapsee Pannu, Kirti Kulhari, And', 8, 136, '2016-08-16'),
(9, 'Valkyrie', 'The film is set in Nazi Germany during World War II and depicts the 20 July plot in 1944 by German army officers to assassinate Adolf Hitler and to use the Operation Valkyrie national emergency plan to take control of the country. The film was released by', 9, 121, '2008-01-01'),
(10, 'Black Friday', 'Based on Black Friday: The True Story of the Bombay Bomb Blasts, a book by Hussain Zaidi about the 1993 Bombay bombings, it chronicles the events that led to the blasts and the subsequent police investigation. Produced by Arindam Mitra of Mid-Day, the fil', 10, 167, '2004-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `movie_images`
--

CREATE TABLE `movie_images` (
  `id` int(10) NOT NULL,
  `movie_image_path` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_images`
--

INSERT INTO `movie_images` (`id`, `movie_image_path`) VALUES
(1, 'movie_images/mov01.jpg'),
(2, 'movie_images/mov02.jpg'),
(3, 'movie_images/mov03.jpg'),
(4, 'movie_images/mov4.jpg'),
(5, 'movie_images/mov05.jpg'),
(6, 'movie_images/mov06.jpg'),
(7, 'movie_images/mov07.jpg'),
(8, 'movie_images/mov08.jpg'),
(9, 'movie_images/mov09.jpg'),
(10, 'movie_images/mov10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE `relationship` (
  `id` int(10) NOT NULL,
  `movie_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`id`, `movie_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 1),
(6, 3, 2),
(7, 4, 5),
(8, 4, 8),
(9, 5, 7),
(10, 5, 3),
(11, 6, 1),
(12, 6, 4),
(13, 7, 5),
(14, 7, 8),
(15, 8, 3),
(16, 8, 6),
(17, 9, 1),
(18, 9, 7),
(19, 10, 3),
(20, 10, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_images`
--
ALTER TABLE `movie_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relationship`
--
ALTER TABLE `relationship`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movie_images`
--
ALTER TABLE `movie_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `relationship`
--
ALTER TABLE `relationship`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
