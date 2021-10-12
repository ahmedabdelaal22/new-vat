-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 02, 2020 at 08:19 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.3.19-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$ncTy3OuiXYxScwvirdO8Q.pPitBw2qaI7N.uZJ9C75FKX0fdqHdnS', '/uploads//admins/156424059025553.jpg', 'usG7qCzvXQVdIF9FhbshRZgIRkcJisF8RR9dEEcxcsONlqOk0wVOYMbc7exJ', '2019-07-27 08:59:10', '2019-07-27 13:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 1, '[]', '{\"employee_id\":\"121\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":1}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:11:46', '2020-07-02 14:11:46'),
(2, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 2, '[]', '{\"employee_id\":\"122\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":2}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:11:46', '2020-07-02 14:11:46'),
(3, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 3, '[]', '{\"employee_id\":\"121\",\"model_id\":121,\"model_type\":\"App\\\\Models\\\\User\",\"id\":3}', 'http://localhost/crm/public/users/121', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:25:12', '2020-07-02 14:25:12'),
(4, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 4, '[]', '{\"employee_id\":\"8\",\"model_id\":121,\"model_type\":\"App\\\\Models\\\\User\",\"id\":4}', 'http://localhost/crm/public/users/121', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:25:34', '2020-07-02 14:25:34'),
(5, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 5, '[]', '{\"employee_id\":\"8\",\"model_id\":122,\"model_type\":\"App\\\\Models\\\\User\",\"id\":5}', 'http://localhost/crm/public/users/122', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:26:33', '2020-07-02 14:26:33'),
(6, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 6, '[]', '{\"employee_id\":\"121\",\"model_id\":122,\"model_type\":\"App\\\\Models\\\\User\",\"id\":6}', 'http://localhost/crm/public/users/122', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:26:33', '2020-07-02 14:26:33'),
(7, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 7, '[]', '{\"employee_id\":\"8\",\"model_id\":123,\"model_type\":\"App\\\\Models\\\\User\",\"id\":7}', 'http://localhost/crm/public/users/123', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:27:04', '2020-07-02 14:27:04'),
(8, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 8, '[]', '{\"employee_id\":\"121\",\"model_id\":123,\"model_type\":\"App\\\\Models\\\\User\",\"id\":8}', 'http://localhost/crm/public/users/123', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:27:04', '2020-07-02 14:27:04'),
(9, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 9, '[]', '{\"employee_id\":\"8\",\"model_id\":124,\"model_type\":\"App\\\\Models\\\\User\",\"id\":9}', 'http://localhost/crm/public/users/124', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:27:44', '2020-07-02 14:27:44'),
(10, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 10, '[]', '{\"employee_id\":\"121\",\"model_id\":124,\"model_type\":\"App\\\\Models\\\\User\",\"id\":10}', 'http://localhost/crm/public/users/124', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:27:44', '2020-07-02 14:27:44'),
(11, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 11, '[]', '{\"employee_id\":\"8\",\"model_id\":125,\"model_type\":\"App\\\\Models\\\\User\",\"id\":11}', 'http://localhost/crm/public/users/125', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(12, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 12, '[]', '{\"employee_id\":\"121\",\"model_id\":125,\"model_type\":\"App\\\\Models\\\\User\",\"id\":12}', 'http://localhost/crm/public/users/125', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(13, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 13, '[]', '{\"employee_id\":\"122\",\"model_id\":125,\"model_type\":\"App\\\\Models\\\\User\",\"id\":13}', 'http://localhost/crm/public/users/125', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(14, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 14, '[]', '{\"employee_id\":\"8\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":14}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:30:22', '2020-07-02 14:30:22'),
(15, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 15, '[]', '{\"employee_id\":\"121\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":15}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:30:22', '2020-07-02 14:30:22'),
(16, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 16, '[]', '{\"employee_id\":\"122\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":16}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:30:22', '2020-07-02 14:30:22'),
(17, 'App\\Models\\User', 8, 'updated', 'App\\Models\\User', 128, '{\"team_leader_id\":122}', '{\"team_leader_id\":\"123\"}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:30:22', '2020-07-02 14:30:22'),
(18, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 17, '[]', '{\"employee_id\":\"8\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":17}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:34:12', '2020-07-02 14:34:12'),
(19, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 18, '[]', '{\"employee_id\":\"121\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":18}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:34:12', '2020-07-02 14:34:12'),
(20, 'App\\Models\\User', 8, 'created', 'App\\Models\\Responsable', 19, '[]', '{\"employee_id\":\"123\",\"model_id\":128,\"model_type\":\"App\\\\Models\\\\User\",\"id\":19}', 'http://localhost/crm/public/users/128', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', NULL, '2020-07-02 14:34:12', '2020-07-02 14:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_comments`
--

CREATE TABLE `campaign_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_channels`
--

CREATE TABLE `chat_channels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_channel_messages`
--

CREATE TABLE `chat_channel_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marketing_way_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `referred_by` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_interests`
--

CREATE TABLE `client_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_items`
--

CREATE TABLE `collection_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communication_method`
--

CREATE TABLE `communication_method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `connection_ways`
--

CREATE TABLE `connection_ways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `connection_way_statuses`
--

CREATE TABLE `connection_way_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection_way_id` int(11) NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocked_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reasons` varchar(400) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(2) NOT NULL,
  `dial_code` varchar(5) NOT NULL,
  `currency_name` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments_langs`
--

CREATE TABLE `departments_langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helper_country`
--

CREATE TABLE `helper_country` (
  `ID` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `dial_code` int(11) NOT NULL,
  `currency_name` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) NOT NULL,
  `currency_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_project` tinyint(1) NOT NULL DEFAULT '0',
  `cetegory_id` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `unit_price` double(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_variations`
--

CREATE TABLE `item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_ar` text COLLATE utf8mb4_unicode_ci,
  `value_en` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `lead_status_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `marketing_way_id` int(11) DEFAULT NULL,
  `communicationMethod` int(11) DEFAULT NULL,
  `campaignName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_comments`
--

CREATE TABLE `lead_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_operations`
--

CREATE TABLE `lead_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_way_id` int(11) DEFAULT NULL,
  `operation_date` date DEFAULT NULL,
  `operation_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `connection_way_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_users`
--

CREATE TABLE `lead_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `lead_status_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailbox_inbound_emails`
--

CREATE TABLE `mailbox_inbound_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_ways`
--

CREATE TABLE `marketing_ways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_04_21_163639_create_marketing_ways_table', 2),
(4, '2020_04_21_163816_create_client_categories_table', 2),
(5, '2020_04_21_164044_create_clients_table', 2),
(6, '2020_04_21_164543_create_client_contacts_table', 3),
(7, '2020_04_21_164704_create_client_interests_table', 3),
(8, '2020_04_21_164816_create_lead_statuses_table', 3),
(9, '2020_04_21_164943_create_connection_ways_table', 3),
(10, '2020_04_21_165114_create_leads_table', 3),
(11, '2020_04_21_165350_create_lead_users_table', 3),
(12, '2020_04_21_165642_create_lead_operations_table', 3),
(13, '2020_04_21_165929_create_lead_comments_table', 3),
(14, '2020_04_21_170558_create_departments_table', 3),
(15, '2020_04_21_170652_create_sms_messages_table', 3),
(16, '2020_04_21_170800_create_sms_message_phones_table', 3),
(17, '2020_04_21_171102_create_campaigns_table', 3),
(18, '2020_04_21_171121_create_campaign_comments_table', 3),
(19, '2020_04_21_171135_create_page_messages_table', 3),
(21, '2020_04_21_171725_create_notification_users_table', 4),
(22, '2020_04_21_172218_create_tickets_table', 4),
(23, '2020_04_21_172237_create_ticket_statuses_table', 4),
(24, '2020_04_21_172858_create_ticket_attachments_table', 4),
(25, '2020_04_21_173042_create_ticket_comments_table', 4),
(26, '2020_04_21_173056_create_ticket_users_table', 4),
(27, '2020_04_21_173602_create_chat_channels_table', 4),
(28, '2020_04_21_173615_create_chat_channel_messages_table', 4),
(29, '2020_04_22_092402_create_suppliers_table', 4),
(30, '2020_04_22_092810_create_item_categories_table', 4),
(31, '2020_04_22_093011_create_variations_table', 4),
(32, '2020_04_22_093018_create_item_variations_table', 4),
(33, '2020_04_22_093427_create_items_table', 4),
(34, '2020_04_22_093656_create_inventories_table', 4),
(35, '2020_04_22_094114_create_inventory_items_table', 4),
(36, '2020_04_22_094458_create_purchase_invoices_table', 5),
(37, '2020_04_22_094505_create_purchase_invoice_items_table', 5),
(38, '2020_04_22_101627_create_sales_invoice_items_table', 5),
(39, '2020_04_22_101641_create_sales_order_items_table', 5),
(40, '2020_04_22_101652_create_sales_orders_table', 5),
(41, '2020_04_22_101700_create_sales_invoices_table', 5),
(42, '2020_04_22_102558_create_purchase_installments_table', 5),
(43, '2020_04_22_102616_create_sales_invoice_installments_table', 5),
(44, '2020_04_22_103201_create_payments_table', 5),
(45, '2020_04_22_103211_create_collections_table', 5),
(46, '2020_04_23_154149_add_label_to_variations_table', 6),
(47, '2020_04_23_154232_add_label_to_item_variations_table', 6),
(48, '2020_04_27_124508_add_employee_id_to_leads_table', 7),
(49, '2020_04_28_143203_add_created_by_to_lead_comments_table', 8),
(52, '2020_04_28_160433_add_created_by_to_lead_operations_table', 9),
(53, '2020_06_02_085151_add_label_to_variations', 10),
(54, '2020_06_02_091433_add_sort_to_variations', 11),
(55, '2020_06_02_122655_add_created_by_to_purcahse_invoices', 12),
(58, '2020_01_01_153905_create_notification_users_table', 13),
(60, '2020_06_01_120214_create_permission_tables', 14),
(61, '2020_06_03_171216_create_audits_table', 14),
(63, '2020_06_07_093046_add_created_by_to_payments_table', 15),
(64, '2020_06_07_095413_create_payment_items_table', 16),
(65, '2020_06_07_122305_alter_sales_orders_table', 17),
(66, '2020_06_08_144450_create_taxes_table', 18),
(67, '2020_06_08_152730_create_sales_invoice_taxes_table', 19),
(68, '2020_06_08_104443_create_collection_items_table', 20),
(69, '2020_06_08_105710_alter_collections_table', 20),
(70, '2020_06_08_140744_add_balance_to_clients_table', 20),
(71, '2020_06_09_083655_add_is_super_admin_to_users', 20),
(72, '2020_06_11_112316_alter_addedd_created_by_sales_orders_table', 21),
(73, '2020_06_11_150518_alter_sms_message_phones_table', 21),
(74, '2020_04_21_171719_create_notifications_table', 22),
(75, '2020_06_14_115609_create_notification_users', 23),
(78, '2020_06_14_152310_create_settings_table', 24),
(79, '2020_06_15_092910_create_departments_langs_table', 25),
(81, '2020_06_15_094101_add_name_en_to_departments', 26),
(83, '2020_06_15_100531_add_name_en_to_roles', 26),
(84, '2020_06_15_103412_add_name_en_to_marketing_ways', 27),
(85, '2020_06_15_104823_add_name_en_to_inventories', 28),
(86, '2020_06_15_105121_add_name_en_to_item_categories', 29),
(87, '2020_06_15_115248_add_name_en_to_items', 30),
(88, '2020_06_15_120310_add_name_en_to_lead_statuses', 31),
(89, '2020_06_15_122129_add_name_en_to_client_categories', 32),
(90, '2020_06_15_130018_add_name_en_to_connection_ways', 33),
(91, '2020_06_15_130415_create_connection_way_statuses_table', 33),
(92, '2020_06_15_140921_alter_lead_opration_connection_way_status', 34),
(93, '2020_06_16_113555_add_date_to_sales_invoices_table', 35),
(94, '2020_06_16_171908_add_supplier_to_sales_invoice_installments', 1),
(95, '2020_06_18_101057_add_message_to_chat_channel_messages', 36),
(96, '2020_06_21_102517_create_responsables_table', 37),
(97, '2020_06_21_114305_drop_employee_id_col_from_leads', 38),
(98, '2020_06_21_104914_add_label_en_to_ariations', 39),
(99, '2020_06_21_105614_add_label_en_to_item_variations', 39),
(100, '2020_06_21_110228_alter_option_leads_table', 39),
(101, '2020_06_21_113005_create_communication_method_table', 39),
(102, '2020_06_21_121459_alter_add_lead_sales_orders_table', 39),
(103, '2020_06_21_121557_alter_add_lead_sales_invoices_table', 39),
(104, '2020_06_21_124402_add_is_onine_user_to_users', 39),
(105, '2020_06_22_102515_create_mailbox_inbound_emails_table', 40),
(106, '2020_06_23_121249_add_is_project_col_to_inventories_table', 41),
(107, '2020_06_23_140736_add_category_id_col_to_inventories_table', 42),
(109, '2020_06_30_112401_add_management_cols_to_users_table', 43);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `created_at`, `updated_at`, `model_id`) VALUES
(2, 'App\\Models\\User', NULL, NULL, 124),
(3, 'App\\Models\\User', NULL, NULL, 125),
(4, 'App\\Models\\User', NULL, NULL, 121),
(5, 'App\\Models\\User', NULL, NULL, 123),
(6, 'App\\Models\\User', NULL, NULL, 122),
(7, 'App\\Models\\User', NULL, NULL, 128);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `basic_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_users`
--

CREATE TABLE `notification_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_messages`
--

CREATE TABLE `page_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_items`
--

CREATE TABLE `payment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'purchase invoices create', 'web', '2020-06-04 08:17:52', '2020-06-04 08:17:52'),
(2, 'calender index', 'web', '2020-06-04 08:18:27', '2020-06-04 08:18:27'),
(3, 'purchase invoices show', 'web', '2020-06-04 08:59:07', '2020-06-04 08:59:07'),
(4, 'purchase invoices index', 'web', '2020-06-04 09:02:41', '2020-06-04 09:02:41'),
(5, 'purchase invoices approve', 'web', '2020-06-04 09:03:31', '2020-06-04 09:03:31'),
(6, 'purchase invoices edit', 'web', '2020-06-04 09:30:04', '2020-06-04 09:30:04'),
(7, 'purchase invoices update', 'web', '2020-06-04 09:30:15', '2020-06-04 09:30:15'),
(8, 'purchase invoices print', 'web', '2020-06-04 11:24:44', '2020-06-04 11:24:44'),
(9, 'inventory items index', 'web', '2020-06-04 13:14:40', '2020-06-04 13:14:40'),
(10, 'purchase installments index', 'web', '2020-06-04 13:37:56', '2020-06-04 13:37:56'),
(11, 'payments index', 'web', '2020-06-07 07:29:23', '2020-06-07 07:29:23'),
(12, 'payments create', 'web', '2020-06-07 07:45:58', '2020-06-07 07:45:58'),
(13, 'payments store', 'web', '2020-06-07 07:53:39', '2020-06-07 07:53:39'),
(14, 'logs', 'web', '2020-06-07 08:45:15', '2020-06-07 08:45:15'),
(15, 'inventories index', 'web', '2020-06-07 08:45:21', '2020-06-07 08:45:21'),
(16, 'sales order index', 'web', '2020-06-07 08:45:27', '2020-06-07 08:45:27'),
(17, 'sales order create', 'web', '2020-06-07 08:45:30', '2020-06-07 08:45:30'),
(18, 'sales order store', 'web', '2020-06-07 08:57:52', '2020-06-07 08:57:52'),
(19, 'purchase invoices store', 'web', '2020-06-07 09:37:43', '2020-06-07 09:37:43'),
(20, 'get supplier purchase invoices', 'web', '2020-06-07 09:56:59', '2020-06-07 09:56:59'),
(21, 'payments edit', 'web', '2020-06-07 11:02:34', '2020-06-07 11:02:34'),
(22, 'payments update', 'web', '2020-06-07 11:16:47', '2020-06-07 11:16:47'),
(23, 'payments approve', 'web', '2020-06-07 11:22:45', '2020-06-07 11:22:45'),
(24, 'payments print', 'web', '2020-06-07 13:17:45', '2020-06-07 13:17:45'),
(25, 'suppliers index', 'web', '2020-06-07 13:31:14', '2020-06-07 13:31:14'),
(26, 'suppliers edit', 'web', '2020-06-07 13:31:20', '2020-06-07 13:31:20'),
(27, 'users index', 'web', '2020-06-07 13:49:15', '2020-06-07 13:49:15'),
(28, 'campaigns index', 'web', '2020-06-07 13:51:47', '2020-06-07 13:51:47'),
(29, 'campaigns show', 'web', '2020-06-07 14:01:47', '2020-06-07 14:01:47'),
(30, 'leads index', 'web', '2020-06-07 14:10:48', '2020-06-07 14:10:48'),
(31, 'departments index', 'web', '2020-06-08 07:18:42', '2020-06-08 07:18:42'),
(32, 'users create', 'web', '2020-06-08 07:18:50', '2020-06-08 07:18:50'),
(33, 'role permissions index', 'web', '2020-06-08 07:18:52', '2020-06-08 07:18:52'),
(34, 'sales invoices index', 'web', '2020-06-08 10:26:39', '2020-06-08 10:26:39'),
(35, 'sales invoices create', 'web', '2020-06-08 10:26:42', '2020-06-08 10:26:42'),
(36, 'leads statuses index', 'web', '2020-06-08 10:28:03', '2020-06-08 10:28:03'),
(37, 'item categories index', 'web', '2020-06-08 12:58:16', '2020-06-08 12:58:16'),
(38, 'item categories create', 'web', '2020-06-08 12:58:20', '2020-06-08 12:58:20'),
(39, 'contact list index', 'web', '2020-06-08 12:58:32', '2020-06-08 12:58:32'),
(40, 'contact list create', 'web', '2020-06-08 12:58:35', '2020-06-08 12:58:35'),
(41, 'items index', 'web', '2020-06-08 12:58:53', '2020-06-08 12:58:53'),
(42, 'sales invoices store', 'web', '2020-06-08 13:43:28', '2020-06-08 13:43:28'),
(43, 'sales invoices edit', 'web', '2020-06-08 13:45:28', '2020-06-08 13:45:28'),
(44, 'sales invoices update', 'web', '2020-06-08 13:45:40', '2020-06-08 13:45:40'),
(45, 'sales invoices approve', 'web', '2020-06-09 06:29:08', '2020-06-09 06:29:08'),
(46, 'sales invoices show', 'web', '2020-06-09 06:29:11', '2020-06-09 06:29:11'),
(47, 'sales invoices print', 'web', '2020-06-09 06:29:17', '2020-06-09 06:29:17'),
(48, 'roles index', 'web', '2020-06-09 06:35:01', '2020-06-09 06:35:01'),
(49, 'roles create', 'web', '2020-06-09 06:35:03', '2020-06-09 06:35:03'),
(50, 'roles store', 'web', '2020-06-09 06:35:07', '2020-06-09 06:35:07'),
(51, 'leads show', 'web', '2020-06-09 14:41:32', '2020-06-09 14:41:32'),
(52, 'collection index', 'web', '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(53, 'sales order show', 'web', '2020-06-10 07:39:28', '2020-06-10 07:39:28'),
(54, 'sales order print', 'web', '2020-06-10 07:39:31', '2020-06-10 07:39:31'),
(55, 'connection ways index', 'web', '2020-06-10 07:50:16', '2020-06-10 07:50:16'),
(56, 'clients index', 'web', '2020-06-10 07:51:08', '2020-06-10 07:51:08'),
(57, 'sms messages index', 'web', '2020-06-10 07:51:14', '2020-06-10 07:51:14'),
(58, 'marketing ways index', 'web', '2020-06-10 07:51:28', '2020-06-10 07:51:28'),
(59, 'client categories index', 'web', '2020-06-10 07:53:14', '2020-06-10 07:53:14'),
(60, 'logs index', 'web', '2020-06-10 08:02:29', '2020-06-10 08:02:29'),
(61, 'users store', 'web', '2020-06-10 08:44:44', '2020-06-10 08:44:44'),
(62, 'sales invoices installments index', 'web', '2020-06-10 09:00:52', '2020-06-10 09:00:52'),
(63, 'profile', 'web', '2020-06-10 09:20:35', '2020-06-10 09:20:35'),
(64, 'users update photo', 'web', '2020-06-10 09:22:09', '2020-06-10 09:22:09'),
(65, 'users edit', 'web', '2020-06-10 10:32:34', '2020-06-10 10:32:34'),
(66, 'users update', 'web', '2020-06-10 10:36:52', '2020-06-10 10:36:52'),
(67, 'users destroy', 'web', '2020-06-10 10:37:00', '2020-06-10 10:37:00'),
(68, 'leads create', 'web', '2020-06-10 12:39:01', '2020-06-10 12:39:01'),
(69, 'users update profile', 'web', '2020-06-10 13:11:06', '2020-06-10 13:11:06'),
(70, 'departments create', 'web', '2020-06-10 13:18:06', '2020-06-10 13:18:06'),
(71, 'roles edit', 'web', '2020-06-10 13:32:43', '2020-06-10 13:32:43'),
(72, 'roles update', 'web', '2020-06-10 13:32:47', '2020-06-10 13:32:47'),
(73, 'clients create', 'web', '2020-06-10 13:33:58', '2020-06-10 13:33:58'),
(74, 'clients store', 'web', '2020-06-10 13:34:38', '2020-06-10 13:34:38'),
(75, 'clients edit', 'web', '2020-06-10 13:34:43', '2020-06-10 13:34:43'),
(76, 'roles destroy', 'web', '2020-06-10 13:35:43', '2020-06-10 13:35:43'),
(77, 'clients update', 'web', '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(78, 'clients show', 'web', '2020-06-10 13:36:39', '2020-06-10 13:36:39'),
(79, 'contact list add phones', 'web', '2020-06-10 13:41:07', '2020-06-10 13:41:07'),
(80, 'getAutoComplete', 'web', '2020-06-10 13:43:28', '2020-06-10 13:43:28'),
(81, 'contact list store', 'web', '2020-06-10 13:44:02', '2020-06-10 13:44:02'),
(82, 'sms messages create', 'web', '2020-06-10 13:46:11', '2020-06-10 13:46:11'),
(83, 'inventories create', 'web', '2020-06-10 13:52:40', '2020-06-10 13:52:40'),
(84, 'inventories store', 'web', '2020-06-10 13:52:56', '2020-06-10 13:52:56'),
(85, 'inventories edit', 'web', '2020-06-10 13:53:01', '2020-06-10 13:53:01'),
(86, 'item categories store', 'web', '2020-06-10 13:55:21', '2020-06-10 13:55:21'),
(87, 'items create', 'web', '2020-06-10 13:56:46', '2020-06-10 13:56:46'),
(88, 'items store', 'web', '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(89, 'marketing ways create', 'web', '2020-06-10 13:58:22', '2020-06-10 13:58:22'),
(90, 'marketing ways store', 'web', '2020-06-10 13:58:29', '2020-06-10 13:58:29'),
(91, 'marketing ways edit', 'web', '2020-06-10 13:58:36', '2020-06-10 13:58:36'),
(92, 'marketing ways update', 'web', '2020-06-10 13:58:38', '2020-06-10 13:58:38'),
(93, 'sales order confirem', 'web', '2020-06-10 14:07:27', '2020-06-10 14:07:27'),
(94, 'leads statuses create', 'web', '2020-06-10 14:15:34', '2020-06-10 14:15:34'),
(95, 'suppliers create', 'web', '2020-06-10 14:23:29', '2020-06-10 14:23:29'),
(96, 'suppliers store', 'web', '2020-06-10 14:23:42', '2020-06-10 14:23:42'),
(97, 'purchase installments create', 'web', '2020-06-11 07:59:44', '2020-06-11 07:59:44'),
(98, 'sms messages store', 'web', '2020-06-14 07:13:14', '2020-06-14 07:13:14'),
(99, 'notfications index', 'web', '2020-06-14 07:37:08', '2020-06-14 07:37:08'),
(100, 'sms messages destroy', 'web', '2020-06-14 08:02:42', '2020-06-14 08:02:42'),
(101, 'departments store', 'web', '2020-06-14 08:36:11', '2020-06-14 08:36:11'),
(102, 'notfications create', 'web', '2020-06-14 09:42:17', '2020-06-14 09:42:17'),
(103, 'notfications store', 'web', '2020-06-14 09:42:38', '2020-06-14 09:42:38'),
(104, 'lead notes store', 'web', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(105, 'lead operations store', 'web', '2020-06-14 10:53:26', '2020-06-14 10:53:26'),
(106, 'leads store', 'web', '2020-06-14 12:43:17', '2020-06-14 12:43:17'),
(107, 'campaigns create', 'web', '2020-06-14 12:44:34', '2020-06-14 12:44:34'),
(108, 'campaigns store', 'web', '2020-06-14 12:44:37', '2020-06-14 12:44:37'),
(109, 'leads statuses store', 'web', '2020-06-14 12:46:10', '2020-06-14 12:46:10'),
(110, 'logs create', 'web', '2020-06-14 12:47:11', '2020-06-14 12:47:11'),
(111, 'leads changestatus', 'web', '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(112, 'leads edit', 'web', '2020-06-14 13:07:37', '2020-06-14 13:07:37'),
(113, 'settings index', 'web', '2020-06-14 13:29:24', '2020-06-14 13:29:24'),
(114, 'settings store', 'web', '2020-06-14 14:07:24', '2020-06-14 14:07:24'),
(115, 'campaigncomments create', 'web', '2020-06-15 07:48:00', '2020-06-15 07:48:00'),
(116, 'departments edit', 'web', '2020-06-15 07:51:26', '2020-06-15 07:51:26'),
(117, 'departments update', 'web', '2020-06-15 07:56:24', '2020-06-15 07:56:24'),
(118, 'marketing ways destroy', 'web', '2020-06-15 08:42:06', '2020-06-15 08:42:06'),
(119, 'inventories update', 'web', '2020-06-15 08:47:54', '2020-06-15 08:47:54'),
(120, 'item categories edit', 'web', '2020-06-15 09:28:09', '2020-06-15 09:28:09'),
(121, 'item categories update', 'web', '2020-06-15 09:38:36', '2020-06-15 09:38:36'),
(122, 'item categories destroy', 'web', '2020-06-15 09:38:43', '2020-06-15 09:38:43'),
(123, 'items edit', 'web', '2020-06-15 09:51:47', '2020-06-15 09:51:47'),
(124, 'items update', 'web', '2020-06-15 09:56:51', '2020-06-15 09:56:51'),
(125, 'items destroy', 'web', '2020-06-15 09:57:07', '2020-06-15 09:57:07'),
(126, 'leads statuses edit', 'web', '2020-06-15 10:06:20', '2020-06-15 10:06:20'),
(127, 'leads statuses update', 'web', '2020-06-15 10:08:51', '2020-06-15 10:08:51'),
(128, 'connection ways edit', 'web', '2020-06-15 10:11:49', '2020-06-15 10:11:49'),
(129, 'client categories edit', 'web', '2020-06-15 10:22:29', '2020-06-15 10:22:29'),
(130, 'client categories update', 'web', '2020-06-15 10:22:39', '2020-06-15 10:22:39'),
(131, 'client categories destroy', 'web', '2020-06-15 10:23:13', '2020-06-15 10:23:13'),
(132, 'items show', 'web', '2020-06-15 10:42:19', '2020-06-15 10:42:19'),
(133, 'connection ways update', 'web', '2020-06-15 10:52:23', '2020-06-15 10:52:23'),
(134, 'connection ways create', 'web', '2020-06-15 10:52:35', '2020-06-15 10:52:35'),
(135, 'connection ways store', 'web', '2020-06-15 10:52:51', '2020-06-15 10:52:51'),
(136, 'item categories show', 'web', '2020-06-15 10:57:51', '2020-06-15 10:57:51'),
(137, 'connection ways destroy', 'web', '2020-06-15 11:24:12', '2020-06-15 11:24:12'),
(138, 'lead operations update', 'web', '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(139, 'contact list edit', 'web', '2020-06-15 12:58:16', '2020-06-15 12:58:16'),
(140, 'contact list update', 'web', '2020-06-15 12:58:20', '2020-06-15 12:58:20'),
(141, 'notfications destroy', 'web', '2020-06-15 13:19:26', '2020-06-15 13:19:26'),
(142, 'role permissions store', 'web', '2020-06-16 08:21:14', '2020-06-16 08:21:14'),
(143, 'departments destroy', 'web', '2020-06-16 09:08:09', '2020-06-16 09:08:09'),
(144, 'clients destroy', 'web', '2020-06-16 10:37:53', '2020-06-16 10:37:53'),
(145, 'clients update show', 'web', '2020-06-16 10:38:09', '2020-06-16 10:38:09'),
(146, 'clients update phones', 'web', '2020-06-16 10:38:12', '2020-06-16 10:38:12'),
(147, 'leads destroy', 'web', '2020-06-16 10:42:21', '2020-06-16 10:42:21'),
(148, 'leads update', 'web', '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(149, 'contact list destroy', 'web', '2020-06-16 10:43:20', '2020-06-16 10:43:20'),
(150, 'inventories destroy', 'web', '2020-06-16 10:44:12', '2020-06-16 10:44:12'),
(151, 'campaigns edit', 'web', '2020-06-16 10:52:50', '2020-06-16 10:52:50'),
(152, 'campaigns update', 'web', '2020-06-16 10:52:53', '2020-06-16 10:52:53'),
(153, 'campaigns destroy', 'web', '2020-06-16 10:52:57', '2020-06-16 10:52:57'),
(154, 'sales order edit', 'web', '2020-06-16 11:09:25', '2020-06-16 11:09:25'),
(155, 'sales order update', 'web', '2020-06-16 11:09:29', '2020-06-16 11:09:29'),
(156, 'sales invoices destroy', 'web', '2020-06-16 11:11:25', '2020-06-16 11:11:25'),
(157, 'collection create', 'web', '2020-06-16 11:11:38', '2020-06-16 11:11:38'),
(158, 'get client salse invoices', 'web', '2020-06-16 11:11:40', '2020-06-16 11:11:40'),
(159, 'collection store', 'web', '2020-06-16 11:11:47', '2020-06-16 11:11:47'),
(160, 'suppliers update', 'web', '2020-06-16 11:12:51', '2020-06-16 11:12:51'),
(161, 'suppliers destroy', 'web', '2020-06-16 11:12:56', '2020-06-16 11:12:56'),
(162, 'purchase invoices destroy', 'web', '2020-06-16 11:13:06', '2020-06-16 11:13:06'),
(163, 'leads statuses destroy', 'web', '2020-06-16 11:15:39', '2020-06-16 11:15:39'),
(164, 'client categories create', 'web', '2020-06-16 11:17:04', '2020-06-16 11:17:04'),
(165, 'client categories store', 'web', '2020-06-16 11:17:07', '2020-06-16 11:17:07'),
(166, 'users show', 'web', '2020-06-16 12:28:27', '2020-06-16 12:28:27'),
(167, 'sales order destroy', 'web', '2020-06-16 14:45:19', '2020-06-16 14:45:19'),
(168, 'collection edit', 'web', '2020-06-16 15:31:31', '2020-06-16 15:31:31'),
(169, 'collection update', 'web', '2020-06-16 15:31:34', '2020-06-16 15:31:34'),
(170, 'collection approve', 'web', '2020-06-16 15:31:36', '2020-06-16 15:31:36'),
(171, 'collection print', 'web', '2020-06-16 15:31:39', '2020-06-16 15:31:39'),
(172, 'collection destroy', 'web', '2020-06-16 15:34:21', '2020-06-16 15:34:21'),
(173, 'payments destroy', 'web', '2020-06-16 16:04:13', '2020-06-16 16:04:13'),
(174, 'lead operations index', 'web', '2020-06-18 15:11:21', '2020-06-18 15:11:21'),
(175, 'projects index', 'web', '2020-06-23 10:38:04', '2020-06-23 10:38:04'),
(176, 'projects create', 'web', '2020-06-23 10:44:36', '2020-06-23 10:44:36'),
(177, 'projects store', 'web', '2020-06-23 10:45:33', '2020-06-23 10:45:33'),
(178, 'projects edit', 'web', '2020-06-23 10:45:58', '2020-06-23 10:45:58'),
(179, 'projects destroy', 'web', '2020-06-23 10:46:07', '2020-06-23 10:46:07'),
(180, 'projects update', 'web', '2020-06-23 12:11:35', '2020-06-23 12:11:35'),
(181, 'clients leads index', 'web', '2020-06-23 15:47:51', '2020-06-23 15:47:51'),
(182, 'reports/clients leads index', 'web', '2020-06-23 16:21:45', '2020-06-23 16:21:45'),
(183, 'sales order show leads', 'web', '2020-06-24 10:08:57', '2020-06-24 10:08:57'),
(184, 'sales order by leads', 'web', '2020-06-24 11:30:42', '2020-06-24 11:30:42'),
(185, 'reports/clients leads export excel', 'web', '2020-06-25 08:23:49', '2020-06-25 08:23:49'),
(186, 'reports/client sales order index', 'web', '2020-06-25 12:01:29', '2020-06-25 12:01:29'),
(187, 'variations index', 'web', '2020-06-25 12:37:27', '2020-06-25 12:37:27'),
(188, 'sales invoices installments create', 'web', '2020-06-25 12:45:21', '2020-06-25 12:45:21'),
(189, 'reports/clients leads export pdf', 'web', '2020-06-25 13:20:03', '2020-06-25 13:20:03'),
(190, 'reports/client sales order export excel', 'web', '2020-06-25 14:58:26', '2020-06-25 14:58:26'),
(191, 'reports/client sales order export pdf', 'web', '2020-06-25 14:59:04', '2020-06-25 14:59:04'),
(192, 'reports/client balances index', 'web', '2020-06-28 07:03:48', '2020-06-28 07:03:48'),
(193, 'reports/client sales invoice index', 'web', '2020-06-28 07:12:34', '2020-06-28 07:12:34'),
(194, 'reports/lead operations index', 'web', '2020-06-28 07:17:46', '2020-06-28 07:17:46'),
(195, 'reports/client sales invoice export excel', 'web', '2020-06-28 07:29:56', '2020-06-28 07:29:56'),
(196, 'reports/client sales invoice export pdf', 'web', '2020-06-28 07:30:40', '2020-06-28 07:30:40'),
(197, 'reports/client balances export pdf', 'web', '2020-06-28 08:27:09', '2020-06-28 08:27:09'),
(198, 'reports/deals index', 'web', '2020-06-28 09:17:41', '2020-06-28 09:17:41'),
(199, 'reports/deals export excel', 'web', '2020-06-28 10:42:36', '2020-06-28 10:42:36'),
(200, 'reports/deals export pdf', 'web', '2020-06-28 10:50:45', '2020-06-28 10:50:45'),
(201, 'reports/stock receipt report index', 'web', '2020-06-28 12:47:07', '2020-06-28 12:47:07'),
(202, 'reports/stock receipt report export excel', 'web', '2020-06-29 06:39:26', '2020-06-29 06:39:26'),
(203, 'reports/stock receipt report export pdf', 'web', '2020-06-29 06:39:29', '2020-06-29 06:39:29'),
(204, 'reports/stock ageing report index', 'web', '2020-06-29 10:14:40', '2020-06-29 10:14:40'),
(205, 'reports/stock ageing report export pdf', 'web', '2020-06-29 11:56:24', '2020-06-29 11:56:24'),
(206, 'reports/stock ageing report export excel', 'web', '2020-06-29 12:19:03', '2020-06-29 12:19:03'),
(207, 'inventory items create', 'web', '2020-06-30 16:32:30', '2020-06-30 16:32:30'),
(208, 'clients import', 'web', '2020-07-01 16:43:29', '2020-07-01 16:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_installments`
--

CREATE TABLE `purchase_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

CREATE TABLE `purchase_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_id` int(11) NOT NULL,
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `final_total` double(8,2) NOT NULL DEFAULT '0.00',
  `total_after_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_type` enum('cash','post_paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `discount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `discount_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `total_taxes_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `paid_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `remaining_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `date` date DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice_items`
--

CREATE TABLE `purchase_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `unit_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(8,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responsables`
--

CREATE TABLE `responsables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `responsables`
--

INSERT INTO `responsables` (`id`, `employee_id`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(4, 8, 'App\\Models\\User', 121, '2020-07-02 14:25:34', '2020-07-02 14:25:34'),
(5, 8, 'App\\Models\\User', 122, '2020-07-02 14:26:33', '2020-07-02 14:26:33'),
(6, 121, 'App\\Models\\User', 122, '2020-07-02 14:26:33', '2020-07-02 14:26:33'),
(7, 8, 'App\\Models\\User', 123, '2020-07-02 14:27:04', '2020-07-02 14:27:04'),
(8, 121, 'App\\Models\\User', 123, '2020-07-02 14:27:04', '2020-07-02 14:27:04'),
(9, 8, 'App\\Models\\User', 124, '2020-07-02 14:27:44', '2020-07-02 14:27:44'),
(10, 121, 'App\\Models\\User', 124, '2020-07-02 14:27:44', '2020-07-02 14:27:44'),
(11, 8, 'App\\Models\\User', 125, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(12, 121, 'App\\Models\\User', 125, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(13, 122, 'App\\Models\\User', 125, '2020-07-02 14:29:54', '2020-07-02 14:29:54'),
(17, 8, 'App\\Models\\User', 128, '2020-07-02 14:34:12', '2020-07-02 14:34:12'),
(18, 121, 'App\\Models\\User', 128, '2020-07-02 14:34:12', '2020-07-02 14:34:12'),
(19, 123, 'App\\Models\\User', 128, '2020-07-02 14:34:12', '2020-07-02 14:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `guard_name`, `name`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(2, 'web', 'ادارة المخازن', '2020-06-09 06:35:14', '2020-06-16 08:10:52', 'ادارة المخازن', 'ادارة المخازن'),
(3, 'web', 'ادارة العملاء', '2020-06-10 13:32:41', '2020-06-16 08:09:11', 'ادارة العملاء', 'ادارة العملاء'),
(4, 'web', 'ادارة المستخدمين', '2020-06-15 08:15:36', '2020-06-16 08:06:56', 'ادارة المستخدمين', 'ادارة المستخدمين'),
(5, 'web', 'ادارة التسويق', '2020-06-16 08:11:11', '2020-06-16 08:11:11', 'ادارة التسويق', 'ادارة التسويق'),
(6, 'web', 'ادارة المبيعات', '2020-06-16 08:11:25', '2020-06-16 08:11:25', 'ادارة المبيعات', 'ادارة المبيعات'),
(7, 'web', 'ادارة المشتريات', '2020-06-16 08:12:09', '2020-06-16 08:12:09', 'ادارة المشتريات', 'ادارة المشتريات'),
(8, 'web', 'الاعدادات', '2020-06-16 08:12:18', '2020-06-16 08:12:18', 'الاعدادات', 'الاعدادات'),
(9, 'web', 'السجلات', '2020-06-16 08:12:26', '2020-06-16 08:12:26', 'السجلات', 'السجلات');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL),
(1, 6, NULL, NULL),
(1, 7, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(3, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(3, 5, NULL, NULL),
(3, 6, NULL, NULL),
(3, 7, NULL, NULL),
(3, 8, NULL, NULL),
(3, 9, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 8, NULL, NULL),
(4, 9, NULL, NULL),
(5, 2, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(5, 5, NULL, NULL),
(5, 6, NULL, NULL),
(5, 7, NULL, NULL),
(5, 8, NULL, NULL),
(5, 9, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL),
(6, 5, NULL, NULL),
(6, 6, NULL, NULL),
(6, 7, NULL, NULL),
(6, 8, NULL, NULL),
(6, 9, NULL, NULL),
(7, 2, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(7, 5, NULL, NULL),
(7, 6, NULL, NULL),
(7, 7, NULL, NULL),
(7, 8, NULL, NULL),
(7, 9, NULL, NULL),
(8, 2, NULL, NULL),
(8, 3, NULL, NULL),
(8, 4, NULL, NULL),
(8, 5, NULL, NULL),
(8, 6, NULL, NULL),
(8, 7, NULL, NULL),
(8, 8, NULL, NULL),
(8, 9, NULL, NULL),
(9, 2, NULL, NULL),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(9, 5, NULL, NULL),
(9, 6, NULL, NULL),
(9, 7, NULL, NULL),
(9, 8, NULL, NULL),
(9, 9, NULL, NULL),
(10, 2, NULL, NULL),
(10, 3, NULL, NULL),
(10, 4, NULL, NULL),
(10, 5, NULL, NULL),
(10, 6, NULL, NULL),
(10, 7, NULL, NULL),
(10, 8, NULL, NULL),
(10, 9, NULL, NULL),
(11, 2, NULL, NULL),
(11, 3, NULL, NULL),
(11, 4, NULL, NULL),
(11, 5, NULL, NULL),
(11, 6, NULL, NULL),
(11, 7, NULL, NULL),
(11, 8, NULL, NULL),
(11, 9, NULL, NULL),
(12, 2, NULL, NULL),
(12, 3, NULL, NULL),
(12, 4, NULL, NULL),
(12, 5, NULL, NULL),
(12, 6, NULL, NULL),
(12, 7, NULL, NULL),
(12, 8, NULL, NULL),
(12, 9, NULL, NULL),
(13, 2, NULL, NULL),
(13, 3, NULL, NULL),
(13, 4, NULL, NULL),
(13, 5, NULL, NULL),
(13, 6, NULL, NULL),
(13, 7, NULL, NULL),
(13, 8, NULL, NULL),
(13, 9, NULL, NULL),
(14, 2, NULL, NULL),
(14, 3, NULL, NULL),
(14, 4, NULL, NULL),
(14, 5, NULL, NULL),
(14, 6, NULL, NULL),
(14, 7, NULL, NULL),
(14, 8, NULL, NULL),
(14, 9, NULL, NULL),
(15, 2, NULL, NULL),
(15, 3, NULL, NULL),
(15, 4, NULL, NULL),
(15, 5, NULL, NULL),
(15, 6, NULL, NULL),
(15, 7, NULL, NULL),
(15, 8, NULL, NULL),
(15, 9, NULL, NULL),
(16, 2, NULL, NULL),
(16, 3, NULL, NULL),
(16, 4, NULL, NULL),
(16, 5, NULL, NULL),
(16, 6, NULL, NULL),
(16, 7, NULL, NULL),
(16, 8, NULL, NULL),
(16, 9, NULL, NULL),
(17, 2, NULL, NULL),
(17, 3, NULL, NULL),
(17, 4, NULL, NULL),
(17, 5, NULL, NULL),
(17, 6, NULL, NULL),
(17, 7, NULL, NULL),
(17, 8, NULL, NULL),
(17, 9, NULL, NULL),
(18, 2, NULL, NULL),
(18, 3, NULL, NULL),
(18, 4, NULL, NULL),
(18, 5, NULL, NULL),
(18, 6, NULL, NULL),
(18, 7, NULL, NULL),
(18, 8, NULL, NULL),
(18, 9, NULL, NULL),
(19, 2, NULL, NULL),
(19, 3, NULL, NULL),
(19, 4, NULL, NULL),
(19, 5, NULL, NULL),
(19, 6, NULL, NULL),
(19, 7, NULL, NULL),
(19, 8, NULL, NULL),
(19, 9, NULL, NULL),
(20, 2, NULL, NULL),
(20, 3, NULL, NULL),
(20, 4, NULL, NULL),
(20, 5, NULL, NULL),
(20, 6, NULL, NULL),
(20, 7, NULL, NULL),
(20, 8, NULL, NULL),
(20, 9, NULL, NULL),
(21, 2, NULL, NULL),
(21, 3, NULL, NULL),
(21, 4, NULL, NULL),
(21, 5, NULL, NULL),
(21, 6, NULL, NULL),
(21, 7, NULL, NULL),
(21, 8, NULL, NULL),
(21, 9, NULL, NULL),
(22, 2, NULL, NULL),
(22, 3, NULL, NULL),
(22, 4, NULL, NULL),
(22, 5, NULL, NULL),
(22, 6, NULL, NULL),
(22, 7, NULL, NULL),
(22, 8, NULL, NULL),
(22, 9, NULL, NULL),
(23, 2, NULL, NULL),
(23, 3, NULL, NULL),
(23, 4, NULL, NULL),
(23, 5, NULL, NULL),
(23, 6, NULL, NULL),
(23, 7, NULL, NULL),
(23, 8, NULL, NULL),
(23, 9, NULL, NULL),
(24, 2, NULL, NULL),
(24, 3, NULL, NULL),
(24, 4, NULL, NULL),
(24, 5, NULL, NULL),
(24, 6, NULL, NULL),
(24, 7, NULL, NULL),
(24, 8, NULL, NULL),
(24, 9, NULL, NULL),
(25, 2, NULL, NULL),
(25, 3, NULL, NULL),
(25, 4, NULL, NULL),
(25, 5, NULL, NULL),
(25, 6, NULL, NULL),
(25, 7, NULL, NULL),
(25, 8, NULL, NULL),
(25, 9, NULL, NULL),
(26, 2, NULL, NULL),
(26, 3, NULL, NULL),
(26, 4, NULL, NULL),
(26, 5, NULL, NULL),
(26, 6, NULL, NULL),
(26, 7, NULL, NULL),
(26, 8, NULL, NULL),
(26, 9, NULL, NULL),
(27, 2, NULL, NULL),
(27, 3, NULL, NULL),
(27, 4, NULL, NULL),
(27, 5, NULL, NULL),
(27, 6, NULL, NULL),
(27, 7, NULL, NULL),
(27, 8, NULL, NULL),
(27, 9, NULL, NULL),
(28, 2, NULL, NULL),
(28, 3, NULL, NULL),
(28, 4, NULL, NULL),
(28, 5, NULL, NULL),
(28, 6, NULL, NULL),
(28, 7, NULL, NULL),
(28, 8, NULL, NULL),
(28, 9, NULL, NULL),
(29, 2, NULL, NULL),
(29, 3, NULL, NULL),
(29, 4, NULL, NULL),
(29, 5, NULL, NULL),
(29, 6, NULL, NULL),
(29, 7, NULL, NULL),
(29, 8, NULL, NULL),
(29, 9, NULL, NULL),
(30, 2, NULL, NULL),
(30, 3, NULL, NULL),
(30, 4, NULL, NULL),
(30, 5, NULL, NULL),
(30, 6, NULL, NULL),
(30, 7, NULL, NULL),
(30, 8, NULL, NULL),
(30, 9, NULL, NULL),
(31, 2, NULL, NULL),
(31, 3, NULL, NULL),
(31, 4, NULL, NULL),
(31, 5, NULL, NULL),
(31, 6, NULL, NULL),
(31, 7, NULL, NULL),
(31, 8, NULL, NULL),
(31, 9, NULL, NULL),
(32, 2, NULL, NULL),
(32, 3, NULL, NULL),
(32, 4, NULL, NULL),
(32, 5, NULL, NULL),
(32, 6, NULL, NULL),
(32, 7, NULL, NULL),
(32, 8, NULL, NULL),
(32, 9, NULL, NULL),
(33, 2, NULL, NULL),
(33, 3, NULL, NULL),
(33, 4, NULL, NULL),
(33, 5, NULL, NULL),
(33, 6, NULL, NULL),
(33, 7, NULL, NULL),
(33, 8, NULL, NULL),
(33, 9, NULL, NULL),
(34, 2, NULL, NULL),
(34, 3, NULL, NULL),
(34, 4, NULL, NULL),
(34, 5, NULL, NULL),
(34, 6, NULL, NULL),
(34, 7, NULL, NULL),
(34, 8, NULL, NULL),
(34, 9, NULL, NULL),
(35, 2, NULL, NULL),
(35, 3, NULL, NULL),
(35, 4, NULL, NULL),
(35, 5, NULL, NULL),
(35, 6, NULL, NULL),
(35, 7, NULL, NULL),
(35, 8, NULL, NULL),
(35, 9, NULL, NULL),
(36, 2, NULL, NULL),
(36, 3, NULL, NULL),
(36, 4, NULL, NULL),
(36, 5, NULL, NULL),
(36, 6, NULL, NULL),
(36, 7, NULL, NULL),
(36, 8, NULL, NULL),
(36, 9, NULL, NULL),
(37, 2, NULL, NULL),
(37, 3, NULL, NULL),
(37, 4, NULL, NULL),
(37, 5, NULL, NULL),
(37, 6, NULL, NULL),
(37, 7, NULL, NULL),
(37, 8, NULL, NULL),
(37, 9, NULL, NULL),
(38, 2, NULL, NULL),
(38, 3, NULL, NULL),
(38, 4, NULL, NULL),
(38, 5, NULL, NULL),
(38, 6, NULL, NULL),
(38, 7, NULL, NULL),
(38, 8, NULL, NULL),
(38, 9, NULL, NULL),
(39, 2, NULL, NULL),
(39, 3, NULL, NULL),
(39, 4, NULL, NULL),
(39, 5, NULL, NULL),
(39, 6, NULL, NULL),
(39, 7, NULL, NULL),
(39, 8, NULL, NULL),
(39, 9, NULL, NULL),
(40, 2, NULL, NULL),
(40, 3, NULL, NULL),
(40, 4, NULL, NULL),
(40, 5, NULL, NULL),
(40, 6, NULL, NULL),
(40, 7, NULL, NULL),
(40, 8, NULL, NULL),
(40, 9, NULL, NULL),
(41, 2, NULL, NULL),
(41, 3, NULL, NULL),
(41, 4, NULL, NULL),
(41, 5, NULL, NULL),
(41, 6, NULL, NULL),
(41, 7, NULL, NULL),
(41, 8, NULL, NULL),
(41, 9, NULL, NULL),
(42, 2, NULL, NULL),
(42, 3, NULL, NULL),
(42, 4, NULL, NULL),
(42, 5, NULL, NULL),
(42, 6, NULL, NULL),
(42, 7, NULL, NULL),
(42, 8, NULL, NULL),
(42, 9, NULL, NULL),
(43, 2, NULL, NULL),
(43, 3, NULL, NULL),
(43, 4, NULL, NULL),
(43, 5, NULL, NULL),
(43, 6, NULL, NULL),
(43, 7, NULL, NULL),
(43, 8, NULL, NULL),
(43, 9, NULL, NULL),
(44, 2, NULL, NULL),
(44, 3, NULL, NULL),
(44, 4, NULL, NULL),
(44, 5, NULL, NULL),
(44, 6, NULL, NULL),
(44, 7, NULL, NULL),
(44, 8, NULL, NULL),
(44, 9, NULL, NULL),
(45, 2, NULL, NULL),
(45, 3, NULL, NULL),
(45, 4, NULL, NULL),
(45, 5, NULL, NULL),
(45, 6, NULL, NULL),
(45, 7, NULL, NULL),
(45, 8, NULL, NULL),
(45, 9, NULL, NULL),
(46, 2, NULL, NULL),
(46, 3, NULL, NULL),
(46, 4, NULL, NULL),
(46, 5, NULL, NULL),
(46, 6, NULL, NULL),
(46, 7, NULL, NULL),
(46, 8, NULL, NULL),
(46, 9, NULL, NULL),
(47, 2, NULL, NULL),
(47, 3, NULL, NULL),
(47, 4, NULL, NULL),
(47, 5, NULL, NULL),
(47, 6, NULL, NULL),
(47, 7, NULL, NULL),
(47, 8, NULL, NULL),
(47, 9, NULL, NULL),
(48, 2, NULL, NULL),
(48, 3, NULL, NULL),
(48, 4, NULL, NULL),
(48, 5, NULL, NULL),
(48, 6, NULL, NULL),
(48, 7, NULL, NULL),
(48, 8, NULL, NULL),
(48, 9, NULL, NULL),
(49, 2, NULL, NULL),
(49, 3, NULL, NULL),
(49, 4, NULL, NULL),
(49, 5, NULL, NULL),
(49, 6, NULL, NULL),
(49, 7, NULL, NULL),
(49, 8, NULL, NULL),
(49, 9, NULL, NULL),
(50, 2, NULL, NULL),
(50, 3, NULL, NULL),
(50, 4, NULL, NULL),
(50, 5, NULL, NULL),
(50, 6, NULL, NULL),
(50, 7, NULL, NULL),
(50, 8, NULL, NULL),
(50, 9, NULL, NULL),
(51, 2, NULL, NULL),
(51, 3, NULL, NULL),
(51, 4, NULL, NULL),
(51, 5, NULL, NULL),
(51, 6, NULL, NULL),
(51, 7, NULL, NULL),
(51, 8, NULL, NULL),
(51, 9, NULL, NULL),
(52, 2, NULL, NULL),
(52, 3, NULL, NULL),
(52, 4, NULL, NULL),
(52, 5, NULL, NULL),
(52, 6, NULL, NULL),
(52, 7, NULL, NULL),
(52, 8, NULL, NULL),
(52, 9, NULL, NULL),
(53, 2, NULL, NULL),
(53, 3, NULL, NULL),
(53, 4, NULL, NULL),
(53, 5, NULL, NULL),
(53, 6, NULL, NULL),
(53, 7, NULL, NULL),
(53, 8, NULL, NULL),
(53, 9, NULL, NULL),
(54, 2, NULL, NULL),
(54, 3, NULL, NULL),
(54, 4, NULL, NULL),
(54, 5, NULL, NULL),
(54, 6, NULL, NULL),
(54, 7, NULL, NULL),
(54, 8, NULL, NULL),
(54, 9, NULL, NULL),
(55, 2, NULL, NULL),
(55, 3, NULL, NULL),
(55, 4, NULL, NULL),
(55, 5, NULL, NULL),
(55, 6, NULL, NULL),
(55, 7, NULL, NULL),
(55, 8, NULL, NULL),
(55, 9, NULL, NULL),
(56, 2, NULL, NULL),
(56, 3, NULL, NULL),
(56, 4, NULL, NULL),
(56, 5, NULL, NULL),
(56, 6, NULL, NULL),
(56, 7, NULL, NULL),
(56, 8, NULL, NULL),
(56, 9, NULL, NULL),
(57, 2, NULL, NULL),
(57, 3, NULL, NULL),
(57, 4, NULL, NULL),
(57, 5, NULL, NULL),
(57, 6, NULL, NULL),
(57, 7, NULL, NULL),
(57, 8, NULL, NULL),
(57, 9, NULL, NULL),
(58, 2, NULL, NULL),
(58, 3, NULL, NULL),
(58, 4, NULL, NULL),
(58, 5, NULL, NULL),
(58, 6, NULL, NULL),
(58, 7, NULL, NULL),
(58, 8, NULL, NULL),
(58, 9, NULL, NULL),
(59, 2, NULL, NULL),
(59, 3, NULL, NULL),
(59, 4, NULL, NULL),
(59, 5, NULL, NULL),
(59, 6, NULL, NULL),
(59, 7, NULL, NULL),
(59, 8, NULL, NULL),
(59, 9, NULL, NULL),
(60, 2, NULL, NULL),
(60, 3, NULL, NULL),
(60, 4, NULL, NULL),
(60, 5, NULL, NULL),
(60, 6, NULL, NULL),
(60, 7, NULL, NULL),
(60, 8, NULL, NULL),
(60, 9, NULL, NULL),
(61, 2, NULL, NULL),
(61, 3, NULL, NULL),
(61, 4, NULL, NULL),
(61, 5, NULL, NULL),
(61, 6, NULL, NULL),
(61, 7, NULL, NULL),
(61, 8, NULL, NULL),
(61, 9, NULL, NULL),
(62, 2, NULL, NULL),
(62, 3, NULL, NULL),
(62, 4, NULL, NULL),
(62, 5, NULL, NULL),
(62, 6, NULL, NULL),
(62, 7, NULL, NULL),
(62, 8, NULL, NULL),
(62, 9, NULL, NULL),
(63, 2, NULL, NULL),
(63, 3, NULL, NULL),
(63, 4, NULL, NULL),
(63, 5, NULL, NULL),
(63, 6, NULL, NULL),
(63, 7, NULL, NULL),
(63, 8, NULL, NULL),
(63, 9, NULL, NULL),
(64, 2, NULL, NULL),
(64, 3, NULL, NULL),
(64, 4, NULL, NULL),
(64, 5, NULL, NULL),
(64, 6, NULL, NULL),
(64, 7, NULL, NULL),
(64, 8, NULL, NULL),
(64, 9, NULL, NULL),
(65, 2, NULL, NULL),
(65, 3, NULL, NULL),
(65, 4, NULL, NULL),
(65, 5, NULL, NULL),
(65, 6, NULL, NULL),
(65, 7, NULL, NULL),
(65, 8, NULL, NULL),
(65, 9, NULL, NULL),
(66, 2, NULL, NULL),
(66, 3, NULL, NULL),
(66, 4, NULL, NULL),
(66, 5, NULL, NULL),
(66, 6, NULL, NULL),
(66, 7, NULL, NULL),
(66, 8, NULL, NULL),
(66, 9, NULL, NULL),
(67, 2, NULL, NULL),
(67, 3, NULL, NULL),
(67, 4, NULL, NULL),
(67, 5, NULL, NULL),
(67, 6, NULL, NULL),
(67, 7, NULL, NULL),
(67, 8, NULL, NULL),
(67, 9, NULL, NULL),
(68, 2, NULL, NULL),
(68, 3, NULL, NULL),
(68, 4, NULL, NULL),
(68, 5, NULL, NULL),
(68, 6, NULL, NULL),
(68, 7, NULL, NULL),
(68, 8, NULL, NULL),
(68, 9, NULL, NULL),
(69, 2, NULL, NULL),
(69, 3, NULL, NULL),
(69, 4, NULL, NULL),
(69, 5, NULL, NULL),
(69, 6, NULL, NULL),
(69, 7, NULL, NULL),
(69, 8, NULL, NULL),
(69, 9, NULL, NULL),
(70, 2, NULL, NULL),
(70, 3, NULL, NULL),
(70, 4, NULL, NULL),
(70, 5, NULL, NULL),
(70, 6, NULL, NULL),
(70, 7, NULL, NULL),
(70, 8, NULL, NULL),
(70, 9, NULL, NULL),
(71, 2, NULL, NULL),
(71, 3, NULL, NULL),
(71, 4, NULL, NULL),
(71, 5, NULL, NULL),
(71, 6, NULL, NULL),
(71, 7, NULL, NULL),
(71, 8, NULL, NULL),
(71, 9, NULL, NULL),
(72, 2, NULL, NULL),
(72, 3, NULL, NULL),
(72, 4, NULL, NULL),
(72, 5, NULL, NULL),
(72, 6, NULL, NULL),
(72, 7, NULL, NULL),
(72, 8, NULL, NULL),
(72, 9, NULL, NULL),
(73, 2, NULL, NULL),
(73, 3, NULL, NULL),
(73, 4, NULL, NULL),
(73, 5, NULL, NULL),
(73, 6, NULL, NULL),
(73, 7, NULL, NULL),
(73, 8, NULL, NULL),
(73, 9, NULL, NULL),
(74, 2, NULL, NULL),
(74, 3, NULL, NULL),
(74, 4, NULL, NULL),
(74, 5, NULL, NULL),
(74, 6, NULL, NULL),
(74, 7, NULL, NULL),
(74, 8, NULL, NULL),
(74, 9, NULL, NULL),
(75, 2, NULL, NULL),
(75, 3, NULL, NULL),
(75, 4, NULL, NULL),
(75, 5, NULL, NULL),
(75, 6, NULL, NULL),
(75, 7, NULL, NULL),
(75, 8, NULL, NULL),
(75, 9, NULL, NULL),
(76, 2, NULL, NULL),
(76, 3, NULL, NULL),
(76, 4, NULL, NULL),
(76, 5, NULL, NULL),
(76, 6, NULL, NULL),
(76, 7, NULL, NULL),
(76, 8, NULL, NULL),
(76, 9, NULL, NULL),
(77, 2, NULL, NULL),
(77, 3, NULL, NULL),
(77, 4, NULL, NULL),
(77, 5, NULL, NULL),
(77, 6, NULL, NULL),
(77, 7, NULL, NULL),
(77, 8, NULL, NULL),
(77, 9, NULL, NULL),
(78, 2, NULL, NULL),
(78, 3, NULL, NULL),
(78, 4, NULL, NULL),
(78, 5, NULL, NULL),
(78, 6, NULL, NULL),
(78, 7, NULL, NULL),
(78, 8, NULL, NULL),
(78, 9, NULL, NULL),
(79, 2, NULL, NULL),
(79, 3, NULL, NULL),
(79, 4, NULL, NULL),
(79, 5, NULL, NULL),
(79, 6, NULL, NULL),
(79, 7, NULL, NULL),
(79, 8, NULL, NULL),
(79, 9, NULL, NULL),
(80, 2, NULL, NULL),
(80, 3, NULL, NULL),
(80, 4, NULL, NULL),
(80, 5, NULL, NULL),
(80, 6, NULL, NULL),
(80, 7, NULL, NULL),
(80, 8, NULL, NULL),
(80, 9, NULL, NULL),
(81, 2, NULL, NULL),
(81, 3, NULL, NULL),
(81, 4, NULL, NULL),
(81, 5, NULL, NULL),
(81, 6, NULL, NULL),
(81, 7, NULL, NULL),
(81, 8, NULL, NULL),
(81, 9, NULL, NULL),
(82, 2, NULL, NULL),
(82, 3, NULL, NULL),
(82, 4, NULL, NULL),
(82, 5, NULL, NULL),
(82, 6, NULL, NULL),
(82, 7, NULL, NULL),
(82, 8, NULL, NULL),
(82, 9, NULL, NULL),
(83, 2, NULL, NULL),
(83, 3, NULL, NULL),
(83, 4, NULL, NULL),
(83, 5, NULL, NULL),
(83, 6, NULL, NULL),
(83, 7, NULL, NULL),
(83, 8, NULL, NULL),
(83, 9, NULL, NULL),
(84, 2, NULL, NULL),
(84, 3, NULL, NULL),
(84, 4, NULL, NULL),
(84, 5, NULL, NULL),
(84, 6, NULL, NULL),
(84, 7, NULL, NULL),
(84, 8, NULL, NULL),
(84, 9, NULL, NULL),
(85, 2, NULL, NULL),
(85, 3, NULL, NULL),
(85, 4, NULL, NULL),
(85, 5, NULL, NULL),
(85, 6, NULL, NULL),
(85, 7, NULL, NULL),
(85, 8, NULL, NULL),
(85, 9, NULL, NULL),
(86, 2, NULL, NULL),
(86, 3, NULL, NULL),
(86, 4, NULL, NULL),
(86, 5, NULL, NULL),
(86, 6, NULL, NULL),
(86, 7, NULL, NULL),
(86, 8, NULL, NULL),
(86, 9, NULL, NULL),
(87, 2, NULL, NULL),
(87, 3, NULL, NULL),
(87, 4, NULL, NULL),
(87, 5, NULL, NULL),
(87, 6, NULL, NULL),
(87, 7, NULL, NULL),
(87, 8, NULL, NULL),
(87, 9, NULL, NULL),
(88, 2, NULL, NULL),
(88, 3, NULL, NULL),
(88, 4, NULL, NULL),
(88, 5, NULL, NULL),
(88, 6, NULL, NULL),
(88, 7, NULL, NULL),
(88, 8, NULL, NULL),
(88, 9, NULL, NULL),
(89, 2, NULL, NULL),
(89, 3, NULL, NULL),
(89, 4, NULL, NULL),
(89, 5, NULL, NULL),
(89, 6, NULL, NULL),
(89, 7, NULL, NULL),
(89, 8, NULL, NULL),
(89, 9, NULL, NULL),
(90, 2, NULL, NULL),
(90, 3, NULL, NULL),
(90, 4, NULL, NULL),
(90, 5, NULL, NULL),
(90, 6, NULL, NULL),
(90, 7, NULL, NULL),
(90, 8, NULL, NULL),
(90, 9, NULL, NULL),
(91, 2, NULL, NULL),
(91, 3, NULL, NULL),
(91, 4, NULL, NULL),
(91, 5, NULL, NULL),
(91, 6, NULL, NULL),
(91, 7, NULL, NULL),
(91, 8, NULL, NULL),
(91, 9, NULL, NULL),
(92, 2, NULL, NULL),
(92, 3, NULL, NULL),
(92, 4, NULL, NULL),
(92, 5, NULL, NULL),
(92, 6, NULL, NULL),
(92, 7, NULL, NULL),
(92, 8, NULL, NULL),
(92, 9, NULL, NULL),
(93, 2, NULL, NULL),
(93, 3, NULL, NULL),
(93, 4, NULL, NULL),
(93, 5, NULL, NULL),
(93, 6, NULL, NULL),
(93, 7, NULL, NULL),
(93, 8, NULL, NULL),
(93, 9, NULL, NULL),
(94, 2, NULL, NULL),
(94, 3, NULL, NULL),
(94, 4, NULL, NULL),
(94, 5, NULL, NULL),
(94, 6, NULL, NULL),
(94, 7, NULL, NULL),
(94, 8, NULL, NULL),
(94, 9, NULL, NULL),
(95, 2, NULL, NULL),
(95, 3, NULL, NULL),
(95, 4, NULL, NULL),
(95, 5, NULL, NULL),
(95, 6, NULL, NULL),
(95, 7, NULL, NULL),
(95, 8, NULL, NULL),
(95, 9, NULL, NULL),
(96, 2, NULL, NULL),
(96, 3, NULL, NULL),
(96, 4, NULL, NULL),
(96, 5, NULL, NULL),
(96, 6, NULL, NULL),
(96, 7, NULL, NULL),
(96, 8, NULL, NULL),
(96, 9, NULL, NULL),
(97, 2, NULL, NULL),
(97, 3, NULL, NULL),
(97, 4, NULL, NULL),
(97, 5, NULL, NULL),
(97, 6, NULL, NULL),
(97, 7, NULL, NULL),
(97, 8, NULL, NULL),
(97, 9, NULL, NULL),
(98, 2, NULL, NULL),
(98, 3, NULL, NULL),
(98, 4, NULL, NULL),
(98, 5, NULL, NULL),
(98, 6, NULL, NULL),
(98, 7, NULL, NULL),
(98, 8, NULL, NULL),
(98, 9, NULL, NULL),
(99, 2, NULL, NULL),
(99, 3, NULL, NULL),
(99, 4, NULL, NULL),
(99, 5, NULL, NULL),
(99, 6, NULL, NULL),
(99, 7, NULL, NULL),
(99, 8, NULL, NULL),
(99, 9, NULL, NULL),
(100, 2, NULL, NULL),
(100, 3, NULL, NULL),
(100, 4, NULL, NULL),
(100, 5, NULL, NULL),
(100, 6, NULL, NULL),
(100, 7, NULL, NULL),
(100, 8, NULL, NULL),
(100, 9, NULL, NULL),
(101, 2, NULL, NULL),
(101, 3, NULL, NULL),
(101, 4, NULL, NULL),
(101, 5, NULL, NULL),
(101, 6, NULL, NULL),
(101, 7, NULL, NULL),
(101, 8, NULL, NULL),
(101, 9, NULL, NULL),
(102, 2, NULL, NULL),
(102, 3, NULL, NULL),
(102, 4, NULL, NULL),
(102, 5, NULL, NULL),
(102, 6, NULL, NULL),
(102, 7, NULL, NULL),
(102, 8, NULL, NULL),
(102, 9, NULL, NULL),
(103, 2, NULL, NULL),
(103, 3, NULL, NULL),
(103, 4, NULL, NULL),
(103, 5, NULL, NULL),
(103, 6, NULL, NULL),
(103, 7, NULL, NULL),
(103, 8, NULL, NULL),
(103, 9, NULL, NULL),
(104, 2, NULL, NULL),
(104, 3, NULL, NULL),
(104, 4, NULL, NULL),
(104, 5, NULL, NULL),
(104, 6, NULL, NULL),
(104, 7, NULL, NULL),
(104, 8, NULL, NULL),
(104, 9, NULL, NULL),
(105, 2, NULL, NULL),
(105, 3, NULL, NULL),
(105, 4, NULL, NULL),
(105, 5, NULL, NULL),
(105, 6, NULL, NULL),
(105, 7, NULL, NULL),
(105, 8, NULL, NULL),
(105, 9, NULL, NULL),
(106, 2, NULL, NULL),
(106, 3, NULL, NULL),
(106, 4, NULL, NULL),
(106, 5, NULL, NULL),
(106, 6, NULL, NULL),
(106, 7, NULL, NULL),
(106, 8, NULL, NULL),
(106, 9, NULL, NULL),
(107, 2, NULL, NULL),
(107, 3, NULL, NULL),
(107, 4, NULL, NULL),
(107, 5, NULL, NULL),
(107, 6, NULL, NULL),
(107, 7, NULL, NULL),
(107, 8, NULL, NULL),
(107, 9, NULL, NULL),
(108, 2, NULL, NULL),
(108, 3, NULL, NULL),
(108, 4, NULL, NULL),
(108, 5, NULL, NULL),
(108, 6, NULL, NULL),
(108, 7, NULL, NULL),
(108, 8, NULL, NULL),
(108, 9, NULL, NULL),
(109, 2, NULL, NULL),
(109, 3, NULL, NULL),
(109, 4, NULL, NULL),
(109, 5, NULL, NULL),
(109, 6, NULL, NULL),
(109, 7, NULL, NULL),
(109, 8, NULL, NULL),
(109, 9, NULL, NULL),
(110, 2, NULL, NULL),
(110, 3, NULL, NULL),
(110, 4, NULL, NULL),
(110, 5, NULL, NULL),
(110, 6, NULL, NULL),
(110, 7, NULL, NULL),
(110, 8, NULL, NULL),
(110, 9, NULL, NULL),
(111, 2, NULL, NULL),
(111, 3, NULL, NULL),
(111, 4, NULL, NULL),
(111, 5, NULL, NULL),
(111, 6, NULL, NULL),
(111, 7, NULL, NULL),
(111, 8, NULL, NULL),
(111, 9, NULL, NULL),
(112, 2, NULL, NULL),
(112, 3, NULL, NULL),
(112, 4, NULL, NULL),
(112, 5, NULL, NULL),
(112, 6, NULL, NULL),
(112, 7, NULL, NULL),
(112, 8, NULL, NULL),
(112, 9, NULL, NULL),
(113, 2, NULL, NULL),
(113, 3, NULL, NULL),
(113, 4, NULL, NULL),
(113, 5, NULL, NULL),
(113, 6, NULL, NULL),
(113, 7, NULL, NULL),
(113, 8, NULL, NULL),
(113, 9, NULL, NULL),
(114, 2, NULL, NULL),
(114, 3, NULL, NULL),
(114, 4, NULL, NULL),
(114, 5, NULL, NULL),
(114, 6, NULL, NULL),
(114, 7, NULL, NULL),
(114, 8, NULL, NULL),
(114, 9, NULL, NULL),
(115, 2, NULL, NULL),
(115, 3, NULL, NULL),
(115, 4, NULL, NULL),
(115, 5, NULL, NULL),
(115, 6, NULL, NULL),
(115, 7, NULL, NULL),
(115, 8, NULL, NULL),
(115, 9, NULL, NULL),
(116, 2, NULL, NULL),
(116, 3, NULL, NULL),
(116, 4, NULL, NULL),
(116, 5, NULL, NULL),
(116, 6, NULL, NULL),
(116, 7, NULL, NULL),
(116, 8, NULL, NULL),
(116, 9, NULL, NULL),
(117, 2, NULL, NULL),
(117, 3, NULL, NULL),
(117, 4, NULL, NULL),
(117, 5, NULL, NULL),
(117, 6, NULL, NULL),
(117, 7, NULL, NULL),
(117, 8, NULL, NULL),
(117, 9, NULL, NULL),
(118, 2, NULL, NULL),
(118, 3, NULL, NULL),
(118, 4, NULL, NULL),
(118, 5, NULL, NULL),
(118, 6, NULL, NULL),
(118, 7, NULL, NULL),
(118, 8, NULL, NULL),
(118, 9, NULL, NULL),
(119, 2, NULL, NULL),
(119, 3, NULL, NULL),
(119, 4, NULL, NULL),
(119, 5, NULL, NULL),
(119, 6, NULL, NULL),
(119, 7, NULL, NULL),
(119, 8, NULL, NULL),
(119, 9, NULL, NULL),
(120, 2, NULL, NULL),
(120, 3, NULL, NULL),
(120, 4, NULL, NULL),
(120, 5, NULL, NULL),
(120, 6, NULL, NULL),
(120, 7, NULL, NULL),
(120, 8, NULL, NULL),
(120, 9, NULL, NULL),
(121, 2, NULL, NULL),
(121, 3, NULL, NULL),
(121, 4, NULL, NULL),
(121, 5, NULL, NULL),
(121, 6, NULL, NULL),
(121, 7, NULL, NULL),
(121, 8, NULL, NULL),
(121, 9, NULL, NULL),
(122, 2, NULL, NULL),
(122, 3, NULL, NULL),
(122, 4, NULL, NULL),
(122, 5, NULL, NULL),
(122, 6, NULL, NULL),
(122, 7, NULL, NULL),
(122, 8, NULL, NULL),
(122, 9, NULL, NULL),
(123, 2, NULL, NULL),
(123, 3, NULL, NULL),
(123, 4, NULL, NULL),
(123, 5, NULL, NULL),
(123, 6, NULL, NULL),
(123, 7, NULL, NULL),
(123, 8, NULL, NULL),
(123, 9, NULL, NULL),
(124, 2, NULL, NULL),
(124, 3, NULL, NULL),
(124, 4, NULL, NULL),
(124, 5, NULL, NULL),
(124, 6, NULL, NULL),
(124, 7, NULL, NULL),
(124, 8, NULL, NULL),
(124, 9, NULL, NULL),
(125, 2, NULL, NULL),
(125, 3, NULL, NULL),
(125, 4, NULL, NULL),
(125, 5, NULL, NULL),
(125, 6, NULL, NULL),
(125, 7, NULL, NULL),
(125, 8, NULL, NULL),
(125, 9, NULL, NULL),
(126, 2, NULL, NULL),
(126, 3, NULL, NULL),
(126, 4, NULL, NULL),
(126, 5, NULL, NULL),
(126, 6, NULL, NULL),
(126, 7, NULL, NULL),
(126, 8, NULL, NULL),
(126, 9, NULL, NULL),
(127, 2, NULL, NULL),
(127, 3, NULL, NULL),
(127, 4, NULL, NULL),
(127, 5, NULL, NULL),
(127, 6, NULL, NULL),
(127, 7, NULL, NULL),
(127, 8, NULL, NULL),
(127, 9, NULL, NULL),
(128, 2, NULL, NULL),
(128, 3, NULL, NULL),
(128, 4, NULL, NULL),
(128, 5, NULL, NULL),
(128, 6, NULL, NULL),
(128, 7, NULL, NULL),
(128, 8, NULL, NULL),
(128, 9, NULL, NULL),
(129, 2, NULL, NULL),
(129, 3, NULL, NULL),
(129, 4, NULL, NULL),
(129, 5, NULL, NULL),
(129, 6, NULL, NULL),
(129, 7, NULL, NULL),
(129, 8, NULL, NULL),
(129, 9, NULL, NULL),
(130, 2, NULL, NULL),
(130, 3, NULL, NULL),
(130, 4, NULL, NULL),
(130, 5, NULL, NULL),
(130, 6, NULL, NULL),
(130, 7, NULL, NULL),
(130, 8, NULL, NULL),
(130, 9, NULL, NULL),
(131, 2, NULL, NULL),
(131, 3, NULL, NULL),
(131, 4, NULL, NULL),
(131, 5, NULL, NULL),
(131, 6, NULL, NULL),
(131, 7, NULL, NULL),
(131, 8, NULL, NULL),
(131, 9, NULL, NULL),
(132, 2, NULL, NULL),
(132, 3, NULL, NULL),
(132, 4, NULL, NULL),
(132, 5, NULL, NULL),
(132, 6, NULL, NULL),
(132, 7, NULL, NULL),
(132, 8, NULL, NULL),
(132, 9, NULL, NULL),
(133, 2, NULL, NULL),
(133, 3, NULL, NULL),
(133, 4, NULL, NULL),
(133, 5, NULL, NULL),
(133, 6, NULL, NULL),
(133, 7, NULL, NULL),
(133, 8, NULL, NULL),
(133, 9, NULL, NULL),
(134, 2, NULL, NULL),
(134, 3, NULL, NULL),
(134, 4, NULL, NULL),
(134, 5, NULL, NULL),
(134, 6, NULL, NULL),
(134, 7, NULL, NULL),
(134, 8, NULL, NULL),
(134, 9, NULL, NULL),
(135, 2, NULL, NULL),
(135, 3, NULL, NULL),
(135, 4, NULL, NULL),
(135, 5, NULL, NULL),
(135, 6, NULL, NULL),
(135, 7, NULL, NULL),
(135, 8, NULL, NULL),
(135, 9, NULL, NULL),
(136, 2, NULL, NULL),
(136, 3, NULL, NULL),
(136, 4, NULL, NULL),
(136, 5, NULL, NULL),
(136, 6, NULL, NULL),
(136, 7, NULL, NULL),
(136, 8, NULL, NULL),
(136, 9, NULL, NULL),
(137, 2, NULL, NULL),
(137, 3, NULL, NULL),
(137, 4, NULL, NULL),
(137, 5, NULL, NULL),
(137, 6, NULL, NULL),
(137, 7, NULL, NULL),
(137, 8, NULL, NULL),
(137, 9, NULL, NULL),
(138, 2, NULL, NULL),
(138, 3, NULL, NULL),
(138, 4, NULL, NULL),
(138, 5, NULL, NULL),
(138, 6, NULL, NULL),
(138, 7, NULL, NULL),
(138, 8, NULL, NULL),
(138, 9, NULL, NULL),
(139, 2, NULL, NULL),
(139, 3, NULL, NULL),
(139, 4, NULL, NULL),
(139, 5, NULL, NULL),
(139, 6, NULL, NULL),
(139, 7, NULL, NULL),
(139, 8, NULL, NULL),
(139, 9, NULL, NULL),
(140, 2, NULL, NULL),
(140, 3, NULL, NULL),
(140, 4, NULL, NULL),
(140, 5, NULL, NULL),
(140, 6, NULL, NULL),
(140, 7, NULL, NULL),
(140, 8, NULL, NULL),
(140, 9, NULL, NULL),
(141, 2, NULL, NULL),
(141, 3, NULL, NULL),
(141, 4, NULL, NULL),
(141, 5, NULL, NULL),
(141, 6, NULL, NULL),
(141, 7, NULL, NULL),
(141, 8, NULL, NULL),
(141, 9, NULL, NULL),
(142, 2, NULL, NULL),
(142, 3, NULL, NULL),
(142, 4, NULL, NULL),
(142, 5, NULL, NULL),
(142, 6, NULL, NULL),
(142, 7, NULL, NULL),
(142, 8, NULL, NULL),
(142, 9, NULL, NULL),
(143, 2, NULL, NULL),
(143, 3, NULL, NULL),
(143, 4, NULL, NULL),
(143, 5, NULL, NULL),
(143, 6, NULL, NULL),
(143, 7, NULL, NULL),
(143, 8, NULL, NULL),
(143, 9, NULL, NULL),
(144, 2, NULL, NULL),
(144, 3, NULL, NULL),
(144, 4, NULL, NULL),
(144, 5, NULL, NULL),
(144, 6, NULL, NULL),
(144, 7, NULL, NULL),
(144, 8, NULL, NULL),
(144, 9, NULL, NULL),
(145, 2, NULL, NULL),
(145, 3, NULL, NULL),
(145, 4, NULL, NULL),
(145, 5, NULL, NULL),
(145, 6, NULL, NULL),
(145, 7, NULL, NULL),
(145, 8, NULL, NULL),
(145, 9, NULL, NULL),
(146, 2, NULL, NULL),
(146, 3, NULL, NULL),
(146, 4, NULL, NULL),
(146, 5, NULL, NULL),
(146, 6, NULL, NULL),
(146, 7, NULL, NULL),
(146, 8, NULL, NULL),
(146, 9, NULL, NULL),
(147, 2, NULL, NULL),
(147, 3, NULL, NULL),
(147, 4, NULL, NULL),
(147, 5, NULL, NULL),
(147, 6, NULL, NULL),
(147, 7, NULL, NULL),
(147, 8, NULL, NULL),
(147, 9, NULL, NULL),
(148, 2, NULL, NULL),
(148, 3, NULL, NULL),
(148, 4, NULL, NULL),
(148, 5, NULL, NULL),
(148, 6, NULL, NULL),
(148, 7, NULL, NULL),
(148, 8, NULL, NULL),
(148, 9, NULL, NULL),
(149, 2, NULL, NULL),
(149, 3, NULL, NULL),
(149, 4, NULL, NULL),
(149, 5, NULL, NULL),
(149, 6, NULL, NULL),
(149, 7, NULL, NULL),
(149, 8, NULL, NULL),
(149, 9, NULL, NULL),
(150, 2, NULL, NULL),
(150, 3, NULL, NULL),
(150, 4, NULL, NULL),
(150, 5, NULL, NULL),
(150, 6, NULL, NULL),
(150, 7, NULL, NULL),
(150, 8, NULL, NULL),
(150, 9, NULL, NULL),
(151, 2, NULL, NULL),
(151, 3, NULL, NULL),
(151, 4, NULL, NULL),
(151, 5, NULL, NULL),
(151, 6, NULL, NULL),
(151, 7, NULL, NULL),
(151, 8, NULL, NULL),
(151, 9, NULL, NULL),
(152, 2, NULL, NULL),
(152, 3, NULL, NULL),
(152, 4, NULL, NULL),
(152, 5, NULL, NULL),
(152, 6, NULL, NULL),
(152, 7, NULL, NULL),
(152, 8, NULL, NULL),
(152, 9, NULL, NULL),
(153, 2, NULL, NULL),
(153, 3, NULL, NULL),
(153, 4, NULL, NULL),
(153, 5, NULL, NULL),
(153, 6, NULL, NULL),
(153, 7, NULL, NULL),
(153, 8, NULL, NULL),
(153, 9, NULL, NULL),
(154, 2, NULL, NULL),
(154, 3, NULL, NULL),
(154, 4, NULL, NULL),
(154, 5, NULL, NULL),
(154, 6, NULL, NULL),
(154, 7, NULL, NULL),
(154, 8, NULL, NULL),
(154, 9, NULL, NULL),
(155, 2, NULL, NULL),
(155, 3, NULL, NULL),
(155, 4, NULL, NULL),
(155, 5, NULL, NULL),
(155, 6, NULL, NULL),
(155, 7, NULL, NULL),
(155, 8, NULL, NULL),
(155, 9, NULL, NULL),
(156, 2, NULL, NULL),
(156, 3, NULL, NULL),
(156, 4, NULL, NULL),
(156, 5, NULL, NULL),
(156, 6, NULL, NULL),
(156, 7, NULL, NULL),
(156, 8, NULL, NULL),
(156, 9, NULL, NULL),
(157, 2, NULL, NULL),
(157, 3, NULL, NULL),
(157, 4, NULL, NULL),
(157, 5, NULL, NULL),
(157, 6, NULL, NULL),
(157, 7, NULL, NULL),
(157, 8, NULL, NULL),
(157, 9, NULL, NULL),
(158, 2, NULL, NULL),
(158, 3, NULL, NULL),
(158, 4, NULL, NULL),
(158, 5, NULL, NULL),
(158, 6, NULL, NULL),
(158, 7, NULL, NULL),
(158, 8, NULL, NULL),
(158, 9, NULL, NULL),
(159, 2, NULL, NULL),
(159, 3, NULL, NULL),
(159, 4, NULL, NULL),
(159, 5, NULL, NULL),
(159, 6, NULL, NULL),
(159, 7, NULL, NULL),
(159, 8, NULL, NULL),
(159, 9, NULL, NULL),
(160, 2, NULL, NULL),
(160, 3, NULL, NULL),
(160, 4, NULL, NULL),
(160, 5, NULL, NULL),
(160, 6, NULL, NULL),
(160, 7, NULL, NULL),
(160, 8, NULL, NULL),
(160, 9, NULL, NULL),
(161, 2, NULL, NULL),
(161, 3, NULL, NULL),
(161, 4, NULL, NULL),
(161, 5, NULL, NULL),
(161, 6, NULL, NULL),
(161, 7, NULL, NULL),
(161, 8, NULL, NULL),
(161, 9, NULL, NULL),
(162, 2, NULL, NULL),
(162, 3, NULL, NULL),
(162, 4, NULL, NULL),
(162, 5, NULL, NULL),
(162, 6, NULL, NULL),
(162, 7, NULL, NULL),
(162, 8, NULL, NULL),
(162, 9, NULL, NULL),
(163, 2, NULL, NULL),
(163, 3, NULL, NULL),
(163, 4, NULL, NULL),
(163, 5, NULL, NULL),
(163, 6, NULL, NULL),
(163, 7, NULL, NULL),
(163, 8, NULL, NULL),
(163, 9, NULL, NULL),
(164, 2, NULL, NULL),
(164, 3, NULL, NULL),
(164, 4, NULL, NULL),
(164, 5, NULL, NULL),
(164, 6, NULL, NULL),
(164, 7, NULL, NULL),
(164, 8, NULL, NULL),
(164, 9, NULL, NULL),
(165, 2, NULL, NULL),
(165, 3, NULL, NULL),
(165, 4, NULL, NULL),
(165, 5, NULL, NULL),
(165, 6, NULL, NULL),
(165, 7, NULL, NULL),
(165, 8, NULL, NULL),
(165, 9, NULL, NULL),
(166, 2, NULL, NULL),
(166, 3, NULL, NULL),
(166, 4, NULL, NULL),
(166, 5, NULL, NULL),
(166, 6, NULL, NULL),
(166, 7, NULL, NULL),
(166, 8, NULL, NULL),
(166, 9, NULL, NULL),
(167, 2, NULL, NULL),
(167, 3, NULL, NULL),
(167, 4, NULL, NULL),
(167, 5, NULL, NULL),
(167, 6, NULL, NULL),
(167, 7, NULL, NULL),
(167, 8, NULL, NULL),
(167, 9, NULL, NULL),
(168, 2, NULL, NULL),
(168, 3, NULL, NULL),
(168, 4, NULL, NULL),
(168, 5, NULL, NULL),
(168, 6, NULL, NULL),
(168, 7, NULL, NULL),
(168, 8, NULL, NULL),
(168, 9, NULL, NULL),
(169, 2, NULL, NULL),
(169, 3, NULL, NULL),
(169, 4, NULL, NULL),
(169, 5, NULL, NULL),
(169, 6, NULL, NULL),
(169, 7, NULL, NULL),
(169, 8, NULL, NULL),
(169, 9, NULL, NULL),
(170, 2, NULL, NULL),
(170, 3, NULL, NULL),
(170, 4, NULL, NULL),
(170, 5, NULL, NULL),
(170, 6, NULL, NULL),
(170, 7, NULL, NULL),
(170, 8, NULL, NULL),
(170, 9, NULL, NULL),
(171, 2, NULL, NULL),
(171, 3, NULL, NULL),
(171, 4, NULL, NULL),
(171, 5, NULL, NULL),
(171, 6, NULL, NULL),
(171, 7, NULL, NULL),
(171, 8, NULL, NULL),
(171, 9, NULL, NULL),
(172, 2, NULL, NULL),
(172, 3, NULL, NULL),
(172, 4, NULL, NULL),
(172, 5, NULL, NULL),
(172, 6, NULL, NULL),
(172, 7, NULL, NULL),
(172, 8, NULL, NULL),
(172, 9, NULL, NULL),
(173, 2, NULL, NULL),
(173, 3, NULL, NULL),
(173, 4, NULL, NULL),
(173, 5, NULL, NULL),
(173, 6, NULL, NULL),
(173, 7, NULL, NULL),
(173, 8, NULL, NULL),
(173, 9, NULL, NULL),
(174, 2, NULL, NULL),
(174, 3, NULL, NULL),
(174, 4, NULL, NULL),
(174, 5, NULL, NULL),
(174, 6, NULL, NULL),
(174, 7, NULL, NULL),
(174, 8, NULL, NULL),
(174, 9, NULL, NULL),
(175, 2, NULL, NULL),
(175, 3, NULL, NULL),
(175, 4, NULL, NULL),
(175, 5, NULL, NULL),
(175, 6, NULL, NULL),
(175, 7, NULL, NULL),
(175, 8, NULL, NULL),
(175, 9, NULL, NULL),
(176, 2, NULL, NULL),
(176, 3, NULL, NULL),
(176, 4, NULL, NULL),
(176, 5, NULL, NULL),
(176, 6, NULL, NULL),
(176, 7, NULL, NULL),
(176, 8, NULL, NULL),
(176, 9, NULL, NULL),
(177, 2, NULL, NULL),
(177, 3, NULL, NULL),
(177, 4, NULL, NULL),
(177, 5, NULL, NULL),
(177, 6, NULL, NULL),
(177, 7, NULL, NULL),
(177, 8, NULL, NULL),
(177, 9, NULL, NULL),
(178, 2, NULL, NULL),
(178, 3, NULL, NULL),
(178, 4, NULL, NULL),
(178, 5, NULL, NULL),
(178, 6, NULL, NULL),
(178, 7, NULL, NULL),
(178, 8, NULL, NULL),
(178, 9, NULL, NULL),
(179, 2, NULL, NULL),
(179, 3, NULL, NULL),
(179, 4, NULL, NULL),
(179, 5, NULL, NULL),
(179, 6, NULL, NULL),
(179, 7, NULL, NULL),
(179, 8, NULL, NULL),
(179, 9, NULL, NULL),
(180, 2, NULL, NULL),
(180, 3, NULL, NULL),
(180, 4, NULL, NULL),
(180, 5, NULL, NULL),
(180, 6, NULL, NULL),
(180, 7, NULL, NULL),
(180, 8, NULL, NULL),
(180, 9, NULL, NULL),
(181, 2, NULL, NULL),
(181, 3, NULL, NULL),
(181, 4, NULL, NULL),
(181, 5, NULL, NULL),
(181, 6, NULL, NULL),
(181, 7, NULL, NULL),
(181, 8, NULL, NULL),
(181, 9, NULL, NULL),
(182, 2, NULL, NULL),
(182, 3, NULL, NULL),
(182, 4, NULL, NULL),
(182, 5, NULL, NULL),
(182, 6, NULL, NULL),
(182, 7, NULL, NULL),
(182, 8, NULL, NULL),
(182, 9, NULL, NULL),
(183, 2, NULL, NULL),
(183, 3, NULL, NULL),
(183, 4, NULL, NULL),
(183, 5, NULL, NULL),
(183, 6, NULL, NULL),
(183, 7, NULL, NULL),
(183, 8, NULL, NULL),
(183, 9, NULL, NULL),
(184, 2, NULL, NULL),
(184, 3, NULL, NULL),
(184, 4, NULL, NULL),
(184, 5, NULL, NULL),
(184, 6, NULL, NULL),
(184, 7, NULL, NULL),
(184, 8, NULL, NULL),
(184, 9, NULL, NULL),
(185, 2, NULL, NULL),
(185, 3, NULL, NULL),
(185, 4, NULL, NULL),
(185, 5, NULL, NULL),
(185, 6, NULL, NULL),
(185, 7, NULL, NULL),
(185, 8, NULL, NULL),
(185, 9, NULL, NULL),
(186, 2, NULL, NULL),
(186, 3, NULL, NULL),
(186, 4, NULL, NULL),
(186, 5, NULL, NULL),
(186, 6, NULL, NULL),
(186, 7, NULL, NULL),
(186, 8, NULL, NULL),
(186, 9, NULL, NULL),
(187, 2, NULL, NULL),
(187, 3, NULL, NULL),
(187, 4, NULL, NULL),
(187, 5, NULL, NULL),
(187, 6, NULL, NULL),
(187, 7, NULL, NULL),
(187, 8, NULL, NULL),
(187, 9, NULL, NULL),
(188, 2, NULL, NULL),
(188, 3, NULL, NULL),
(188, 4, NULL, NULL),
(188, 5, NULL, NULL),
(188, 6, NULL, NULL),
(188, 7, NULL, NULL),
(188, 8, NULL, NULL),
(188, 9, NULL, NULL),
(189, 2, NULL, NULL),
(189, 3, NULL, NULL),
(189, 4, NULL, NULL),
(189, 5, NULL, NULL),
(189, 6, NULL, NULL),
(189, 7, NULL, NULL),
(189, 8, NULL, NULL),
(189, 9, NULL, NULL),
(190, 2, NULL, NULL),
(190, 3, NULL, NULL),
(190, 4, NULL, NULL),
(190, 5, NULL, NULL),
(190, 6, NULL, NULL),
(190, 7, NULL, NULL),
(190, 8, NULL, NULL),
(190, 9, NULL, NULL),
(191, 2, NULL, NULL),
(191, 3, NULL, NULL),
(191, 4, NULL, NULL),
(191, 5, NULL, NULL),
(191, 6, NULL, NULL),
(191, 7, NULL, NULL),
(191, 8, NULL, NULL),
(191, 9, NULL, NULL),
(192, 2, NULL, NULL),
(192, 3, NULL, NULL),
(192, 4, NULL, NULL),
(192, 5, NULL, NULL),
(192, 6, NULL, NULL),
(192, 7, NULL, NULL),
(192, 8, NULL, NULL),
(192, 9, NULL, NULL),
(193, 2, NULL, NULL),
(193, 3, NULL, NULL),
(193, 4, NULL, NULL),
(193, 5, NULL, NULL),
(193, 6, NULL, NULL),
(193, 7, NULL, NULL),
(193, 8, NULL, NULL),
(193, 9, NULL, NULL),
(194, 2, NULL, NULL),
(194, 3, NULL, NULL),
(194, 4, NULL, NULL),
(194, 5, NULL, NULL),
(194, 6, NULL, NULL),
(194, 7, NULL, NULL),
(194, 8, NULL, NULL),
(194, 9, NULL, NULL),
(195, 2, NULL, NULL),
(195, 3, NULL, NULL),
(195, 4, NULL, NULL),
(195, 5, NULL, NULL),
(195, 6, NULL, NULL),
(195, 7, NULL, NULL),
(195, 8, NULL, NULL),
(195, 9, NULL, NULL),
(196, 2, NULL, NULL),
(196, 3, NULL, NULL),
(196, 4, NULL, NULL),
(196, 5, NULL, NULL),
(196, 6, NULL, NULL),
(196, 7, NULL, NULL),
(196, 8, NULL, NULL),
(196, 9, NULL, NULL),
(197, 2, NULL, NULL),
(197, 3, NULL, NULL),
(197, 4, NULL, NULL),
(197, 5, NULL, NULL),
(197, 6, NULL, NULL),
(197, 7, NULL, NULL),
(197, 8, NULL, NULL),
(197, 9, NULL, NULL),
(198, 2, NULL, NULL),
(198, 3, NULL, NULL),
(198, 4, NULL, NULL),
(198, 5, NULL, NULL),
(198, 6, NULL, NULL),
(198, 7, NULL, NULL),
(198, 8, NULL, NULL),
(198, 9, NULL, NULL),
(199, 2, NULL, NULL),
(199, 3, NULL, NULL),
(199, 4, NULL, NULL),
(199, 5, NULL, NULL),
(199, 6, NULL, NULL),
(199, 7, NULL, NULL),
(199, 8, NULL, NULL),
(199, 9, NULL, NULL),
(200, 2, NULL, NULL),
(200, 3, NULL, NULL),
(200, 4, NULL, NULL),
(200, 5, NULL, NULL),
(200, 6, NULL, NULL),
(200, 7, NULL, NULL),
(200, 8, NULL, NULL),
(200, 9, NULL, NULL),
(201, 2, NULL, NULL),
(201, 3, NULL, NULL),
(201, 4, NULL, NULL),
(201, 5, NULL, NULL),
(201, 6, NULL, NULL),
(201, 7, NULL, NULL),
(201, 8, NULL, NULL),
(201, 9, NULL, NULL),
(202, 2, NULL, NULL),
(202, 3, NULL, NULL),
(202, 4, NULL, NULL),
(202, 5, NULL, NULL),
(202, 6, NULL, NULL),
(202, 7, NULL, NULL),
(202, 8, NULL, NULL),
(202, 9, NULL, NULL),
(203, 2, NULL, NULL),
(203, 3, NULL, NULL),
(203, 4, NULL, NULL),
(203, 5, NULL, NULL),
(203, 6, NULL, NULL),
(203, 7, NULL, NULL),
(203, 8, NULL, NULL),
(203, 9, NULL, NULL),
(204, 2, NULL, NULL),
(204, 3, NULL, NULL),
(204, 4, NULL, NULL),
(204, 5, NULL, NULL),
(204, 6, NULL, NULL),
(204, 7, NULL, NULL),
(204, 8, NULL, NULL),
(204, 9, NULL, NULL),
(205, 2, NULL, NULL),
(205, 3, NULL, NULL),
(205, 4, NULL, NULL),
(205, 5, NULL, NULL),
(205, 6, NULL, NULL),
(205, 7, NULL, NULL),
(205, 8, NULL, NULL),
(205, 9, NULL, NULL),
(206, 2, NULL, NULL),
(206, 3, NULL, NULL),
(206, 4, NULL, NULL),
(206, 5, NULL, NULL),
(206, 6, NULL, NULL),
(206, 7, NULL, NULL),
(206, 8, NULL, NULL),
(206, 9, NULL, NULL),
(207, 2, NULL, NULL),
(207, 3, NULL, NULL),
(207, 4, NULL, NULL),
(207, 5, NULL, NULL),
(207, 6, NULL, NULL),
(207, 7, NULL, NULL),
(207, 8, NULL, NULL),
(207, 9, NULL, NULL),
(208, 2, NULL, NULL),
(208, 3, NULL, NULL),
(208, 4, NULL, NULL),
(208, 5, NULL, NULL),
(208, 6, NULL, NULL),
(208, 7, NULL, NULL),
(208, 8, NULL, NULL),
(208, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices`
--

CREATE TABLE `sales_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_order_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) NOT NULL,
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `final_total` double(8,2) NOT NULL DEFAULT '0.00',
  `total_after_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_type` enum('cash','post_paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `discount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `discount_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `total_taxes_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `paid_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `remaining_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_installments`
--

CREATE TABLE `sales_invoice_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_items`
--

CREATE TABLE `sales_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `unit_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(8,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_taxes`
--

CREATE TABLE `sales_invoice_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_invoice_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `tax_type` enum('percent','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `inventory_id` int(11) NOT NULL,
  `total` double(8,2) NOT NULL DEFAULT '0.00',
  `final_total` double(8,2) NOT NULL DEFAULT '0.00',
  `total_after_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `discount_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `total_taxes_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_items`
--

CREATE TABLE `sales_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `unit_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(8,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `option`, `option_type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'name_ar', NULL, 'text', '44445555', NULL, '2020-06-16 11:19:52'),
(2, 'name_en', NULL, 'text', 'الاسم باللغة الانجليزية555554444', NULL, '2020-06-16 11:19:52'),
(3, 'logo', NULL, 'file', '/uploads//159231359295268.png', NULL, '2020-06-16 11:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `sms_messages`
--

CREATE TABLE `sms_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_message_phones`
--

CREATE TABLE `sms_message_phones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sms_message_id` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `initial_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL DEFAULT '0',
  `type` enum('percent','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_invoice_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `ticket_status_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_users`
--

CREATE TABLE `ticket_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `team_leader_id` int(11) DEFAULT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_team_leader` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `image`, `remember_token`, `created_at`, `updated_at`, `is_super_admin`, `is_online`, `last_login`, `manager_id`, `team_leader_id`, `is_manager`, `is_team_leader`) VALUES
(8, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1, 0, NULL, NULL, NULL, 0, 0),
(121, 'مدير مارك', 'mark@queentechsolutions.net', NULL, '$2y$10$iVl8MHSdgEdjyb9rZ.d2KeSkFpr33j8eCKxuJYWNdi3uVwowSYAxa', NULL, NULL, NULL, '2020-06-30 12:29:28', '2020-06-30 12:29:28', 0, 0, NULL, NULL, NULL, 1, 0),
(122, 'هيثم', 'hytham@queentechsolutions.net', NULL, '$2y$10$vCTQzaVsBDdbJo6YEl0Bg.Kf3a5YZivTSBc93WfC4r8ztFeGaYNvW', NULL, NULL, NULL, '2020-06-30 12:30:56', '2020-06-30 12:30:56', 0, 0, NULL, 121, NULL, 0, 1),
(123, 'عمر', 'amr@queentechsolutions.net', NULL, '$2y$10$D0AzEaZD9mTsiitlQqz4UuZGuEx1dtEzh/P4NTO2.dBrZhms.wAQG', NULL, NULL, NULL, '2020-06-30 12:31:44', '2020-06-30 12:31:44', 0, 0, NULL, 121, NULL, 0, 1),
(124, 'عبد القادر', 'abdo@queentechsolutions.net', NULL, '$2y$10$KbhUBOg0PW6zuXUw2.cNtuH1TWuzrDTiCoV5p7q.1Qp1HFAaaNdM6', NULL, NULL, NULL, '2020-06-30 12:32:28', '2020-06-30 14:07:10', 0, 0, NULL, 121, NULL, 0, 0),
(125, 'أحمد عبد العال', 'ahmad@queentechsolutions.net', NULL, '$2y$10$FpJPpe11UCg2b7AwIIkPVuEW0XAiooTKvKjOdTTWtcvcs2vT3Wd36', NULL, NULL, NULL, '2020-07-01 18:51:15', '2020-07-01 18:51:15', 0, 0, NULL, 121, 122, 0, 0),
(128, 'أحمد شورى', 'elshora2@queentechsolutions.net', NULL, '$2y$10$7dfFmT1kPbFwkwNr5rhPAeROgV1dm/9DRi3RMD7YXU8D/pr22ROpK', NULL, NULL, NULL, '2020-07-01 18:59:17', '2020-07-02 14:30:22', 0, 0, NULL, 121, 123, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `cols` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_ar` text COLLATE utf8mb4_unicode_ci,
  `value_en` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `type`, `options`, `created_at`, `updated_at`, `sort`, `cols`, `label_ar`, `label_en`, `value_ar`, `value_en`) VALUES
(1, 'item_status', 'checkbox', 'class=\"form-check\" ', NULL, NULL, 1, 'col-md-6', 'للبيع ', 'For sale', 'for_sale', 'for_sale'),
(2, 'item_status', 'checkbox', 'class=\"form-check\" ', NULL, NULL, 2, 'col-md-6', 'للايجار ', 'For rent', 'for_rent', 'for_rent'),
(3, 'width', 'number', 'class=\"form-control\" ', NULL, NULL, 3, 'col-md-6', 'العرض', 'width', '0', '0'),
(4, 'height', 'text', 'class=\"form-control\" ', NULL, NULL, 4, 'col-md-6', 'الارتفاع', 'height', '0', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_comments`
--
ALTER TABLE `campaign_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_channels`
--
ALTER TABLE `chat_channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_channel_messages`
--
ALTER TABLE `chat_channel_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_interests`
--
ALTER TABLE `client_interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_items`
--
ALTER TABLE `collection_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communication_method`
--
ALTER TABLE `communication_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connection_ways`
--
ALTER TABLE `connection_ways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connection_way_statuses`
--
ALTER TABLE `connection_way_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments_langs`
--
ALTER TABLE `departments_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_variations`
--
ALTER TABLE `item_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_comments`
--
ALTER TABLE `lead_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_operations`
--
ALTER TABLE `lead_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_users`
--
ALTER TABLE `lead_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailbox_inbound_emails`
--
ALTER TABLE `mailbox_inbound_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_ways`
--
ALTER TABLE `marketing_ways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_users`
--
ALTER TABLE `notification_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_messages`
--
ALTER TABLE `page_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_installments`
--
ALTER TABLE `purchase_installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoice_items`
--
ALTER TABLE `purchase_invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoice_installments`
--
ALTER TABLE `sales_invoice_installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoice_taxes`
--
ALTER TABLE `sales_invoice_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_messages`
--
ALTER TABLE `sms_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_message_phones`
--
ALTER TABLE `sms_message_phones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_users`
--
ALTER TABLE `ticket_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_comments`
--
ALTER TABLE `campaign_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_channels`
--
ALTER TABLE `chat_channels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_channel_messages`
--
ALTER TABLE `chat_channel_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_interests`
--
ALTER TABLE `client_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_items`
--
ALTER TABLE `collection_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communication_method`
--
ALTER TABLE `communication_method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connection_ways`
--
ALTER TABLE `connection_ways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connection_way_statuses`
--
ALTER TABLE `connection_way_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments_langs`
--
ALTER TABLE `departments_langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_variations`
--
ALTER TABLE `item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_comments`
--
ALTER TABLE `lead_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_operations`
--
ALTER TABLE `lead_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_users`
--
ALTER TABLE `lead_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mailbox_inbound_emails`
--
ALTER TABLE `mailbox_inbound_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_ways`
--
ALTER TABLE `marketing_ways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_messages`
--
ALTER TABLE `page_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_items`
--
ALTER TABLE `payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `purchase_installments`
--
ALTER TABLE `purchase_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_invoice_items`
--
ALTER TABLE `purchase_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `responsables`
--
ALTER TABLE `responsables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_invoice_installments`
--
ALTER TABLE `sales_invoice_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_invoice_taxes`
--
ALTER TABLE `sales_invoice_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_messages`
--
ALTER TABLE `sms_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_message_phones`
--
ALTER TABLE `sms_message_phones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_users`
--
ALTER TABLE `ticket_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
