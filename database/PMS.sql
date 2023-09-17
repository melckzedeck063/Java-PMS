-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2023 at 01:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand_name` varchar(70) NOT NULL,
  `buying_price` int(8) NOT NULL,
  `selling_price` int(8) NOT NULL,
  `quantity` int(5) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `date_expired` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_registered` date NOT NULL DEFAULT current_timestamp(),
  `registered_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_name`, `buying_price`, `selling_price`, `quantity`, `unit`, `date_expired`, `date_registered`, `registered_by`) VALUES
(1, 'Panadol', 'Sheladol', 70, 100, 50, 'pills', '2023-09-14 08:51:02', '2023-09-11', 1),
(2, 'Septrin', 'Sheladol', 65, 100, 30, 'pills', '2023-09-17 10:40:11', '2023-09-11', 1),
(3, 'Diclofenac Gel', 'Sheladol', 3000, 5000, 7, 'Gel', '2023-09-14 08:52:16', '2023-09-11', 1),
(4, 'Sedton syrup', 'Sedton', 3000, 4000, 9, 'solution', '2023-09-17 10:38:27', '2023-09-13', 1),
(5, 'Gofen', 'diclofenac', 700, 1000, 16, 'pills', '2023-09-17 11:02:46', '2023-09-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(70) NOT NULL,
  `brand_name` varchar(70) NOT NULL,
  `price_sold` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold_by` int(11) NOT NULL,
  `date_sold` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `product_name`, `brand_name`, `price_sold`, `quantity`, `sold_by`, `date_sold`) VALUES
(2, 4, 'Sedton syrup', 'Sedton', 4500, 1, 1, '2023-09-17 13:38:27'),
(3, 2, 'Septrin', 'Sheladol', 100, 5, 1, '2023-09-17 13:39:49'),
(4, 5, 'Gofen', 'diclofenac', 1000, 4, 1, '2023-09-17 14:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `date_registered` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `role`, `date_registered`) VALUES
(1, 'Melckzedeck', 'James', 'zedeck063@gmail.com', '0744219981', 'zedeck123', 'admin', '2023-08-31'),
(2, 'Loveness', 'James', 'loveness@gmail.com', '+255778134854', '18c9682703041dad62103e35887e537a', 'employee', '2023-09-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `registered_by` (`registered_by`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
