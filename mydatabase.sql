-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 07:24 AM
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2021_03_18_080327_products', 1),
(11, '2021_03_18_080431_orders', 1),
(12, '2021_03_18_081023_order_details', 1),
(13, '2021_03_18_081440_supplier', 1),
(14, '2021_03_18_081533_supplier_products', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2', '2021-03-18 09:31:44', '2021-03-18 09:31:51', NULL),
(2, '3', '2021-03-18 09:31:57', '2021-03-21 08:31:27', '2021-03-21 08:31:27'),
(3, '13', '2021-03-18 06:35:37', '2021-03-18 06:35:37', NULL),
(4, '6', '2021-03-21 08:21:28', '2021-03-21 08:21:28', NULL),
(5, '7', '2021-03-21 08:31:35', '2021-03-21 08:31:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2021-03-18 10:17:23', '2021-03-18 10:17:23', NULL),
(2, 2, 3, '2021-03-18 07:21:58', '2021-03-18 07:21:58', NULL),
(3, 4, 7, '2021-03-21 08:19:18', '2021-03-21 08:31:27', '2021-03-21 08:31:27'),
(5, 4, 7, '2021-03-21 08:21:28', '2021-03-21 08:31:21', '2021-03-21 08:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Brian Rakoi', '2021-03-18 10:08:35', '2021-03-19 18:40:42', '2021-03-19 18:40:42'),
(2, 'Victor Mutai', '2021-03-18 10:08:35', '2021-03-18 07:11:52', '2021-03-18 07:11:52'),
(3, 'Michael Coreleone', '2021-03-18 07:11:02', '2021-03-19 18:40:41', '2021-03-19 18:40:41'),
(4, 'Victor Coreleone', '2021-03-18 07:11:13', '2021-03-19 18:40:40', '2021-03-19 18:40:40'),
(5, 'Winnie Auor', '2021-03-19 18:01:24', '2021-03-19 18:39:01', '2021-03-19 18:39:01'),
(6, 'Amina Abi', '2021-03-19 18:01:52', '2021-03-19 18:36:06', '2021-03-19 18:36:06'),
(7, 'John Doe', '2021-03-19 18:02:04', '2021-03-19 18:38:54', '2021-03-19 18:38:54'),
(8, 'TEST', '2021-03-19 18:39:19', '2021-03-19 18:40:39', '2021-03-19 18:40:39'),
(9, 'DJ E', '2021-03-19 18:39:47', '2021-03-19 18:39:50', '2021-03-19 18:39:50'),
(10, 'TESTING ADDITION', '2021-03-19 18:40:00', '2021-03-19 18:40:38', '2021-03-19 18:40:38'),
(11, 'Winnie Auor', '2021-03-19 18:40:04', '2021-03-19 18:40:36', '2021-03-19 18:40:36'),
(12, 'Winnie Auor', '2021-03-19 18:40:06', '2021-03-19 18:40:35', '2021-03-19 18:40:35'),
(13, 'Winnie Auor', '2021-03-19 18:40:09', '2021-03-19 18:40:34', '2021-03-19 18:40:34'),
(14, 'Winnie Auory', '2021-03-19 18:41:00', '2021-03-21 12:22:13', '2021-03-21 12:22:13'),
(15, 'Winnie Auora', '2021-03-19 18:41:05', '2021-03-21 12:18:21', NULL),
(16, 'Elsie Miyoro', '2021-03-21 12:19:06', '2021-03-21 12:19:06', NULL),
(17, 'Sara Jakes', '2021-03-21 12:19:26', '2021-03-21 12:19:26', NULL),
(18, 'Philip Price', '2021-03-21 12:19:36', '2021-03-21 12:19:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_products`
--

CREATE TABLE `supplier_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supply_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_products`
--

INSERT INTO `supplier_products` (`id`, `supply_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-03-18 07:34:20', NULL, NULL),
(2, 1, 3, '2021-03-18 07:34:20', '2021-03-18 07:34:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'brianrakoi@gmail.com', 'brianrakoi@gmail.com', NULL, '$2y$10$ss9xcSV8/C4rsaC4wAzMZ.dnIMr/BvXYHrXC02TUVqucckc6MqinW', '31cmTLCNNzF7BGdQA28SVPT2UNVF1OiYN2SuciWexXgWb0f0U7ZnwKFtrLki', '2021-03-22 03:06:01', '2021-03-22 03:06:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_products_supply_id_foreign` (`supply_id`),
  ADD KEY `supplier_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `supplier_products`
--
ALTER TABLE `supplier_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD CONSTRAINT `supplier_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `supplier_products_supply_id_foreign` FOREIGN KEY (`supply_id`) REFERENCES `suppliers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
