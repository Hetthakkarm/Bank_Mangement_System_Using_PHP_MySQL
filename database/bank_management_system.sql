-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2026 at 07:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `open_date` date NOT NULL,
  `status` enum('active','frozen','closed') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_number`, `branch_id`, `account_type_id`, `open_date`, `status`, `created_at`) VALUES
(31, '100000000001', 1, 4, '2024-01-10', 'active', '2026-04-10 15:29:29'),
(32, '100000000002', 2, 5, '2024-01-12', 'active', '2026-04-10 15:29:29'),
(33, '100000000004', 33, 7, '2024-01-16', 'active', '2026-04-10 15:29:29'),
(34, '100000000005', 34, 8, '2024-01-18', 'active', '2026-04-10 15:29:29'),
(35, '100000000006', 35, 9, '2024-01-20', 'active', '2026-04-10 15:29:29'),
(36, '100000000007', 36, 10, '2024-01-22', 'active', '2026-04-10 15:29:29'),
(37, '100000000008', 37, 11, '2024-01-24', 'active', '2026-04-10 15:29:29'),
(38, '100000000009', 38, 12, '2024-01-26', 'active', '2026-04-10 15:29:29'),
(39, '100000000010', 39, 13, '2024-01-28', 'active', '2026-04-10 15:29:29'),
(40, '100000000011', 40, 14, '2024-02-01', 'active', '2026-04-10 15:29:29'),
(41, '100000000012', 41, 15, '2024-02-03', 'active', '2026-04-10 15:29:29'),
(42, '100000000013', 42, 16, '2024-02-05', 'active', '2026-04-10 15:29:29'),
(43, '100000000014', 43, 17, '2024-02-07', 'active', '2026-04-10 15:29:29'),
(44, '100000000015', 44, 18, '2024-02-09', 'active', '2026-04-10 15:29:29'),
(45, '100000000016', 45, 19, '2024-02-11', 'active', '2026-04-10 15:29:29'),
(46, '100000000017', 46, 20, '2024-02-13', 'active', '2026-04-10 15:29:29'),
(47, '100000000018', 47, 21, '2024-02-15', 'active', '2026-04-10 15:29:29'),
(48, '100000000019', 48, 22, '2024-02-17', 'active', '2026-04-10 15:29:29'),
(49, '100000000020', 49, 23, '2024-02-19', 'active', '2026-04-10 15:29:29'),
(50, '100000000021', 50, 24, '2024-02-21', 'active', '2026-04-10 15:29:29'),
(51, '100000000022', 51, 25, '2024-02-23', 'active', '2026-04-10 15:29:29'),
(52, '100000000023', 52, 26, '2024-02-25', 'active', '2026-04-10 15:29:29'),
(53, '100000000024', 53, 27, '2024-02-27', 'active', '2026-04-10 15:29:29'),
(54, '100000000025', 54, 28, '2024-03-01', 'active', '2026-04-10 15:29:29'),
(55, '100000000026', 55, 29, '2024-03-03', 'active', '2026-04-10 15:29:29'),
(56, '100000000027', 56, 30, '2024-03-05', 'active', '2026-04-10 15:29:29'),
(57, '100000000028', 57, 31, '2024-03-07', 'active', '2026-04-10 15:29:29'),
(58, '100000000029', 58, 32, '2024-03-09', 'active', '2026-04-10 15:29:29'),
(59, '100000000030', 59, 33, '2024-03-11', 'active', '2026-04-10 15:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `account_holders`
--

CREATE TABLE `account_holders` (
  `account_holder_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `holder_role` enum('primary','joint','guardian') NOT NULL DEFAULT 'primary',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_holders`
--

INSERT INTO `account_holders` (`account_holder_id`, `account_id`, `customer_id`, `holder_role`, `added_at`) VALUES
(31, 31, 1, 'primary', '2026-04-10 15:36:13'),
(32, 32, 2, 'primary', '2026-04-10 15:36:13'),
(33, 33, 4, 'primary', '2026-04-10 15:36:13'),
(34, 34, 5, 'primary', '2026-04-10 15:36:13'),
(35, 35, 6, 'primary', '2026-04-10 15:36:13'),
(36, 36, 7, 'primary', '2026-04-10 15:36:13'),
(37, 37, 8, 'primary', '2026-04-10 15:36:13'),
(38, 38, 9, 'primary', '2026-04-10 15:36:13'),
(39, 39, 10, 'primary', '2026-04-10 15:36:13'),
(40, 40, 11, 'primary', '2026-04-10 15:36:13'),
(41, 41, 12, 'primary', '2026-04-10 15:36:13'),
(42, 42, 13, 'primary', '2026-04-10 15:36:13'),
(43, 43, 14, 'primary', '2026-04-10 15:36:13'),
(44, 44, 15, 'primary', '2026-04-10 15:36:13'),
(45, 45, 16, 'primary', '2026-04-10 15:36:13'),
(46, 46, 17, 'primary', '2026-04-10 15:36:13'),
(47, 47, 18, 'primary', '2026-04-10 15:36:13'),
(48, 48, 19, 'primary', '2026-04-10 15:36:13'),
(49, 49, 20, 'primary', '2026-04-10 15:36:13'),
(50, 50, 21, 'primary', '2026-04-10 15:36:13'),
(51, 51, 22, 'primary', '2026-04-10 15:36:13'),
(52, 52, 23, 'primary', '2026-04-10 15:36:13'),
(53, 53, 24, 'primary', '2026-04-10 15:36:13'),
(54, 54, 25, 'primary', '2026-04-10 15:36:13'),
(55, 55, 26, 'primary', '2026-04-10 15:36:13'),
(56, 56, 27, 'primary', '2026-04-10 15:36:13'),
(57, 57, 28, 'primary', '2026-04-10 15:36:13'),
(58, 58, 29, 'primary', '2026-04-10 15:36:13'),
(59, 59, 30, 'primary', '2026-04-10 15:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `account_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `minimum_balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `interest_rate` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`account_type_id`, `type_name`, `minimum_balance`, `interest_rate`) VALUES
(1, 'Savings', 1000.00, 3.50),
(2, 'Current', 0.00, 0.00),
(3, 'Fixed Deposit', 5000.00, 6.75),
(4, 'Savings Basic', 1000.00, 3.50),
(5, 'Savings Premium', 5000.00, 4.00),
(6, 'Savings Salary', 0.00, 3.00),
(7, 'Savings Women', 1000.00, 3.75),
(8, 'Savings Senior Citizen', 1000.00, 4.25),
(9, 'Savings Student', 500.00, 2.75),
(10, 'Current Standard', 0.00, 0.00),
(11, 'Current Business', 10000.00, 0.00),
(12, 'Current Merchant', 15000.00, 0.00),
(13, 'Current Professional', 5000.00, 0.00),
(14, 'Fixed Deposit 1 Year', 5000.00, 6.75),
(15, 'Fixed Deposit 3 Year', 5000.00, 7.10),
(16, 'Fixed Deposit 5 Year', 5000.00, 7.25),
(17, 'Recurring Deposit Monthly', 500.00, 6.50),
(18, 'NRE Savings', 1000.00, 3.25),
(19, 'NRO Savings', 1000.00, 3.25),
(20, 'Salary Gold', 0.00, 3.20),
(21, 'Salary Platinum', 0.00, 3.40),
(22, 'Kids Savings', 500.00, 3.10),
(23, 'Jan Dhan Savings', 0.00, 2.50),
(24, 'Agri Current', 0.00, 0.00),
(25, 'MSME Current', 10000.00, 0.00),
(26, 'Corporate Current', 25000.00, 0.00),
(27, 'Diamond Savings', 10000.00, 4.10),
(28, 'Wealth Savings', 25000.00, 4.35),
(29, 'Holiday Savings', 1000.00, 3.60),
(30, 'Pension Savings', 500.00, 3.80),
(31, 'Health Savings', 1000.00, 3.55),
(32, 'Startup Current', 5000.00, 0.00),
(33, 'Digital Savings', 1000.00, 3.45);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `branch_code` varchar(20) NOT NULL,
  `branch_name` varchar(120) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `ifsc_prefix` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_code`, `branch_name`, `city`, `state`, `ifsc_prefix`, `phone`, `address_line`, `created_at`) VALUES
(1, 'BR001', 'Central City Branch', 'Ahmedabad', 'Gujarat', 'BKMS0001', '9876500001', '12 Riverfront Road', '2026-04-10 13:40:50'),
(2, 'BR002', 'North Market Branch', 'Surat', 'Gujarat', 'BKMS0002', '9876500002', '45 Market Street', '2026-04-10 13:40:50'),
(33, 'BR004', 'Rajkot Branch', 'Rajkot', 'Gujarat', 'BMS0001004', '9876500004', '', '2026-04-10 15:15:03'),
(34, 'BR005', 'Mumbai Fort Branch', 'Mumbai', 'Maharashtra', 'BMS0001005', '9876500005', '', '2026-04-10 15:15:03'),
(35, 'BR006', 'Pune Camp Branch', 'Pune', 'Maharashtra', 'BMS0001006', '9876500006', '', '2026-04-10 15:15:03'),
(36, 'BR007', 'Nagpur Branch', 'Nagpur', 'Maharashtra', 'BMS0001007', '9876500007', '', '2026-04-10 15:15:03'),
(37, 'BR008', 'Nashik Branch', 'Nashik', 'Maharashtra', 'BMS0001008', '9876500008', '', '2026-04-10 15:15:03'),
(38, 'BR009', 'Jaipur Branch', 'Jaipur', 'Rajasthan', 'BMS0001009', '9876500009', '', '2026-04-10 15:15:03'),
(39, 'BR010', 'Udaipur Branch', 'Udaipur', 'Rajasthan', 'BMS0001010', '9876500010', '', '2026-04-10 15:15:03'),
(40, 'BR011', 'Delhi Connaught Branch', 'New Delhi', 'Delhi', 'BMS0001011', '9876500011', '', '2026-04-10 15:15:03'),
(41, 'BR012', 'Noida Branch', 'Noida', 'Uttar Pradesh', 'BMS0001012', '9876500012', '', '2026-04-10 15:15:03'),
(42, 'BR013', 'Lucknow Branch', 'Lucknow', 'Uttar Pradesh', 'BMS0001013', '9876500013', '', '2026-04-10 15:15:03'),
(43, 'BR014', 'Kanpur Branch', 'Kanpur', 'Uttar Pradesh', 'BMS0001014', '9876500014', '', '2026-04-10 15:15:03'),
(44, 'BR015', 'Indore Branch', 'Indore', 'Madhya Pradesh', 'BMS0001015', '9876500015', '', '2026-04-10 15:15:03'),
(45, 'BR016', 'Bhopal Branch', 'Bhopal', 'Madhya Pradesh', 'BMS0001016', '9876500016', '', '2026-04-10 15:15:03'),
(46, 'BR017', 'Kolkata Branch', 'Kolkata', 'West Bengal', 'BMS0001017', '9876500017', '', '2026-04-10 15:15:03'),
(47, 'BR018', 'Howrah Branch', 'Howrah', 'West Bengal', 'BMS0001018', '9876500018', '', '2026-04-10 15:15:03'),
(48, 'BR019', 'Chennai T Nagar Branch', 'Chennai', 'Tamil Nadu', 'BMS0001019', '9876500019', '', '2026-04-10 15:15:03'),
(49, 'BR020', 'Coimbatore Branch', 'Coimbatore', 'Tamil Nadu', 'BMS0001020', '9876500020', '', '2026-04-10 15:15:03'),
(50, 'BR021', 'Bengaluru MG Road Branch', 'Bengaluru', 'Karnataka', 'BMS0001021', '9876500021', '', '2026-04-10 15:15:03'),
(51, 'BR022', 'Mysuru Branch', 'Mysuru', 'Karnataka', 'BMS0001022', '9876500022', '', '2026-04-10 15:15:03'),
(52, 'BR023', 'Hyderabad Branch', 'Hyderabad', 'Telangana', 'BMS0001023', '9876500023', '', '2026-04-10 15:15:03'),
(53, 'BR024', 'Warangal Branch', 'Warangal', 'Telangana', 'BMS0001024', '9876500024', '', '2026-04-10 15:15:03'),
(54, 'BR025', 'Kochi Branch', 'Kochi', 'Kerala', 'BMS0001025', '9876500025', '', '2026-04-10 15:15:03'),
(55, 'BR026', 'Thiruvananthapuram Branch', 'Thiruvananthapuram', 'Kerala', 'BMS0001026', '9876500026', '', '2026-04-10 15:15:03'),
(56, 'BR027', 'Patna Branch', 'Patna', 'Bihar', 'BMS0001027', '9876500027', '', '2026-04-10 15:15:03'),
(57, 'BR028', 'Bhubaneswar Branch', 'Bhubaneswar', 'Odisha', 'BMS0001028', '9876500028', '', '2026-04-10 15:15:03'),
(58, 'BR029', 'Chandigarh Branch', 'Chandigarh', 'Chandigarh', 'BMS0001029', '9876500029', '', '2026-04-10 15:15:03'),
(59, 'BR030', 'Guwahati Branch', 'Guwahati', 'Assam', 'BMS0001030', '9876500030', '', '2026-04-10 15:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_code` varchar(20) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `id_type` varchar(50) NOT NULL,
  `id_number` varchar(100) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_code`, `first_name`, `last_name`, `date_of_birth`, `gender`, `phone`, `email`, `id_type`, `id_number`, `address_line`, `city`, `state`, `postal_code`, `status`, `created_at`) VALUES
(1, 'CUS001', 'Rakesh', 'Patel', '1988-04-14', 'male', '9102200001', 'rakesh.patel@gmail.com', 'Aadhaar', '421100000001', '12 Navrang Society', 'Ahmedabad', 'Gujarat', '380009', 'active', '2026-04-10 15:25:23'),
(2, 'CUS002', 'Mahesh', 'Shah', '1990-06-21', 'male', '9102200002', 'mahesh.shah@gmail.com', 'PAN', 'AHXPS1001K', 'Surya Residency', 'Surat', 'Gujarat', '395003', 'active', '2026-04-10 15:25:23'),
(3, 'CUS003', 'Nilesh', 'Mehta', '1985-07-11', 'male', '9102200003', 'nilesh.mehta@gmail.com', 'Aadhaar', '421100000003', 'Akota Main Road', 'Vadodara', 'Gujarat', '390020', 'active', '2026-04-10 15:25:23'),
(4, 'CUS004', 'Kiran', 'Joshi', '1992-01-18', 'male', '9102200004', 'kiran.joshi@gmail.com', 'PAN', 'AHXPS1002K', 'Race Course Road', 'Rajkot', 'Gujarat', '360001', 'active', '2026-04-10 15:25:23'),
(5, 'CUS005', 'Suresh', 'Iyer', '1987-08-09', 'male', '9102200005', 'suresh.iyer@gmail.com', 'Aadhaar', '421100000005', 'Dadar West', 'Mumbai', 'Maharashtra', '400028', 'active', '2026-04-10 15:25:23'),
(6, 'CUS006', 'Deepak', 'Nair', '1991-09-22', 'male', '9102200006', 'deepak.nair@gmail.com', 'PAN', 'AHXPS1003K', 'FC Road', 'Pune', 'Maharashtra', '411004', 'active', '2026-04-10 15:25:23'),
(7, 'CUS007', 'Manoj', 'Kulkarni', '1986-12-15', 'male', '9102200007', 'manoj.kulkarni@gmail.com', 'Aadhaar', '421100000007', 'Civil Lines', 'Nagpur', 'Maharashtra', '440001', 'active', '2026-04-10 15:25:23'),
(8, 'CUS008', 'Pravin', 'Reddy', '1993-10-04', 'male', '9102200008', 'pravin.reddy@gmail.com', 'PAN', 'AHXPS1004K', 'College Road', 'Nashik', 'Maharashtra', '422005', 'active', '2026-04-10 15:25:23'),
(9, 'CUS009', 'Mukesh', 'Verma', '1989-03-27', 'male', '9102200009', 'mukesh.verma@gmail.com', 'Aadhaar', '421100000009', 'Malviya Nagar', 'Jaipur', 'Rajasthan', '302017', 'active', '2026-04-10 15:25:23'),
(10, 'CUS010', 'Gaurav', 'Bansal', '1994-05-13', 'male', '9102200010', 'gaurav.bansal@gmail.com', 'PAN', 'AHXPS1005K', 'Fateh Sagar Road', 'Udaipur', 'Rajasthan', '313001', 'active', '2026-04-10 15:25:23'),
(11, 'CUS011', 'Asha', 'Patel', '1995-02-17', 'female', '9102200011', 'asha.patel@gmail.com', 'Aadhaar', '421100000011', 'Lajpat Nagar', 'New Delhi', 'Delhi', '110024', 'active', '2026-04-10 15:25:23'),
(12, 'CUS012', 'Nisha', 'Sharma', '1996-04-20', 'female', '9102200012', 'nisha.sharma@gmail.com', 'PAN', 'AHXPS1006K', 'Sector 62', 'Noida', 'Uttar Pradesh', '201309', 'active', '2026-04-10 15:25:23'),
(13, 'CUS013', 'Pallavi', 'Gupta', '1991-11-29', 'female', '9102200013', 'pallavi.gupta@gmail.com', 'Aadhaar', '421100000013', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', '226010', 'active', '2026-04-10 15:25:23'),
(14, 'CUS014', 'Ritu', 'Yadav', '1993-06-16', 'female', '9102200014', 'ritu.yadav@gmail.com', 'PAN', 'AHXPS1007K', 'Swaroop Nagar', 'Kanpur', 'Uttar Pradesh', '208002', 'active', '2026-04-10 15:25:23'),
(15, 'CUS015', 'Shweta', 'Mishra', '1988-01-30', 'female', '9102200015', 'shweta.mishra@gmail.com', 'Aadhaar', '421100000015', 'Vijay Nagar', 'Indore', 'Madhya Pradesh', '452010', 'active', '2026-04-10 15:25:23'),
(16, 'CUS016', 'Komal', 'Rao', '1990-09-12', 'female', '9102200016', 'komal.rao@gmail.com', 'PAN', 'AHXPS1008K', 'Arera Colony', 'Bhopal', 'Madhya Pradesh', '462016', 'active', '2026-04-10 15:25:23'),
(17, 'CUS017', 'Mousumi', 'Chatterjee', '1987-07-19', 'female', '9102200017', 'mousumi.chatterjee@gmail.com', 'Aadhaar', '421100000017', 'Salt Lake', 'Kolkata', 'West Bengal', '700091', 'active', '2026-04-10 15:25:23'),
(18, 'CUS018', 'Tumpa', 'Mukherjee', '1994-03-05', 'female', '9102200018', 'tumpa.mukherjee@gmail.com', 'PAN', 'AHXPS1009K', 'Belur Math Road', 'Howrah', 'West Bengal', '711202', 'active', '2026-04-10 15:25:23'),
(19, 'CUS019', 'Revathi', 'Subramanian', '1992-08-24', 'female', '9102200019', 'revathi.subramanian@gmail.com', 'Aadhaar', '421100000019', 'T Nagar', 'Chennai', 'Tamil Nadu', '600017', 'active', '2026-04-10 15:25:23'),
(20, 'CUS020', 'Bhavya', 'Krishnan', '1995-10-10', 'female', '9102200020', 'bhavya.krishnan@gmail.com', 'PAN', 'AHXPS1010K', 'RS Puram', 'Coimbatore', 'Tamil Nadu', '641002', 'active', '2026-04-10 15:25:23'),
(21, 'CUS021', 'Lakshmi', 'Hegde', '1989-12-01', 'female', '9102200021', 'lakshmi.hegde@gmail.com', 'Aadhaar', '421100000021', 'MG Road', 'Bengaluru', 'Karnataka', '560001', 'active', '2026-04-10 15:25:23'),
(22, 'CUS022', 'Aparna', 'Shetty', '1993-02-14', 'female', '9102200022', 'aparna.shetty@gmail.com', 'PAN', 'AHXPS1011K', 'VV Mohalla', 'Mysuru', 'Karnataka', '570002', 'active', '2026-04-10 15:25:23'),
(23, 'CUS023', 'Sravani', 'Reddy', '1991-05-26', 'female', '9102200023', 'sravani.reddy@gmail.com', 'Aadhaar', '421100000023', 'Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'active', '2026-04-10 15:25:23'),
(24, 'CUS024', 'Harika', 'Naidu', '1994-07-07', 'female', '9102200024', 'harika.naidu@gmail.com', 'PAN', 'AHXPS1012K', 'Hanamkonda', 'Warangal', 'Telangana', '506001', 'active', '2026-04-10 15:25:23'),
(25, 'CUS025', 'Anjali', 'Menon', '1988-11-18', 'female', '9102200025', 'anjali.menon@gmail.com', 'Aadhaar', '421100000025', 'Marine Drive', 'Kochi', 'Kerala', '682031', 'active', '2026-04-10 15:25:23'),
(26, 'CUS026', 'Divya', 'Pillai', '1996-01-22', 'female', '9102200026', 'divya.pillai@gmail.com', 'PAN', 'AHXPS1013K', 'Kowdiar', 'Thiruvananthapuram', 'Kerala', '695003', 'active', '2026-04-10 15:25:23'),
(27, 'CUS027', 'Poonam', 'Sinha', '1992-03-09', 'female', '9102200027', 'poonam.sinha@gmail.com', 'Aadhaar', '421100000027', 'Boring Road', 'Patna', 'Bihar', '800001', 'active', '2026-04-10 15:25:23'),
(28, 'CUS028', 'Madhumita', 'Das', '1990-06-28', 'female', '9102200028', 'madhumita.das@gmail.com', 'PAN', 'AHXPS1014K', 'Jaydev Vihar', 'Bhubaneswar', 'Odisha', '751013', 'active', '2026-04-10 15:25:23'),
(29, 'CUS029', 'Tanisha', 'Arora', '1995-09-03', 'female', '9102200029', 'tanisha.arora@gmail.com', 'Aadhaar', '421100000029', 'Sector 17', 'Chandigarh', 'Chandigarh', '160017', 'active', '2026-04-10 15:25:23'),
(30, 'CUS030', 'Riniki', 'Saikia', '1993-12-19', 'female', '9102200030', 'riniki.saikia@gmail.com', 'PAN', 'AHXPS1015K', 'GS Road', 'Guwahati', 'Assam', '781005', 'active', '2026-04-10 15:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_code` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `hire_date` date NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_code`, `branch_id`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `hire_date`, `status`, `created_at`) VALUES
(61, 'EMP001', 1, 64, 'Aarav', 'Patel', 'aarav.patel@bankms.in', '9011100001', '2023-01-10', 'active', '2026-04-10 15:26:01'),
(62, 'EMP002', 2, 65, 'Vivaan', 'Shah', 'vivaan.shah@bankms.in', '9011100002', '2023-01-12', 'active', '2026-04-10 15:26:01'),
(63, 'EMP004', 33, 67, 'Krishna', 'Joshi', 'krishna.joshi@bankms.in', '9011100004', '2023-01-16', 'active', '2026-04-10 15:26:01'),
(64, 'EMP005', 34, 68, 'Arjun', 'Iyer', 'arjun.iyer@bankms.in', '9011100005', '2023-01-18', 'active', '2026-04-10 15:26:01'),
(65, 'EMP006', 35, 69, 'Sai', 'Nair', 'sai.nair@bankms.in', '9011100006', '2023-01-20', 'active', '2026-04-10 15:26:01'),
(66, 'EMP007', 36, 70, 'Rohan', 'Kulkarni', 'rohan.kulkarni@bankms.in', '9011100007', '2023-01-22', 'active', '2026-04-10 15:26:01'),
(67, 'EMP008', 37, 3, 'Karthik', 'Reddy', 'karthik.reddy@bankms.in', '9011100008', '2023-01-24', 'active', '2026-04-10 15:26:01'),
(68, 'EMP009', 38, 71, 'Rahul', 'Verma', 'rahul.verma@bankms.in', '9011100009', '2023-01-26', 'active', '2026-04-10 15:26:01'),
(69, 'EMP010', 39, 72, 'Siddharth', 'Bansal', 'siddharth.bansal@bankms.in', '9011100010', '2023-01-28', 'active', '2026-04-10 15:26:01'),
(70, 'EMP011', 40, 73, 'Ananya', 'Patel', 'ananya.patel@bankms.in', '9011100011', '2023-02-01', 'active', '2026-04-10 15:26:01'),
(71, 'EMP012', 41, 74, 'Diya', 'Sharma', 'diya.sharma@bankms.in', '9011100012', '2023-02-03', 'active', '2026-04-10 15:26:01'),
(72, 'EMP013', 42, 75, 'Ishita', 'Gupta', 'ishita.gupta@bankms.in', '9011100013', '2023-02-05', 'active', '2026-04-10 15:26:01'),
(73, 'EMP014', 43, 76, 'Sneha', 'Yadav', 'sneha.yadav@bankms.in', '9011100014', '2023-02-07', 'active', '2026-04-10 15:26:01'),
(74, 'EMP015', 44, 77, 'Pooja', 'Mishra', 'pooja.mishra@bankms.in', '9011100015', '2023-02-09', 'active', '2026-04-10 15:26:01'),
(75, 'EMP016', 45, 78, 'Kavya', 'Rao', 'kavya.rao@bankms.in', '9011100016', '2023-02-11', 'active', '2026-04-10 15:26:01'),
(76, 'EMP017', 46, 79, 'Meera', 'Chatterjee', 'meera.chatterjee@bankms.in', '9011100017', '2023-02-13', 'active', '2026-04-10 15:26:01'),
(77, 'EMP018', 47, 80, 'Priya', 'Mukherjee', 'priya.mukherjee@bankms.in', '9011100018', '2023-02-15', 'active', '2026-04-10 15:26:01'),
(78, 'EMP019', 48, 81, 'Nandini', 'Subramanian', 'nandini.subramanian@bankms.in', '9011100019', '2023-02-17', 'active', '2026-04-10 15:26:01'),
(79, 'EMP020', 49, 82, 'Harini', 'Krishnan', 'harini.krishnan@bankms.in', '9011100020', '2023-02-19', 'active', '2026-04-10 15:26:01'),
(80, 'EMP021', 50, 83, 'Lakshmi', 'Hegde', 'lakshmi.hegde@bankms.in', '9011100021', '2023-02-21', 'active', '2026-04-10 15:26:01'),
(81, 'EMP022', 51, 84, 'Sanjana', 'Shetty', 'sanjana.shetty@bankms.in', '9011100022', '2023-02-23', 'active', '2026-04-10 15:26:01'),
(82, 'EMP023', 52, 85, 'Keerthi', 'Reddy', 'keerthi.reddy@bankms.in', '9011100023', '2023-02-25', 'active', '2026-04-10 15:26:01'),
(83, 'EMP024', 53, 86, 'Bhavana', 'Naidu', 'bhavana.naidu@bankms.in', '9011100024', '2023-02-27', 'active', '2026-04-10 15:26:01'),
(84, 'EMP025', 54, 87, 'Akhila', 'Menon', 'akhila.menon@bankms.in', '9011100025', '2023-03-01', 'active', '2026-04-10 15:26:01'),
(85, 'EMP026', 55, 88, 'Neha', 'Pillai', 'neha.pillai@bankms.in', '9011100026', '2023-03-03', 'active', '2026-04-10 15:26:01'),
(86, 'EMP027', 56, 89, 'Ritu', 'Sinha', 'ritu.sinha@bankms.in', '9011100027', '2023-03-05', 'active', '2026-04-10 15:26:01'),
(87, 'EMP028', 57, 90, 'Shruti', 'Das', 'shruti.das@bankms.in', '9011100028', '2023-03-07', 'active', '2026-04-10 15:26:01'),
(88, 'EMP029', 58, 91, 'Tanvi', 'Arora', 'tanvi.arora@bankms.in', '9011100029', '2023-03-09', 'active', '2026-04-10 15:26:01'),
(89, 'EMP030', 59, 92, 'Mitali', 'Saikia', 'mitali.saikia@bankms.in', '9011100030', '2023-03-11', 'active', '2026-04-10 15:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `loan_number` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `principal_amount` decimal(12,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `tenure_months` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `status` enum('pending','approved','active','closed','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `loan_number`, `customer_id`, `branch_id`, `loan_type_id`, `approved_by`, `principal_amount`, `interest_rate`, `tenure_months`, `start_date`, `status`, `created_at`) VALUES
(1, 'LOAN001', 1, 1, 4, NULL, 850000.00, 8.50, 180, '2024-01-10', 'approved', '2026-04-10 15:32:36'),
(2, 'LOAN002', 2, 2, 5, NULL, 900000.00, 8.75, 180, '2024-01-12', 'approved', '2026-04-10 15:32:36'),
(3, 'LOAN004', 4, 33, 7, NULL, 400000.00, 8.10, 72, '2024-01-16', 'approved', '2026-04-10 15:32:36'),
(4, 'LOAN005', 5, 34, 8, NULL, 300000.00, 12.00, 36, '2024-01-18', 'approved', '2026-04-10 15:32:36'),
(5, 'LOAN006', 6, 35, 9, NULL, 350000.00, 13.00, 36, '2024-01-20', 'approved', '2026-04-10 15:32:36'),
(6, 'LOAN007', 7, 36, 10, NULL, 700000.00, 9.10, 60, '2024-01-22', 'approved', '2026-04-10 15:32:36'),
(7, 'LOAN008', 8, 37, 11, NULL, 95000.00, 10.50, 24, '2024-01-24', 'approved', '2026-04-10 15:32:36'),
(8, 'LOAN009', 9, 38, 12, NULL, 180000.00, 11.20, 18, '2024-01-26', 'approved', '2026-04-10 15:32:36'),
(9, 'LOAN010', 10, 39, 13, NULL, 200000.00, 11.80, 18, '2024-01-28', 'approved', '2026-04-10 15:32:36'),
(10, 'LOAN011', 11, 40, 14, NULL, 450000.00, 10.25, 48, '2024-02-01', 'approved', '2026-04-10 15:32:36'),
(11, 'LOAN012', 12, 41, 15, NULL, 500000.00, 10.75, 48, '2024-02-03', 'approved', '2026-04-10 15:32:36'),
(12, 'LOAN013', 13, 42, 16, NULL, 120000.00, 7.00, 12, '2024-02-05', 'approved', '2026-04-10 15:32:36'),
(13, 'LOAN014', 14, 43, 17, NULL, 240000.00, 8.20, 24, '2024-02-07', 'approved', '2026-04-10 15:32:36'),
(14, 'LOAN015', 15, 44, 18, NULL, 650000.00, 11.50, 60, '2024-02-09', 'approved', '2026-04-10 15:32:36'),
(15, 'LOAN016', 16, 45, 19, NULL, 550000.00, 10.40, 48, '2024-02-11', 'approved', '2026-04-10 15:32:36'),
(16, 'LOAN017', 17, 46, 20, NULL, 580000.00, 10.40, 48, '2024-02-13', 'approved', '2026-04-10 15:32:36'),
(17, 'LOAN018', 18, 47, 21, NULL, 275000.00, 12.60, 24, '2024-02-15', 'approved', '2026-04-10 15:32:36'),
(18, 'LOAN019', 19, 48, 22, NULL, 320000.00, 12.90, 24, '2024-02-17', 'approved', '2026-04-10 15:32:36'),
(19, 'LOAN020', 20, 49, 23, NULL, 110000.00, 13.20, 12, '2024-02-19', 'approved', '2026-04-10 15:32:36'),
(20, 'LOAN021', 21, 50, 24, NULL, 420000.00, 8.30, 48, '2024-02-21', 'approved', '2026-04-10 15:32:36'),
(21, 'LOAN022', 22, 51, 25, NULL, 650000.00, 8.70, 60, '2024-02-23', 'approved', '2026-04-10 15:32:36'),
(22, 'LOAN023', 23, 52, 26, NULL, 500000.00, 9.25, 48, '2024-02-25', 'approved', '2026-04-10 15:32:36'),
(23, 'LOAN024', 24, 53, 27, NULL, 750000.00, 11.10, 60, '2024-02-27', 'approved', '2026-04-10 15:32:36'),
(24, 'LOAN025', 25, 54, 28, NULL, 950000.00, 9.90, 84, '2024-03-01', 'approved', '2026-04-10 15:32:36'),
(25, 'LOAN026', 26, 55, 29, NULL, 300000.00, 9.15, 36, '2024-03-03', 'approved', '2026-04-10 15:32:36'),
(26, 'LOAN027', 27, 56, 30, NULL, 220000.00, 13.50, 24, '2024-03-05', 'approved', '2026-04-10 15:32:36'),
(27, 'LOAN028', 28, 57, 31, NULL, 260000.00, 7.80, 36, '2024-03-07', 'approved', '2026-04-10 15:32:36'),
(28, 'LOAN029', 29, 58, 32, NULL, 175000.00, 10.20, 18, '2024-03-09', 'approved', '2026-04-10 15:32:36'),
(29, 'LOAN030', 30, 59, 33, NULL, 390000.00, 9.60, 30, '2024-03-11', 'approved', '2026-04-10 15:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `loan_payment_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `installment_no` int(11) NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `paid_on` date NOT NULL,
  `received_by` int(11) NOT NULL,
  `reference_no` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`loan_payment_id`, `loan_id`, `installment_no`, `amount_paid`, `paid_on`, `received_by`, `reference_no`, `created_at`) VALUES
(31, 1, 1, 12500.00, '2024-04-10', 61, 'LPMT0001', '2026-04-10 15:43:57'),
(32, 2, 1, 13000.00, '2024-04-12', 62, 'LPMT0002', '2026-04-10 15:43:57'),
(33, 3, 1, 7200.00, '2024-04-16', 63, 'LPMT0004', '2026-04-10 15:43:57'),
(34, 4, 1, 9800.00, '2024-04-18', 64, 'LPMT0005', '2026-04-10 15:43:57'),
(35, 5, 1, 11200.00, '2024-04-20', 65, 'LPMT0006', '2026-04-10 15:43:57'),
(36, 6, 1, 14500.00, '2024-04-22', 66, 'LPMT0007', '2026-04-10 15:43:57'),
(37, 7, 1, 4800.00, '2024-04-24', 67, 'LPMT0008', '2026-04-10 15:43:57'),
(38, 8, 1, 10300.00, '2024-04-26', 68, 'LPMT0009', '2026-04-10 15:43:57'),
(39, 9, 1, 11100.00, '2024-04-28', 69, 'LPMT0010', '2026-04-10 15:43:57'),
(40, 10, 1, 12000.00, '2024-05-01', 70, 'LPMT0011', '2026-04-10 15:43:57'),
(41, 11, 1, 12800.00, '2024-05-03', 71, 'LPMT0012', '2026-04-10 15:43:57'),
(42, 12, 1, 10100.00, '2024-05-05', 72, 'LPMT0013', '2026-04-10 15:43:57'),
(43, 13, 1, 11200.00, '2024-05-07', 73, 'LPMT0014', '2026-04-10 15:43:57'),
(44, 14, 1, 14500.00, '2024-05-09', 74, 'LPMT0015', '2026-04-10 15:43:57'),
(45, 15, 1, 13200.00, '2024-05-11', 75, 'LPMT0016', '2026-04-10 15:43:57'),
(46, 16, 1, 13300.00, '2024-05-13', 76, 'LPMT0017', '2026-04-10 15:43:57'),
(47, 17, 1, 12200.00, '2024-05-15', 77, 'LPMT0018', '2026-04-10 15:43:57'),
(48, 18, 1, 12600.00, '2024-05-17', 78, 'LPMT0019', '2026-04-10 15:43:57'),
(49, 19, 1, 9800.00, '2024-05-19', 79, 'LPMT0020', '2026-04-10 15:43:57'),
(50, 20, 1, 11500.00, '2024-05-21', 80, 'LPMT0021', '2026-04-10 15:43:57'),
(51, 21, 1, 12700.00, '2024-05-23', 81, 'LPMT0022', '2026-04-10 15:43:57'),
(52, 22, 1, 12100.00, '2024-05-25', 82, 'LPMT0023', '2026-04-10 15:43:57'),
(53, 23, 1, 14900.00, '2024-05-27', 83, 'LPMT0024', '2026-04-10 15:43:57'),
(54, 24, 1, 15400.00, '2024-05-29', 84, 'LPMT0025', '2026-04-10 15:43:57'),
(55, 25, 1, 10900.00, '2024-05-31', 85, 'LPMT0026', '2026-04-10 15:43:57'),
(56, 26, 1, 9700.00, '2024-06-02', 86, 'LPMT0027', '2026-04-10 15:43:57'),
(57, 27, 1, 8200.00, '2024-06-04', 87, 'LPMT0028', '2026-04-10 15:43:57'),
(58, 28, 1, 7600.00, '2024-06-06', 88, 'LPMT0029', '2026-04-10 15:43:57'),
(59, 29, 1, 9100.00, '2024-06-08', 89, 'LPMT0030', '2026-04-10 15:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `loan_type_id` int(11) NOT NULL,
  `type_name` varchar(60) NOT NULL,
  `default_interest_rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`loan_type_id`, `type_name`, `default_interest_rate`) VALUES
(1, 'Home Loan', 8.50),
(2, 'Education Loan', 7.25),
(3, 'Personal Loan', 12.00),
(4, 'Home Loan Standard', 8.50),
(5, 'Home Loan MaxGain', 8.75),
(6, 'Education Loan Domestic', 7.25),
(7, 'Education Loan Abroad', 8.10),
(8, 'Personal Loan Salaried', 12.00),
(9, 'Personal Loan Self Employed', 13.00),
(10, 'Vehicle Loan Car', 9.10),
(11, 'Vehicle Loan Two Wheeler', 10.50),
(12, 'Gold Loan Regular', 11.20),
(13, 'Gold Loan Express', 11.80),
(14, 'MSME Term Loan', 10.25),
(15, 'MSME Working Capital', 10.75),
(16, 'Agriculture Crop Loan', 7.00),
(17, 'Agriculture Equipment Loan', 8.20),
(18, 'Property Loan LAP', 11.50),
(19, 'Doctor Professional Loan', 10.40),
(20, 'CA Professional Loan', 10.40),
(21, 'Wedding Loan', 12.60),
(22, 'Travel Loan', 12.90),
(23, 'Consumer Durable Loan', 13.20),
(24, 'Solar Loan', 8.30),
(25, 'E Vehicle Loan', 8.70),
(26, 'Women Entrepreneur Loan', 9.25),
(27, 'Startup Business Loan', 11.10),
(28, 'Senior Citizen Reverse Mortgage', 9.90),
(29, 'Top Up Home Loan', 9.15),
(30, 'Top Up Personal Loan', 13.50),
(31, 'Education Skill Loan', 7.80),
(32, 'Microfinance Group Loan', 10.20),
(33, 'Warehouse Receipt Loan', 9.60);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`) VALUES
(1, 'Administrator', 'Full system access'),
(2, 'Manager', 'Branch and operations control'),
(3, 'Teller', 'Daily transactions and customer service'),
(64, 'Branch Manager', NULL),
(65, 'Operations Manager', NULL),
(66, 'Assistant Manager', NULL),
(67, 'Relationship Manager', NULL),
(68, 'Loan Officer', NULL),
(69, 'Credit Analyst', NULL),
(70, 'Cashier', NULL),
(71, 'Clerk', NULL),
(72, 'Customer Service Executive', NULL),
(73, 'KYC Officer', NULL),
(74, 'Accounts Officer', NULL),
(75, 'Recovery Officer', NULL),
(76, 'IT Support Officer', NULL),
(77, 'Compliance Officer', NULL),
(78, 'Audit Officer', NULL),
(79, 'Foreign Exchange Officer', NULL),
(80, 'Investment Advisor', NULL),
(81, 'Insurance Desk Officer', NULL),
(82, 'Gold Loan Officer', NULL),
(83, 'Personal Banker', NULL),
(84, 'Agricultural Finance Officer', NULL),
(85, 'MSME Officer', NULL),
(86, 'Treasury Assistant', NULL),
(87, 'Security Supervisor', NULL),
(88, 'Vault Custodian', NULL),
(89, 'Service Branch Officer', NULL),
(90, 'Regional Coordinator', NULL),
(91, 'Documentation Officer', NULL),
(92, 'NPA Monitoring Officer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `initiated_by` int(11) NOT NULL,
  `source_account_id` int(11) DEFAULT NULL,
  `target_account_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reference_no` varchar(40) NOT NULL,
  `narration` varchar(255) NOT NULL,
  `transaction_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_type_id`, `initiated_by`, `source_account_id`, `target_account_id`, `amount`, `reference_no`, `narration`, `transaction_date`) VALUES
(34, 4, 61, NULL, 31, 50000.00, 'TXN0001', 'Initial cash deposit', '2024-04-01 10:00:00'),
(35, 4, 62, NULL, 32, 45000.00, 'TXN0002', 'Initial cash deposit', '2024-04-01 10:10:00'),
(36, 4, 63, NULL, 33, 42000.00, 'TXN0004', 'Initial cash deposit', '2024-04-01 10:30:00'),
(37, 4, 64, NULL, 34, 47000.00, 'TXN0005', 'Initial cash deposit', '2024-04-01 10:40:00'),
(38, 5, 65, 31, NULL, 5000.00, 'TXN0011', 'ATM cash withdrawal', '2024-04-02 09:15:00'),
(39, 5, 66, 32, NULL, 3000.00, 'TXN0012', 'Cash withdrawal', '2024-04-02 09:25:00'),
(40, 6, 67, 31, 40, 7000.00, 'TXN0021', 'Transfer to family account', '2024-04-03 11:00:00'),
(41, 6, 68, 32, 41, 4500.00, 'TXN0022', 'Fund transfer', '2024-04-03 11:10:00'),
(66, 4, 65, NULL, 35, 52000.00, 'TXN0006', 'Initial cash deposit', '2024-04-01 10:50:00'),
(67, 4, 66, NULL, 36, 61000.00, 'TXN0007', 'Initial cash deposit', '2024-04-01 11:00:00'),
(68, 4, 67, NULL, 37, 29500.00, 'TXN0008', 'Initial cash deposit', '2024-04-01 11:10:00'),
(69, 4, 68, NULL, 38, 33000.00, 'TXN0009', 'Initial cash deposit', '2024-04-01 11:20:00'),
(70, 4, 69, NULL, 39, 36000.00, 'TXN0010', 'Initial cash deposit', '2024-04-01 11:30:00'),
(71, 5, 73, 33, NULL, 4000.00, 'TXN0014', 'Cash withdrawal', '2024-04-02 09:45:00'),
(72, 5, 74, 34, NULL, 3500.00, 'TXN0015', 'Cash withdrawal', '2024-04-02 09:55:00'),
(73, 5, 75, 35, NULL, 4500.00, 'TXN0016', 'Cash withdrawal', '2024-04-02 10:05:00'),
(74, 5, 76, 36, NULL, 6000.00, 'TXN0017', 'Cash withdrawal', '2024-04-02 10:15:00'),
(75, 5, 77, 37, NULL, 2000.00, 'TXN0018', 'Cash withdrawal', '2024-04-02 10:25:00'),
(76, 5, 78, 38, NULL, 2800.00, 'TXN0019', 'Cash withdrawal', '2024-04-02 10:35:00'),
(77, 5, 79, 39, NULL, 3200.00, 'TXN0020', 'Cash withdrawal', '2024-04-02 10:45:00'),
(78, 6, 83, 33, 43, 5200.00, 'TXN0024', 'Fund transfer', '2024-04-03 11:30:00'),
(79, 6, 84, 34, 44, 6100.00, 'TXN0025', 'Fund transfer', '2024-04-03 11:40:00'),
(80, 6, 85, 35, 45, 4800.00, 'TXN0026', 'Fund transfer', '2024-04-03 11:50:00'),
(81, 6, 86, 36, 46, 7500.00, 'TXN0027', 'Fund transfer', '2024-04-03 12:00:00'),
(82, 6, 87, 37, 47, 2200.00, 'TXN0028', 'Fund transfer', '2024-04-03 12:10:00'),
(83, 6, 88, 38, 48, 4100.00, 'TXN0029', 'Fund transfer', '2024-04-03 12:20:00'),
(84, 6, 89, 39, 49, 3900.00, 'TXN0030', 'Fund transfer', '2024-04-03 12:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_entries`
--

CREATE TABLE `transaction_entries` (
  `transaction_entry_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `entry_role` enum('debit','credit') NOT NULL,
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_entries`
--

INSERT INTO `transaction_entries` (`transaction_entry_id`, `transaction_id`, `account_id`, `entry_role`, `amount`) VALUES
(41, 34, 31, 'credit', 50000.00),
(42, 35, 32, 'credit', 45000.00),
(43, 36, 33, 'credit', 42000.00),
(44, 37, 34, 'credit', 47000.00),
(45, 66, 35, 'credit', 52000.00),
(46, 67, 36, 'credit', 61000.00),
(47, 68, 37, 'credit', 29500.00),
(48, 69, 38, 'credit', 33000.00),
(49, 70, 39, 'credit', 36000.00),
(50, 38, 31, 'debit', 5000.00),
(51, 39, 32, 'debit', 3000.00),
(52, 71, 33, 'debit', 4000.00),
(53, 72, 34, 'debit', 3500.00),
(54, 73, 35, 'debit', 4500.00),
(55, 74, 36, 'debit', 6000.00),
(56, 75, 37, 'debit', 2000.00),
(57, 76, 38, 'debit', 2800.00),
(58, 77, 39, 'debit', 3200.00),
(59, 40, 31, 'debit', 7000.00),
(60, 40, 40, 'credit', 7000.00),
(61, 41, 32, 'debit', 4500.00),
(62, 41, 41, 'credit', 4500.00),
(63, 78, 33, 'debit', 5200.00),
(64, 78, 43, 'credit', 5200.00),
(65, 79, 34, 'debit', 6100.00),
(66, 79, 44, 'credit', 6100.00),
(67, 80, 35, 'debit', 4800.00),
(68, 80, 45, 'credit', 4800.00),
(69, 81, 36, 'debit', 7500.00),
(70, 81, 46, 'credit', 7500.00),
(71, 82, 37, 'debit', 2200.00),
(72, 82, 47, 'credit', 2200.00),
(73, 83, 38, 'debit', 4100.00),
(74, 83, 48, 'credit', 4100.00),
(75, 84, 39, 'debit', 3900.00),
(76, 84, 49, 'credit', 3900.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `transaction_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`transaction_type_id`, `type_name`) VALUES
(6, 'Account Transfer'),
(17, 'ATM Cash Withdrawal'),
(23, 'Card Payment Debit'),
(25, 'Cash Collection Credit'),
(4, 'Cash Deposit'),
(18, 'Cash Reversal'),
(5, 'Cash Withdrawal'),
(7, 'Cheque Deposit'),
(8, 'Cheque Withdrawal'),
(27, 'Demand Draft Cancel'),
(26, 'Demand Draft Issue'),
(1, 'Deposit'),
(32, 'Dividend Credit'),
(33, 'Government Subsidy Credit'),
(13, 'IMPS Credit'),
(14, 'IMPS Debit'),
(30, 'Insurance Premium Debit'),
(21, 'Interest Credit'),
(22, 'Loan EMI Debit'),
(29, 'Locker Rent Debit'),
(9, 'NEFT Credit'),
(10, 'NEFT Debit'),
(24, 'POS Refund Credit'),
(11, 'RTGS Credit'),
(12, 'RTGS Debit'),
(28, 'Service Charge Debit'),
(19, 'Standing Instruction Credit'),
(20, 'Standing Instruction Debit'),
(31, 'Tax Payment Debit'),
(3, 'Transfer'),
(15, 'UPI Credit'),
(16, 'UPI Debit'),
(2, 'Withdrawal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `fk_accounts_type` (`account_type_id`),
  ADD KEY `idx_accounts_branch` (`branch_id`);

--
-- Indexes for table `account_holders`
--
ALTER TABLE `account_holders`
  ADD PRIMARY KEY (`account_holder_id`),
  ADD UNIQUE KEY `uq_account_holders` (`account_id`,`customer_id`),
  ADD KEY `fk_account_holders_customer` (`customer_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`account_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `branch_code` (`branch_code`),
  ADD UNIQUE KEY `ifsc_prefix` (`ifsc_prefix`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `government_id_number` (`id_number`),
  ADD KEY `idx_customers_phone` (`phone`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_employees_branch` (`branch_id`),
  ADD KEY `fk_employees_role` (`role_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD UNIQUE KEY `loan_number` (`loan_number`),
  ADD KEY `fk_loans_branch` (`branch_id`),
  ADD KEY `fk_loans_type` (`loan_type_id`),
  ADD KEY `fk_loans_employee` (`approved_by`),
  ADD KEY `idx_loans_customer` (`customer_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`loan_payment_id`),
  ADD UNIQUE KEY `reference_no` (`reference_no`),
  ADD UNIQUE KEY `uq_loan_installment` (`loan_id`,`installment_no`),
  ADD KEY `fk_loan_payments_employee` (`received_by`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`loan_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `reference_no` (`reference_no`),
  ADD KEY `fk_transactions_type` (`transaction_type_id`),
  ADD KEY `fk_transactions_employee` (`initiated_by`),
  ADD KEY `fk_transactions_source` (`source_account_id`),
  ADD KEY `fk_transactions_target` (`target_account_id`),
  ADD KEY `idx_transactions_date` (`transaction_date`);

--
-- Indexes for table `transaction_entries`
--
ALTER TABLE `transaction_entries`
  ADD PRIMARY KEY (`transaction_entry_id`),
  ADD KEY `fk_entries_transaction` (`transaction_id`),
  ADD KEY `idx_transaction_entries_account` (`account_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`transaction_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `account_holders`
--
ALTER TABLE `account_holders`
  MODIFY `account_holder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `account_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `loan_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `loan_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `transaction_entries`
--
ALTER TABLE `transaction_entries`
  MODIFY `transaction_entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `fk_accounts_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fk_accounts_type` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`account_type_id`);

--
-- Constraints for table `account_holders`
--
ALTER TABLE `account_holders`
  ADD CONSTRAINT `fk_account_holders_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `fk_account_holders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fk_employees_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `fk_loans_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fk_loans_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_loans_employee` FOREIGN KEY (`approved_by`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `fk_loans_type` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`loan_type_id`);

--
-- Constraints for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD CONSTRAINT `fk_loan_payments_employee` FOREIGN KEY (`received_by`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `fk_loan_payments_loan` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_employee` FOREIGN KEY (`initiated_by`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `fk_transactions_source` FOREIGN KEY (`source_account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `fk_transactions_target` FOREIGN KEY (`target_account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `fk_transactions_type` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`transaction_type_id`);

--
-- Constraints for table `transaction_entries`
--
ALTER TABLE `transaction_entries`
  ADD CONSTRAINT `fk_entries_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `fk_entries_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- ADVANCED ACADEMIC UPGRADES
-- --------------------------------------------------------

-- 1. Audit Logs for Security Tracking
CREATE TABLE IF NOT EXISTS `audit_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `record_id` int(11) NOT NULL,
  `details` text DEFAULT NULL,
  `changed_by` varchar(100) DEFAULT 'system',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. View for Simplified Account Summaries
CREATE OR REPLACE VIEW `v_account_balances` AS
SELECT 
    a.account_id,
    a.account_number,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    at.type_name AS account_type,
    at.minimum_balance,
    b.branch_name,
    COALESCE(SUM(CASE WHEN te.entry_role = 'credit' THEN te.amount WHEN te.entry_role = 'debit' THEN -te.amount ELSE 0 END), 0) AS balance,
    a.status
FROM accounts a
JOIN account_types at ON a.account_type_id = at.account_type_id
JOIN branches b ON a.branch_id = b.branch_id
JOIN account_holders ah ON a.account_id = ah.account_id AND ah.holder_role = 'primary'
JOIN customers c ON ah.customer_id = c.customer_id
LEFT JOIN transaction_entries te ON a.account_id = te.account_id
GROUP BY a.account_id;

-- 3. Stored Procedure for Atomic Fund Transfers
DELIMITER //
CREATE PROCEDURE `sp_transfer_funds`(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(12,2),
    IN p_initiated_by INT,
    IN p_narration VARCHAR(255)
)
BEGIN
    DECLARE v_txn_id INT;
    DECLARE v_ref_no VARCHAR(40);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transfer failed: Database Error';
    END;

    START TRANSACTION;
    
    -- 1. Create Transaction (Type 6 = Account Transfer)
    SET v_ref_no = CONCAT('TXN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'), FLOOR(RAND()*1000));
    INSERT INTO transactions (transaction_type_id, initiated_by, source_account_id, target_account_id, amount, reference_no, narration, transaction_date)
    VALUES (tx_type_id('Account Transfer'), p_initiated_by, p_sender_id, p_receiver_id, p_amount, v_ref_no, p_narration, NOW());
    
    SET v_txn_id = LAST_INSERT_ID();
    
    -- 2. Debit Sender
    INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount)
    VALUES (v_txn_id, p_sender_id, 'debit', p_amount);
    
    -- 3. Credit Receiver
    INSERT INTO transaction_entries (transaction_id, account_id, entry_role, amount)
    VALUES (v_txn_id, p_receiver_id, 'credit', p_amount);
    
    COMMIT;
END //
DELIMITER ;

-- 4. Trigger for Overdraft Prevention
DELIMITER //
CREATE TRIGGER `tr_overdraft_check`
BEFORE INSERT ON `transaction_entries`
FOR EACH ROW
BEGIN
    DECLARE v_current_balance DECIMAL(12,2);
    DECLARE v_min_balance DECIMAL(12,2);
    
    IF NEW.entry_role = 'debit' THEN
        -- Get current balance
        SELECT balance, minimum_balance INTO v_current_balance, v_min_balance 
        FROM v_account_balances 
        WHERE account_id = NEW.account_id;
        
        IF (v_current_balance - NEW.amount) < v_min_balance THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Transaction Rejected: Insufficient balance for this account type.';
        END IF;
    END IF;
END //
DELIMITER ;

-- 5. Data Quality Check Constraints (MariaDB 10.2+)
ALTER TABLE transactions ADD CONSTRAINT chk_txn_amount_positive CHECK (amount > 0);
ALTER TABLE transaction_entries ADD CONSTRAINT chk_entry_amount_positive CHECK (amount > 0);
ALTER TABLE loan_payments ADD CONSTRAINT chk_payment_amount_positive CHECK (amount_paid > 0);
ALTER TABLE loans ADD CONSTRAINT chk_loan_principal_positive CHECK (principal_amount > 0);
