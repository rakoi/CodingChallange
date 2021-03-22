-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 07:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ak 47', 'Better than  AR', '13', '2021-03-18 09:13:14', '2021-03-19 04:49:07', NULL),
(2, 'AR 15', 'Good gun', '3', '2021-03-18 06:14:17', '2021-03-19 17:37:19', '2021-03-19 17:37:19'),
(3, 'ACP 130', 'Good gun', '3', '2021-03-18 06:14:49', '2021-03-19 04:49:55', NULL),
(5, 'Test Test Test', 'Test Description Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Descripti', '2', '2021-03-18 13:25:43', '2021-03-18 13:25:43', NULL),
(6, 'Test Test Test', 'Test Description Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Descripti', '1', '2021-03-18 13:25:43', '2021-03-19 04:51:37', NULL),
(7, 'Test Test Test', 'Test Description Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Descripti', '1', '2021-03-18 13:25:43', '2021-03-19 04:51:34', NULL),
(8, 'Test Test Test', 'Test Description Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Descripti', '1', '2021-03-18 13:25:43', '2021-03-19 05:10:05', '2021-03-19 05:10:05'),
(13, 'Musa', 'MusaMusa', '12', '2021-03-19 06:03:51', '2021-03-19 06:22:09', '2021-03-19 06:22:09'),
(15, 'BRIAN L. RAKOI', 'BRIAN L. RAKOI', '1', '2021-03-19 06:05:31', '2021-03-19 06:05:31', NULL),
(16, 'Test item', 'Just a random test item', '2', '2021-03-21 12:22:49', '2021-03-21 12:22:49', NULL),
(17, 'Mp 5', 'Just a normal Mp5 gun', '2', '2021-03-21 12:24:15', '2021-03-21 12:24:15', NULL),
(18, 'RPG', 'Just a random RPG', '99', '2021-03-21 12:25:13', '2021-03-21 12:25:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
