-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2020 at 09:31 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.31-1+ubuntu18.04.1+deb.sury.org+1

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
(1, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 1, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices create\",\"id\":1}', 'http://localhost/crm/public/purchase_invoices/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 08:17:52', '2020-06-04 08:17:52'),
(2, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 2, '[]', '{\"guard_name\":\"web\",\"name\":\"calender index\",\"id\":2}', 'http://localhost/crm/public', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 08:18:27', '2020-06-04 08:18:27'),
(3, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 3, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices show\",\"id\":3}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 08:59:07', '2020-06-04 08:59:07'),
(4, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 4, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices index\",\"id\":4}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:02:41', '2020-06-04 09:02:41'),
(5, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 5, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices approve\",\"id\":5}', 'http://localhost/crm/public/purchase_invoices/approve/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:03:31', '2020-06-04 09:03:31'),
(7, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 2, '[]', '{\"inventory_id\":2,\"item_id\":3,\"amount\":2,\"unit_price\":40,\"purchase_price\":40,\"sale_price\":40,\"id\":2}', 'http://localhost/crm/public/purchase_invoices/approve/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:29:43', '2020-06-04 09:29:43'),
(8, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 6, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices edit\",\"id\":6}', 'http://localhost/crm/public/purchase_invoices/2/edit', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:30:04', '2020-06-04 09:30:04'),
(9, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 7, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices update\",\"id\":7}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:30:15', '2020-06-04 09:30:15'),
(10, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":8,\"payment_type\":\"cash\",\"paid_amount\":72,\"remaining_amount\":0,\"date\":\"2020-06-01\"}', '{\"discount\":0,\"payment_type\":\"post_paid\",\"paid_amount\":\"50\",\"remaining_amount\":\"22\",\"date\":\"2020-06-01T00:00:00.000000Z\"}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:30:15', '2020-06-04 09:30:15'),
(11, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 15, '[]', '{\"item_id\":\"3\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"2\",\"price\":\"40\",\"unit_price\":\"40\",\"sale_price\":\"40\",\"purchase_price\":\"40\",\"notes\":\"test\",\"id\":15}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:30:15', '2020-06-04 09:30:15'),
(12, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":0}', '{\"discount\":8}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:30:15', '2020-06-04 09:30:15'),
(13, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":8,\"date\":\"2020-06-01\"}', '{\"discount\":0,\"date\":\"2020-06-01T00:00:00.000000Z\"}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:43:16', '2020-06-04 09:43:16'),
(14, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 16, '[]', '{\"item_id\":\"3\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"2\",\"price\":\"40\",\"unit_price\":\"40\",\"sale_price\":\"40\",\"purchase_price\":\"40\",\"notes\":\"test\",\"id\":16}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:43:16', '2020-06-04 09:43:16'),
(15, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":0}', '{\"discount\":8}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 09:43:16', '2020-06-04 09:43:16'),
(16, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":8,\"payment_type\":\"post_paid\",\"paid_amount\":50,\"remaining_amount\":22,\"date\":\"2020-06-01\"}', '{\"discount\":0,\"payment_type\":\"cash\",\"paid_amount\":\"72\",\"remaining_amount\":\"0\",\"date\":\"2020-06-01T00:00:00.000000Z\"}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 10:42:34', '2020-06-04 10:42:34'),
(17, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 17, '[]', '{\"item_id\":\"3\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"2\",\"price\":\"40\",\"unit_price\":\"40\",\"sale_price\":\"40\",\"purchase_price\":\"40\",\"notes\":\"test\",\"id\":17}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 10:42:34', '2020-06-04 10:42:34'),
(18, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":0}', '{\"discount\":8}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 10:42:34', '2020-06-04 10:42:34'),
(25, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":8,\"payment_type\":\"cash\",\"paid_amount\":72,\"remaining_amount\":0,\"date\":\"2020-06-01\"}', '{\"discount\":0,\"payment_type\":\"post_paid\",\"paid_amount\":\"20\",\"remaining_amount\":\"52\",\"date\":\"2020-06-01T00:00:00.000000Z\"}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:04:49', '2020-06-04 11:04:49'),
(26, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 21, '[]', '{\"item_id\":\"3\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"2\",\"price\":\"40\",\"unit_price\":\"40\",\"sale_price\":\"40\",\"purchase_price\":\"40\",\"notes\":\"test\",\"id\":21}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:04:49', '2020-06-04 11:04:49'),
(27, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInstallment', 1, '[]', '{\"supplier_id\":\"1\",\"invoice_id\":2,\"amount\":\"52\",\"date\":\"2020-06-04T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":1}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:04:49', '2020-06-04 11:04:49'),
(28, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"discount\":0}', '{\"discount\":8}', 'http://localhost/crm/public/purchase_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:04:49', '2020-06-04 11:04:49'),
(29, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-04T13:17:22.227385Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:17:22', '2020-06-04 11:17:22'),
(30, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 2, '{\"confirmed_at\":\"2020-06-04 13:17:22\"}', '{\"confirmed_at\":\"2020-06-04T13:17:59.949427Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:17:59', '2020-06-04 11:17:59'),
(31, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 8, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices print\",\"id\":8}', 'http://localhost/crm/public/purchase_invoices/print/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 11:24:44', '2020-06-04 11:24:44'),
(32, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 9, '[]', '{\"guard_name\":\"web\",\"name\":\"inventory items index\",\"id\":9}', 'http://localhost/crm/public/inventory_items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 13:14:40', '2020-06-04 13:14:40'),
(33, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 10, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase installments index\",\"id\":10}', 'http://localhost/crm/public/purchase_installments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-04 13:37:56', '2020-06-04 13:37:56'),
(34, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 11, '[]', '{\"guard_name\":\"web\",\"name\":\"payments index\",\"id\":11}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 07:29:23', '2020-06-07 07:29:23'),
(35, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 12, '[]', '{\"guard_name\":\"web\",\"name\":\"payments create\",\"id\":12}', 'http://localhost/crm/public/payments/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 07:45:58', '2020-06-07 07:45:58'),
(36, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 13, '[]', '{\"guard_name\":\"web\",\"name\":\"payments store\",\"id\":13}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 07:53:39', '2020-06-07 07:53:39'),
(37, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 14, '[]', '{\"guard_name\":\"web\",\"name\":\"logs\",\"id\":14}', 'http://localhost/crm/public/admin/logs', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 08:45:15', '2020-06-07 08:45:15'),
(38, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 15, '[]', '{\"guard_name\":\"web\",\"name\":\"inventories index\",\"id\":15}', 'http://localhost/crm/public/inventories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 08:45:21', '2020-06-07 08:45:21'),
(39, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 16, '[]', '{\"guard_name\":\"web\",\"name\":\"sales order index\",\"id\":16}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 08:45:27', '2020-06-07 08:45:27'),
(40, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 17, '[]', '{\"guard_name\":\"web\",\"name\":\"sales order create\",\"id\":17}', 'http://localhost/crm/public/sales_order/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 08:45:30', '2020-06-07 08:45:30'),
(41, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 18, '[]', '{\"guard_name\":\"web\",\"name\":\"sales order store\",\"id\":18}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 08:57:52', '2020-06-07 08:57:52'),
(42, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesOrder', 1, '[]', '{\"client_id\":\"1\",\"code\":\"code\",\"inventory_id\":\"2\",\"total\":\"120\",\"final_total\":\"120\",\"total_after_discount\":\"120\",\"discount\":0,\"payment_type\":\"post_paid\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"120\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":1}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:28:16', '2020-06-07 09:28:16'),
(43, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesOrderItem', 1, '[]', '{\"item_id\":\"3\",\"inventory_id\":\"2\",\"invoice_id\":1,\"amount\":\"3\",\"price\":\"40\",\"unit_price\":\"40\",\"sale_price\":\"40\",\"purchase_price\":\"40\",\"notes\":0,\"id\":1}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:28:16', '2020-06-07 09:28:16'),
(44, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 19, '[]', '{\"guard_name\":\"web\",\"name\":\"purchase invoices store\",\"id\":19}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:37:43', '2020-06-07 09:37:43'),
(45, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoice', 3, '[]', '{\"date\":\"2020-06-07T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"code\",\"purchase_invoice_number\":\"dddd\",\"inventory_id\":\"2\",\"total\":\"50\",\"final_total\":\"50\",\"total_after_discount\":\"50\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"50\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":3}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:38:21', '2020-06-07 09:38:21'),
(46, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 22, '[]', '{\"item_id\":\"2\",\"inventory_id\":\"2\",\"invoice_id\":3,\"amount\":\"1\",\"price\":\"50\",\"unit_price\":\"50\",\"sale_price\":\"55\",\"purchase_price\":\"50\",\"notes\":0,\"id\":22}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:38:21', '2020-06-07 09:38:21'),
(47, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 20, '[]', '{\"guard_name\":\"web\",\"name\":\"get supplier purchase invoices\",\"id\":20}', 'http://localhost/crm/public/get_supplier_purchase_invoices?suppplier_id=1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 09:56:59', '2020-06-07 09:56:59'),
(51, 'App\\Models\\User', 1, 'created', 'App\\Models\\Payment', 4, '[]', '{\"supplier_id\":\"1\",\"date\":\"2020-06-07T00:00:00.000000Z\",\"amount\":\"500\",\"notes\":null,\"created_by\":1,\"id\":4}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 10:44:25', '2020-06-07 10:44:25'),
(52, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 21, '[]', '{\"guard_name\":\"web\",\"name\":\"payments edit\",\"id\":21}', 'http://localhost/crm/public/payments/4/edit', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 11:02:34', '2020-06-07 11:02:34'),
(53, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 22, '[]', '{\"guard_name\":\"web\",\"name\":\"payments update\",\"id\":22}', 'http://localhost/crm/public/payments/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 11:16:47', '2020-06-07 11:16:47'),
(54, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 4, '{\"date\":\"2020-06-07\"}', '{\"date\":\"2020-06-07T00:00:00.000000Z\"}', 'http://localhost/crm/public/payments/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 11:17:04', '2020-06-07 11:17:04'),
(55, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 23, '[]', '{\"guard_name\":\"web\",\"name\":\"payments approve\",\"id\":23}', 'http://localhost/crm/public/payments/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 11:22:45', '2020-06-07 11:22:45'),
(56, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 4, '{\"date\":\"2020-06-07\"}', '{\"date\":\"2020-06-07T00:00:00.000000Z\"}', 'http://localhost/crm/public/payments/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 11:58:41', '2020-06-07 11:58:41'),
(57, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 4, '{\"confirmed_by\":null,\"confirmed_at\":null}', '{\"confirmed_by\":1,\"confirmed_at\":\"2020-06-07T15:16:48.693655Z\"}', 'http://localhost/crm/public/payments/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:16:48', '2020-06-07 13:16:48'),
(58, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 4, '{\"confirmed_at\":\"2020-06-07 15:16:48\"}', '{\"confirmed_at\":\"2020-06-07T15:16:53.407039Z\"}', 'http://localhost/crm/public/payments/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:16:53', '2020-06-07 13:16:53'),
(59, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 4, '{\"status\":\"open\",\"confirmed_at\":\"2020-06-07 15:16:53\"}', '{\"status\":\"closed\",\"confirmed_at\":\"2020-06-07T15:17:23.833787Z\"}', 'http://localhost/crm/public/payments/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:17:23', '2020-06-07 13:17:23'),
(60, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 24, '[]', '{\"guard_name\":\"web\",\"name\":\"payments print\",\"id\":24}', 'http://localhost/crm/public/payments/print/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:17:45', '2020-06-07 13:17:45'),
(61, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoice', 4, '[]', '{\"date\":\"2020-06-07T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"code\",\"purchase_invoice_number\":\"123654\",\"inventory_id\":\"2\",\"total\":\"1500\",\"final_total\":\"1500\",\"total_after_discount\":\"1500\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"1500\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":4}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:20:26', '2020-06-07 13:20:26'),
(62, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 23, '[]', '{\"item_id\":\"2\",\"inventory_id\":\"2\",\"invoice_id\":4,\"amount\":\"30\",\"price\":\"50\",\"unit_price\":\"50\",\"sale_price\":\"55\",\"purchase_price\":\"50\",\"notes\":0,\"id\":23}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:20:26', '2020-06-07 13:20:26'),
(63, 'App\\Models\\User', 1, 'created', 'App\\Models\\Payment', 5, '[]', '{\"supplier_id\":\"1\",\"date\":\"2020-06-07T00:00:00.000000Z\",\"amount\":\"5000\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":5}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:31:03', '2020-06-07 13:31:03'),
(64, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 25, '[]', '{\"guard_name\":\"web\",\"name\":\"suppliers index\",\"id\":25}', 'http://localhost/crm/public/suppliers', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:31:14', '2020-06-07 13:31:14'),
(65, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 26, '[]', '{\"guard_name\":\"web\",\"name\":\"suppliers edit\",\"id\":26}', 'http://localhost/crm/public/suppliers/1/edit', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:31:20', '2020-06-07 13:31:20'),
(66, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 5, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-07T15:32:13.398887Z\"}', 'http://localhost/crm/public/payments/approve/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:32:13', '2020-06-07 13:32:13'),
(67, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 3, '[]', '{\"inventory_id\":2,\"item_id\":2,\"amount\":30,\"unit_price\":50,\"purchase_price\":50,\"sale_price\":55,\"id\":3}', 'http://localhost/crm/public/purchase_invoices/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:43:51', '2020-06-07 13:43:51'),
(68, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 4, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-07T15:43:51.937317Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:43:51', '2020-06-07 13:43:51'),
(69, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 3, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-07T15:43:57.828332Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:43:57', '2020-06-07 13:43:57'),
(70, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 1, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-07T15:43:59.476893Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:43:59', '2020-06-07 13:43:59'),
(71, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 27, '[]', '{\"guard_name\":\"web\",\"name\":\"users index\",\"id\":27}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:49:15', '2020-06-07 13:49:15'),
(72, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 28, '[]', '{\"guard_name\":\"web\",\"name\":\"campaigns index\",\"id\":28}', 'http://localhost/crm/public/campaigns', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 13:51:47', '2020-06-07 13:51:47'),
(73, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 29, '[]', '{\"guard_name\":\"web\",\"name\":\"campaigns show\",\"id\":29}', 'http://localhost/crm/public/campaigns/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 14:01:47', '2020-06-07 14:01:47'),
(74, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 30, '[]', '{\"guard_name\":\"web\",\"name\":\"leads index\",\"id\":30}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-07 14:10:48', '2020-06-07 14:10:48'),
(75, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 31, '[]', '{\"guard_name\":\"web\",\"name\":\"departments index\",\"id\":31}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 07:18:42', '2020-06-08 07:18:42'),
(76, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 32, '[]', '{\"guard_name\":\"web\",\"name\":\"users create\",\"id\":32}', 'http://localhost/crm/public/users/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 07:18:50', '2020-06-08 07:18:50'),
(77, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 33, '[]', '{\"guard_name\":\"web\",\"name\":\"role permissions index\",\"id\":33}', 'http://localhost/crm/public/role_permissions', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 07:18:52', '2020-06-08 07:18:52'),
(78, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 34, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices index\",\"id\":34}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 10:26:39', '2020-06-08 10:26:39'),
(79, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 35, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices create\",\"id\":35}', 'http://localhost/crm/public/sales_invoices/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 10:26:42', '2020-06-08 10:26:42'),
(80, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 36, '[]', '{\"guard_name\":\"web\",\"name\":\"leads statuses index\",\"id\":36}', 'http://localhost/crm/public/leads_statuses', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 10:28:03', '2020-06-08 10:28:03'),
(81, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 37, '[]', '{\"guard_name\":\"web\",\"name\":\"item categories index\",\"id\":37}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 12:58:16', '2020-06-08 12:58:16'),
(82, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 38, '[]', '{\"guard_name\":\"web\",\"name\":\"item categories create\",\"id\":38}', 'http://localhost/crm/public/item_categories/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 12:58:20', '2020-06-08 12:58:20'),
(83, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 39, '[]', '{\"guard_name\":\"web\",\"name\":\"contact list index\",\"id\":39}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 12:58:32', '2020-06-08 12:58:32'),
(84, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 40, '[]', '{\"guard_name\":\"web\",\"name\":\"contact list create\",\"id\":40}', 'http://localhost/crm/public/contact_list/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 12:58:35', '2020-06-08 12:58:35'),
(85, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 41, '[]', '{\"guard_name\":\"web\",\"name\":\"items index\",\"id\":41}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 12:58:53', '2020-06-08 12:58:53'),
(86, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 42, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices store\",\"id\":42}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:43:28', '2020-06-08 13:43:28'),
(87, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoice', 1, '[]', '{\"client_id\":\"1\",\"code\":\"SINV\",\"inventory_id\":\"2\",\"total\":\"60\",\"final_total\":\"73\",\"total_after_discount\":\"60\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"73\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":1}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:44:34', '2020-06-08 13:44:34'),
(88, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 1, '[]', '{\"item_id\":\"4\",\"inventory_id\":\"2\",\"invoice_id\":1,\"amount\":\"1\",\"price\":\"60\",\"unit_price\":\"60\",\"sale_price\":\"60\",\"purchase_price\":\"30\",\"notes\":0,\"id\":1}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:44:34', '2020-06-08 13:44:34'),
(89, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 1, '{\"remaining_amount\":\"0\"}', '{\"remaining_amount\":-13}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:44:34', '2020-06-08 13:44:34'),
(90, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 43, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices edit\",\"id\":43}', 'http://localhost/crm/public/sales_invoices/1/edit', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:45:28', '2020-06-08 13:45:28'),
(91, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 44, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices update\",\"id\":44}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:45:40', '2020-06-08 13:45:40'),
(100, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 1, '{\"remaining_amount\":-13}', '{\"remaining_amount\":\"0\"}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:57:58', '2020-06-08 13:57:58'),
(101, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 6, '[]', '{\"item_id\":\"4\",\"inventory_id\":\"2\",\"invoice_id\":1,\"amount\":\"1\",\"price\":\"60\",\"unit_price\":\"60\",\"sale_price\":\"60\",\"purchase_price\":\"30\",\"notes\":0,\"id\":6}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 13:57:58', '2020-06-08 13:57:58'),
(102, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 1, '{\"final_total\":73,\"paid_amount\":73}', '{\"final_total\":\"70\",\"paid_amount\":\"70\"}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 14:02:22', '2020-06-08 14:02:22'),
(103, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 7, '[]', '{\"item_id\":\"4\",\"inventory_id\":\"2\",\"invoice_id\":1,\"amount\":\"1\",\"price\":\"60\",\"unit_price\":\"60\",\"sale_price\":\"60\",\"purchase_price\":\"30\",\"notes\":0,\"id\":7}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-08 14:02:22', '2020-06-08 14:02:22'),
(104, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 45, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices approve\",\"id\":45}', 'http://localhost/crm/public/sales_invoices/approve/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:29:08', '2020-06-09 06:29:08'),
(105, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 4, '[]', '{\"inventory_id\":2,\"item_id\":4,\"amount\":1,\"unit_price\":60,\"purchase_price\":30,\"sale_price\":60,\"id\":4}', 'http://localhost/crm/public/sales_invoices/approve/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:29:08', '2020-06-09 06:29:08'),
(106, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 1, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-09T08:29:08.656200Z\"}', 'http://localhost/crm/public/sales_invoices/approve/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:29:08', '2020-06-09 06:29:08'),
(107, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 46, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices show\",\"id\":46}', 'http://localhost/crm/public/sales_invoices/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:29:11', '2020-06-09 06:29:11'),
(108, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 47, '[]', '{\"guard_name\":\"web\",\"name\":\"sales invoices print\",\"id\":47}', 'http://localhost/crm/public/sales_invoices/print/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:29:17', '2020-06-09 06:29:17'),
(109, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 48, '[]', '{\"guard_name\":\"web\",\"name\":\"roles index\",\"id\":48}', 'http://localhost/crm/public/roles', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:35:01', '2020-06-09 06:35:01'),
(110, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 49, '[]', '{\"guard_name\":\"web\",\"name\":\"roles create\",\"id\":49}', 'http://localhost/crm/public/roles/create', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:35:03', '2020-06-09 06:35:03'),
(111, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 50, '[]', '{\"guard_name\":\"web\",\"name\":\"roles store\",\"id\":50}', 'http://localhost/crm/public/roles', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 06:35:07', '2020-06-09 06:35:07'),
(112, 'App\\Models\\User', 1, 'created', 'App\\Models\\Permission', 51, '[]', '{\"guard_name\":\"web\",\"name\":\"leads show\",\"id\":51}', 'http://localhost/crm/public/leads/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-09 14:41:32', '2020-06-09 14:41:32'),
(113, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"image\":null}', '{\"image\":\"\\/uploads\\/admins\\/159178812999449.jpg\"}', 'http://localhost/crm/public/users/update_photo/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 09:22:09', '2020-06-10 09:22:09'),
(114, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 7, '[]', '{\"name\":\"user\",\"email\":\"user@user.com\",\"image\":\"\\/uploads\\/user\\/159179234618230.png\",\"password\":\"$2y$10$80NszjTOxLbQg\\/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.\",\"is_super_admin\":0,\"id\":7}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 10:32:26', '2020-06-10 10:32:26'),
(115, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 7, '{\"is_super_admin\":0}', '{\"is_super_admin\":1}', 'http://localhost/crm/public/users/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 10:36:52', '2020-06-10 10:36:52'),
(116, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 6, '{\"id\":6,\"name\":\"test name\",\"email\":\"testmail@test.com\",\"email_verified_at\":null,\"password\":\"$2y$10$vyhCUVIhjRYzGZ8Nx1At7OluMnsBi3cjcYr6cAeyMH.9xGbftAsq6\",\"api_token\":null,\"image\":\"\\/uploads\\/user\\/158947113652728.png\",\"remember_token\":null,\"is_super_admin\":0}', '[]', 'http://localhost/crm/public/users/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 10:37:00', '2020-06-10 10:37:00'),
(117, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 5, '{\"id\":5,\"name\":\"test name\",\"email\":\"testmail@test.com\",\"email_verified_at\":null,\"password\":\"$2y$10$ajdwrh63J07Hf6vTK33zrez.HW4C6MFFPri29paleutlHmXJ5MUhW\",\"api_token\":null,\"image\":\"\\/uploads\\/user\\/158947113628820.png\",\"remember_token\":null,\"is_super_admin\":0}', '[]', 'http://localhost/crm/public/users/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 10:37:04', '2020-06-10 10:37:04'),
(118, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 107, '[]', '{\"name\":\"Carl Fischer\",\"email\":\"dipowymile@mailinator.com\",\"image\":\"\\/uploads\\/user\\/159180265250934.png\",\"password\":\"$2y$10$XaMrvqMazO\\/B38A2j\\/OHI.obSNd.Li1EYjVWBlakTav4Es6JlyyO6\",\"is_super_admin\":0,\"id\":107}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:24:12', '2020-06-10 13:24:12'),
(119, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 11, '[]', '{\"name\":\"Xantha Powers\",\"email\":\"moxaqobyg@mailinator.net\",\"category_id\":\"3\",\"marketing_way_id\":\"1\",\"birth_date\":\"06\\/24\\/2020\",\"job\":\"Proident a dolore q\",\"address\":\"Minus eos dicta des\",\"referred_by\":\"Aut aut sunt veniam\",\"notes\":\"Laborum odio autem d\",\"id\":11}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:34:38', '2020-06-10 13:34:38'),
(120, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 29, '[]', '{\"phone\":\"+1 (676) 971-8782\",\"notes\":\"Consequatur fuga Ni\",\"client_id\":11,\"id\":29}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:34:38', '2020-06-10 13:34:38'),
(121, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Client', 11, '{\"name\":\"Xantha Powers\",\"address\":\"Minus eos dicta des\"}', '{\"name\":\"riyad\",\"address\":\"elthawra street\"}', 'http://localhost/crm/public/clients/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(122, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 30, '[]', '{\"phone\":\"01115752554\",\"notes\":\"Consequatur fuga Ni\",\"client_id\":11,\"id\":30}', 'http://localhost/crm/public/clients/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(123, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 31, '[]', '{\"phone\":\"01115752554\",\"notes\":\"phone test 2\",\"client_id\":11,\"id\":31}', 'http://localhost/crm/public/clients/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(124, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 32, '[]', '{\"phone\":\"+1 (849) 682-5151\",\"notes\":null,\"client_id\":\"4\",\"id\":32}', 'http://localhost/crm/public/contact_list/add_phones', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:41:07', '2020-06-10 13:41:07'),
(125, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 12, '[]', '{\"name\":\"name\",\"email\":\"email@email.com\",\"id\":12}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:44:02', '2020-06-10 13:44:02'),
(126, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 33, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":12,\"id\":33}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:44:02', '2020-06-10 13:44:02'),
(127, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 13, '[]', '{\"name\":\"name\",\"email\":\"name@name.com\",\"id\":13}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:44:24', '2020-06-10 13:44:24'),
(128, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 34, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":13,\"id\":34}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:44:24', '2020-06-10 13:44:24'),
(129, 'App\\Models\\User', 1, 'created', 'App\\Models\\Inventory', 3, '[]', '{\"name\":\"inventory\",\"phone\":\"555522444\",\"address\":\"dasd\",\"notes\":null,\"id\":3}', 'http://localhost/crm/public/inventories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:52:56', '2020-06-10 13:52:56'),
(130, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 7, '[]', '{\"parent_id\":\"1\",\"name\":\"patient_id\",\"notes\":\"asdasd\",\"id\":7}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:55:22', '2020-06-10 13:55:22'),
(131, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 8, '[]', '{\"parent_id\":7,\"name\":\"dasd\",\"notes\":\"dasd\",\"id\":8}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:55:22', '2020-06-10 13:55:22'),
(132, 'App\\Models\\User', 1, 'created', 'App\\Models\\Item', 5, '[]', '{\"category_id\":\"8\",\"name\":\"riyad\",\"unit_price\":\"50\",\"purchase_price\":\"70\",\"sale_price\":\"55\",\"notes\":null,\"id\":5}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(133, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 34, '[]', '{\"variation_id\":1,\"item_id\":5,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":34}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(134, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 35, '[]', '{\"variation_id\":2,\"item_id\":5,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":35}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(135, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 36, '[]', '{\"variation_id\":3,\"item_id\":5,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":36}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(136, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 37, '[]', '{\"variation_id\":4,\"item_id\":5,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":37}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:57:14', '2020-06-10 13:57:14'),
(137, 'App\\Models\\User', 1, 'created', 'App\\Models\\MarketingWay', 4, '[]', '{\"name\":\"name\",\"id\":4}', 'http://localhost/crm/public/marketing_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 13:58:29', '2020-06-10 13:58:29'),
(138, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_by\":null,\"confirmed_at\":null}', '{\"confirmed_by\":1,\"confirmed_at\":\"2020-06-10T16:07:27.203709Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:07:27', '2020-06-10 14:07:27'),
(139, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoice', 2, '[]', '{\"client_id\":\"1\",\"code\":\"code\",\"inventory_id\":\"2\",\"total\":\"55\",\"final_total\":\"67.75\",\"total_after_discount\":\"55\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"67.75\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":2}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:12:34', '2020-06-10 14:12:34');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(140, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 8, '[]', '{\"item_id\":\"2\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"1\",\"price\":\"55\",\"unit_price\":\"50\",\"sale_price\":\"55\",\"purchase_price\":\"50\",\"notes\":0,\"id\":8}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:12:34', '2020-06-10 14:12:34'),
(141, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 9, '[]', '{\"item_id\":\"2\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"1\",\"price\":\"55\",\"unit_price\":\"50\",\"sale_price\":\"55\",\"purchase_price\":\"50\",\"notes\":0,\"id\":9}', 'http://localhost/crm/public/sales_invoices/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:12:47', '2020-06-10 14:12:47'),
(142, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 2, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-10T16:12:51.567495Z\"}', 'http://localhost/crm/public/sales_invoices/approve/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:12:51', '2020-06-10 14:12:51'),
(143, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoice', 3, '[]', '{\"client_id\":\"2\",\"code\":\"code\",\"inventory_id\":\"2\",\"total\":\"120\",\"final_total\":\"120\",\"total_after_discount\":\"120\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"120\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":3}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:13:49', '2020-06-10 14:13:49'),
(144, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 10, '[]', '{\"item_id\":\"4\",\"inventory_id\":\"2\",\"invoice_id\":3,\"amount\":\"2\",\"price\":\"60\",\"unit_price\":\"60\",\"sale_price\":\"60\",\"purchase_price\":\"30\",\"notes\":0,\"id\":10}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:13:49', '2020-06-10 14:13:49'),
(145, 'App\\Models\\User', 1, 'created', 'App\\Models\\Supplier', 5, '[]', '{\"name\":\"Cole Hull\",\"email\":\"xegyla@mailinator.net\",\"phone\":\"+1 (372) 868-2733\",\"initial_balance\":\"1\",\"address\":\"Voluptate consequunt\",\"notes\":\"Obcaecati iste sed q\",\"balance\":\"1\",\"id\":5}', 'http://localhost/crm/public/suppliers', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-10 14:23:42', '2020-06-10 14:23:42'),
(146, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-10 16:07:27\"}', '{\"confirmed_at\":\"2020-06-11T10:40:11.990458Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-11 08:40:12', '2020-06-11 08:40:12'),
(147, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-11 10:40:11\"}', '{\"confirmed_at\":\"2020-06-11T10:40:32.556636Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-11 08:40:32', '2020-06-11 08:40:32'),
(148, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-11 10:40:32\"}', '{\"confirmed_at\":\"2020-06-11T10:40:56.822713Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-11 08:40:56', '2020-06-11 08:40:56'),
(149, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-11 10:40:56\"}', '{\"confirmed_at\":\"2020-06-11T10:40:58.736165Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-11 08:40:58', '2020-06-11 08:40:58'),
(150, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-11 10:40:58\"}', '{\"confirmed_at\":\"2020-06-11T11:09:38.009196Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-11 09:09:38', '2020-06-11 09:09:38'),
(151, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 1, '[]', '{\"message\":\"message\",\"id\":1}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 07:13:14', '2020-06-14 07:13:14'),
(152, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessagePhone', 1, '[]', '{\"sms_message_id\":1,\"client_id\":\"4\",\"phone\":\"01001587086\",\"id\":1}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 07:13:14', '2020-06-14 07:13:14'),
(153, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessagePhone', 2, '[]', '{\"sms_message_id\":1,\"client_id\":\"8\",\"phone\":\"+1 (504) 422-8337\",\"id\":2}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 07:13:14', '2020-06-14 07:13:14'),
(154, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessagePhone', 3, '[]', '{\"sms_message_id\":1,\"client_id\":\"1\",\"phone\":\"55464465\",\"id\":3}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 07:13:14', '2020-06-14 07:13:14'),
(155, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 2, '[]', '{\"message\":\"m\",\"id\":2}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 07:17:43', '2020-06-14 07:17:43'),
(156, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 3, '[]', '{\"message\":\"ddd\",\"id\":3}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 08:02:37', '2020-06-14 08:02:37'),
(157, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\SmsMessage', 1, '{\"id\":1,\"message\":\"message\"}', '[]', 'http://localhost/crm/public/sms_messages/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 08:02:42', '2020-06-14 08:02:42'),
(158, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoice', 5, '[]', '{\"date\":\"2020-06-14T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"codeeeee\",\"purchase_invoice_number\":\"num\",\"inventory_id\":\"3\",\"total\":\"550\",\"final_total\":\"550\",\"total_after_discount\":\"550\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"550\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":5}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 08:33:12', '2020-06-14 08:33:12'),
(159, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 24, '[]', '{\"item_id\":\"2\",\"inventory_id\":\"3\",\"invoice_id\":5,\"amount\":\"11\",\"price\":\"50\",\"unit_price\":\"50\",\"sale_price\":\"55\",\"purchase_price\":\"50\",\"notes\":0,\"id\":24}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 08:33:12', '2020-06-14 08:33:12'),
(160, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 1, '[]', '{\"action\":\"message\",\"basic_body\":\"name\",\"basic_title\":\"name\",\"model_type\":\"App\\\\Models\\\\Notificatio\",\"id\":1}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 09:46:25', '2020-06-14 09:46:25'),
(161, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 3, '{\"total\":120,\"final_total\":120,\"total_after_discount\":120,\"paid_amount\":120}', '{\"total\":\"30000\",\"final_total\":\"30000\",\"total_after_discount\":\"30000\",\"paid_amount\":\"30000\"}', 'http://localhost/crm/public/sales_invoices/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:04:01', '2020-06-14 10:04:01'),
(162, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 11, '[]', '{\"item_id\":\"4\",\"inventory_id\":\"2\",\"invoice_id\":3,\"amount\":\"500\",\"price\":\"60\",\"unit_price\":\"60\",\"sale_price\":\"60\",\"purchase_price\":\"30\",\"notes\":0,\"id\":11}', 'http://localhost/crm/public/sales_invoices/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:04:01', '2020-06-14 10:04:01'),
(163, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 2, '[]', '{\"action\":\"message\",\"basic_body\":\"name\",\"basic_title\":\"name\",\"model_type\":\"App\\\\Models\\\\Notificatio\",\"id\":2}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(164, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 1, '[]', '{\"notification_id\":2,\"user_id\":\"4\",\"seen\":0,\"id\":1}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(165, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 2, '[]', '{\"notification_id\":2,\"user_id\":\"7\",\"seen\":0,\"id\":2}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(166, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 3, '[]', '{\"notification_id\":2,\"user_id\":\"8\",\"seen\":0,\"id\":3}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(167, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 4, '[]', '{\"notification_id\":2,\"user_id\":\"9\",\"seen\":0,\"id\":4}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(168, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 5, '[]', '{\"notification_id\":2,\"user_id\":\"10\",\"seen\":0,\"id\":5}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(169, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 6, '[]', '{\"notification_id\":2,\"user_id\":\"11\",\"seen\":0,\"id\":6}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(170, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadComment', 33, '[]', '{\"lead_id\":\"5\",\"details\":\"note\",\"created_by\":1,\"id\":33}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(171, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 3, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":3}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(172, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 7, '[]', '{\"notification_id\":3,\"user_id\":2,\"seen\":0,\"id\":7}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(173, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 8, '[]', '{\"notification_id\":3,\"user_id\":4,\"seen\":0,\"id\":8}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(174, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 4, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":4}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(175, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 9, '[]', '{\"notification_id\":4,\"user_id\":2,\"seen\":0,\"id\":9}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(176, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 10, '[]', '{\"notification_id\":4,\"user_id\":4,\"seen\":0,\"id\":10}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(177, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 11, '[]', '{\"notification_id\":4,\"user_id\":1,\"seen\":0,\"id\":11}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(178, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 5, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":5}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(179, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 12, '[]', '{\"notification_id\":5,\"user_id\":2,\"seen\":0,\"id\":12}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(180, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 13, '[]', '{\"notification_id\":5,\"user_id\":4,\"seen\":0,\"id\":13}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(181, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 14, '[]', '{\"notification_id\":5,\"user_id\":1,\"seen\":0,\"id\":14}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(182, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 6, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":6}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(183, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 15, '[]', '{\"notification_id\":6,\"user_id\":2,\"seen\":0,\"id\":15}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(184, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 16, '[]', '{\"notification_id\":6,\"user_id\":4,\"seen\":0,\"id\":16}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(185, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 17, '[]', '{\"notification_id\":6,\"user_id\":1,\"seen\":0,\"id\":17}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(186, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 7, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":7}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(187, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 18, '[]', '{\"notification_id\":7,\"user_id\":2,\"seen\":0,\"id\":18}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(188, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 19, '[]', '{\"notification_id\":7,\"user_id\":4,\"seen\":0,\"id\":19}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(189, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 20, '[]', '{\"notification_id\":7,\"user_id\":1,\"seen\":0,\"id\":20}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(190, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 8, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":8}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(191, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 21, '[]', '{\"notification_id\":8,\"user_id\":2,\"seen\":0,\"id\":21}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(192, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 22, '[]', '{\"notification_id\":8,\"user_id\":4,\"seen\":0,\"id\":22}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(193, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 23, '[]', '{\"notification_id\":8,\"user_id\":1,\"seen\":0,\"id\":23}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(194, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 9, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":9}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(195, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 24, '[]', '{\"notification_id\":9,\"user_id\":2,\"seen\":0,\"id\":24}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(196, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 25, '[]', '{\"notification_id\":9,\"user_id\":4,\"seen\":0,\"id\":25}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(197, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 26, '[]', '{\"notification_id\":9,\"user_id\":1,\"seen\":0,\"id\":26}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(198, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 10, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":10}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(199, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 27, '[]', '{\"notification_id\":10,\"user_id\":2,\"seen\":0,\"id\":27}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(200, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 28, '[]', '{\"notification_id\":10,\"user_id\":4,\"seen\":0,\"id\":28}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(201, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 29, '[]', '{\"notification_id\":10,\"user_id\":1,\"seen\":0,\"id\":29}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(202, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 11, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":11}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(203, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 30, '[]', '{\"notification_id\":11,\"user_id\":2,\"seen\":0,\"id\":30}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(204, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 31, '[]', '{\"notification_id\":11,\"user_id\":4,\"seen\":0,\"id\":31}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(205, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 32, '[]', '{\"notification_id\":11,\"user_id\":1,\"seen\":0,\"id\":32}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(206, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 12, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":12}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(207, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 33, '[]', '{\"notification_id\":12,\"user_id\":2,\"seen\":0,\"id\":33}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(208, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 34, '[]', '{\"notification_id\":12,\"user_id\":4,\"seen\":0,\"id\":34}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(209, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 35, '[]', '{\"notification_id\":12,\"user_id\":1,\"seen\":0,\"id\":35}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(210, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 13, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":13}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(211, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 36, '[]', '{\"notification_id\":13,\"user_id\":2,\"seen\":0,\"id\":36}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(212, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 37, '[]', '{\"notification_id\":13,\"user_id\":4,\"seen\":0,\"id\":37}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(213, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 38, '[]', '{\"notification_id\":13,\"user_id\":1,\"seen\":0,\"id\":38}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(214, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 14, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":14}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(215, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 39, '[]', '{\"notification_id\":14,\"user_id\":2,\"seen\":0,\"id\":39}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(216, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 40, '[]', '{\"notification_id\":14,\"user_id\":4,\"seen\":0,\"id\":40}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(217, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 41, '[]', '{\"notification_id\":14,\"user_id\":1,\"seen\":0,\"id\":41}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(218, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 15, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":15}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(219, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 42, '[]', '{\"notification_id\":15,\"user_id\":2,\"seen\":0,\"id\":42}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(220, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 43, '[]', '{\"notification_id\":15,\"user_id\":4,\"seen\":0,\"id\":43}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(221, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 44, '[]', '{\"notification_id\":15,\"user_id\":1,\"seen\":0,\"id\":44}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(222, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 16, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":16}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(223, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 45, '[]', '{\"notification_id\":16,\"user_id\":2,\"seen\":0,\"id\":45}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(224, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 46, '[]', '{\"notification_id\":16,\"user_id\":4,\"seen\":0,\"id\":46}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(225, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 47, '[]', '{\"notification_id\":16,\"user_id\":1,\"seen\":0,\"id\":47}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(226, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 17, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":17}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(227, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 48, '[]', '{\"notification_id\":17,\"user_id\":2,\"seen\":0,\"id\":48}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(228, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 49, '[]', '{\"notification_id\":17,\"user_id\":4,\"seen\":0,\"id\":49}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(229, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 50, '[]', '{\"notification_id\":17,\"user_id\":1,\"seen\":0,\"id\":50}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(230, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 18, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":18}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(231, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 51, '[]', '{\"notification_id\":18,\"user_id\":2,\"seen\":0,\"id\":51}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(232, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 52, '[]', '{\"notification_id\":18,\"user_id\":4,\"seen\":0,\"id\":52}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(233, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 53, '[]', '{\"notification_id\":18,\"user_id\":1,\"seen\":0,\"id\":53}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(234, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 19, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":19}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(235, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 54, '[]', '{\"notification_id\":19,\"user_id\":2,\"seen\":0,\"id\":54}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(236, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 55, '[]', '{\"notification_id\":19,\"user_id\":4,\"seen\":0,\"id\":55}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(237, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 56, '[]', '{\"notification_id\":19,\"user_id\":1,\"seen\":0,\"id\":56}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(238, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 20, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":20}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(239, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 57, '[]', '{\"notification_id\":20,\"user_id\":2,\"seen\":0,\"id\":57}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(240, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 58, '[]', '{\"notification_id\":20,\"user_id\":4,\"seen\":0,\"id\":58}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(241, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 59, '[]', '{\"notification_id\":20,\"user_id\":1,\"seen\":0,\"id\":59}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(242, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 21, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":21}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(243, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 60, '[]', '{\"notification_id\":21,\"user_id\":2,\"seen\":0,\"id\":60}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(244, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 61, '[]', '{\"notification_id\":21,\"user_id\":4,\"seen\":0,\"id\":61}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(245, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 62, '[]', '{\"notification_id\":21,\"user_id\":1,\"seen\":0,\"id\":62}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(246, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 22, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":22}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(247, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 63, '[]', '{\"notification_id\":22,\"user_id\":2,\"seen\":0,\"id\":63}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(248, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 64, '[]', '{\"notification_id\":22,\"user_id\":4,\"seen\":0,\"id\":64}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(249, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 65, '[]', '{\"notification_id\":22,\"user_id\":1,\"seen\":0,\"id\":65}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(250, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 23, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":23}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(251, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 66, '[]', '{\"notification_id\":23,\"user_id\":2,\"seen\":0,\"id\":66}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(252, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 67, '[]', '{\"notification_id\":23,\"user_id\":4,\"seen\":0,\"id\":67}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(253, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 68, '[]', '{\"notification_id\":23,\"user_id\":1,\"seen\":0,\"id\":68}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(254, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 24, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":24}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(255, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 69, '[]', '{\"notification_id\":24,\"user_id\":2,\"seen\":0,\"id\":69}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(256, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 70, '[]', '{\"notification_id\":24,\"user_id\":4,\"seen\":0,\"id\":70}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(257, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 71, '[]', '{\"notification_id\":24,\"user_id\":1,\"seen\":0,\"id\":71}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(258, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 25, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":25}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(259, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 72, '[]', '{\"notification_id\":25,\"user_id\":2,\"seen\":0,\"id\":72}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(260, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 73, '[]', '{\"notification_id\":25,\"user_id\":4,\"seen\":0,\"id\":73}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(261, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 74, '[]', '{\"notification_id\":25,\"user_id\":1,\"seen\":0,\"id\":74}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(262, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 26, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":26}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(263, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 75, '[]', '{\"notification_id\":26,\"user_id\":2,\"seen\":0,\"id\":75}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(264, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 76, '[]', '{\"notification_id\":26,\"user_id\":4,\"seen\":0,\"id\":76}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(265, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 77, '[]', '{\"notification_id\":26,\"user_id\":1,\"seen\":0,\"id\":77}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(266, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 27, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":27}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(267, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 78, '[]', '{\"notification_id\":27,\"user_id\":2,\"seen\":0,\"id\":78}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(268, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 79, '[]', '{\"notification_id\":27,\"user_id\":4,\"seen\":0,\"id\":79}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(269, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 80, '[]', '{\"notification_id\":27,\"user_id\":1,\"seen\":0,\"id\":80}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(270, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 28, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":28}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(271, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 81, '[]', '{\"notification_id\":28,\"user_id\":2,\"seen\":0,\"id\":81}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(272, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 82, '[]', '{\"notification_id\":28,\"user_id\":4,\"seen\":0,\"id\":82}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(273, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 83, '[]', '{\"notification_id\":28,\"user_id\":1,\"seen\":0,\"id\":83}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(274, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 29, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":29}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(275, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 84, '[]', '{\"notification_id\":29,\"user_id\":2,\"seen\":0,\"id\":84}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(276, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 85, '[]', '{\"notification_id\":29,\"user_id\":4,\"seen\":0,\"id\":85}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(277, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 86, '[]', '{\"notification_id\":29,\"user_id\":1,\"seen\":0,\"id\":86}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(278, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 30, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":30}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(279, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 87, '[]', '{\"notification_id\":30,\"user_id\":2,\"seen\":0,\"id\":87}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(280, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 88, '[]', '{\"notification_id\":30,\"user_id\":4,\"seen\":0,\"id\":88}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(281, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 89, '[]', '{\"notification_id\":30,\"user_id\":1,\"seen\":0,\"id\":89}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(282, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 31, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":31}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(283, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 90, '[]', '{\"notification_id\":31,\"user_id\":2,\"seen\":0,\"id\":90}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(284, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 91, '[]', '{\"notification_id\":31,\"user_id\":4,\"seen\":0,\"id\":91}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(285, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 92, '[]', '{\"notification_id\":31,\"user_id\":1,\"seen\":0,\"id\":92}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(286, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 32, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":32}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(287, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 93, '[]', '{\"notification_id\":32,\"user_id\":2,\"seen\":0,\"id\":93}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(288, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 94, '[]', '{\"notification_id\":32,\"user_id\":4,\"seen\":0,\"id\":94}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(289, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 95, '[]', '{\"notification_id\":32,\"user_id\":1,\"seen\":0,\"id\":95}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(290, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 33, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":33}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(291, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 96, '[]', '{\"notification_id\":33,\"user_id\":2,\"seen\":0,\"id\":96}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(292, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 97, '[]', '{\"notification_id\":33,\"user_id\":4,\"seen\":0,\"id\":97}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(293, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 98, '[]', '{\"notification_id\":33,\"user_id\":1,\"seen\":0,\"id\":98}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(294, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 34, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":34}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(295, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 99, '[]', '{\"notification_id\":34,\"user_id\":2,\"seen\":0,\"id\":99}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(296, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 100, '[]', '{\"notification_id\":34,\"user_id\":4,\"seen\":0,\"id\":100}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(297, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 101, '[]', '{\"notification_id\":34,\"user_id\":1,\"seen\":0,\"id\":101}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(298, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 35, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":35}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(299, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 102, '[]', '{\"notification_id\":35,\"user_id\":2,\"seen\":0,\"id\":102}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(300, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 103, '[]', '{\"notification_id\":35,\"user_id\":4,\"seen\":0,\"id\":103}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(301, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 104, '[]', '{\"notification_id\":35,\"user_id\":1,\"seen\":0,\"id\":104}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(302, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 36, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":36}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(303, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 105, '[]', '{\"notification_id\":36,\"user_id\":2,\"seen\":0,\"id\":105}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(304, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 106, '[]', '{\"notification_id\":36,\"user_id\":4,\"seen\":0,\"id\":106}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(305, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 107, '[]', '{\"notification_id\":36,\"user_id\":1,\"seen\":0,\"id\":107}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(306, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 37, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":37}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(307, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 108, '[]', '{\"notification_id\":37,\"user_id\":2,\"seen\":0,\"id\":108}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(308, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 109, '[]', '{\"notification_id\":37,\"user_id\":4,\"seen\":0,\"id\":109}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(309, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 110, '[]', '{\"notification_id\":37,\"user_id\":1,\"seen\":0,\"id\":110}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(310, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 38, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":38}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(311, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 111, '[]', '{\"notification_id\":38,\"user_id\":2,\"seen\":0,\"id\":111}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(312, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 112, '[]', '{\"notification_id\":38,\"user_id\":4,\"seen\":0,\"id\":112}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(313, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 113, '[]', '{\"notification_id\":38,\"user_id\":1,\"seen\":0,\"id\":113}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(314, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 39, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":39}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(315, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 114, '[]', '{\"notification_id\":39,\"user_id\":2,\"seen\":0,\"id\":114}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(316, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 115, '[]', '{\"notification_id\":39,\"user_id\":4,\"seen\":0,\"id\":115}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(317, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 116, '[]', '{\"notification_id\":39,\"user_id\":1,\"seen\":0,\"id\":116}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(318, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 40, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":40}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(319, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 117, '[]', '{\"notification_id\":40,\"user_id\":2,\"seen\":0,\"id\":117}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(320, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 118, '[]', '{\"notification_id\":40,\"user_id\":4,\"seen\":0,\"id\":118}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(321, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 119, '[]', '{\"notification_id\":40,\"user_id\":1,\"seen\":0,\"id\":119}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(322, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 41, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":41}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(323, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 120, '[]', '{\"notification_id\":41,\"user_id\":2,\"seen\":0,\"id\":120}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(324, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 121, '[]', '{\"notification_id\":41,\"user_id\":4,\"seen\":0,\"id\":121}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(325, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 122, '[]', '{\"notification_id\":41,\"user_id\":1,\"seen\":0,\"id\":122}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(326, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 42, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":42}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(327, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 123, '[]', '{\"notification_id\":42,\"user_id\":2,\"seen\":0,\"id\":123}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(328, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 124, '[]', '{\"notification_id\":42,\"user_id\":4,\"seen\":0,\"id\":124}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(329, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 125, '[]', '{\"notification_id\":42,\"user_id\":1,\"seen\":0,\"id\":125}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(330, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 43, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":43}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(331, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 126, '[]', '{\"notification_id\":43,\"user_id\":2,\"seen\":0,\"id\":126}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(332, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 127, '[]', '{\"notification_id\":43,\"user_id\":4,\"seen\":0,\"id\":127}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(333, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 128, '[]', '{\"notification_id\":43,\"user_id\":1,\"seen\":0,\"id\":128}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(334, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 44, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":44}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(335, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 129, '[]', '{\"notification_id\":44,\"user_id\":2,\"seen\":0,\"id\":129}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(336, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 130, '[]', '{\"notification_id\":44,\"user_id\":4,\"seen\":0,\"id\":130}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(337, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 131, '[]', '{\"notification_id\":44,\"user_id\":1,\"seen\":0,\"id\":131}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(338, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 45, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":45}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(339, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 132, '[]', '{\"notification_id\":45,\"user_id\":2,\"seen\":0,\"id\":132}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(340, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 133, '[]', '{\"notification_id\":45,\"user_id\":4,\"seen\":0,\"id\":133}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(341, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 134, '[]', '{\"notification_id\":45,\"user_id\":1,\"seen\":0,\"id\":134}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(342, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 46, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":46}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(343, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 135, '[]', '{\"notification_id\":46,\"user_id\":2,\"seen\":0,\"id\":135}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(344, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 136, '[]', '{\"notification_id\":46,\"user_id\":4,\"seen\":0,\"id\":136}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(345, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 137, '[]', '{\"notification_id\":46,\"user_id\":1,\"seen\":0,\"id\":137}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(346, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 47, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":47}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(347, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 138, '[]', '{\"notification_id\":47,\"user_id\":2,\"seen\":0,\"id\":138}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(348, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 139, '[]', '{\"notification_id\":47,\"user_id\":4,\"seen\":0,\"id\":139}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(349, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 140, '[]', '{\"notification_id\":47,\"user_id\":1,\"seen\":0,\"id\":140}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(350, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 48, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":48}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(351, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 141, '[]', '{\"notification_id\":48,\"user_id\":2,\"seen\":0,\"id\":141}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(352, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 142, '[]', '{\"notification_id\":48,\"user_id\":4,\"seen\":0,\"id\":142}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(353, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 143, '[]', '{\"notification_id\":48,\"user_id\":1,\"seen\":0,\"id\":143}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(354, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 49, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":49}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(355, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 144, '[]', '{\"notification_id\":49,\"user_id\":2,\"seen\":0,\"id\":144}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(356, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 145, '[]', '{\"notification_id\":49,\"user_id\":4,\"seen\":0,\"id\":145}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(357, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 146, '[]', '{\"notification_id\":49,\"user_id\":1,\"seen\":0,\"id\":146}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(358, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 50, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":50}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(359, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 147, '[]', '{\"notification_id\":50,\"user_id\":2,\"seen\":0,\"id\":147}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(360, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 148, '[]', '{\"notification_id\":50,\"user_id\":4,\"seen\":0,\"id\":148}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(361, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 149, '[]', '{\"notification_id\":50,\"user_id\":1,\"seen\":0,\"id\":149}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(362, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 51, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":51}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(363, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 150, '[]', '{\"notification_id\":51,\"user_id\":2,\"seen\":0,\"id\":150}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(364, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 151, '[]', '{\"notification_id\":51,\"user_id\":4,\"seen\":0,\"id\":151}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(365, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 152, '[]', '{\"notification_id\":51,\"user_id\":1,\"seen\":0,\"id\":152}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(366, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 52, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":52}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(367, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 153, '[]', '{\"notification_id\":52,\"user_id\":2,\"seen\":0,\"id\":153}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(368, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 154, '[]', '{\"notification_id\":52,\"user_id\":4,\"seen\":0,\"id\":154}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(369, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 155, '[]', '{\"notification_id\":52,\"user_id\":1,\"seen\":0,\"id\":155}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(370, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 53, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":53}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(371, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 156, '[]', '{\"notification_id\":53,\"user_id\":2,\"seen\":0,\"id\":156}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(372, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 157, '[]', '{\"notification_id\":53,\"user_id\":4,\"seen\":0,\"id\":157}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(373, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 158, '[]', '{\"notification_id\":53,\"user_id\":1,\"seen\":0,\"id\":158}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(374, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 54, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":54}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(375, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 159, '[]', '{\"notification_id\":54,\"user_id\":2,\"seen\":0,\"id\":159}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(376, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 160, '[]', '{\"notification_id\":54,\"user_id\":4,\"seen\":0,\"id\":160}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(377, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 161, '[]', '{\"notification_id\":54,\"user_id\":1,\"seen\":0,\"id\":161}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(378, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 55, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":55}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(379, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 162, '[]', '{\"notification_id\":55,\"user_id\":2,\"seen\":0,\"id\":162}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(380, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 163, '[]', '{\"notification_id\":55,\"user_id\":4,\"seen\":0,\"id\":163}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(381, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 164, '[]', '{\"notification_id\":55,\"user_id\":1,\"seen\":0,\"id\":164}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(382, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 56, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":56}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(383, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 165, '[]', '{\"notification_id\":56,\"user_id\":2,\"seen\":0,\"id\":165}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(384, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 166, '[]', '{\"notification_id\":56,\"user_id\":4,\"seen\":0,\"id\":166}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(385, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 167, '[]', '{\"notification_id\":56,\"user_id\":1,\"seen\":0,\"id\":167}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(386, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 57, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":57}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(387, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 168, '[]', '{\"notification_id\":57,\"user_id\":2,\"seen\":0,\"id\":168}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(388, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 169, '[]', '{\"notification_id\":57,\"user_id\":4,\"seen\":0,\"id\":169}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(389, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 170, '[]', '{\"notification_id\":57,\"user_id\":1,\"seen\":0,\"id\":170}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(390, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 58, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":58}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(391, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 171, '[]', '{\"notification_id\":58,\"user_id\":2,\"seen\":0,\"id\":171}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(392, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 172, '[]', '{\"notification_id\":58,\"user_id\":4,\"seen\":0,\"id\":172}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(393, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 173, '[]', '{\"notification_id\":58,\"user_id\":1,\"seen\":0,\"id\":173}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(394, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 59, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":59}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(395, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 174, '[]', '{\"notification_id\":59,\"user_id\":2,\"seen\":0,\"id\":174}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(396, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 175, '[]', '{\"notification_id\":59,\"user_id\":4,\"seen\":0,\"id\":175}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(397, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 176, '[]', '{\"notification_id\":59,\"user_id\":1,\"seen\":0,\"id\":176}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(398, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 60, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":60}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(399, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 177, '[]', '{\"notification_id\":60,\"user_id\":2,\"seen\":0,\"id\":177}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(400, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 178, '[]', '{\"notification_id\":60,\"user_id\":4,\"seen\":0,\"id\":178}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(401, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 179, '[]', '{\"notification_id\":60,\"user_id\":1,\"seen\":0,\"id\":179}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(402, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 61, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":61}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(403, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 180, '[]', '{\"notification_id\":61,\"user_id\":2,\"seen\":0,\"id\":180}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(404, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 181, '[]', '{\"notification_id\":61,\"user_id\":4,\"seen\":0,\"id\":181}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(405, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 182, '[]', '{\"notification_id\":61,\"user_id\":1,\"seen\":0,\"id\":182}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(406, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 62, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":62}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(407, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 183, '[]', '{\"notification_id\":62,\"user_id\":2,\"seen\":0,\"id\":183}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(408, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 184, '[]', '{\"notification_id\":62,\"user_id\":4,\"seen\":0,\"id\":184}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(409, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 185, '[]', '{\"notification_id\":62,\"user_id\":1,\"seen\":0,\"id\":185}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(410, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 63, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":63}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(411, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 186, '[]', '{\"notification_id\":63,\"user_id\":2,\"seen\":0,\"id\":186}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(412, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 187, '[]', '{\"notification_id\":63,\"user_id\":4,\"seen\":0,\"id\":187}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(413, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 188, '[]', '{\"notification_id\":63,\"user_id\":1,\"seen\":0,\"id\":188}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(414, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 64, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":64}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(415, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 189, '[]', '{\"notification_id\":64,\"user_id\":2,\"seen\":0,\"id\":189}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(416, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 190, '[]', '{\"notification_id\":64,\"user_id\":4,\"seen\":0,\"id\":190}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(417, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 191, '[]', '{\"notification_id\":64,\"user_id\":1,\"seen\":0,\"id\":191}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(418, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 65, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":65}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(419, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 192, '[]', '{\"notification_id\":65,\"user_id\":2,\"seen\":0,\"id\":192}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(420, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 193, '[]', '{\"notification_id\":65,\"user_id\":4,\"seen\":0,\"id\":193}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(421, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 194, '[]', '{\"notification_id\":65,\"user_id\":1,\"seen\":0,\"id\":194}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(422, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 66, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":66}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(423, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 195, '[]', '{\"notification_id\":66,\"user_id\":2,\"seen\":0,\"id\":195}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(424, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 196, '[]', '{\"notification_id\":66,\"user_id\":4,\"seen\":0,\"id\":196}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(425, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 197, '[]', '{\"notification_id\":66,\"user_id\":1,\"seen\":0,\"id\":197}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(426, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 67, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":67}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(427, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 198, '[]', '{\"notification_id\":67,\"user_id\":2,\"seen\":0,\"id\":198}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(428, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 199, '[]', '{\"notification_id\":67,\"user_id\":4,\"seen\":0,\"id\":199}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(429, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 200, '[]', '{\"notification_id\":67,\"user_id\":1,\"seen\":0,\"id\":200}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(430, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 68, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":68}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(431, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 201, '[]', '{\"notification_id\":68,\"user_id\":2,\"seen\":0,\"id\":201}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(432, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 202, '[]', '{\"notification_id\":68,\"user_id\":4,\"seen\":0,\"id\":202}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(433, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 203, '[]', '{\"notification_id\":68,\"user_id\":1,\"seen\":0,\"id\":203}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(434, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 69, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":69}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(435, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 204, '[]', '{\"notification_id\":69,\"user_id\":2,\"seen\":0,\"id\":204}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(436, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 205, '[]', '{\"notification_id\":69,\"user_id\":4,\"seen\":0,\"id\":205}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(437, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 206, '[]', '{\"notification_id\":69,\"user_id\":1,\"seen\":0,\"id\":206}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(438, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 70, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":70}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(439, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 207, '[]', '{\"notification_id\":70,\"user_id\":2,\"seen\":0,\"id\":207}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(440, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 208, '[]', '{\"notification_id\":70,\"user_id\":4,\"seen\":0,\"id\":208}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(441, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 209, '[]', '{\"notification_id\":70,\"user_id\":1,\"seen\":0,\"id\":209}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(442, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 71, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":71}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(443, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 210, '[]', '{\"notification_id\":71,\"user_id\":2,\"seen\":0,\"id\":210}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(444, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 211, '[]', '{\"notification_id\":71,\"user_id\":4,\"seen\":0,\"id\":211}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(445, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 212, '[]', '{\"notification_id\":71,\"user_id\":1,\"seen\":0,\"id\":212}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(446, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 72, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":72}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(447, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 213, '[]', '{\"notification_id\":72,\"user_id\":2,\"seen\":0,\"id\":213}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(448, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 214, '[]', '{\"notification_id\":72,\"user_id\":4,\"seen\":0,\"id\":214}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(449, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 215, '[]', '{\"notification_id\":72,\"user_id\":1,\"seen\":0,\"id\":215}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(450, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 73, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":73}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(451, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 216, '[]', '{\"notification_id\":73,\"user_id\":2,\"seen\":0,\"id\":216}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(452, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 217, '[]', '{\"notification_id\":73,\"user_id\":4,\"seen\":0,\"id\":217}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(453, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 218, '[]', '{\"notification_id\":73,\"user_id\":1,\"seen\":0,\"id\":218}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(454, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 74, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":74}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(455, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 219, '[]', '{\"notification_id\":74,\"user_id\":2,\"seen\":0,\"id\":219}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(456, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 220, '[]', '{\"notification_id\":74,\"user_id\":4,\"seen\":0,\"id\":220}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(457, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 221, '[]', '{\"notification_id\":74,\"user_id\":1,\"seen\":0,\"id\":221}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(458, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 75, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":75}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(459, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 222, '[]', '{\"notification_id\":75,\"user_id\":2,\"seen\":0,\"id\":222}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(460, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 223, '[]', '{\"notification_id\":75,\"user_id\":4,\"seen\":0,\"id\":223}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(461, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 224, '[]', '{\"notification_id\":75,\"user_id\":1,\"seen\":0,\"id\":224}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(462, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 76, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":76}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(463, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 225, '[]', '{\"notification_id\":76,\"user_id\":2,\"seen\":0,\"id\":225}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(464, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 226, '[]', '{\"notification_id\":76,\"user_id\":4,\"seen\":0,\"id\":226}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(465, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 227, '[]', '{\"notification_id\":76,\"user_id\":1,\"seen\":0,\"id\":227}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(466, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 77, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":77}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(467, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 228, '[]', '{\"notification_id\":77,\"user_id\":2,\"seen\":0,\"id\":228}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(468, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 229, '[]', '{\"notification_id\":77,\"user_id\":4,\"seen\":0,\"id\":229}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(469, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 230, '[]', '{\"notification_id\":77,\"user_id\":1,\"seen\":0,\"id\":230}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(470, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 78, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":78}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(471, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 231, '[]', '{\"notification_id\":78,\"user_id\":2,\"seen\":0,\"id\":231}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(472, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 232, '[]', '{\"notification_id\":78,\"user_id\":4,\"seen\":0,\"id\":232}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(473, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 233, '[]', '{\"notification_id\":78,\"user_id\":1,\"seen\":0,\"id\":233}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(474, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 79, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":79}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(475, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 234, '[]', '{\"notification_id\":79,\"user_id\":2,\"seen\":0,\"id\":234}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(476, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 235, '[]', '{\"notification_id\":79,\"user_id\":4,\"seen\":0,\"id\":235}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(477, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 236, '[]', '{\"notification_id\":79,\"user_id\":1,\"seen\":0,\"id\":236}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(478, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 80, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":80}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(479, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 237, '[]', '{\"notification_id\":80,\"user_id\":2,\"seen\":0,\"id\":237}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(480, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 238, '[]', '{\"notification_id\":80,\"user_id\":4,\"seen\":0,\"id\":238}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(481, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 239, '[]', '{\"notification_id\":80,\"user_id\":1,\"seen\":0,\"id\":239}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(482, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 81, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":81}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(483, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 240, '[]', '{\"notification_id\":81,\"user_id\":2,\"seen\":0,\"id\":240}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(484, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 241, '[]', '{\"notification_id\":81,\"user_id\":4,\"seen\":0,\"id\":241}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(485, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 242, '[]', '{\"notification_id\":81,\"user_id\":1,\"seen\":0,\"id\":242}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(486, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 82, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":82}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(487, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 243, '[]', '{\"notification_id\":82,\"user_id\":2,\"seen\":0,\"id\":243}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(488, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 244, '[]', '{\"notification_id\":82,\"user_id\":4,\"seen\":0,\"id\":244}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(489, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 245, '[]', '{\"notification_id\":82,\"user_id\":1,\"seen\":0,\"id\":245}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(490, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 83, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":83}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(491, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 246, '[]', '{\"notification_id\":83,\"user_id\":2,\"seen\":0,\"id\":246}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(492, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 247, '[]', '{\"notification_id\":83,\"user_id\":4,\"seen\":0,\"id\":247}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(493, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 248, '[]', '{\"notification_id\":83,\"user_id\":1,\"seen\":0,\"id\":248}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(494, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 84, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":84}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(495, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 249, '[]', '{\"notification_id\":84,\"user_id\":2,\"seen\":0,\"id\":249}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(496, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 250, '[]', '{\"notification_id\":84,\"user_id\":4,\"seen\":0,\"id\":250}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(497, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 251, '[]', '{\"notification_id\":84,\"user_id\":1,\"seen\":0,\"id\":251}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(498, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 85, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":85}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(499, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 252, '[]', '{\"notification_id\":85,\"user_id\":2,\"seen\":0,\"id\":252}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(500, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 253, '[]', '{\"notification_id\":85,\"user_id\":4,\"seen\":0,\"id\":253}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(501, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 254, '[]', '{\"notification_id\":85,\"user_id\":1,\"seen\":0,\"id\":254}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(502, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 86, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":86}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(503, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 255, '[]', '{\"notification_id\":86,\"user_id\":2,\"seen\":0,\"id\":255}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(504, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 256, '[]', '{\"notification_id\":86,\"user_id\":4,\"seen\":0,\"id\":256}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(505, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 257, '[]', '{\"notification_id\":86,\"user_id\":1,\"seen\":0,\"id\":257}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(506, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 87, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":87}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(507, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 258, '[]', '{\"notification_id\":87,\"user_id\":2,\"seen\":0,\"id\":258}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(508, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 259, '[]', '{\"notification_id\":87,\"user_id\":4,\"seen\":0,\"id\":259}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(509, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 260, '[]', '{\"notification_id\":87,\"user_id\":1,\"seen\":0,\"id\":260}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(510, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 88, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":88}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(511, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 261, '[]', '{\"notification_id\":88,\"user_id\":2,\"seen\":0,\"id\":261}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(512, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 262, '[]', '{\"notification_id\":88,\"user_id\":4,\"seen\":0,\"id\":262}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(513, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 263, '[]', '{\"notification_id\":88,\"user_id\":1,\"seen\":0,\"id\":263}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(514, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 89, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":89}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(515, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 264, '[]', '{\"notification_id\":89,\"user_id\":2,\"seen\":0,\"id\":264}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(516, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 265, '[]', '{\"notification_id\":89,\"user_id\":4,\"seen\":0,\"id\":265}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(517, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 266, '[]', '{\"notification_id\":89,\"user_id\":1,\"seen\":0,\"id\":266}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(518, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 90, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":90}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(519, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 267, '[]', '{\"notification_id\":90,\"user_id\":2,\"seen\":0,\"id\":267}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(520, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 268, '[]', '{\"notification_id\":90,\"user_id\":4,\"seen\":0,\"id\":268}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(521, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 269, '[]', '{\"notification_id\":90,\"user_id\":1,\"seen\":0,\"id\":269}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(522, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 91, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":91}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(523, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 270, '[]', '{\"notification_id\":91,\"user_id\":2,\"seen\":0,\"id\":270}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(524, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 271, '[]', '{\"notification_id\":91,\"user_id\":4,\"seen\":0,\"id\":271}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(525, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 272, '[]', '{\"notification_id\":91,\"user_id\":1,\"seen\":0,\"id\":272}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(526, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 92, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":92}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(527, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 273, '[]', '{\"notification_id\":92,\"user_id\":2,\"seen\":0,\"id\":273}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(528, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 274, '[]', '{\"notification_id\":92,\"user_id\":4,\"seen\":0,\"id\":274}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(529, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 275, '[]', '{\"notification_id\":92,\"user_id\":1,\"seen\":0,\"id\":275}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(530, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 93, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":93}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(531, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 276, '[]', '{\"notification_id\":93,\"user_id\":2,\"seen\":0,\"id\":276}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(532, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 277, '[]', '{\"notification_id\":93,\"user_id\":4,\"seen\":0,\"id\":277}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(533, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 278, '[]', '{\"notification_id\":93,\"user_id\":1,\"seen\":0,\"id\":278}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(534, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 94, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":94}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(535, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 279, '[]', '{\"notification_id\":94,\"user_id\":2,\"seen\":0,\"id\":279}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(536, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 280, '[]', '{\"notification_id\":94,\"user_id\":4,\"seen\":0,\"id\":280}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(537, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 281, '[]', '{\"notification_id\":94,\"user_id\":1,\"seen\":0,\"id\":281}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(538, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 95, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":95}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(539, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 282, '[]', '{\"notification_id\":95,\"user_id\":2,\"seen\":0,\"id\":282}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(540, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 283, '[]', '{\"notification_id\":95,\"user_id\":4,\"seen\":0,\"id\":283}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(541, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 284, '[]', '{\"notification_id\":95,\"user_id\":1,\"seen\":0,\"id\":284}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(542, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 96, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":96}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(543, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 285, '[]', '{\"notification_id\":96,\"user_id\":2,\"seen\":0,\"id\":285}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(544, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 286, '[]', '{\"notification_id\":96,\"user_id\":4,\"seen\":0,\"id\":286}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(545, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 287, '[]', '{\"notification_id\":96,\"user_id\":1,\"seen\":0,\"id\":287}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(546, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 97, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":97}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(547, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 288, '[]', '{\"notification_id\":97,\"user_id\":2,\"seen\":0,\"id\":288}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(548, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 289, '[]', '{\"notification_id\":97,\"user_id\":4,\"seen\":0,\"id\":289}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(549, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 290, '[]', '{\"notification_id\":97,\"user_id\":1,\"seen\":0,\"id\":290}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(550, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 98, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":98}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(551, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 291, '[]', '{\"notification_id\":98,\"user_id\":2,\"seen\":0,\"id\":291}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(552, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 292, '[]', '{\"notification_id\":98,\"user_id\":4,\"seen\":0,\"id\":292}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(553, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 293, '[]', '{\"notification_id\":98,\"user_id\":1,\"seen\":0,\"id\":293}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(554, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 99, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":99}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(555, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 294, '[]', '{\"notification_id\":99,\"user_id\":2,\"seen\":0,\"id\":294}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(556, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 295, '[]', '{\"notification_id\":99,\"user_id\":4,\"seen\":0,\"id\":295}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(557, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 296, '[]', '{\"notification_id\":99,\"user_id\":1,\"seen\":0,\"id\":296}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(558, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 100, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":100}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(559, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 297, '[]', '{\"notification_id\":100,\"user_id\":2,\"seen\":0,\"id\":297}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(560, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 298, '[]', '{\"notification_id\":100,\"user_id\":4,\"seen\":0,\"id\":298}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(561, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 299, '[]', '{\"notification_id\":100,\"user_id\":1,\"seen\":0,\"id\":299}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(562, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 101, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":101}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(563, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 300, '[]', '{\"notification_id\":101,\"user_id\":2,\"seen\":0,\"id\":300}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(564, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 301, '[]', '{\"notification_id\":101,\"user_id\":4,\"seen\":0,\"id\":301}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(565, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 302, '[]', '{\"notification_id\":101,\"user_id\":1,\"seen\":0,\"id\":302}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(566, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 102, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":102}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(567, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 303, '[]', '{\"notification_id\":102,\"user_id\":2,\"seen\":0,\"id\":303}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(568, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 304, '[]', '{\"notification_id\":102,\"user_id\":4,\"seen\":0,\"id\":304}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(569, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 305, '[]', '{\"notification_id\":102,\"user_id\":1,\"seen\":0,\"id\":305}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(570, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 103, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":103}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(571, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 306, '[]', '{\"notification_id\":103,\"user_id\":2,\"seen\":0,\"id\":306}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(572, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 307, '[]', '{\"notification_id\":103,\"user_id\":4,\"seen\":0,\"id\":307}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(573, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 308, '[]', '{\"notification_id\":103,\"user_id\":1,\"seen\":0,\"id\":308}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(574, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 104, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":104}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(575, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 309, '[]', '{\"notification_id\":104,\"user_id\":2,\"seen\":0,\"id\":309}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(576, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 310, '[]', '{\"notification_id\":104,\"user_id\":4,\"seen\":0,\"id\":310}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(577, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 311, '[]', '{\"notification_id\":104,\"user_id\":1,\"seen\":0,\"id\":311}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(578, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 105, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":105}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(579, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 312, '[]', '{\"notification_id\":105,\"user_id\":2,\"seen\":0,\"id\":312}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(580, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 313, '[]', '{\"notification_id\":105,\"user_id\":4,\"seen\":0,\"id\":313}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(581, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 314, '[]', '{\"notification_id\":105,\"user_id\":1,\"seen\":0,\"id\":314}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(582, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 106, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":106}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(583, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 315, '[]', '{\"notification_id\":106,\"user_id\":2,\"seen\":0,\"id\":315}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(584, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 316, '[]', '{\"notification_id\":106,\"user_id\":4,\"seen\":0,\"id\":316}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(585, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 317, '[]', '{\"notification_id\":106,\"user_id\":1,\"seen\":0,\"id\":317}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(586, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 107, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":107}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(587, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 318, '[]', '{\"notification_id\":107,\"user_id\":2,\"seen\":0,\"id\":318}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(588, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 319, '[]', '{\"notification_id\":107,\"user_id\":4,\"seen\":0,\"id\":319}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(589, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 320, '[]', '{\"notification_id\":107,\"user_id\":1,\"seen\":0,\"id\":320}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(590, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 108, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":108}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(591, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 321, '[]', '{\"notification_id\":108,\"user_id\":2,\"seen\":0,\"id\":321}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(592, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 322, '[]', '{\"notification_id\":108,\"user_id\":4,\"seen\":0,\"id\":322}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(593, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 323, '[]', '{\"notification_id\":108,\"user_id\":1,\"seen\":0,\"id\":323}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(594, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 109, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":109}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(595, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 324, '[]', '{\"notification_id\":109,\"user_id\":2,\"seen\":0,\"id\":324}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(596, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 325, '[]', '{\"notification_id\":109,\"user_id\":4,\"seen\":0,\"id\":325}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(597, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 326, '[]', '{\"notification_id\":109,\"user_id\":1,\"seen\":0,\"id\":326}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(598, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 110, '[]', '{\"action\":\"new_lead_comment\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":110}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(599, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 327, '[]', '{\"notification_id\":110,\"user_id\":2,\"seen\":0,\"id\":327}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(600, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 328, '[]', '{\"notification_id\":110,\"user_id\":4,\"seen\":0,\"id\":328}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:49', '2020-06-14 10:26:49'),
(601, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 329, '[]', '{\"notification_id\":110,\"user_id\":1,\"seen\":0,\"id\":329}', 'http://localhost/crm/public/lead_notes', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:26:49', '2020-06-14 10:26:49'),
(602, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadOperation', 111, '[]', '{\"lead_id\":\"5\",\"operation_date\":\"2020-06-06T00:00:00.000000Z\",\"operation_time\":\"2020-06-14T19:25:00.000000Z\",\"user_id\":\"1\",\"connection_way_id\":\"1\",\"connection_way_status\":\"\\u0644\\u0645 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0631\\u062f\",\"notes\":null,\"created_by\":1,\"id\":111}', 'http://localhost/crm/public/lead_operations', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 10:53:26', '2020-06-14 10:53:26'),
(603, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 4, '[]', '{\"message\":\"Dolor velit dolorem\",\"id\":4}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 12:12:38', '2020-06-14 12:12:38'),
(604, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 5, '[]', '{\"message\":\"Dolor velit dolorem\",\"id\":5}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 12:24:16', '2020-06-14 12:24:16'),
(605, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Lead', 5, '{\"lead_status_id\":1}', '{\"lead_status_id\":\"2\"}', 'http://localhost/crm/public/leads/changestatus/5/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(606, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 111, '[]', '{\"action\":\"updated_Lead\",\"model_id\":5,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":111}', 'http://localhost/crm/public/leads/changestatus/5/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(607, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 330, '[]', '{\"notification_id\":111,\"user_id\":2,\"seen\":0,\"id\":330}', 'http://localhost/crm/public/leads/changestatus/5/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(608, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 331, '[]', '{\"notification_id\":111,\"user_id\":4,\"seen\":0,\"id\":331}', 'http://localhost/crm/public/leads/changestatus/5/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(609, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 332, '[]', '{\"notification_id\":111,\"user_id\":1,\"seen\":0,\"id\":332}', 'http://localhost/crm/public/leads/changestatus/5/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(610, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Lead', 5, '{\"lead_status_id\":2}', '{\"lead_status_id\":\"3\"}', 'http://localhost/crm/public/leads/changestatus/5/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(611, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 112, '[]', '{\"action\":\"updated_Lead\",\"model_id\":5,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":112}', 'http://localhost/crm/public/leads/changestatus/5/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(612, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 333, '[]', '{\"notification_id\":112,\"user_id\":2,\"seen\":0,\"id\":333}', 'http://localhost/crm/public/leads/changestatus/5/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(613, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 334, '[]', '{\"notification_id\":112,\"user_id\":4,\"seen\":0,\"id\":334}', 'http://localhost/crm/public/leads/changestatus/5/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(614, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 335, '[]', '{\"notification_id\":112,\"user_id\":1,\"seen\":0,\"id\":335}', 'http://localhost/crm/public/leads/changestatus/5/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(615, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadOperation', 112, '[]', '{\"lead_id\":\"5\",\"operation_date\":\"1920-06-16T00:00:00.000000Z\",\"operation_time\":\"2020-06-15T19:25:00.000000Z\",\"user_id\":\"1\",\"connection_way_id\":\"1\",\"connection_way_status\":\"\\u062a\\u0645 \\u0627\\u0644\\u0631\\u062f\",\"notes\":null,\"created_by\":1,\"id\":112}', 'http://localhost/crm/public/lead_operations', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 06:53:52', '2020-06-15 06:53:52'),
(616, 'App\\Models\\User', 1, 'created', 'App\\Models\\Department', 2, '[]', '{\"name\":\"root\",\"id\":2}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 07:11:18', '2020-06-15 07:11:18'),
(617, 'App\\Models\\User', 1, 'created', 'App\\Models\\Department', 3, '[]', '{\"name\":\"arabic\",\"name_en\":\"english\",\"id\":3}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 07:51:17', '2020-06-15 07:51:17'),
(618, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Department', 3, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"english\",\"name_ar\":\"arabic\"}', 'http://localhost/crm/public/departments/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 07:56:24', '2020-06-15 07:56:24'),
(619, 'App\\Models\\User', 1, 'created', 'App\\Models\\MarketingWay', 5, '[]', '{\"name_ar\":\"ar\",\"name_en\":\"en\",\"id\":5}', 'http://localhost/crm/public/marketing_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:40:50', '2020-06-15 08:40:50'),
(620, 'App\\Models\\User', 1, 'updated', 'App\\Models\\MarketingWay', 4, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"facebook\",\"name_ar\":\"\\u0641\\u064a\\u0633\\u0628\\u0648\\u0643\"}', 'http://localhost/crm/public/marketing_ways/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:41:11', '2020-06-15 08:41:11'),
(621, 'App\\Models\\User', 1, 'updated', 'App\\Models\\MarketingWay', 3, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"linkedin\",\"name_ar\":\"\\u0644\\u0646\\u0643\\u064a\\u062f \\u0627\\u0646\"}', 'http://localhost/crm/public/marketing_ways/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:41:29', '2020-06-15 08:41:29'),
(622, 'App\\Models\\User', 1, 'updated', 'App\\Models\\MarketingWay', 2, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"twitter\",\"name_ar\":\"\\u062a\\u0648\\u064a\\u062a\\u0631\"}', 'http://localhost/crm/public/marketing_ways/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:41:40', '2020-06-15 08:41:40'),
(623, 'App\\Models\\User', 1, 'updated', 'App\\Models\\MarketingWay', 1, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"google ads\",\"name_ar\":\"\\u0627\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u062c\\u0648\\u062c\\u0644\"}', 'http://localhost/crm/public/marketing_ways/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:42:00', '2020-06-15 08:42:00'),
(624, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\MarketingWay', 5, '{\"id\":5,\"name_en\":\"en\",\"name_ar\":\"ar\"}', '[]', 'http://localhost/crm/public/marketing_ways/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:42:06', '2020-06-15 08:42:06'),
(625, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Inventory', 3, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"inventory name\",\"name_ar\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u062e\\u0632\\u0646\"}', 'http://localhost/crm/public/inventories/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:49:16', '2020-06-15 08:49:16'),
(626, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Inventory', 2, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"english\",\"name_ar\":\"arabic\"}', 'http://localhost/crm/public/inventories/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 08:50:06', '2020-06-15 08:50:06'),
(627, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 9, '[]', '{\"parent_id\":null,\"name_ar\":\"arabic\",\"name_en\":\"english\",\"notes\":null,\"id\":9}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:28:01', '2020-06-15 09:28:01'),
(628, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 8, '{\"id\":8,\"parent_id\":7,\"notes\":\"dasd\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:43', '2020-06-15 09:38:43'),
(629, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 7, '{\"id\":7,\"parent_id\":1,\"notes\":\"asdasd\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:46', '2020-06-15 09:38:46'),
(630, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 6, '{\"id\":6,\"parent_id\":3,\"notes\":\"note 2\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:49', '2020-06-15 09:38:49'),
(631, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 5, '{\"id\":5,\"parent_id\":3,\"notes\":\"note 1\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:51', '2020-06-15 09:38:51'),
(632, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 3, '{\"id\":3,\"parent_id\":1,\"notes\":\"notes\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:56', '2020-06-15 09:38:56'),
(633, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 1, '{\"id\":1,\"parent_id\":null,\"notes\":null,\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/item_categories/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:38:58', '2020-06-15 09:38:58'),
(634, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Item', 5, '{\"category_id\":8}', '{\"category_id\":\"9\"}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:56:59', '2020-06-15 09:56:59'),
(635, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 38, '[]', '{\"variation_id\":1,\"item_id\":5,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":38}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:56:59', '2020-06-15 09:56:59'),
(636, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 39, '[]', '{\"variation_id\":2,\"item_id\":5,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":39}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:56:59', '2020-06-15 09:56:59'),
(637, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 40, '[]', '{\"variation_id\":3,\"item_id\":5,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":40}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:56:59', '2020-06-15 09:56:59'),
(638, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 41, '[]', '{\"variation_id\":4,\"item_id\":5,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":41}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:56:59', '2020-06-15 09:56:59'),
(639, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Item', 4, '{\"id\":4,\"category_id\":6,\"unit_price\":60,\"purchase_price\":30,\"sale_price\":60,\"notes\":null,\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/items/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:57:07', '2020-06-15 09:57:07'),
(640, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Item', 3, '{\"id\":3,\"category_id\":5,\"unit_price\":40,\"purchase_price\":40,\"sale_price\":40,\"notes\":null,\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/items/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:57:10', '2020-06-15 09:57:10'),
(641, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Item', 2, '{\"id\":2,\"category_id\":3,\"unit_price\":50,\"purchase_price\":50,\"sale_price\":55,\"notes\":\"note\",\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/items/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 09:57:13', '2020-06-15 09:57:13'),
(642, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Item', 5, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"english\",\"name_ar\":\"arabic\"}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:00:34', '2020-06-15 10:00:34'),
(643, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 42, '[]', '{\"variation_id\":1,\"item_id\":5,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":42}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:00:34', '2020-06-15 10:00:34'),
(644, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 43, '[]', '{\"variation_id\":2,\"item_id\":5,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":43}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:00:34', '2020-06-15 10:00:34'),
(645, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 44, '[]', '{\"variation_id\":3,\"item_id\":5,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":44}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:00:34', '2020-06-15 10:00:34'),
(646, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 45, '[]', '{\"variation_id\":4,\"item_id\":5,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":45}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:00:34', '2020-06-15 10:00:34'),
(647, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 46, '[]', '{\"variation_id\":1,\"item_id\":5,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":46}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:01:03', '2020-06-15 10:01:03'),
(648, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 47, '[]', '{\"variation_id\":2,\"item_id\":5,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":47}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:01:03', '2020-06-15 10:01:03'),
(649, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 48, '[]', '{\"variation_id\":3,\"item_id\":5,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":48}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:01:03', '2020-06-15 10:01:03'),
(650, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 49, '[]', '{\"variation_id\":4,\"item_id\":5,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"20\",\"id\":49}', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:01:03', '2020-06-15 10:01:03'),
(651, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadStatus', 4, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"new\",\"name_ar\":\"\\u062c\\u062f\\u064a\\u062f\\u0629\"}', 'http://localhost/crm/public/leads_statuses/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:08:51', '2020-06-15 10:08:51'),
(652, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadStatus', 3, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"finished\",\"name_ar\":\"\\u0645\\u0646\\u062a\\u0647\\u064a\\u0647\"}', 'http://localhost/crm/public/leads_statuses/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:09:12', '2020-06-15 10:09:12'),
(653, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ClientCategory', 3, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"english\",\"name_ar\":\"arabic\"}', 'http://localhost/crm/public/client_categories/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:22:39', '2020-06-15 10:22:39'),
(654, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ClientCategory', 2, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"category\",\"name_ar\":\"\\u062a\\u0635\\u0646\\u064a\\u0641\"}', 'http://localhost/crm/public/client_categories/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:23:07', '2020-06-15 10:23:07'),
(655, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ClientCategory', 1, '{\"id\":1,\"name_en\":\"\",\"name_ar\":\"\"}', '[]', 'http://localhost/crm/public/client_categories/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 10:23:13', '2020-06-15 10:23:13'),
(656, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 3, '[]', '{\"name_ar\":\"arabic\",\"name_en\":\"english\",\"id\":3}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:18:22', '2020-06-15 11:18:22'),
(657, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 4, '[]', '{\"name_ar\":\"arabic\",\"name_en\":\"english\",\"id\":4}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:18:52', '2020-06-15 11:18:52'),
(658, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 5, '[]', '{\"name_ar\":\"arabic\",\"name_en\":\"english\",\"id\":5}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:19:02', '2020-06-15 11:19:02'),
(659, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 6, '[]', '{\"name_ar\":\"arabic\",\"name_en\":\"english\",\"id\":6}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:19:07', '2020-06-15 11:19:07'),
(660, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 7, '[]', '{\"name_ar\":\"arabic\",\"name_en\":\"english\",\"id\":7}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:20:21', '2020-06-15 11:20:21'),
(661, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ConnectionWay', 7, '{\"name_ar\":\"arabic\",\"name_en\":\"english\"}', '{\"name_ar\":\"\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0647\\u0627\\u062a\\u0641\\u064a\",\"name_en\":\"phone call\"}', 'http://localhost/crm/public/connection_ways/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:06', '2020-06-15 11:24:06'),
(662, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 6, '{\"id\":6,\"name_ar\":\"arabic\",\"name_en\":\"english\"}', '[]', 'http://localhost/crm/public/connection_ways/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:12', '2020-06-15 11:24:12'),
(663, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 5, '{\"id\":5,\"name_ar\":\"arabic\",\"name_en\":\"english\"}', '[]', 'http://localhost/crm/public/connection_ways/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:15', '2020-06-15 11:24:15'),
(664, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 4, '{\"id\":4,\"name_ar\":\"arabic\",\"name_en\":\"english\"}', '[]', 'http://localhost/crm/public/connection_ways/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:18', '2020-06-15 11:24:18'),
(665, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 3, '{\"id\":3,\"name_ar\":\"arabic\",\"name_en\":\"english\"}', '[]', 'http://localhost/crm/public/connection_ways/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:21', '2020-06-15 11:24:21'),
(666, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 2, '{\"id\":2,\"name_ar\":\"\",\"name_en\":\"\"}', '[]', 'http://localhost/crm/public/connection_ways/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:24', '2020-06-15 11:24:24'),
(667, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 1, '{\"id\":1,\"name_ar\":\"\",\"name_en\":\"\"}', '[]', 'http://localhost/crm/public/connection_ways/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:24:27', '2020-06-15 11:24:27'),
(668, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 8, '[]', '{\"name_ar\":\"\\u0631\\u0633\\u0627\\u0644\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0648\\u0627\\u062a\\u0633\\u0627\\u0628\",\"name_en\":\"whatsapp message\",\"id\":8}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 11:26:03', '2020-06-15 11:26:03'),
(669, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadOperation', 113, '[]', '{\"lead_id\":\"5\",\"operation_date\":\"2020-06-15T00:00:00.000000Z\",\"operation_time\":\"2020-06-15T16:15:00.000000Z\",\"user_id\":\"1\",\"connection_way_id\":\"7\",\"connection_way_status\":\"4\",\"notes\":null,\"created_by\":1,\"id\":113}', 'http://localhost/crm/public/lead_operations', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:05:13', '2020-06-15 12:05:13');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(670, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadOperation', 113, '{\"operation_date\":\"2020-06-15\",\"operation_time\":\"16:15:00\"}', '{\"operation_date\":\"2020-06-15T00:00:00.000000Z\",\"operation_time\":\"2020-06-15T16:15:00.000000Z\"}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(671, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 113, '[]', '{\"action\":\"updated_Lead_operation\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":113}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(672, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 336, '[]', '{\"notification_id\":113,\"user_id\":2,\"seen\":0,\"id\":336}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(673, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 337, '[]', '{\"notification_id\":113,\"user_id\":1,\"seen\":0,\"id\":337}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(674, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadOperation', 113, '{\"operation_date\":\"2020-06-15\",\"operation_time\":\"16:15:00\",\"connection_way_status_id\":4}', '{\"operation_date\":\"2020-06-15T00:00:00.000000Z\",\"operation_time\":\"2020-06-15T16:15:00.000000Z\",\"connection_way_status_id\":\"5\"}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(675, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 114, '[]', '{\"action\":\"updated_Lead_operation\",\"model_id\":\"5\",\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":114}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(676, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 338, '[]', '{\"notification_id\":114,\"user_id\":2,\"seen\":0,\"id\":338}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(677, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 339, '[]', '{\"notification_id\":114,\"user_id\":1,\"seen\":0,\"id\":339}', 'http://localhost/crm/public/lead_operations/113', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(678, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadOperation', 114, '[]', '{\"lead_id\":\"5\",\"operation_date\":\"2020-06-15T00:00:00.000000Z\",\"operation_time\":\"2020-06-15T16:15:00.000000Z\",\"user_id\":\"1\",\"connection_way_id\":\"8\",\"connection_way_status_id\":\"7\",\"notes\":null,\"created_by\":1,\"id\":114}', 'http://localhost/crm/public/lead_operations', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:17:50', '2020-06-15 12:17:50'),
(679, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 35, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":null,\"id\":35}', 'http://localhost/crm/public/contact_list/13', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 12:58:20', '2020-06-15 12:58:20'),
(680, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 36, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":12,\"id\":36}', 'http://localhost/crm/public/contact_list/12', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:02:03', '2020-06-15 13:02:03'),
(681, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 37, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":12,\"id\":37}', 'http://localhost/crm/public/contact_list/12', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:02:13', '2020-06-15 13:02:13'),
(682, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 38, '[]', '{\"phone\":\"01115752554\",\"notes\":null,\"client_id\":4,\"id\":38}', 'http://localhost/crm/public/contact_list/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:02:21', '2020-06-15 13:02:21'),
(683, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 39, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":4,\"id\":39}', 'http://localhost/crm/public/contact_list/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:02:21', '2020-06-15 13:02:21'),
(684, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 40, '[]', '{\"phone\":\"+1 (849) 682-5151\",\"notes\":null,\"client_id\":4,\"id\":40}', 'http://localhost/crm/public/contact_list/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:02:21', '2020-06-15 13:02:21'),
(685, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Notification', 114, '{\"id\":114,\"basic_title\":null,\"basic_body\":null,\"model_type\":\"App\\\\Models\\\\Lead\",\"model_id\":5,\"action\":\"updated_Lead_operation\"}', '[]', 'http://localhost/crm/public/notfications/114', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:19:26', '2020-06-15 13:19:26'),
(686, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Department', 2, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"e\",\"name_ar\":\"\\u0639\\u0631\\u0628\\u064a\"}', 'http://localhost/crm/public/departments/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:37:40', '2020-06-15 13:37:40'),
(687, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Department', 1, '{\"name_en\":\"\",\"name_ar\":\"\"}', '{\"name_en\":\"mv\",\"name_ar\":\"mv\"}', 'http://localhost/crm/public/departments/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-15 13:37:59', '2020-06-15 13:37:59'),
(688, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Client', 4, '{\"email\":\"siwoko@mailinator.com\"}', '{\"email\":\"siwokoelshora.queen@mailinator.com\"}', 'http://localhost/crm/public/clients/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(689, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 41, '[]', '{\"phone\":\"01115752554\",\"notes\":null,\"client_id\":4,\"id\":41}', 'http://localhost/crm/public/clients/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(690, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 42, '[]', '{\"phone\":\"01001587086\",\"notes\":null,\"client_id\":4,\"id\":42}', 'http://localhost/crm/public/clients/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(691, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 43, '[]', '{\"phone\":\"+1 (849) 682-5151\",\"notes\":null,\"client_id\":4,\"id\":43}', 'http://localhost/crm/public/clients/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(692, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 108, '[]', '{\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0642\\u0627\\u062f\\u0631 \\u0632\\u0643\\u0631\\u064a\\u0627\",\"email\":\"abdulkader@gmail.com\",\"is_super_admin\":1,\"password\":\"$2y$10$v7JsqUYhCBWE2ua8M9ieVOZ6FpC0cxz8GAwmV9Td7mVn4HLsDmaZ6\",\"id\":108}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 07:56:27', '2020-06-16 07:56:27'),
(693, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 109, '[]', '{\"name\":\"users_manager@gmail.com\",\"email\":\"users_manager@gmail.com\",\"password\":\"$2y$10$csgrQ8ZdHJ43AiNjAkIbZezfp772JSP0v1Zek44XyCsLAeuZINcZm\",\"is_super_admin\":0,\"id\":109}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 08:55:06', '2020-06-16 08:55:06'),
(694, 'App\\Models\\User', 109, 'updated', 'App\\Models\\User', 109, '{\"remember_token\":null}', '{\"remember_token\":\"J1U369dBMZNR12hgsnHiJ3aONZdwxODFIkDlJfgvbhlHEbqZhcTercnMx3DD\"}', 'http://localhost/crm/public/login', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 08:56:10', '2020-06-16 08:56:10'),
(695, 'App\\Models\\User', 109, 'created', 'App\\Models\\Department', 4, '[]', '{\"name_ar\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0631\\u0627\\u0621\\u0629\",\"name_en\":\"reading section\",\"id\":4}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 08:59:47', '2020-06-16 08:59:47'),
(696, 'App\\Models\\User', 109, 'updated', 'App\\Models\\Department', 4, '{\"name_en\":\"reading section\",\"name_ar\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0631\\u0627\\u0621\\u0629\"}', '{\"name_en\":\"reading section 1\",\"name_ar\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0631\\u0627\\u0621\\u0629 1\"}', 'http://localhost/crm/public/departments/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 08:59:53', '2020-06-16 08:59:53'),
(697, 'App\\Models\\User', 109, 'updated', 'App\\Models\\User', 109, '{\"remember_token\":\"J1U369dBMZNR12hgsnHiJ3aONZdwxODFIkDlJfgvbhlHEbqZhcTercnMx3DD\"}', '{\"remember_token\":\"IbpfhlZPtw5XK074X2hnQZFsMfvfeSp41WTiNjJQQy8p1tmxZzApMu3gZljm\"}', 'http://localhost/crm/public/logout', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:06:18', '2020-06-16 10:06:18'),
(698, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Department', 4, '{\"id\":4,\"name_en\":\"reading section 1\",\"name_ar\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0631\\u0627\\u0621\\u0629 1\"}', '[]', 'http://localhost/crm/public/departments/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:06:35', '2020-06-16 10:06:35'),
(699, 'App\\Models\\User', 1, 'created', 'App\\Models\\Department', 5, '[]', '{\"name_ar\":\"\\u0641\\u062b\\u0633\\u0641\",\"name_en\":\"\\u0641\\u062b\\u0633\\u0641\",\"id\":5}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:30:54', '2020-06-16 10:30:54'),
(700, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Department', 5, '{\"id\":5,\"name_en\":\"\\u0641\\u062b\\u0633\\u0641\",\"name_ar\":\"\\u0641\\u062b\\u0633\\u0641\"}', '[]', 'http://localhost/crm/public/departments/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:30:58', '2020-06-16 10:30:58'),
(701, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 110, '[]', '{\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0642\\u0627\\u062f\\u0631 \\u0645\\u0632\\u0648\\u062f\",\"email\":\"it.abdulkader@gmail.com\",\"password\":\"$2y$10$kw1SxldB6C0YsdHH\\/H3vK.qikURznAjMZ8yo9dW3YRE3\\/h8hsz4xu\",\"is_super_admin\":0,\"id\":110}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:32:01', '2020-06-16 10:32:01'),
(702, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 110, '{\"id\":110,\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0642\\u0627\\u062f\\u0631 \\u0645\\u0632\\u0648\\u062f\",\"email\":\"it.abdulkader@gmail.com\",\"email_verified_at\":null,\"password\":\"$2y$10$kw1SxldB6C0YsdHH\\/H3vK.qikURznAjMZ8yo9dW3YRE3\\/h8hsz4xu\",\"api_token\":null,\"image\":null,\"remember_token\":null,\"is_super_admin\":0}', '[]', 'http://localhost/crm/public/users/110', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:32:08', '2020-06-16 10:32:08'),
(703, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 109, '{\"image\":null}', '{\"image\":\"\\/uploads\\/user\\/159231073487211.jpeg\"}', 'http://localhost/crm/public/users/109', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:32:14', '2020-06-16 10:32:14'),
(704, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 108, '{\"id\":108,\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0642\\u0627\\u062f\\u0631 \\u0632\\u0643\\u0631\\u064a\\u0627\",\"email\":\"abdulkader@gmail.com\",\"email_verified_at\":null,\"password\":\"$2y$10$v7JsqUYhCBWE2ua8M9ieVOZ6FpC0cxz8GAwmV9Td7mVn4HLsDmaZ6\",\"api_token\":null,\"image\":null,\"remember_token\":null,\"is_super_admin\":1}', '[]', 'http://localhost/crm/public/users/108', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:35:31', '2020-06-16 10:35:31'),
(705, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 14, '[]', '{\"name\":\"cairo\",\"email\":\"Abdulkadeaaaar@queentechsolutions.net\",\"category_id\":\"2\",\"marketing_way_id\":null,\"birth_date\":\"2020-06-29\",\"job\":\"1job\",\"address\":\"ahmad tayseer\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":\"test\",\"id\":14}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:37:38', '2020-06-16 10:37:38'),
(706, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 44, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":14,\"id\":44}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:37:38', '2020-06-16 10:37:38'),
(707, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 45, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":14,\"id\":45}', 'http://localhost/crm/public/clients/14', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:37:51', '2020-06-16 10:37:51'),
(708, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Client', 14, '{\"id\":14,\"marketing_way_id\":null,\"category_id\":2,\"name\":\"cairo\",\"email\":\"Abdulkadeaaaar@queentechsolutions.net\",\"user_name\":null,\"password\":null,\"job\":\"1job\",\"birth_date\":\"2020-06-29\",\"address\":\"ahmad tayseer\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":\"test\",\"balance\":0}', '[]', 'http://localhost/crm/public/clients/14', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:37:53', '2020-06-16 10:37:53'),
(709, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Client', 13, '{\"marketing_way_id\":null,\"category_id\":null,\"name\":\"name\",\"email\":\"name@name.com\"}', '{\"marketing_way_id\":\"1\",\"category_id\":\"2\",\"name\":\"324name\",\"email\":\"name@name.com2\"}', 'http://localhost/crm/public/clients/update_show/13', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:38:09', '2020-06-16 10:38:09'),
(710, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 46, '[]', '{\"phone\":\"324\",\"notes\":\"234\",\"client_id\":\"13\",\"id\":46}', 'http://localhost/crm/public/clients/update_phones', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:38:15', '2020-06-16 10:38:15'),
(711, 'App\\Models\\User', 1, 'created', 'App\\Models\\Lead', 6, '[]', '{\"client_id\":\"3\",\"lead_status_id\":\"3\",\"title\":\"test\",\"employee_id\":\"7\",\"details\":\"test\",\"created_by\":1,\"id\":6}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:38:44', '2020-06-16 10:38:44'),
(712, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 114, '[]', '{\"action\":\"new_Lead\",\"model_id\":6,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":114}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:38:44', '2020-06-16 10:38:44'),
(713, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 340, '[]', '{\"notification_id\":114,\"user_id\":\"7\",\"seen\":0,\"id\":340}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:38:44', '2020-06-16 10:38:44'),
(714, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 15, '[]', '{\"name\":\"test\",\"email\":\"Abdulkader@queentechsolutions.net\",\"category_id\":\"2\",\"marketing_way_id\":\"2\",\"birth_date\":\"2020-06-29\",\"job\":\"job\",\"address\":\"ahmad tayseer\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":\"test\",\"id\":15}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:39:08', '2020-06-16 10:39:08'),
(715, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 47, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":15,\"id\":47}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:39:08', '2020-06-16 10:39:08'),
(716, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 48, '[]', '{\"phone\":\"est\",\"notes\":null,\"client_id\":15,\"id\":48}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:39:08', '2020-06-16 10:39:08'),
(717, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 49, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":15,\"id\":49}', 'http://localhost/crm/public/clients/15', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:39:58', '2020-06-16 10:39:58'),
(718, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 50, '[]', '{\"phone\":\"est\",\"notes\":null,\"client_id\":15,\"id\":50}', 'http://localhost/crm/public/clients/15', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:39:58', '2020-06-16 10:39:58'),
(719, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 16, '[]', '{\"name\":\"cairo\",\"email\":\"Abdulkadera@queentechsolutions.net\",\"category_id\":null,\"marketing_way_id\":null,\"birth_date\":null,\"job\":null,\"address\":\"ahmad tayseer\",\"referred_by\":null,\"notes\":null,\"id\":16}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:41:03', '2020-06-16 10:41:03'),
(720, 'App\\Models\\User', 1, 'created', 'App\\Models\\Client', 17, '[]', '{\"name\":\"cairo\",\"email\":\"Abdulkader@quaaaaaaaeentechsolutions.net\",\"category_id\":\"2\",\"marketing_way_id\":\"1\",\"birth_date\":\"2020-06-03\",\"job\":\"1job\",\"address\":\"ahmad tayseer\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":null,\"id\":17}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:41:46', '2020-06-16 10:41:46'),
(721, 'App\\Models\\User', 1, 'created', 'App\\Models\\Lead', 7, '[]', '{\"client_id\":\"11\",\"lead_status_id\":\"3\",\"title\":\"test\",\"employee_id\":\"8\",\"details\":null,\"created_by\":1,\"id\":7}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(722, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 115, '[]', '{\"action\":\"new_Lead\",\"model_id\":7,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":115}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(723, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 341, '[]', '{\"notification_id\":115,\"user_id\":\"8\",\"seen\":0,\"id\":341}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(724, 'App\\Models\\User', 1, 'created', 'App\\Models\\Lead', 8, '[]', '{\"client_id\":\"11\",\"lead_status_id\":\"3\",\"title\":\"test\",\"employee_id\":\"8\",\"details\":null,\"created_by\":1,\"id\":8}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(725, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 116, '[]', '{\"action\":\"new_Lead\",\"model_id\":8,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":116}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(726, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 342, '[]', '{\"notification_id\":116,\"user_id\":\"8\",\"seen\":0,\"id\":342}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(727, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Lead', 8, '{\"lead_status_id\":3}', '{\"lead_status_id\":\"4\"}', 'http://localhost/crm/public/leads/changestatus/8/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:10', '2020-06-16 10:42:10'),
(728, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 117, '[]', '{\"action\":\"updated_Lead\",\"model_id\":8,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":117}', 'http://localhost/crm/public/leads/changestatus/8/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:10', '2020-06-16 10:42:10'),
(729, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 343, '[]', '{\"notification_id\":117,\"user_id\":8,\"seen\":0,\"id\":343}', 'http://localhost/crm/public/leads/changestatus/8/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:10', '2020-06-16 10:42:10'),
(730, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Lead', 8, '{\"id\":8,\"client_id\":11,\"lead_status_id\":4,\"title\":\"test\",\"details\":null,\"created_by\":1,\"employee_id\":8}', '[]', 'http://localhost/crm/public/leads/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:21', '2020-06-16 10:42:21'),
(731, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Lead', 7, '{\"client_id\":11,\"lead_status_id\":3,\"title\":\"test\",\"details\":null,\"employee_id\":8}', '{\"client_id\":\"10\",\"lead_status_id\":\"4\",\"title\":\"test111111\",\"details\":\"ttttttt\",\"employee_id\":\"4\"}', 'http://localhost/crm/public/leads/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(732, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 118, '[]', '{\"action\":\"updated_Lead\",\"model_id\":7,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":118}', 'http://localhost/crm/public/leads/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(733, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 344, '[]', '{\"notification_id\":118,\"user_id\":\"4\",\"seen\":0,\"id\":344}', 'http://localhost/crm/public/leads/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(734, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Lead', 7, '{\"id\":7,\"client_id\":10,\"lead_status_id\":4,\"title\":\"test111111\",\"details\":\"ttttttt\",\"created_by\":1,\"employee_id\":4}', '[]', 'http://localhost/crm/public/leads/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:04', '2020-06-16 10:43:04'),
(735, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Lead', 6, '{\"client_id\":3}', '{\"client_id\":\"2\"}', 'http://localhost/crm/public/leads/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:08', '2020-06-16 10:43:08'),
(736, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 119, '[]', '{\"action\":\"updated_Lead\",\"model_id\":6,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":119}', 'http://localhost/crm/public/leads/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:08', '2020-06-16 10:43:08'),
(737, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 345, '[]', '{\"notification_id\":119,\"user_id\":\"7\",\"seen\":0,\"id\":345}', 'http://localhost/crm/public/leads/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:08', '2020-06-16 10:43:08'),
(738, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ClientContact', 50, '{\"id\":50,\"client_id\":15,\"phone\":\"est\",\"notes\":null}', '[]', 'http://localhost/crm/public/contact_list/50', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:20', '2020-06-16 10:43:20'),
(739, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Client', 15, '{\"name\":\"test\",\"email\":\"Abdulkader@queentechsolutions.net\"}', '{\"name\":\"testasd\",\"email\":\"Abdulkader@queentechsolutions.netasd\"}', 'http://localhost/crm/public/contact_list/15', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:24', '2020-06-16 10:43:24'),
(740, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientContact', 51, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":15,\"id\":51}', 'http://localhost/crm/public/contact_list/15', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:24', '2020-06-16 10:43:24'),
(741, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessage', 6, '[]', '{\"message\":\"test\",\"id\":6}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:43', '2020-06-16 10:43:43'),
(742, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessagePhone', 4, '[]', '{\"sms_message_id\":6,\"client_id\":\"12\",\"phone\":\"01001587086\",\"id\":4}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:43', '2020-06-16 10:43:43'),
(743, 'App\\Models\\User', 1, 'created', 'App\\Models\\SmsMessagePhone', 5, '[]', '{\"sms_message_id\":6,\"client_id\":\"15\",\"phone\":\"+201159401701\",\"id\":5}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:43', '2020-06-16 10:43:43'),
(744, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\SmsMessage', 6, '{\"id\":6,\"message\":\"test\"}', '[]', 'http://localhost/crm/public/sms_messages/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:43:46', '2020-06-16 10:43:46'),
(745, 'App\\Models\\User', 1, 'created', 'App\\Models\\Inventory', 4, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"phone\":\"+201159401701\",\"address\":\"ahmad tayseer\",\"notes\":\"set\",\"id\":4}', 'http://localhost/crm/public/inventories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:05', '2020-06-16 10:44:05'),
(746, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Inventory', 4, '{\"name_ar\":\"test\"}', '{\"name_ar\":\"testttttttt\"}', 'http://localhost/crm/public/inventories/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:10', '2020-06-16 10:44:10'),
(747, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Inventory', 4, '{\"id\":4,\"phone\":\"+201159401701\",\"address\":\"ahmad tayseer\",\"notes\":\"set\",\"name_en\":\"test\",\"name_ar\":\"testttttttt\"}', '[]', 'http://localhost/crm/public/inventories/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:12', '2020-06-16 10:44:12'),
(748, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 10, '[]', '{\"parent_id\":\"9\",\"name_ar\":\"test\",\"name_en\":\"test\",\"notes\":\"test\",\"id\":10}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:38', '2020-06-16 10:44:38'),
(749, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 11, '[]', '{\"parent_id\":10,\"name_ar\":\"test\",\"name_en\":\"etst\",\"notes\":\"set\",\"id\":11}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:38', '2020-06-16 10:44:38'),
(750, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 11, '{\"id\":11,\"parent_id\":10,\"notes\":\"set\",\"name_en\":\"etst\",\"name_ar\":\"test\"}', '[]', 'http://localhost/crm/public/item_categories/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:41', '2020-06-16 10:44:41'),
(751, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ItemCategory', 10, '{\"parent_id\":9,\"notes\":\"test\",\"name_en\":\"test\",\"name_ar\":\"test\"}', '{\"parent_id\":\"10\",\"notes\":\"test222\",\"name_en\":\"test22\",\"name_ar\":\"test22\"}', 'http://localhost/crm/public/item_categories/10', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:44:53', '2020-06-16 10:44:53'),
(752, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 12, '[]', '{\"parent_id\":\"9\",\"name_ar\":\"test\",\"name_en\":\"test\",\"notes\":\"test\",\"id\":12}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:48:43', '2020-06-16 10:48:43'),
(753, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemCategory', 13, '[]', '{\"parent_id\":12,\"name_ar\":\"test\",\"name_en\":\"tes\",\"notes\":\"tset\",\"id\":13}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:48:43', '2020-06-16 10:48:43'),
(754, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ItemCategory', 13, '{\"notes\":\"tset\",\"name_en\":\"tes\",\"name_ar\":\"test\"}', '{\"notes\":\"tset1\",\"name_en\":\"1tes\",\"name_ar\":\"1test\"}', 'http://localhost/crm/public/item_categories/13', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:49:29', '2020-06-16 10:49:29'),
(755, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ItemCategory', 13, '{\"id\":13,\"parent_id\":12,\"notes\":\"tset1\",\"name_en\":\"1tes\",\"name_ar\":\"1test\"}', '[]', 'http://localhost/crm/public/item_categories/13', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:49:33', '2020-06-16 10:49:33'),
(756, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ItemCategory', 12, '{\"notes\":\"test\"}', '{\"notes\":\"test1\"}', 'http://localhost/crm/public/item_categories/12', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:49:38', '2020-06-16 10:49:38'),
(757, 'App\\Models\\User', 1, 'created', 'App\\Models\\Item', 6, '[]', '{\"category_id\":\"12\",\"name_ar\":\"test\",\"name_en\":\"test\",\"unit_price\":\"3\",\"purchase_price\":\"5\",\"sale_price\":\"4\",\"notes\":\"35\",\"id\":6}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:30', '2020-06-16 10:50:30'),
(758, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 50, '[]', '{\"variation_id\":1,\"item_id\":6,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":50}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:30', '2020-06-16 10:50:30'),
(759, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 51, '[]', '{\"variation_id\":2,\"item_id\":6,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":51}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:30', '2020-06-16 10:50:30'),
(760, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 52, '[]', '{\"variation_id\":3,\"item_id\":6,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":52}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:30', '2020-06-16 10:50:30'),
(761, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 53, '[]', '{\"variation_id\":4,\"item_id\":6,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":53}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:30', '2020-06-16 10:50:30'),
(762, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Item', 6, '{\"category_id\":12,\"name_en\":\"test\",\"name_ar\":\"test\"}', '{\"category_id\":\"9\",\"name_en\":\"test35\",\"name_ar\":\"test35\"}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:37', '2020-06-16 10:50:37'),
(763, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 54, '[]', '{\"variation_id\":1,\"item_id\":6,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":54}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:37', '2020-06-16 10:50:37'),
(764, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 55, '[]', '{\"variation_id\":2,\"item_id\":6,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":55}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:37', '2020-06-16 10:50:37'),
(765, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 56, '[]', '{\"variation_id\":3,\"item_id\":6,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":56}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:37', '2020-06-16 10:50:37'),
(766, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 57, '[]', '{\"variation_id\":4,\"item_id\":6,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":57}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:37', '2020-06-16 10:50:37'),
(767, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Item', 5, '{\"id\":5,\"category_id\":9,\"unit_price\":50,\"purchase_price\":70,\"sale_price\":55,\"notes\":null,\"name_en\":\"english\",\"name_ar\":\"arabic\"}', '[]', 'http://localhost/crm/public/items/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:50:40', '2020-06-16 10:50:40'),
(768, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 58, '[]', '{\"variation_id\":1,\"item_id\":6,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":58}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:11', '2020-06-16 10:51:11'),
(769, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 59, '[]', '{\"variation_id\":2,\"item_id\":6,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":59}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:11', '2020-06-16 10:51:11'),
(770, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 60, '[]', '{\"variation_id\":3,\"item_id\":6,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":60}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:11', '2020-06-16 10:51:11'),
(771, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 61, '[]', '{\"variation_id\":4,\"item_id\":6,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"35\",\"id\":61}', 'http://localhost/crm/public/items/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:11', '2020-06-16 10:51:11'),
(772, 'App\\Models\\User', 1, 'created', 'App\\Models\\Item', 7, '[]', '{\"category_id\":\"9\",\"name_ar\":\"test\",\"name_en\":\"test\",\"unit_price\":\"324\",\"purchase_price\":\"234\",\"sale_price\":\"234\",\"notes\":null,\"id\":7}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45'),
(773, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 62, '[]', '{\"variation_id\":3,\"item_id\":7,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":null,\"id\":62}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45'),
(774, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 63, '[]', '{\"variation_id\":4,\"item_id\":7,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":null,\"id\":63}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45'),
(775, 'App\\Models\\User', 1, 'updated', 'App\\Models\\MarketingWay', 4, '{\"name_ar\":\"\\u0641\\u064a\\u0633\\u0628\\u0648\\u0643\"}', '{\"name_ar\":\"\\u0641\\u064a\\u0633\\u0628\\u0648\\u06431\"}', 'http://localhost/crm/public/marketing_ways/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:24', '2020-06-16 10:52:24'),
(776, 'App\\Models\\User', 1, 'created', 'App\\Models\\MarketingWay', 5, '[]', '{\"name_ar\":\"1\",\"name_en\":\"1\",\"id\":5}', 'http://localhost/crm/public/marketing_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:29', '2020-06-16 10:52:29'),
(777, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\MarketingWay', 5, '{\"id\":5,\"name_en\":\"1\",\"name_ar\":\"1\"}', '[]', 'http://localhost/crm/public/marketing_ways/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:32', '2020-06-16 10:52:32'),
(778, 'App\\Models\\User', 1, 'created', 'App\\Models\\Campaign', 2, '[]', '{\"title\":\"test\",\"details\":\"test\",\"page_id\":\"1\",\"post_id\":\"2\",\"id\":2}', 'http://localhost/crm/public/campaigns', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:46', '2020-06-16 10:52:46'),
(779, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Campaign', 2, '{\"title\":\"test\",\"details\":\"test\"}', '{\"title\":\"1test\",\"details\":\"test1\"}', 'http://localhost/crm/public/campaigns/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:53', '2020-06-16 10:52:53'),
(780, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Campaign', 2, '{\"id\":2,\"title\":\"1test\",\"details\":\"test1\",\"page_id\":\"1\",\"post_id\":\"2\"}', '[]', 'http://localhost/crm/public/campaigns/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:52:57', '2020-06-16 10:52:57'),
(781, 'App\\Models\\User', 1, 'created', 'App\\Models\\Item', 8, '[]', '{\"category_id\":\"9\",\"name_ar\":\"111\",\"name_en\":\"11111\",\"unit_price\":\"1\",\"purchase_price\":\"1\",\"sale_price\":\"1\",\"notes\":null,\"id\":8}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:54:03', '2020-06-16 10:54:03'),
(782, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 64, '[]', '{\"variation_id\":3,\"item_id\":8,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"1\",\"id\":64}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:54:03', '2020-06-16 10:54:03'),
(783, 'App\\Models\\User', 1, 'created', 'App\\Models\\ItemVariation', 65, '[]', '{\"variation_id\":4,\"item_id\":8,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"1\",\"id\":65}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 10:54:03', '2020-06-16 10:54:03'),
(784, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoice', 6, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"234235\",\"purchase_invoice_number\":\"234235\",\"inventory_id\":\"2\",\"total\":\"9420\",\"final_total\":\"9420\",\"total_after_discount\":\"9420\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"9420\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":6}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(785, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 25, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":6,\"amount\":\"04\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":25}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(786, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 26, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":6,\"amount\":\"40\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":26}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(787, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 27, '[]', '{\"item_id\":\"8\",\"inventory_id\":\"2\",\"invoice_id\":6,\"amount\":\"40\",\"price\":\"1\",\"unit_price\":\"1\",\"sale_price\":\"1\",\"purchase_price\":\"1\",\"notes\":0,\"id\":27}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:03', '2020-06-16 11:02:03');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(788, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 5, '[]', '{\"inventory_id\":2,\"item_id\":6,\"amount\":4,\"unit_price\":3,\"purchase_price\":5,\"sale_price\":4,\"id\":5}', 'http://localhost/crm/public/purchase_invoices/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:10', '2020-06-16 11:02:10'),
(789, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 6, '[]', '{\"inventory_id\":2,\"item_id\":7,\"amount\":40,\"unit_price\":324,\"purchase_price\":234,\"sale_price\":234,\"id\":6}', 'http://localhost/crm/public/purchase_invoices/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:10', '2020-06-16 11:02:10'),
(790, 'App\\Models\\User', 1, 'created', 'App\\Models\\InventoryItem', 7, '[]', '{\"inventory_id\":2,\"item_id\":8,\"amount\":40,\"unit_price\":1,\"purchase_price\":1,\"sale_price\":1,\"id\":7}', 'http://localhost/crm/public/purchase_invoices/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:10', '2020-06-16 11:02:10'),
(791, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 6, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T13:02:10.638782Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:02:10', '2020-06-16 11:02:10'),
(792, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoice', 7, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"44444\",\"purchase_invoice_number\":\"44444\",\"inventory_id\":\"2\",\"total\":\"1196\",\"final_total\":\"1148.16\",\"total_after_discount\":\"1148.16\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"4\",\"total_taxes_amount\":0,\"paid_amount\":\"1148.16\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"created_by\":1,\"id\":7}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(793, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 28, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":7,\"amount\":\"4\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":\"1\",\"id\":28}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(794, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 29, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":7,\"amount\":\"5\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":\"2\",\"id\":29}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(795, 'App\\Models\\User', 1, 'created', 'App\\Models\\PurchaseInvoiceItem', 30, '[]', '{\"item_id\":\"8\",\"inventory_id\":\"2\",\"invoice_id\":7,\"amount\":\"6\",\"price\":\"1\",\"unit_price\":\"1\",\"sale_price\":\"1\",\"purchase_price\":\"1\",\"notes\":\"3\",\"id\":30}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(796, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 7, '{\"discount\":0}', '{\"discount\":47.84}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(797, 'App\\Models\\User', 1, 'updated', 'App\\Models\\PurchaseInvoice', 7, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T13:03:38.674716Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:03:38', '2020-06-16 11:03:38'),
(798, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-11 11:09:38\"}', '{\"confirmed_at\":\"2020-06-16T13:09:58.970632Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:09:58', '2020-06-16 11:09:58'),
(799, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\SalesInvoice', 3, '{\"id\":3,\"client_id\":2,\"code\":\"code\",\"sales_order_id\":null,\"inventory_id\":2,\"total\":30000,\"final_total\":30000,\"total_after_discount\":30000,\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":0,\"total_taxes_amount\":0,\"paid_amount\":30000,\"remaining_amount\":0,\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null,\"notes\":null}', '[]', 'http://localhost/crm/public/sales_invoices/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:11:25', '2020-06-16 11:11:25'),
(800, 'App\\Models\\User', 1, 'created', 'App\\Models\\Supplier', 6, '[]', '{\"name\":\"cairo\",\"email\":\"Abdulkader@queentechsolutions.net\",\"phone\":\"+201159401701\",\"initial_balance\":\"150\",\"address\":\"ahmad tayseer\",\"notes\":null,\"balance\":\"150\",\"id\":6}', 'http://localhost/crm/public/suppliers', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:12:26', '2020-06-16 11:12:26'),
(801, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Supplier', 6, '{\"id\":6,\"name\":\"cairo\",\"email\":\"Abdulkader@queentechsolutions.net\",\"address\":\"ahmad tayseer\",\"phone\":\"+201159401701\",\"notes\":null,\"initial_balance\":150,\"balance\":150}', '[]', 'http://localhost/crm/public/suppliers/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:12:56', '2020-06-16 11:12:56'),
(802, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\PurchaseInvoice', 5, '{\"id\":5,\"supplier_id\":1,\"code\":\"codeeeee\",\"purchase_invoice_number\":\"num\",\"inventory_id\":3,\"total\":550,\"final_total\":550,\"total_after_discount\":550,\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":0,\"total_taxes_amount\":0,\"paid_amount\":550,\"remaining_amount\":0,\"status\":\"new\",\"date\":\"2020-06-14\",\"confirmed_by\":null,\"confirmed_at\":null,\"notes\":null,\"created_by\":1}', '[]', 'http://localhost/crm/public/purchase_invoices/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:13:06', '2020-06-16 11:13:06'),
(803, 'App\\Models\\User', 1, 'created', 'App\\Models\\Payment', 6, '[]', '{\"supplier_id\":\"1\",\"date\":\"2011-10-11T00:00:00.000000Z\",\"amount\":\"343534\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":6}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:13:50', '2020-06-16 11:13:50'),
(804, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 6, '{\"supplier_id\":1,\"amount\":343534,\"date\":\"2011-10-11\"}', '{\"supplier_id\":\"4\",\"amount\":\"2\",\"date\":\"2011-10-11T00:00:00.000000Z\"}', 'http://localhost/crm/public/payments/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:14:35', '2020-06-16 11:14:35'),
(805, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 6, '{\"amount\":2,\"date\":\"2011-10-11\"}', '{\"amount\":\"22\",\"date\":\"2011-10-11T00:00:00.000000Z\"}', 'http://localhost/crm/public/payments/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:14:48', '2020-06-16 11:14:48'),
(806, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Payment', 6, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T13:14:56.228489Z\"}', 'http://localhost/crm/public/payments/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:14:56', '2020-06-16 11:14:56'),
(807, 'App\\Models\\User', 1, 'created', 'App\\Models\\LeadStatus', 5, '[]', '{\"name_ar\":\"213\",\"name_en\":\"234\",\"notes\":\"234\",\"id\":5}', 'http://localhost/crm/public/leads_statuses', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:15:28', '2020-06-16 11:15:28'),
(808, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadStatus', 5, '{\"notes\":\"234\",\"name_en\":\"234\",\"name_ar\":\"213\"}', '{\"notes\":\"234234\",\"name_en\":\"234234\",\"name_ar\":\"213234\"}', 'http://localhost/crm/public/leads_statuses/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:15:34', '2020-06-16 11:15:34'),
(809, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\LeadStatus', 5, '{\"id\":5,\"notes\":\"234234\",\"name_en\":\"234234\",\"name_ar\":\"213234\"}', '[]', 'http://localhost/crm/public/leads_statuses/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:15:39', '2020-06-16 11:15:39'),
(810, 'App\\Models\\User', 1, 'updated', 'App\\Models\\LeadStatus', 3, '{\"name_en\":\"finished\",\"name_ar\":\"\\u0645\\u0646\\u062a\\u0647\\u064a\\u0647\"}', '{\"name_en\":\"ESTfinished\",\"name_ar\":\"\\u0645\\u0646\\u062a\\u0647\\u064a\\u0647TE\"}', 'http://localhost/crm/public/leads_statuses/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:16:37', '2020-06-16 11:16:37'),
(811, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\LeadStatus', 3, '{\"id\":3,\"notes\":null,\"name_en\":\"ESTfinished\",\"name_ar\":\"\\u0645\\u0646\\u062a\\u0647\\u064a\\u0647TE\"}', '[]', 'http://localhost/crm/public/leads_statuses/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:16:40', '2020-06-16 11:16:40'),
(812, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ConnectionWay', 7, '{\"id\":7,\"name_ar\":\"\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0647\\u0627\\u062a\\u0641\\u064a\",\"name_en\":\"phone call\"}', '[]', 'http://localhost/crm/public/connection_ways/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:16:51', '2020-06-16 11:16:51'),
(813, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ConnectionWay', 8, '{\"name_ar\":\"\\u0631\\u0633\\u0627\\u0644\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0648\\u0627\\u062a\\u0633\\u0627\\u0628\"}', '{\"name_ar\":\"\\u0631\\u0633\\u0627\\u0644\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0648\\u0627\\u062a\\u0633\\u0627\\u0628TEST\"}', 'http://localhost/crm/public/connection_ways/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:16:54', '2020-06-16 11:16:54'),
(814, 'App\\Models\\User', 1, 'created', 'App\\Models\\ConnectionWay', 9, '[]', '{\"name_ar\":\"SET\",\"name_en\":\"SET\",\"id\":9}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:16:59', '2020-06-16 11:16:59'),
(815, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientCategory', 4, '[]', '{\"name_ar\":\"SET\",\"name_en\":\"SET\",\"id\":4}', 'http://localhost/crm/public/client_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:17:07', '2020-06-16 11:17:07'),
(816, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ClientCategory', 4, '{\"name_en\":\"SET\",\"name_ar\":\"SET\"}', '{\"name_en\":\"SETSET\",\"name_ar\":\"SETSET\"}', 'http://localhost/crm/public/client_categories/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:17:11', '2020-06-16 11:17:11'),
(817, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ClientCategory', 4, '{\"id\":4,\"name_en\":\"SETSET\",\"name_ar\":\"SETSET\"}', '[]', 'http://localhost/crm/public/client_categories/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:17:13', '2020-06-16 11:17:13'),
(818, 'App\\Models\\User', 1, 'updated', 'App\\Models\\ClientCategory', 2, '{\"name_en\":\"category\",\"name_ar\":\"\\u062a\\u0635\\u0646\\u064a\\u0641\"}', '{\"name_en\":\"category234\",\"name_ar\":\"\\u062a\\u0635\\u0646\\u064a\\u0641324\"}', 'http://localhost/crm/public/client_categories/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:18:50', '2020-06-16 11:18:50'),
(819, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\ClientCategory', 2, '{\"id\":2,\"name_en\":\"category234\",\"name_ar\":\"\\u062a\\u0635\\u0646\\u064a\\u0641324\"}', '[]', 'http://localhost/crm/public/client_categories/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:18:53', '2020-06-16 11:18:53'),
(820, 'App\\Models\\User', 1, 'created', 'App\\Models\\ClientCategory', 5, '[]', '{\"name_ar\":\"test\",\"name_en\":\"est\",\"id\":5}', 'http://localhost/crm/public/client_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:18:59', '2020-06-16 11:18:59'),
(821, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Notification', 119, '{\"id\":119,\"basic_title\":null,\"basic_body\":null,\"model_type\":\"App\\\\Models\\\\Lead\",\"model_id\":6,\"action\":\"updated_Lead\"}', '[]', 'http://localhost/crm/public/notfications/119', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:20', '2020-06-16 11:19:20'),
(822, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 120, '[]', '{\"action\":\"message\",\"basic_body\":\"set\",\"basic_title\":\"test\",\"model_type\":\"App\\\\Models\\\\Notification\",\"id\":120}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:26', '2020-06-16 11:19:26'),
(823, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 346, '[]', '{\"notification_id\":120,\"user_id\":\"10\",\"seen\":0,\"id\":346}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:26', '2020-06-16 11:19:26'),
(824, 'App\\Models\\User', 1, 'created', 'App\\Models\\Notification', 121, '[]', '{\"action\":\"message\",\"basic_body\":\"test\",\"basic_title\":\"test\",\"model_type\":\"App\\\\Models\\\\Notification\",\"id\":121}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(825, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 347, '[]', '{\"notification_id\":121,\"user_id\":\"7\",\"seen\":0,\"id\":347}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(826, 'App\\Models\\User', 1, 'created', 'App\\Models\\NotificationUser', 348, '[]', '{\"notification_id\":121,\"user_id\":\"9\",\"seen\":0,\"id\":348}', 'http://localhost/crm/public/notfications', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(827, 'App\\Models\\User', 109, 'deleted', 'App\\Models\\Department', 1, '{\"id\":1,\"name_en\":\"mv\",\"name_ar\":\"mv\"}', '[]', 'http://localhost/crm/public/departments/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:37:41', '2020-06-16 11:37:41'),
(828, 'App\\Models\\User', 109, 'created', 'App\\Models\\Department', 6, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"id\":6}', 'http://localhost/crm/public/departments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:40:27', '2020-06-16 11:40:27'),
(829, 'App\\Models\\User', 109, 'updated', 'App\\Models\\Department', 6, '{\"name_ar\":\"test\"}', '{\"name_ar\":\"324234\"}', 'http://localhost/crm/public/departments/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:40:32', '2020-06-16 11:40:32'),
(830, 'App\\Models\\User', 109, 'deleted', 'App\\Models\\Department', 6, '{\"id\":6,\"name_en\":\"test\",\"name_ar\":\"324234\"}', '[]', 'http://localhost/crm/public/departments/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:40:40', '2020-06-16 11:40:40'),
(831, 'App\\Models\\User', 109, 'created', 'App\\Models\\User', 111, '[]', '{\"name\":\"cairo1\",\"email\":\"i1111111t.abdulkader@gmail.com1111111\",\"image\":\"\\/uploads\\/user\\/159231487616619.png\",\"password\":\"$2y$10$3rxOc9QLmkuPVuyieB\\/duechhs2r\\/cQHktX0akb.U83FG.mD0qhOe\",\"is_super_admin\":0,\"id\":111}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:41:16', '2020-06-16 11:41:16'),
(832, 'App\\Models\\User', 109, 'deleted', 'App\\Models\\User', 111, '{\"id\":111,\"name\":\"cairo1\",\"email\":\"i1111111t.abdulkader@gmail.com1111111\",\"email_verified_at\":null,\"password\":\"$2y$10$3rxOc9QLmkuPVuyieB\\/duechhs2r\\/cQHktX0akb.U83FG.mD0qhOe\",\"api_token\":null,\"image\":\"\\/uploads\\/user\\/159231487616619.png\",\"remember_token\":null,\"is_super_admin\":0}', '[]', 'http://localhost/crm/public/users/111', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:41:36', '2020-06-16 11:41:36'),
(833, 'App\\Models\\User', 109, 'updated', 'App\\Models\\User', 109, '{\"remember_token\":\"IbpfhlZPtw5XK074X2hnQZFsMfvfeSp41WTiNjJQQy8p1tmxZzApMu3gZljm\"}', '{\"remember_token\":\"hSYCAi4oKdIpMgc3uWSUN92LkfNaTFJhezKZnVriaQ9RNrJDPRtVZpXD6rDl\"}', 'http://localhost/crm/public/logout', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 11:52:17', '2020-06-16 11:52:17'),
(834, 'App\\Models\\User', 109, 'updated', 'App\\Models\\User', 109, '{\"remember_token\":\"hSYCAi4oKdIpMgc3uWSUN92LkfNaTFJhezKZnVriaQ9RNrJDPRtVZpXD6rDl\"}', '{\"remember_token\":\"vGLL7TOGbiO3gFrOR3VdYc6x8uUV2EGABy50vx3tTiXbH2AGe696qI3cmswX\"}', 'http://localhost/crm/public/logout', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:25:19', '2020-06-16 12:25:19'),
(835, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 112, '[]', '{\"name\":\"client_manager\",\"email\":\"client_manager@gmail.com\",\"is_super_admin\":1,\"password\":\"$2y$10$WucbzVMJTuS6KcjsNrv6OOjKTvvMBCtmwdUzdGmW7TL8d3Ydgr8q6\",\"id\":112}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:26:00', '2020-06-16 12:26:00'),
(836, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 112, '{\"is_super_admin\":1}', '{\"is_super_admin\":0}', 'http://localhost/crm/public/users/112', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:26:59', '2020-06-16 12:26:59'),
(837, 'App\\Models\\User', 112, 'created', 'App\\Models\\Client', 18, '[]', '{\"name\":\"test1\",\"email\":\"test111@gmail.com\",\"category_id\":\"3\",\"marketing_way_id\":\"1\",\"birth_date\":\"2020-06-01\",\"job\":\"1job\",\"address\":\"asd\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":\"test\",\"id\":18}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:47:36', '2020-06-16 12:47:36'),
(838, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 52, '[]', '{\"phone\":\"+201159401701\",\"notes\":\"1\",\"client_id\":18,\"id\":52}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:47:36', '2020-06-16 12:47:36'),
(839, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 53, '[]', '{\"phone\":\"+201159401701\",\"notes\":\"2\",\"client_id\":18,\"id\":53}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:47:36', '2020-06-16 12:47:36'),
(840, 'App\\Models\\User', 112, 'updated', 'App\\Models\\Client', 18, '{\"name\":\"test1\"}', '{\"name\":\"test1tttttttttt\"}', 'http://localhost/crm/public/clients/18', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:48:10', '2020-06-16 12:48:10'),
(841, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 54, '[]', '{\"phone\":\"+201159401701\",\"notes\":\"1\",\"client_id\":18,\"id\":54}', 'http://localhost/crm/public/clients/18', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:48:10', '2020-06-16 12:48:10'),
(842, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 55, '[]', '{\"phone\":\"+201159401701\",\"notes\":\"2\",\"client_id\":18,\"id\":55}', 'http://localhost/crm/public/clients/18', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:48:10', '2020-06-16 12:48:10'),
(843, 'App\\Models\\User', 112, 'deleted', 'App\\Models\\Client', 18, '{\"id\":18,\"marketing_way_id\":1,\"category_id\":3,\"name\":\"test1tttttttttt\",\"email\":\"test111@gmail.com\",\"user_name\":null,\"password\":null,\"job\":\"1job\",\"birth_date\":\"2020-06-01\",\"address\":\"asd\",\"referred_by\":\"Eum ullam sed dolor\",\"notes\":\"test\",\"balance\":0}', '[]', 'http://localhost/crm/public/clients/18', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:48:30', '2020-06-16 12:48:30'),
(844, 'App\\Models\\User', 112, 'updated', 'App\\Models\\Client', 17, '{\"category_id\":2}', '{\"category_id\":null}', 'http://localhost/crm/public/clients/update_show/17', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 12:57:22', '2020-06-16 12:57:22'),
(845, 'App\\Models\\User', 112, 'created', 'App\\Models\\Client', 19, '[]', '{\"name\":\"test\",\"email\":\"Abdulkader3@queentechsolutions.net\",\"category_id\":null,\"marketing_way_id\":null,\"birth_date\":null,\"job\":null,\"address\":\"ahmad tayseer\",\"referred_by\":null,\"notes\":null,\"id\":19}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51'),
(846, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 56, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":19,\"id\":56}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51'),
(847, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 57, '[]', '{\"phone\":\"324234\",\"notes\":null,\"client_id\":19,\"id\":57}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51'),
(848, 'App\\Models\\User', 112, 'created', 'App\\Models\\Client', 20, '[]', '{\"name\":\"55555555\",\"email\":\"555@gmail.com\",\"category_id\":\"3\",\"marketing_way_id\":\"1\",\"birth_date\":\"2020-06-08\",\"job\":\"1job\",\"address\":\"ahmad tayseer\",\"referred_by\":null,\"notes\":null,\"id\":20}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:22:22', '2020-06-16 13:22:22'),
(849, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 58, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":20,\"id\":58}', 'http://localhost/crm/public/clients', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:22:22', '2020-06-16 13:22:22'),
(850, 'App\\Models\\User', 112, 'created', 'App\\Models\\Lead', 9, '[]', '{\"client_id\":\"20\",\"lead_status_id\":\"4\",\"title\":\"hello world\",\"employee_id\":\"1\",\"details\":\"test\",\"created_by\":112,\"id\":9}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:22:33', '2020-06-16 13:22:33'),
(851, 'App\\Models\\User', 112, 'created', 'App\\Models\\Notification', 122, '[]', '{\"action\":\"new_Lead\",\"model_id\":9,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":122}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:22:33', '2020-06-16 13:22:33'),
(852, 'App\\Models\\User', 112, 'created', 'App\\Models\\NotificationUser', 349, '[]', '{\"notification_id\":122,\"user_id\":\"1\",\"seen\":0,\"id\":349}', 'http://localhost/crm/public/leads', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:22:33', '2020-06-16 13:22:33'),
(853, 'App\\Models\\User', 112, 'updated', 'App\\Models\\Lead', 6, '{\"lead_status_id\":3}', '{\"lead_status_id\":\"4\"}', 'http://localhost/crm/public/leads/changestatus/6/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:26:14', '2020-06-16 13:26:14'),
(854, 'App\\Models\\User', 112, 'created', 'App\\Models\\Notification', 123, '[]', '{\"action\":\"updated_Lead\",\"model_id\":6,\"model_type\":\"App\\\\Models\\\\Lead\",\"id\":123}', 'http://localhost/crm/public/leads/changestatus/6/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:26:14', '2020-06-16 13:26:14'),
(855, 'App\\Models\\User', 112, 'created', 'App\\Models\\NotificationUser', 350, '[]', '{\"notification_id\":123,\"user_id\":7,\"seen\":0,\"id\":350}', 'http://localhost/crm/public/leads/changestatus/6/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:26:14', '2020-06-16 13:26:14'),
(856, 'App\\Models\\User', 112, 'deleted', 'App\\Models\\Lead', 5, '{\"id\":5,\"client_id\":4,\"lead_status_id\":3,\"title\":\"title\",\"details\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\",\"created_by\":1,\"employee_id\":2}', '[]', 'http://localhost/crm/public/leads/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:26:22', '2020-06-16 13:26:22'),
(857, 'App\\Models\\User', 112, 'created', 'App\\Models\\Client', 21, '[]', '{\"name\":\"test\",\"email\":\"33Abdulkader@queentechsolutions.net\",\"id\":21}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:31:53', '2020-06-16 13:31:53'),
(858, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 59, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":21,\"id\":59}', 'http://localhost/crm/public/contact_list', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:31:53', '2020-06-16 13:31:53'),
(859, 'App\\Models\\User', 112, 'updated', 'App\\Models\\Client', 21, '{\"email\":\"33Abdulkader@queentechsolutions.net\"}', '{\"email\":\"2222222@queentechsolutions.net\"}', 'http://localhost/crm/public/contact_list/21', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:32:02', '2020-06-16 13:32:02'),
(860, 'App\\Models\\User', 112, 'created', 'App\\Models\\ClientContact', 60, '[]', '{\"phone\":\"+201159401701\",\"notes\":null,\"client_id\":21,\"id\":60}', 'http://localhost/crm/public/contact_list/21', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:32:02', '2020-06-16 13:32:02'),
(861, 'App\\Models\\User', 112, 'deleted', 'App\\Models\\ClientContact', 60, '{\"id\":60,\"client_id\":21,\"phone\":\"+201159401701\",\"notes\":null}', '[]', 'http://localhost/crm/public/contact_list/60', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:32:14', '2020-06-16 13:32:14'),
(862, 'App\\Models\\User', 112, 'created', 'App\\Models\\SmsMessage', 7, '[]', '{\"message\":\"test\",\"id\":7}', 'http://localhost/crm/public/sms_messages', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:41:20', '2020-06-16 13:41:20'),
(863, 'App\\Models\\User', 112, 'deleted', 'App\\Models\\SmsMessage', 7, '{\"id\":7,\"message\":\"test\"}', '[]', 'http://localhost/crm/public/sms_messages/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:41:24', '2020-06-16 13:41:24'),
(864, 'App\\Models\\User', 109, 'updated', 'App\\Models\\User', 109, '{\"remember_token\":\"vGLL7TOGbiO3gFrOR3VdYc6x8uUV2EGABy50vx3tTiXbH2AGe696qI3cmswX\"}', '{\"remember_token\":\"K70xRklMYes0Rq2L2p1RvipLTvEkyv54mutttAws6PIrKMYGlbQWAK95Pmdw\"}', 'http://localhost/crm/public/logout', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:54:02', '2020-06-16 13:54:02'),
(865, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 113, '[]', '{\"name\":\"store\",\"email\":\"stores_manager@gmail.com\",\"password\":\"$2y$10$yq7Bl2g\\/Fx3PxepGaRb47.rZ8LhsXMZ8iJbI8pJvcFhAmOiPxTMEW\",\"is_super_admin\":0,\"id\":113}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 13:54:52', '2020-06-16 13:54:52'),
(866, 'App\\Models\\User', 113, 'created', 'App\\Models\\Inventory', 5, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"phone\":\"3234235324234\",\"address\":\"test\",\"notes\":\"tset\",\"id\":5}', 'http://localhost/crm/public/inventories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:04:06', '2020-06-16 14:04:06'),
(867, 'App\\Models\\User', 113, 'updated', 'App\\Models\\Inventory', 5, '{\"name_ar\":\"test\"}', '{\"name_ar\":\"11111test\"}', 'http://localhost/crm/public/inventories/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:04:11', '2020-06-16 14:04:11'),
(868, 'App\\Models\\User', 113, 'deleted', 'App\\Models\\Inventory', 5, '{\"id\":5,\"phone\":\"3234235324234\",\"address\":\"test\",\"notes\":\"tset\",\"name_en\":\"test\",\"name_ar\":\"11111test\"}', '[]', 'http://localhost/crm/public/inventories/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:04:15', '2020-06-16 14:04:15'),
(869, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemCategory', 14, '[]', '{\"parent_id\":\"9\",\"name_ar\":\"1111\",\"name_en\":\"22222\",\"notes\":\"33333\",\"id\":14}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:06:24', '2020-06-16 14:06:24'),
(870, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemCategory', 15, '[]', '{\"parent_id\":14,\"name_ar\":\"444\",\"name_en\":\"445\",\"notes\":\"66\",\"id\":15}', 'http://localhost/crm/public/item_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:06:24', '2020-06-16 14:06:24'),
(871, 'App\\Models\\User', 113, 'deleted', 'App\\Models\\ItemCategory', 15, '{\"id\":15,\"parent_id\":14,\"notes\":\"66\",\"name_en\":\"445\",\"name_ar\":\"444\"}', '[]', 'http://localhost/crm/public/item_categories/15', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:06:33', '2020-06-16 14:06:33'),
(872, 'App\\Models\\User', 113, 'created', 'App\\Models\\Item', 9, '[]', '{\"category_id\":\"14\",\"name_ar\":\"32423\",\"name_en\":\"423423\",\"unit_price\":\"3\",\"purchase_price\":\"4\",\"sale_price\":\"2\",\"notes\":\"234\",\"id\":9}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:33', '2020-06-16 14:09:33'),
(873, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 66, '[]', '{\"variation_id\":1,\"item_id\":9,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":66}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:33', '2020-06-16 14:09:33'),
(874, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 67, '[]', '{\"variation_id\":2,\"item_id\":9,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":67}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:33', '2020-06-16 14:09:33'),
(875, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 68, '[]', '{\"variation_id\":3,\"item_id\":9,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"234\",\"id\":68}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:33', '2020-06-16 14:09:33'),
(876, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 69, '[]', '{\"variation_id\":4,\"item_id\":9,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"234\",\"id\":69}', 'http://localhost/crm/public/items', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:33', '2020-06-16 14:09:33'),
(877, 'App\\Models\\User', 113, 'updated', 'App\\Models\\Item', 9, '{\"category_id\":14,\"name_en\":\"423423\",\"name_ar\":\"32423\"}', '{\"category_id\":\"9\",\"name_en\":\"4234232222222222\",\"name_ar\":\"32423222222\"}', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(878, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 70, '[]', '{\"variation_id\":1,\"item_id\":9,\"label\":\"for_sale\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"sale\",\"id\":70}', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(879, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 71, '[]', '{\"variation_id\":2,\"item_id\":9,\"label\":\"for_rent\",\"name\":\"item_status\",\"type\":\"checkbox\",\"options\":\"class=\\\"form-check\\\" \",\"value\":\"rent\",\"id\":71}', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(880, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 72, '[]', '{\"variation_id\":3,\"item_id\":9,\"label\":\"width\",\"name\":\"width\",\"type\":\"number\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"234\",\"id\":72}', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(881, 'App\\Models\\User', 113, 'created', 'App\\Models\\ItemVariation', 73, '[]', '{\"variation_id\":4,\"item_id\":9,\"label\":\"height\",\"name\":\"height\",\"type\":\"text\",\"options\":\"class=\\\"form-control\\\" \",\"value\":\"234\",\"id\":73}', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(882, 'App\\Models\\User', 113, 'deleted', 'App\\Models\\Item', 9, '{\"id\":9,\"category_id\":9,\"unit_price\":3,\"purchase_price\":4,\"sale_price\":2,\"notes\":\"234\",\"name_en\":\"4234232222222222\",\"name_ar\":\"32423222222\"}', '[]', 'http://localhost/crm/public/items/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:09:48', '2020-06-16 14:09:48'),
(883, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 114, '[]', '{\"name\":\"marketing_user\",\"email\":\"marketing_user@gmail.com\",\"image\":\"\\/uploads\\/user\\/159232400737616.jpeg\",\"password\":\"$2y$10$QOQLKoHeFFJeXnO8otAIEul389n4DM4vxwzpyGW3WY4IP4.HFrb\\/q\",\"is_super_admin\":0,\"id\":114}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:13:27', '2020-06-16 14:13:27'),
(884, 'App\\Models\\User', 114, 'created', 'App\\Models\\MarketingWay', 6, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"id\":6}', 'http://localhost/crm/public/marketing_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:18:03', '2020-06-16 14:18:03'),
(885, 'App\\Models\\User', 114, 'updated', 'App\\Models\\MarketingWay', 6, '{\"name_ar\":\"test\"}', '{\"name_ar\":\"test11\"}', 'http://localhost/crm/public/marketing_ways/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:18:30', '2020-06-16 14:18:30'),
(886, 'App\\Models\\User', 114, 'deleted', 'App\\Models\\MarketingWay', 6, '{\"id\":6,\"name_en\":\"test\",\"name_ar\":\"test11\"}', '[]', 'http://localhost/crm/public/marketing_ways/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:18:33', '2020-06-16 14:18:33'),
(887, 'App\\Models\\User', 114, 'created', 'App\\Models\\Campaign', 3, '[]', '{\"title\":\"aaa\",\"details\":\"aaaaa\",\"page_id\":\"1\",\"post_id\":\"2\",\"id\":3}', 'http://localhost/crm/public/campaigns', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:19:52', '2020-06-16 14:19:52'),
(888, 'App\\Models\\User', 114, 'updated', 'App\\Models\\Campaign', 3, '{\"title\":\"aaa\",\"details\":\"aaaaa\",\"page_id\":\"1\",\"post_id\":\"2\"}', '{\"title\":\"aaa2\",\"details\":\"aaaaa222\",\"page_id\":\"12\",\"post_id\":\"2222222\"}', 'http://localhost/crm/public/campaigns/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:19:59', '2020-06-16 14:19:59'),
(889, 'App\\Models\\User', 114, 'deleted', 'App\\Models\\Campaign', 3, '{\"id\":3,\"title\":\"aaa2\",\"details\":\"aaaaa222\",\"page_id\":\"12\",\"post_id\":\"2222222\"}', '[]', 'http://localhost/crm/public/campaigns/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:20:04', '2020-06-16 14:20:04'),
(890, 'App\\Models\\User', 114, 'created', 'App\\Models\\Campaign', 4, '[]', '{\"title\":\"test\",\"details\":\"test\",\"page_id\":\"1\",\"post_id\":\"2\",\"id\":4}', 'http://localhost/crm/public/campaigns', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:20:47', '2020-06-16 14:20:47'),
(891, 'App\\Models\\User', 114, 'deleted', 'App\\Models\\Campaign', 4, '{\"id\":4,\"title\":\"test\",\"details\":\"test\",\"page_id\":\"1\",\"post_id\":\"2\"}', '[]', 'http://localhost/crm/public/campaigns/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:20:51', '2020-06-16 14:20:51'),
(892, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 115, '[]', '{\"name\":\"sales_manager\",\"email\":\"sales_manager@gmail.com\",\"image\":\"\\/uploads\\/user\\/159232502744814.\",\"password\":\"$2y$10$XONPqVD55vW.a5NFcNaW3OVnfS3ZxrZohdP6SdgDa4fvIKqjUBvvG\",\"is_super_admin\":0,\"id\":115}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:30:27', '2020-06-16 14:30:27'),
(893, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"email\":\"admin@admin.com\"}', '{\"email\":\"admin1@admin.com\"}', 'http://localhost/crm/public/users/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:30:57', '2020-06-16 14:30:57'),
(894, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"email\":\"admin1@admin.com\",\"image\":\"\\/uploads\\/admins\\/159178812999449.jpg\"}', '{\"email\":\"admin2@admin.com\",\"image\":\"\\/uploads\\/user\\/159232508073216.\"}', 'http://localhost/crm/public/users/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:31:20', '2020-06-16 14:31:20'),
(895, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrder', 2, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"2\",\"code\":\"ttttttt\",\"inventory_id\":\"2\",\"total\":\"961\",\"final_total\":\"961\",\"total_after_discount\":\"961\",\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"status\":\"new\",\"notes\":\"4\",\"created_by\":115,\"id\":2}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:41:10', '2020-06-16 14:41:10'),
(896, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 2, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"04\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":2}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:41:10', '2020-06-16 14:41:10'),
(897, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 3, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"05\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":3}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:41:10', '2020-06-16 14:41:10'),
(898, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesOrder', 2, '{\"code\":\"ttttttt\",\"date\":\"2020-06-16\"}', '{\"code\":\"ttttttta\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/sales_order/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:43:20', '2020-06-16 14:43:20'),
(899, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 4, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"4\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":4}', 'http://localhost/crm/public/sales_order/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:43:20', '2020-06-16 14:43:20'),
(900, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 5, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":2,\"amount\":\"5\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":5}', 'http://localhost/crm/public/sales_order/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:43:20', '2020-06-16 14:43:20'),
(901, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrder', 3, '[]', '{\"date\":\"2020-06-15T00:00:00.000000Z\",\"client_id\":\"3\",\"code\":\"test\",\"inventory_id\":\"2\",\"total\":\"702\",\"final_total\":\"702\",\"total_after_discount\":\"702\",\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"status\":\"new\",\"notes\":null,\"created_by\":115,\"id\":3}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:43:51', '2020-06-16 14:43:51'),
(902, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 6, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":3,\"amount\":\"03\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":6}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:43:51', '2020-06-16 14:43:51');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(903, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\SalesOrder', 3, '{\"id\":3,\"client_id\":3,\"code\":\"test\",\"date\":\"2020-06-15\",\"inventory_id\":2,\"total\":702,\"final_total\":702,\"total_after_discount\":702,\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":0,\"total_taxes_amount\":0,\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null,\"notes\":null,\"created_by\":115}', '[]', 'http://localhost/crm/public/sales_order/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:45:19', '2020-06-16 14:45:19'),
(904, 'App\\Models\\User', 115, 'deleted', 'App\\Models\\SalesOrder', 2, '{\"id\":2,\"client_id\":2,\"code\":\"ttttttta\",\"date\":\"2020-06-16\",\"inventory_id\":2,\"total\":961,\"final_total\":961,\"total_after_discount\":961,\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":0,\"total_taxes_amount\":0,\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null,\"notes\":\"4\",\"created_by\":115}', '[]', 'http://localhost/crm/public/sales_order/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:45:53', '2020-06-16 14:45:53'),
(905, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16 13:09:58\"}', '{\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T16:45:56.360996Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:45:56', '2020-06-16 14:45:56'),
(906, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesOrder', 1, '{\"confirmed_at\":\"2020-06-16 16:45:56\"}', '{\"confirmed_at\":\"2020-06-16T16:46:12.157160Z\"}', 'http://localhost/crm/public/sales_order/confirem/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:46:12', '2020-06-16 14:46:12'),
(907, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrder', 4, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"5\",\"code\":\"aaaaaa\",\"inventory_id\":\"2\",\"total\":\"936\",\"final_total\":\"936\",\"total_after_discount\":\"936\",\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"status\":\"new\",\"notes\":null,\"created_by\":115,\"id\":4}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:48:45', '2020-06-16 14:48:45'),
(908, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 7, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":4,\"amount\":\"04\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":7}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:48:45', '2020-06-16 14:48:45'),
(909, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesOrder', 4, '{\"confirmed_by\":null,\"confirmed_at\":null}', '{\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T16:48:48.548131Z\"}', 'http://localhost/crm/public/sales_order/confirem/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:48:48', '2020-06-16 14:48:48'),
(910, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoice', 4, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"1\",\"code\":\"aaaaaa\",\"inventory_id\":\"2\",\"total\":\"12\",\"final_total\":\"22.6\",\"total_after_discount\":\"12\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"22.6\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":4}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:53:56', '2020-06-16 14:53:56'),
(911, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 12, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":4,\"amount\":\"3\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":12}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:53:56', '2020-06-16 14:53:56'),
(912, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesInvoice', 4, '{\"code\":\"aaaaaa\",\"date\":\"2020-06-16\"}', '{\"code\":\"ssss\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/sales_invoices/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:55:51', '2020-06-16 14:55:51'),
(913, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 13, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":4,\"amount\":\"3\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":13}', 'http://localhost/crm/public/sales_invoices/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:55:51', '2020-06-16 14:55:51'),
(914, 'App\\Models\\User', 115, 'deleted', 'App\\Models\\SalesInvoice', 4, '{\"id\":4,\"client_id\":1,\"code\":\"ssss\",\"sales_order_id\":null,\"inventory_id\":2,\"total\":12,\"final_total\":22.6,\"total_after_discount\":12,\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":0,\"total_taxes_amount\":0,\"paid_amount\":22.6,\"remaining_amount\":0,\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null,\"notes\":null,\"date\":\"2020-06-16\"}', '[]', 'http://localhost/crm/public/sales_invoices/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:55:55', '2020-06-16 14:55:55'),
(915, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoice', 5, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"2\",\"code\":\"11\",\"inventory_id\":\"2\",\"total\":\"129\",\"final_total\":\"129\",\"total_after_discount\":\"129\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"129\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":5}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:56:40', '2020-06-16 14:56:40'),
(916, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 14, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":5,\"amount\":\"03\",\"price\":\"43\",\"unit_price\":\"3\",\"sale_price\":\"43\",\"purchase_price\":\"5\",\"notes\":0,\"id\":14}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:56:40', '2020-06-16 14:56:40'),
(917, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesInvoice', 5, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T16:56:43.045226Z\"}', 'http://localhost/crm/public/sales_invoices/approve/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:56:43', '2020-06-16 14:56:43'),
(918, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrder', 5, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"8\",\"code\":\"1111111111111111\",\"inventory_id\":\"2\",\"total\":\"480\",\"final_total\":\"480\",\"total_after_discount\":\"480\",\"discount\":0,\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"status\":\"new\",\"notes\":null,\"created_by\":115,\"id\":5}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(919, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 8, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":5,\"amount\":\"02\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"43\",\"purchase_price\":\"5\",\"notes\":0,\"id\":8}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(920, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 9, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":5,\"amount\":\"02\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":9}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(921, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesOrderItem', 10, '[]', '{\"item_id\":\"8\",\"inventory_id\":\"2\",\"invoice_id\":5,\"amount\":\"02\",\"price\":\"1\",\"unit_price\":\"1\",\"sale_price\":\"1\",\"purchase_price\":\"1\",\"notes\":0,\"id\":10}', 'http://localhost/crm/public/sales_order', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(922, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoice', 6, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"5\",\"code\":\"TEST123\",\"inventory_id\":\"2\",\"total\":\"150\",\"final_total\":\"150\",\"total_after_discount\":\"150\",\"discount\":0,\"payment_type\":\"cash\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"150\",\"remaining_amount\":\"0\",\"status\":\"new\",\"notes\":null,\"id\":6}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:01:21', '2020-06-16 15:01:21'),
(923, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 15, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":6,\"amount\":\"30\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":15}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:01:21', '2020-06-16 15:01:21'),
(924, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 16, '[]', '{\"item_id\":\"8\",\"inventory_id\":\"2\",\"invoice_id\":6,\"amount\":\"30\",\"price\":\"1\",\"unit_price\":\"1\",\"sale_price\":\"1\",\"purchase_price\":\"1\",\"notes\":0,\"id\":16}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:01:21', '2020-06-16 15:01:21'),
(935, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoice', 10, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"9\",\"code\":\"34234\",\"inventory_id\":\"2\",\"total\":\"1170\",\"final_total\":\"1170\",\"total_after_discount\":\"1170\",\"discount\":0,\"payment_type\":\"post_paid\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"123\",\"remaining_amount\":\"1047\",\"status\":\"new\",\"notes\":null,\"id\":10}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(936, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 23, '[]', '{\"item_id\":\"7\",\"inventory_id\":\"2\",\"invoice_id\":10,\"amount\":\"05\",\"price\":\"234\",\"unit_price\":\"324\",\"sale_price\":\"234\",\"purchase_price\":\"234\",\"notes\":0,\"id\":23}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(937, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 1, '[]', '{\"client_id\":\"9\",\"invoice_id\":10,\"amount\":\"012\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":1}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(938, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 2, '[]', '{\"client_id\":\"9\",\"invoice_id\":10,\"amount\":\"0444\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":2}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(939, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 3, '[]', '{\"client_id\":\"9\",\"invoice_id\":10,\"amount\":\"0555\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":3}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(940, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 4, '[]', '{\"client_id\":\"9\",\"invoice_id\":10,\"amount\":\"36\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":4}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(941, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesInvoice', 10, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T17:24:11.100207Z\"}', 'http://localhost/crm/public/sales_invoices/approve/10', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:24:11', '2020-06-16 15:24:11'),
(942, 'App\\Models\\User', 115, 'created', 'App\\Models\\Collection', 1, '[]', '{\"client_id\":\"9\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"100000\",\"notes\":null,\"created_by\":115,\"status\":\"open\",\"id\":1}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:24:21', '2020-06-16 15:24:21'),
(943, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Collection', 1, '{\"date\":\"2020-06-16\"}', '{\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/collection/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:31:34', '2020-06-16 15:31:34'),
(944, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Collection', 1, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T17:31:36.864629Z\"}', 'http://localhost/crm/public/collection/approve/1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:31:36', '2020-06-16 15:31:36'),
(945, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoice', 11, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"9\",\"code\":\"test\",\"inventory_id\":\"2\",\"total\":\"176\",\"final_total\":\"176\",\"total_after_discount\":\"176\",\"discount\":0,\"payment_type\":\"post_paid\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"44\",\"remaining_amount\":\"132\",\"status\":\"new\",\"notes\":null,\"id\":11}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:32:37', '2020-06-16 15:32:37'),
(946, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 24, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":11,\"amount\":\"044\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":24}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:32:37', '2020-06-16 15:32:37'),
(947, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 5, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"044\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":5}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:32:37', '2020-06-16 15:32:37'),
(948, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 6, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"88\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":6}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:32:37', '2020-06-16 15:32:37'),
(949, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 11, '{\"total\":176,\"final_total\":176,\"total_after_discount\":176,\"paid_amount\":44,\"remaining_amount\":132,\"date\":\"2020-06-16\"}', '{\"total\":\"48\",\"final_total\":\"48\",\"total_after_discount\":\"48\",\"paid_amount\":\"33\",\"remaining_amount\":\"15\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:27', '2020-06-16 15:33:27'),
(950, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 25, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":11,\"amount\":\"12\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":25}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:27', '2020-06-16 15:33:27'),
(951, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 7, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"01\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":7}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:27', '2020-06-16 15:33:27'),
(952, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 8, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"14\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":8}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:27', '2020-06-16 15:33:27'),
(953, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 11, '{\"total\":48,\"final_total\":48,\"total_after_discount\":48,\"paid_amount\":33,\"remaining_amount\":15,\"date\":\"2020-06-16\"}', '{\"total\":\"4\",\"final_total\":\"4\",\"total_after_discount\":\"4\",\"paid_amount\":\"1\",\"remaining_amount\":\"3\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:58', '2020-06-16 15:33:58'),
(954, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceItem', 26, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":11,\"amount\":\"1\",\"price\":\"4\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":26}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:58', '2020-06-16 15:33:58'),
(955, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 9, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"02\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":9}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:58', '2020-06-16 15:33:58'),
(956, 'App\\Models\\User', 1, 'created', 'App\\Models\\SalesInvoiceInstallment', 10, '[]', '{\"client_id\":\"9\",\"invoice_id\":11,\"amount\":\"1\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":10}', 'http://localhost/crm/public/sales_invoices/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:33:58', '2020-06-16 15:33:58'),
(957, 'App\\Models\\User', 1, 'updated', 'App\\Models\\SalesInvoice', 11, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T17:34:01.990739Z\"}', 'http://localhost/crm/public/sales_invoices/approve/11', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:01', '2020-06-16 15:34:01'),
(958, 'App\\Models\\User', 1, 'created', 'App\\Models\\Collection', 2, '[]', '{\"client_id\":\"9\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"33\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":2}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:14', '2020-06-16 15:34:14'),
(959, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Collection', 2, '{\"id\":2,\"client_id\":9,\"invoice_id\":null,\"amount\":33,\"date\":\"2020-06-16\",\"notes\":null,\"status\":\"open\",\"created_by\":1,\"confirmed_by\":null,\"confirmed_at\":null}', '[]', 'http://localhost/crm/public/collection/2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:22', '2020-06-16 15:34:22'),
(960, 'App\\Models\\User', 1, 'created', 'App\\Models\\Collection', 3, '[]', '{\"client_id\":\"9\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"1\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":3}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:33', '2020-06-16 15:34:33'),
(961, 'App\\Models\\User', 1, 'created', 'App\\Models\\Collection', 4, '[]', '{\"client_id\":\"9\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"2\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":4}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:41', '2020-06-16 15:34:41'),
(962, 'App\\Models\\User', 1, 'created', 'App\\Models\\Collection', 5, '[]', '{\"client_id\":\"9\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"44\",\"notes\":null,\"created_by\":1,\"status\":\"open\",\"id\":5}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:51', '2020-06-16 15:34:51'),
(963, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Collection', 5, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T17:34:53.776128Z\"}', 'http://localhost/crm/public/collection/approve/5', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:53', '2020-06-16 15:34:53'),
(964, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Collection', 4, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T17:34:55.342161Z\"}', 'http://localhost/crm/public/collection/approve/4', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:34:55', '2020-06-16 15:34:55'),
(965, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Collection', 3, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":1,\"confirmed_at\":\"2020-06-16T17:35:00.065691Z\"}', 'http://localhost/crm/public/collection/approve/3', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:35:00', '2020-06-16 15:35:00'),
(966, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoice', 12, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"client_id\":\"5\",\"code\":\"324\",\"inventory_id\":\"2\",\"total\":\"3\",\"final_total\":\"3\",\"total_after_discount\":\"3\",\"discount\":0,\"payment_type\":\"post_paid\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"1\",\"remaining_amount\":\"2\",\"status\":\"new\",\"notes\":null,\"id\":12}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:36:57', '2020-06-16 15:36:57'),
(967, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceItem', 27, '[]', '{\"item_id\":\"8\",\"inventory_id\":\"2\",\"invoice_id\":12,\"amount\":\"03\",\"price\":\"1\",\"unit_price\":\"1\",\"sale_price\":\"1\",\"purchase_price\":\"1\",\"notes\":0,\"id\":27}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:36:57', '2020-06-16 15:36:57'),
(968, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 11, '[]', '{\"client_id\":\"5\",\"invoice_id\":12,\"amount\":\"01\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":11}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:36:57', '2020-06-16 15:36:57'),
(969, 'App\\Models\\User', 115, 'created', 'App\\Models\\SalesInvoiceInstallment', 12, '[]', '{\"client_id\":\"5\",\"invoice_id\":12,\"amount\":\"1\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":12}', 'http://localhost/crm/public/sales_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:36:57', '2020-06-16 15:36:57'),
(970, 'App\\Models\\User', 115, 'updated', 'App\\Models\\SalesInvoice', 12, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T17:37:45.182949Z\"}', 'http://localhost/crm/public/sales_invoices/approve/12', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:37:45', '2020-06-16 15:37:45'),
(971, 'App\\Models\\User', 115, 'created', 'App\\Models\\Collection', 6, '[]', '{\"client_id\":\"5\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"44\",\"notes\":null,\"created_by\":115,\"status\":\"open\",\"id\":6}', 'http://localhost/crm/public/collection', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:37:56', '2020-06-16 15:37:56'),
(972, 'App\\Models\\User', 115, 'updated', 'App\\Models\\Collection', 6, '{\"amount\":44,\"date\":\"2020-06-16\"}', '{\"amount\":\"22\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/collection/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:38:04', '2020-06-16 15:38:04'),
(973, 'App\\Models\\User', 115, 'updated', 'App\\Models\\Collection', 6, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":115,\"confirmed_at\":\"2020-06-16T17:39:01.898043Z\"}', 'http://localhost/crm/public/collection/approve/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:39:01', '2020-06-16 15:39:01'),
(974, 'App\\Models\\User', 8, 'created', 'App\\Models\\User', 116, '[]', '{\"name\":\"purchas_invoices_manager@gmail.com\",\"email\":\"purchas_invoices_manager@gmail.com\",\"image\":\"\\/uploads\\/user\\/159232999979733.png\",\"password\":\"$2y$10$1KCBh.nA.GLpabSOIhVKku8ihk8t8QsIXjN\\/8fVAoWyQ9AH6SHksm\",\"is_super_admin\":0,\"id\":116}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:53:19', '2020-06-16 15:53:19'),
(975, 'App\\Models\\User', 116, 'created', 'App\\Models\\Supplier', 7, '[]', '{\"name\":\"test\",\"email\":\"sssss@queentechsolutions.net\",\"phone\":\"+201159401701\",\"initial_balance\":\"34\",\"address\":\"ahmad tayseer\",\"notes\":null,\"balance\":\"34\",\"id\":7}', 'http://localhost/crm/public/suppliers', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:55:52', '2020-06-16 15:55:52'),
(976, 'App\\Models\\User', 116, 'deleted', 'App\\Models\\Supplier', 7, '{\"id\":7,\"name\":\"test\",\"email\":\"sssss@queentechsolutions.net\",\"address\":\"ahmad tayseer\",\"phone\":\"+201159401701\",\"notes\":null,\"initial_balance\":34,\"balance\":34}', '[]', 'http://localhost/crm/public/suppliers/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:56:13', '2020-06-16 15:56:13'),
(977, 'App\\Models\\User', 116, 'created', 'App\\Models\\Supplier', 8, '[]', '{\"name\":\"test\",\"email\":\"333333@queentechsolutions.net\",\"phone\":\"+201159401701\",\"initial_balance\":\"333\",\"address\":\"ahmad tayseer\",\"notes\":null,\"balance\":\"333\",\"id\":8}', 'http://localhost/crm/public/suppliers', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:56:24', '2020-06-16 15:56:24'),
(978, 'App\\Models\\User', 116, 'updated', 'App\\Models\\Supplier', 8, '{\"name\":\"test\"}', '{\"name\":\"333test\"}', 'http://localhost/crm/public/suppliers/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 15:56:30', '2020-06-16 15:56:30'),
(979, 'App\\Models\\User', 116, 'created', 'App\\Models\\PurchaseInvoice', 8, '[]', '{\"date\":\"2020-06-16T00:00:00.000000Z\",\"supplier_id\":\"1\",\"code\":\"test\",\"purchase_invoice_number\":\"tset\",\"inventory_id\":\"2\",\"total\":\"220\",\"final_total\":\"220\",\"total_after_discount\":\"220\",\"discount\":0,\"payment_type\":\"post_paid\",\"discount_type\":\"percent\",\"discount_amount\":\"0\",\"total_taxes_amount\":0,\"paid_amount\":\"2\",\"remaining_amount\":\"218\",\"status\":\"new\",\"notes\":null,\"created_by\":116,\"id\":8}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:05', '2020-06-16 16:00:05'),
(980, 'App\\Models\\User', 116, 'created', 'App\\Models\\PurchaseInvoiceItem', 31, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":8,\"amount\":\"044\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":31}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:05', '2020-06-16 16:00:05'),
(981, 'App\\Models\\User', 116, 'created', 'App\\Models\\PurchaseInstallment', 2, '[]', '{\"supplier_id\":\"1\",\"invoice_id\":8,\"amount\":\"44\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":2}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:05', '2020-06-16 16:00:05'),
(982, 'App\\Models\\User', 116, 'created', 'App\\Models\\PurchaseInstallment', 3, '[]', '{\"supplier_id\":\"1\",\"invoice_id\":8,\"amount\":\"174\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"notes\":null,\"status\":\"open\",\"id\":3}', 'http://localhost/crm/public/purchase_invoices', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:05', '2020-06-16 16:00:05'),
(983, 'App\\Models\\User', 116, 'updated', 'App\\Models\\PurchaseInvoice', 8, '{\"date\":\"2020-06-16\"}', '{\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/purchase_invoices/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:17', '2020-06-16 16:00:17'),
(984, 'App\\Models\\User', 116, 'created', 'App\\Models\\PurchaseInvoiceItem', 32, '[]', '{\"item_id\":\"6\",\"inventory_id\":\"2\",\"invoice_id\":8,\"amount\":\"44\",\"price\":\"5\",\"unit_price\":\"3\",\"sale_price\":\"4\",\"purchase_price\":\"5\",\"notes\":0,\"id\":32}', 'http://localhost/crm/public/purchase_invoices/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:17', '2020-06-16 16:00:17'),
(985, 'App\\Models\\User', 116, 'updated', 'App\\Models\\PurchaseInvoice', 8, '{\"status\":\"new\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":116,\"confirmed_at\":\"2020-06-16T18:00:30.696049Z\"}', 'http://localhost/crm/public/purchase_invoices/approve/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:00:30', '2020-06-16 16:00:30'),
(986, 'App\\Models\\User', 116, 'created', 'App\\Models\\Payment', 7, '[]', '{\"supplier_id\":\"1\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"33\",\"notes\":null,\"created_by\":116,\"status\":\"open\",\"id\":7}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:02:12', '2020-06-16 16:02:12'),
(987, 'App\\Models\\User', 116, 'updated', 'App\\Models\\Payment', 7, '{\"amount\":33,\"date\":\"2020-06-16\"}', '{\"amount\":\"55\",\"date\":\"2020-06-16T00:00:00.000000Z\"}', 'http://localhost/crm/public/payments/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:02:23', '2020-06-16 16:02:23'),
(988, 'App\\Models\\User', 116, 'updated', 'App\\Models\\Payment', 7, '{\"status\":\"open\",\"confirmed_by\":null,\"confirmed_at\":null}', '{\"status\":\"closed\",\"confirmed_by\":116,\"confirmed_at\":\"2020-06-16T18:03:03.193178Z\"}', 'http://localhost/crm/public/payments/approve/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:03:03', '2020-06-16 16:03:03'),
(989, 'App\\Models\\User', 116, 'created', 'App\\Models\\Payment', 8, '[]', '{\"supplier_id\":\"1\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"55\",\"notes\":null,\"created_by\":116,\"status\":\"open\",\"id\":8}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:03:16', '2020-06-16 16:03:16'),
(990, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Payment', 8, '{\"id\":8,\"supplier_id\":1,\"amount\":55,\"date\":\"2020-06-16\",\"notes\":null,\"status\":\"open\",\"created_by\":116,\"confirmed_by\":null,\"confirmed_at\":null}', '[]', 'http://localhost/crm/public/payments/8', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:04:13', '2020-06-16 16:04:13'),
(991, 'App\\Models\\User', 116, 'created', 'App\\Models\\Payment', 9, '[]', '{\"supplier_id\":\"1\",\"date\":\"2020-06-16T00:00:00.000000Z\",\"amount\":\"3324\",\"notes\":null,\"created_by\":116,\"status\":\"open\",\"id\":9}', 'http://localhost/crm/public/payments', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:04:43', '2020-06-16 16:04:43'),
(992, 'App\\Models\\User', 116, 'deleted', 'App\\Models\\Payment', 9, '{\"id\":9,\"supplier_id\":1,\"amount\":3324,\"date\":\"2020-06-16\",\"notes\":null,\"status\":\"open\",\"created_by\":116,\"confirmed_by\":null,\"confirmed_at\":null}', '[]', 'http://localhost/crm/public/payments/9', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:04:46', '2020-06-16 16:04:46'),
(993, 'App\\Models\\User', 8, 'created', 'App\\Models\\User', 117, '[]', '{\"name\":\"setting_manager\",\"email\":\"setting_manager@gmail.com\",\"image\":\"\\/uploads\\/user\\/159233138979613.jpg\",\"password\":\"$2y$10$lbF5x\\/\\/13sFZT.XF7KSPJOPtDLTHkYkdKUxP8BJq87Fz\\/xpddJX0.\",\"is_super_admin\":0,\"id\":117}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:16:29', '2020-06-16 16:16:29'),
(994, 'App\\Models\\User', 117, 'created', 'App\\Models\\LeadStatus', 6, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"notes\":null,\"id\":6}', 'http://localhost/crm/public/leads_statuses', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:21:51', '2020-06-16 16:21:51'),
(995, 'App\\Models\\User', 117, 'deleted', 'App\\Models\\LeadStatus', 6, '{\"id\":6,\"notes\":null,\"name_en\":\"test\",\"name_ar\":\"test\"}', '[]', 'http://localhost/crm/public/leads_statuses/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:21:53', '2020-06-16 16:21:53'),
(996, 'App\\Models\\User', 117, 'created', 'App\\Models\\LeadStatus', 7, '[]', '{\"name_ar\":\"t\",\"name_en\":\"ttt\",\"notes\":null,\"id\":7}', 'http://localhost/crm/public/leads_statuses', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:21:57', '2020-06-16 16:21:57'),
(997, 'App\\Models\\User', 117, 'updated', 'App\\Models\\LeadStatus', 7, '{\"name_ar\":\"t\"}', '{\"name_ar\":\"tt\"}', 'http://localhost/crm/public/leads_statuses/7', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:22:01', '2020-06-16 16:22:01'),
(998, 'App\\Models\\User', 117, 'created', 'App\\Models\\ConnectionWay', 10, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"id\":10}', 'http://localhost/crm/public/connection_ways', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:24:11', '2020-06-16 16:24:11'),
(999, 'App\\Models\\User', 117, 'updated', 'App\\Models\\ConnectionWay', 10, '{\"name_ar\":\"test\"}', '{\"name_ar\":\"testttttt\"}', 'http://localhost/crm/public/connection_ways/10', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:24:15', '2020-06-16 16:24:15'),
(1000, 'App\\Models\\User', 117, 'updated', 'App\\Models\\ConnectionWay', 10, '{\"name_en\":\"test\"}', '{\"name_en\":\"testttt\"}', 'http://localhost/crm/public/connection_ways/10', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:24:19', '2020-06-16 16:24:19'),
(1001, 'App\\Models\\User', 117, 'deleted', 'App\\Models\\ConnectionWay', 10, '{\"id\":10,\"name_ar\":\"testttttt\",\"name_en\":\"testttt\"}', '[]', 'http://localhost/crm/public/connection_ways/10', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:24:22', '2020-06-16 16:24:22'),
(1002, 'App\\Models\\User', 117, 'created', 'App\\Models\\ClientCategory', 6, '[]', '{\"name_ar\":\"test\",\"name_en\":\"test\",\"id\":6}', 'http://localhost/crm/public/client_categories', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:25:40', '2020-06-16 16:25:40'),
(1003, 'App\\Models\\User', 117, 'updated', 'App\\Models\\ClientCategory', 6, '{\"name_en\":\"test\",\"name_ar\":\"test\"}', '{\"name_en\":\"tetsetst\",\"name_ar\":\"testtest\"}', 'http://localhost/crm/public/client_categories/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:25:44', '2020-06-16 16:25:44'),
(1004, 'App\\Models\\User', 117, 'deleted', 'App\\Models\\ClientCategory', 6, '{\"id\":6,\"name_en\":\"tetsetst\",\"name_ar\":\"testtest\"}', '[]', 'http://localhost/crm/public/client_categories/6', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:25:47', '2020-06-16 16:25:47'),
(1005, 'App\\Models\\User', 8, 'created', 'App\\Models\\User', 118, '[]', '{\"name\":\"logs_manager\",\"email\":\"logs_manager@gmail.com\",\"image\":\"\\/uploads\\/user\\/159233215176714.jpeg\",\"password\":\"$2y$10$TveuiqVd4GLHboLuSk5tG.xi.eLRmAsGfJxPnd5G1uJ.6hLlS6xu2\",\"is_super_admin\":0,\"id\":118}', 'http://localhost/crm/public/users', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', NULL, '2020-06-16 16:29:11', '2020-06-16 16:29:11');

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

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `details`, `page_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'المستوي الرابع', 'التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل', '203154564', '456465465', '2020-04-30 08:46:48', '2020-04-30 08:46:48');

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
  `massage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `marketing_way_id`, `category_id`, `name`, `email`, `user_name`, `password`, `job`, `birth_date`, `address`, `referred_by`, `notes`, `created_at`, `updated_at`, `balance`) VALUES
(1, 1, 1, 'ahmed elshora', 'm.ammar@queentechsolutions.net', NULL, NULL, 'job', '10-11-2020', 'mehalla', 'محمد', NULL, '2020-04-26 09:39:59', '2020-04-26 12:30:38', 0),
(2, 1, 1, 'ahmed elshora', 'supporter@gmail.com', NULL, NULL, 'Nemo eius ratione au', NULL, 'mehalla', 'محمد', NULL, '2020-04-26 11:03:15', '2020-04-26 11:03:15', 0),
(3, 1, 1, 'test', 'test@test.com', NULL, NULL, 'job', 'date', 'address', 'suggested by', 'notes', '2020-04-27 10:34:41', '2020-04-27 10:34:41', 0),
(4, 3, 2, 'ahmed elshora', 'siwokoelshora.queen@mailinator.com', NULL, NULL, 'Sint lorem ut porro', '11-Oct-1984', 'mehalla', 'Eum ullam sed dolor', 'Tempor accusantium a', '2020-04-27 10:37:11', '2020-06-16 07:13:18', 0),
(5, NULL, NULL, 'Noble Bender', 'nomeraqu@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-28 11:22:13', '2020-06-16 15:39:01', -24),
(6, NULL, NULL, 'Sierra Coleman', 'riziman@mailinator.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-28 11:26:53', '2020-04-28 11:26:53', 0),
(8, NULL, NULL, 'Uta Mcclure', 'wutu@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-28 11:28:12', '2020-04-28 11:28:12', 0),
(9, 1, 1, 'test client', 'testclient@test.com', NULL, NULL, 'client job', '2020/04/30 12:25', 'address', 'name', 'test', '2020-04-30 08:29:30', '2020-06-16 15:35:00', -101097),
(10, 2, 1, 'client name', 'client_email@client.com', NULL, NULL, 'job', '05/14/2020', 'mehalla', 'Eum ullam sed dolor', NULL, '2020-05-14 13:46:56', '2020-05-14 13:52:04', 0),
(11, 1, 3, 'riyad', 'moxaqobyg@mailinator.net', NULL, NULL, 'Proident a dolore q', '06/24/2020', 'elthawra street', 'Aut aut sunt veniam', 'Laborum odio autem d', '2020-06-10 13:34:38', '2020-06-10 13:36:24', 0),
(12, NULL, NULL, 'name', 'email@email.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-10 13:44:02', '2020-06-10 13:44:02', 0),
(13, 1, 2, '324name', 'name@name.com2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-10 13:44:24', '2020-06-16 10:38:09', 0),
(15, 2, 2, 'testasd', 'Abdulkader@queentechsolutions.netasd', NULL, NULL, 'job', '2020-06-29', 'ahmad tayseer', 'Eum ullam sed dolor', 'test', '2020-06-16 10:39:08', '2020-06-16 10:43:24', 0),
(16, NULL, NULL, 'cairo', 'Abdulkadera@queentechsolutions.net', NULL, NULL, NULL, NULL, 'ahmad tayseer', NULL, NULL, '2020-06-16 10:41:03', '2020-06-16 10:41:03', 0),
(17, 1, NULL, 'cairo', 'Abdulkader@quaaaaaaaeentechsolutions.net', NULL, NULL, '1job', '2020-06-03', 'ahmad tayseer', 'Eum ullam sed dolor', NULL, '2020-06-16 10:41:46', '2020-06-16 12:57:22', 0),
(19, NULL, NULL, 'test', 'Abdulkader3@queentechsolutions.net', NULL, NULL, NULL, NULL, 'ahmad tayseer', NULL, NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51', 0),
(20, 1, 3, '55555555', '555@gmail.com', NULL, NULL, '1job', '2020-06-08', 'ahmad tayseer', NULL, NULL, '2020-06-16 13:22:22', '2020-06-16 13:22:22', 0),
(21, NULL, NULL, 'test', '2222222@queentechsolutions.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-16 13:31:53', '2020-06-16 13:32:02', 0);

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

--
-- Dumping data for table `client_categories`
--

INSERT INTO `client_categories` (`id`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(3, '2020-04-26 09:59:45', '2020-06-15 10:22:39', 'english', 'arabic'),
(5, '2020-06-16 11:18:59', '2020-06-16 11:18:59', 'est', 'test');

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

--
-- Dumping data for table `client_contacts`
--

INSERT INTO `client_contacts` (`id`, `client_id`, `phone`, `notes`, `created_at`, `updated_at`) VALUES
(16, 1, '01115752554', NULL, '2020-04-28 11:11:42', '2020-04-28 11:11:42'),
(19, 8, '+1 (504) 422-8337', 'Eos exercitation ab', '2020-04-28 11:28:12', '2020-04-28 11:28:12'),
(20, 1, '55464465', NULL, '2020-04-28 11:40:49', '2020-04-28 11:40:49'),
(21, 1, '01115752554', 'note', '2020-04-28 11:41:01', '2020-04-28 11:41:01'),
(26, 10, '020405060', 'test notes in client phone number', '2020-05-14 14:24:11', '2020-05-14 14:24:11'),
(28, 5, '01115752554', NULL, '2020-05-14 15:59:30', '2020-05-14 15:59:30'),
(30, 11, '01115752554', 'Consequatur fuga Ni', '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(31, 11, '01115752554', 'phone test 2', '2020-06-10 13:36:24', '2020-06-10 13:36:24'),
(35, NULL, '01001587086', NULL, '2020-06-15 12:58:20', '2020-06-15 12:58:20'),
(37, 12, '01001587086', NULL, '2020-06-15 13:02:13', '2020-06-15 13:02:13'),
(41, 4, '01115752554', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(42, 4, '01001587086', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(43, 4, '+1 (849) 682-5151', NULL, '2020-06-16 07:13:18', '2020-06-16 07:13:18'),
(45, 14, '+201159401701', NULL, '2020-06-16 10:37:51', '2020-06-16 10:37:51'),
(46, 13, '324', '234', '2020-06-16 10:38:15', '2020-06-16 10:38:15'),
(51, 15, '+201159401701', NULL, '2020-06-16 10:43:24', '2020-06-16 10:43:24'),
(54, 18, '+201159401701', '1', '2020-06-16 12:48:10', '2020-06-16 12:48:10'),
(55, 18, '+201159401701', '2', '2020-06-16 12:48:10', '2020-06-16 12:48:10'),
(56, 19, '+201159401701', NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51'),
(57, 19, '324234', NULL, '2020-06-16 13:21:51', '2020-06-16 13:21:51'),
(58, 20, '+201159401701', NULL, '2020-06-16 13:22:22', '2020-06-16 13:22:22');

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

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `client_id`, `invoice_id`, `amount`, `date`, `notes`, `status`, `created_at`, `updated_at`, `created_by`, `confirmed_by`, `confirmed_at`) VALUES
(1, 9, NULL, 100000.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:24:21', '2020-06-16 15:31:36', 115, 1, '2020-06-16 15:31:36'),
(3, 9, NULL, 1.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:34:33', '2020-06-16 15:35:00', 1, 1, '2020-06-16 15:35:00'),
(4, 9, NULL, 2.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:34:41', '2020-06-16 15:34:55', 1, 1, '2020-06-16 15:34:55'),
(5, 9, NULL, 44.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:34:51', '2020-06-16 15:34:53', 1, 1, '2020-06-16 15:34:53'),
(6, 5, NULL, 22.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:37:56', '2020-06-16 15:39:01', 115, 115, '2020-06-16 15:39:01');

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

--
-- Dumping data for table `collection_items`
--

INSERT INTO `collection_items` (`id`, `collection_id`, `model_id`, `model_type`, `amount`, `created_at`, `updated_at`) VALUES
(2, 1, 10, 'App\\Models\\SalesInvoice', 1047, '2020-06-16 15:31:34', '2020-06-16 15:31:36'),
(5, 3, 11, 'App\\Models\\SalesInvoice', 0, '2020-06-16 15:34:33', '2020-06-16 15:34:33'),
(6, 4, 11, 'App\\Models\\SalesInvoice', 0, '2020-06-16 15:34:41', '2020-06-16 15:34:41'),
(7, 5, 11, 'App\\Models\\SalesInvoice', 3, '2020-06-16 15:34:51', '2020-06-16 15:34:53'),
(12, 6, 12, 'App\\Models\\SalesInvoice', 2, '2020-06-16 15:38:04', '2020-06-16 15:39:01'),
(13, 6, 6, 'App\\Models\\Collection', 20, '2020-06-16 15:39:01', '2020-06-16 15:39:01');

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

--
-- Dumping data for table `connection_ways`
--

INSERT INTO `connection_ways` (`id`, `created_at`, `updated_at`, `name_ar`, `name_en`) VALUES
(8, '2020-06-15 11:26:03', '2020-06-16 11:16:54', 'رسالة عبر الواتسابTEST', 'whatsapp message'),
(9, '2020-06-16 11:16:59', '2020-06-16 11:16:59', 'SET', 'SET');

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

--
-- Dumping data for table `connection_way_statuses`
--

INSERT INTO `connection_way_statuses` (`id`, `connection_way_id`, `name_ar`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 6, 'status', 'en', '2020-06-15 11:19:07', '2020-06-15 11:19:07'),
(4, 7, 'تم الرد', 'answer', '2020-06-15 11:24:06', '2020-06-15 11:24:06'),
(5, 7, 'لم يتم الرد', 'no answer', '2020-06-15 11:24:06', '2020-06-15 11:24:06'),
(10, 8, 'تم الارسال', 'sent', '2020-06-16 11:16:54', '2020-06-16 11:16:54'),
(11, 8, 'لم يتم الارسال', 'not sent', '2020-06-16 11:16:54', '2020-06-16 11:16:54'),
(16, 10, 't', 't', '2020-06-16 16:24:19', '2020-06-16 16:24:19'),
(17, 10, '', '', '2020-06-16 16:24:19', '2020-06-16 16:24:19');

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

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(2, '2020-06-15 07:11:18', '2020-06-15 13:37:40', 'e', 'عربي'),
(3, '2020-06-15 07:51:17', '2020-06-15 07:56:24', 'english', 'arabic');

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
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `phone`, `address`, `notes`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(2, '+1 (733) 488-7891', 'Ipsa ad laudantium', 'Culpa possimus ad d', '2020-04-23 10:23:06', '2020-06-15 08:50:06', 'english', 'arabic'),
(3, '555522444', 'dasd', NULL, '2020-06-10 13:52:56', '2020-06-15 08:49:16', 'inventory name', 'اسم المخزن');

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

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`id`, `inventory_id`, `item_id`, `amount`, `unit_price`, `purchase_price`, `sale_price`, `created_at`, `updated_at`) VALUES
(2, 2, 3, '12.00', 40.00, 40.00, 40.00, '2020-06-04 09:29:43', '2020-06-04 11:17:59'),
(3, 2, 2, '30.00', 50.00, 50.00, 55.00, '2020-06-07 13:43:51', '2020-06-10 14:12:51'),
(4, 2, 4, '1.00', 60.00, 30.00, 60.00, '2020-06-09 06:29:08', '2020-06-09 06:29:08'),
(5, 2, 6, '48.00', 3.00, 5.00, 4.00, '2020-06-16 11:02:10', '2020-06-16 16:00:30'),
(6, 2, 7, '40.00', 324.00, 234.00, 234.00, '2020-06-16 11:02:10', '2020-06-16 15:24:11'),
(7, 2, 8, '43.00', 1.00, 1.00, 1.00, '2020-06-16 11:02:10', '2020-06-16 15:37:45');

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

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `unit_price`, `purchase_price`, `sale_price`, `notes`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(6, 9, 3.00, 5.00, 4.00, '35', '2020-06-16 10:50:30', '2020-06-16 10:50:37', 'test35', 'test35'),
(7, 9, 324.00, 234.00, 234.00, NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45', 'test', 'test'),
(8, 9, 1.00, 1.00, 1.00, NULL, '2020-06-16 10:54:03', '2020-06-16 10:54:03', '11111', '111');

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

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `parent_id`, `notes`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(9, NULL, NULL, '2020-06-15 09:28:01', '2020-06-15 09:28:01', 'english', 'arabic'),
(12, 9, 'test1', '2020-06-16 10:48:43', '2020-06-16 10:49:38', 'test', 'test'),
(14, 9, '33333', '2020-06-16 14:06:24', '2020-06-16 14:06:24', '22222', '1111');

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
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_variations`
--

INSERT INTO `item_variations` (`id`, `variation_id`, `item_id`, `name`, `type`, `options`, `value`, `created_at`, `updated_at`, `label`) VALUES
(58, 1, 6, 'item_status', 'checkbox', 'class=\"form-check\" ', 'sale', '2020-06-16 10:51:11', '2020-06-16 10:51:11', 'for_sale'),
(59, 2, 6, 'item_status', 'checkbox', 'class=\"form-check\" ', 'rent', '2020-06-16 10:51:11', '2020-06-16 10:51:11', 'for_rent'),
(60, 3, 6, 'width', 'number', 'class=\"form-control\" ', '35', '2020-06-16 10:51:11', '2020-06-16 10:51:11', 'width'),
(61, 4, 6, 'height', 'text', 'class=\"form-control\" ', '35', '2020-06-16 10:51:11', '2020-06-16 10:51:11', 'height'),
(62, 3, 7, 'width', 'number', 'class=\"form-control\" ', NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45', 'width'),
(63, 4, 7, 'height', 'text', 'class=\"form-control\" ', NULL, '2020-06-16 10:51:45', '2020-06-16 10:51:45', 'height'),
(64, 3, 8, 'width', 'number', 'class=\"form-control\" ', '1', '2020-06-16 10:54:03', '2020-06-16 10:54:03', 'width'),
(65, 4, 8, 'height', 'text', 'class=\"form-control\" ', '1', '2020-06-16 10:54:03', '2020-06-16 10:54:03', 'height');

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
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `client_id`, `lead_status_id`, `title`, `details`, `created_by`, `created_at`, `updated_at`, `employee_id`) VALUES
(6, 2, 4, 'test', 'test', 1, '2020-06-16 10:38:44', '2020-06-16 13:26:14', 7),
(9, 20, 4, 'hello world', 'test', 112, '2020-06-16 13:22:33', '2020-06-16 13:22:33', 1);

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

--
-- Dumping data for table `lead_comments`
--

INSERT INTO `lead_comments` (`id`, `lead_id`, `type`, `details`, `created_at`, `updated_at`, `created_by`) VALUES
(32, 5, 'comment', 'Lorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.Lorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\n\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.Lorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\n\r\n\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\n\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.Lorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\n\r\n\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.\r\n\r\n\r\nLorem ipsum dolor sit amet,consectetuer edipiscing elit,sed diam nonummy nibh euismod tinciduntut laoreet doloremagna aliquam erat volutpat.', '2020-04-28 13:56:58', '2020-04-28 13:56:58', 1),
(33, 5, 'comment', 'note', '2020-06-14 10:26:32', '2020-06-14 10:26:32', 1);

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

--
-- Dumping data for table `lead_operations`
--

INSERT INTO `lead_operations` (`id`, `lead_id`, `user_id`, `user_type`, `connection_way_id`, `operation_date`, `operation_time`, `created_at`, `updated_at`, `created_by`, `notes`, `connection_way_status_id`) VALUES
(113, 5, 1, NULL, 7, '2020-06-15', '16:15:00', '2020-06-15 12:05:13', '2020-06-15 12:15:41', 1, NULL, 5),
(114, 5, 1, NULL, 8, '2020-06-15', '16:15:00', '2020-06-15 12:17:50', '2020-06-15 12:17:50', 1, NULL, 7);

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

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `notes`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(1, 'notes', '2020-04-26 15:39:59', '2020-04-26 15:39:59', '', ''),
(2, NULL, '2020-04-26 15:40:41', '2020-04-26 15:40:41', '', ''),
(4, NULL, '2020-04-26 15:41:05', '2020-06-15 10:08:51', 'new', 'جديدة'),
(7, NULL, '2020-06-16 16:21:57', '2020-06-16 16:22:01', 'ttt', 'tt');

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
-- Table structure for table `marketing_ways`
--

CREATE TABLE `marketing_ways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketing_ways`
--

INSERT INTO `marketing_ways` (`id`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(1, '2020-04-26 09:43:17', '2020-06-15 08:42:00', 'google ads', 'اعلانات جوجل'),
(2, '2020-04-26 09:43:24', '2020-06-15 08:41:40', 'twitter', 'تويتر'),
(3, '2020-04-26 09:43:32', '2020-06-15 08:41:29', 'linkedin', 'لنكيد ان'),
(4, '2020-06-10 13:58:29', '2020-06-16 10:52:24', 'facebook', 'فيسبوك1');

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
(93, '2020_06_16_113555_add_date_to_sales_invoices_table', 35);

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
(2, 'App\\Models\\User', NULL, NULL, 107),
(2, 'App\\Models\\User', NULL, NULL, 113),
(3, 'App\\Models\\User', NULL, NULL, 112),
(4, 'App\\Models\\User', NULL, NULL, 109),
(5, 'App\\Models\\User', NULL, NULL, 114),
(6, 'App\\Models\\User', NULL, NULL, 115),
(7, 'App\\Models\\User', NULL, NULL, 116),
(8, 'App\\Models\\User', NULL, NULL, 117),
(9, 'App\\Models\\User', NULL, NULL, 118);

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

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `basic_title`, `basic_body`, `model_type`, `model_id`, `action`, `created_at`, `updated_at`) VALUES
(1, 'name', 'name', 'App\\Models\\Notificatio', NULL, 'message', '2020-06-14 09:46:25', '2020-06-14 09:46:25'),
(2, 'name', 'name', 'App\\Models\\Notificatio', NULL, 'message', '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(3, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(4, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(5, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(6, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(7, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(8, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(9, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(10, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(11, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(12, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(13, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(14, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(15, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(16, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(17, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(18, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(19, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(20, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(21, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(22, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(23, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(24, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(25, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(26, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(27, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(28, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(29, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(30, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(31, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(32, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(33, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(34, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(35, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(36, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(37, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(38, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(39, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(40, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(41, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(42, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(43, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(44, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(45, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(46, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(47, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(48, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(49, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(50, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(51, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(52, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(53, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(54, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(55, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(56, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(57, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(58, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(59, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(60, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(61, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(62, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(63, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(64, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(65, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(66, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(67, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(68, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(69, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(70, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(71, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(72, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(73, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(74, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(75, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(76, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(77, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(78, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(79, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(80, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(81, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(82, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(83, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(84, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(85, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(86, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(87, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(88, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(89, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(90, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(91, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(92, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(93, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(94, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(95, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(96, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(97, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(98, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(99, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(100, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(101, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(102, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(103, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(104, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(105, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(106, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(107, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(108, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(109, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(110, NULL, NULL, 'App\\Models\\Lead', 5, 'new_lead_comment', '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(111, NULL, NULL, 'App\\Models\\Lead', 5, 'updated_Lead', '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(112, NULL, NULL, 'App\\Models\\Lead', 5, 'updated_Lead', '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(113, NULL, NULL, 'App\\Models\\Lead', 5, 'updated_Lead_operation', '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(114, NULL, NULL, 'App\\Models\\Lead', 6, 'new_Lead', '2020-06-16 10:38:44', '2020-06-16 10:38:44'),
(115, NULL, NULL, 'App\\Models\\Lead', 7, 'new_Lead', '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(116, NULL, NULL, 'App\\Models\\Lead', 8, 'new_Lead', '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(117, NULL, NULL, 'App\\Models\\Lead', 8, 'updated_Lead', '2020-06-16 10:42:10', '2020-06-16 10:42:10'),
(118, NULL, NULL, 'App\\Models\\Lead', 7, 'updated_Lead', '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(120, 'test', 'set', 'App\\Models\\Notification', NULL, 'message', '2020-06-16 11:19:26', '2020-06-16 11:19:26'),
(121, 'test', 'test', 'App\\Models\\Notification', NULL, 'message', '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(122, NULL, NULL, 'App\\Models\\Lead', 9, 'new_Lead', '2020-06-16 13:22:33', '2020-06-16 13:22:33'),
(123, NULL, NULL, 'App\\Models\\Lead', 6, 'updated_Lead', '2020-06-16 13:26:14', '2020-06-16 13:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `notification_users`
--

CREATE TABLE `notification_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_users`
--

INSERT INTO `notification_users` (`id`, `user_id`, `notification_id`, `seen`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(2, 7, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(3, 8, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(4, 9, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(5, 10, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(6, 11, 2, 0, '2020-06-14 10:10:04', '2020-06-14 10:10:04'),
(7, 2, 3, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(8, 4, 3, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(9, 2, 4, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(10, 4, 4, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(11, 1, 4, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(12, 2, 5, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(13, 4, 5, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(14, 1, 5, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(15, 2, 6, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(16, 4, 6, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(17, 1, 6, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(18, 2, 7, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(19, 4, 7, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(20, 1, 7, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(21, 2, 8, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(22, 4, 8, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(23, 1, 8, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(24, 2, 9, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(25, 4, 9, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(26, 1, 9, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(27, 2, 10, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(28, 4, 10, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(29, 1, 10, 0, '2020-06-14 10:26:32', '2020-06-14 10:26:32'),
(30, 2, 11, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(31, 4, 11, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(32, 1, 11, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(33, 2, 12, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(34, 4, 12, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(35, 1, 12, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(36, 2, 13, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(37, 4, 13, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(38, 1, 13, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(39, 2, 14, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(40, 4, 14, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(41, 1, 14, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(42, 2, 15, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(43, 4, 15, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(44, 1, 15, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(45, 2, 16, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(46, 4, 16, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(47, 1, 16, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(48, 2, 17, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(49, 4, 17, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(50, 1, 17, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(51, 2, 18, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(52, 4, 18, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(53, 1, 18, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(54, 2, 19, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(55, 4, 19, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(56, 1, 19, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(57, 2, 20, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(58, 4, 20, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(59, 1, 20, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(60, 2, 21, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(61, 4, 21, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(62, 1, 21, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(63, 2, 22, 0, '2020-06-14 10:26:33', '2020-06-14 10:26:33'),
(64, 4, 22, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(65, 1, 22, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(66, 2, 23, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(67, 4, 23, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(68, 1, 23, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(69, 2, 24, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(70, 4, 24, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(71, 1, 24, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(72, 2, 25, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(73, 4, 25, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(74, 1, 25, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(75, 2, 26, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(76, 4, 26, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(77, 1, 26, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(78, 2, 27, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(79, 4, 27, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(80, 1, 27, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(81, 2, 28, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(82, 4, 28, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(83, 1, 28, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(84, 2, 29, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(85, 4, 29, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(86, 1, 29, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(87, 2, 30, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(88, 4, 30, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(89, 1, 30, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(90, 2, 31, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(91, 4, 31, 0, '2020-06-14 10:26:34', '2020-06-14 10:26:34'),
(92, 1, 31, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(93, 2, 32, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(94, 4, 32, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(95, 1, 32, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(96, 2, 33, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(97, 4, 33, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(98, 1, 33, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(99, 2, 34, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(100, 4, 34, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(101, 1, 34, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(102, 2, 35, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(103, 4, 35, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(104, 1, 35, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(105, 2, 36, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(106, 4, 36, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(107, 1, 36, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(108, 2, 37, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(109, 4, 37, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(110, 1, 37, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(111, 2, 38, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(112, 4, 38, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(113, 1, 38, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(114, 2, 39, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(115, 4, 39, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(116, 1, 39, 0, '2020-06-14 10:26:35', '2020-06-14 10:26:35'),
(117, 2, 40, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(118, 4, 40, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(119, 1, 40, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(120, 2, 41, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(121, 4, 41, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(122, 1, 41, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(123, 2, 42, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(124, 4, 42, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(125, 1, 42, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(126, 2, 43, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(127, 4, 43, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(128, 1, 43, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(129, 2, 44, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(130, 4, 44, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(131, 1, 44, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(132, 2, 45, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(133, 4, 45, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(134, 1, 45, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(135, 2, 46, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(136, 4, 46, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(137, 1, 46, 0, '2020-06-14 10:26:36', '2020-06-14 10:26:36'),
(138, 2, 47, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(139, 4, 47, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(140, 1, 47, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(141, 2, 48, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(142, 4, 48, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(143, 1, 48, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(144, 2, 49, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(145, 4, 49, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(146, 1, 49, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(147, 2, 50, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(148, 4, 50, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(149, 1, 50, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(150, 2, 51, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(151, 4, 51, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(152, 1, 51, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(153, 2, 52, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(154, 4, 52, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(155, 1, 52, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(156, 2, 53, 0, '2020-06-14 10:26:37', '2020-06-14 10:26:37'),
(157, 4, 53, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(158, 1, 53, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(159, 2, 54, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(160, 4, 54, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(161, 1, 54, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(162, 2, 55, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(163, 4, 55, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(164, 1, 55, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(165, 2, 56, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(166, 4, 56, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(167, 1, 56, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(168, 2, 57, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(169, 4, 57, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(170, 1, 57, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(171, 2, 58, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(172, 4, 58, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(173, 1, 58, 0, '2020-06-14 10:26:38', '2020-06-14 10:26:38'),
(174, 2, 59, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(175, 4, 59, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(176, 1, 59, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(177, 2, 60, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(178, 4, 60, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(179, 1, 60, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(180, 2, 61, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(181, 4, 61, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(182, 1, 61, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(183, 2, 62, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(184, 4, 62, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(185, 1, 62, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(186, 2, 63, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(187, 4, 63, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(188, 1, 63, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(189, 2, 64, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(190, 4, 64, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(191, 1, 64, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(192, 2, 65, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(193, 4, 65, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(194, 1, 65, 0, '2020-06-14 10:26:39', '2020-06-14 10:26:39'),
(195, 2, 66, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(196, 4, 66, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(197, 1, 66, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(198, 2, 67, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(199, 4, 67, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(200, 1, 67, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(201, 2, 68, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(202, 4, 68, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(203, 1, 68, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(204, 2, 69, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(205, 4, 69, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(206, 1, 69, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(207, 2, 70, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(208, 4, 70, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(209, 1, 70, 0, '2020-06-14 10:26:40', '2020-06-14 10:26:40'),
(210, 2, 71, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(211, 4, 71, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(212, 1, 71, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(213, 2, 72, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(214, 4, 72, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(215, 1, 72, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(216, 2, 73, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(217, 4, 73, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(218, 1, 73, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(219, 2, 74, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(220, 4, 74, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(221, 1, 74, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(222, 2, 75, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(223, 4, 75, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(224, 1, 75, 0, '2020-06-14 10:26:41', '2020-06-14 10:26:41'),
(225, 2, 76, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(226, 4, 76, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(227, 1, 76, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(228, 2, 77, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(229, 4, 77, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(230, 1, 77, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(231, 2, 78, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(232, 4, 78, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(233, 1, 78, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(234, 2, 79, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(235, 4, 79, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(236, 1, 79, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(237, 2, 80, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(238, 4, 80, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(239, 1, 80, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(240, 2, 81, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(241, 4, 81, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(242, 1, 81, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(243, 2, 82, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(244, 4, 82, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(245, 1, 82, 0, '2020-06-14 10:26:42', '2020-06-14 10:26:42'),
(246, 2, 83, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(247, 4, 83, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(248, 1, 83, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(249, 2, 84, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(250, 4, 84, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(251, 1, 84, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(252, 2, 85, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(253, 4, 85, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(254, 1, 85, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(255, 2, 86, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(256, 4, 86, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(257, 1, 86, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(258, 2, 87, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(259, 4, 87, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(260, 1, 87, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(261, 2, 88, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(262, 4, 88, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(263, 1, 88, 0, '2020-06-14 10:26:43', '2020-06-14 10:26:43'),
(264, 2, 89, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(265, 4, 89, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(266, 1, 89, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(267, 2, 90, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(268, 4, 90, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(269, 1, 90, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(270, 2, 91, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(271, 4, 91, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(272, 1, 91, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(273, 2, 92, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(274, 4, 92, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(275, 1, 92, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(276, 2, 93, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(277, 4, 93, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(278, 1, 93, 0, '2020-06-14 10:26:44', '2020-06-14 10:26:44'),
(279, 2, 94, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(280, 4, 94, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(281, 1, 94, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(282, 2, 95, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(283, 4, 95, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(284, 1, 95, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(285, 2, 96, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(286, 4, 96, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(287, 1, 96, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(288, 2, 97, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(289, 4, 97, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(290, 1, 97, 0, '2020-06-14 10:26:45', '2020-06-14 10:26:45'),
(291, 2, 98, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(292, 4, 98, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(293, 1, 98, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(294, 2, 99, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(295, 4, 99, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(296, 1, 99, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(297, 2, 100, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(298, 4, 100, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(299, 1, 100, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(300, 2, 101, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(301, 4, 101, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(302, 1, 101, 0, '2020-06-14 10:26:46', '2020-06-14 10:26:46'),
(303, 2, 102, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(304, 4, 102, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(305, 1, 102, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(306, 2, 103, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(307, 4, 103, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(308, 1, 103, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(309, 2, 104, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(310, 4, 104, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(311, 1, 104, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(312, 2, 105, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(313, 4, 105, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(314, 1, 105, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(315, 2, 106, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(316, 4, 106, 0, '2020-06-14 10:26:47', '2020-06-14 10:26:47'),
(317, 1, 106, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(318, 2, 107, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(319, 4, 107, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(320, 1, 107, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(321, 2, 108, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(322, 4, 108, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(323, 1, 108, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(324, 2, 109, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(325, 4, 109, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(326, 1, 109, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(327, 2, 110, 0, '2020-06-14 10:26:48', '2020-06-14 10:26:48'),
(328, 4, 110, 0, '2020-06-14 10:26:49', '2020-06-14 10:26:49'),
(329, 1, 110, 0, '2020-06-14 10:26:49', '2020-06-14 10:26:49'),
(330, 2, 111, 0, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(331, 4, 111, 0, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(332, 1, 111, 0, '2020-06-14 13:07:33', '2020-06-14 13:07:33'),
(333, 2, 112, 0, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(334, 4, 112, 0, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(335, 1, 112, 0, '2020-06-14 13:07:58', '2020-06-14 13:07:58'),
(336, 2, 113, 0, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(337, 1, 113, 0, '2020-06-15 12:15:26', '2020-06-15 12:15:26'),
(338, 2, 114, 0, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(339, 1, 114, 0, '2020-06-15 12:15:41', '2020-06-15 12:15:41'),
(340, 7, 114, 0, '2020-06-16 10:38:44', '2020-06-16 10:38:44'),
(341, 8, 115, 0, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(342, 8, 116, 0, '2020-06-16 10:42:04', '2020-06-16 10:42:04'),
(343, 8, 117, 0, '2020-06-16 10:42:10', '2020-06-16 10:42:10'),
(344, 4, 118, 0, '2020-06-16 10:42:59', '2020-06-16 10:42:59'),
(345, 7, 119, 0, '2020-06-16 10:43:08', '2020-06-16 10:43:08'),
(346, 10, 120, 0, '2020-06-16 11:19:26', '2020-06-16 11:19:26'),
(347, 7, 121, 0, '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(348, 9, 121, 0, '2020-06-16 11:19:35', '2020-06-16 11:19:35'),
(349, 1, 122, 0, '2020-06-16 13:22:33', '2020-06-16 13:22:33'),
(350, 7, 123, 0, '2020-06-16 13:26:14', '2020-06-16 13:26:14');

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

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `supplier_id`, `amount`, `date`, `notes`, `status`, `created_at`, `updated_at`, `created_by`, `confirmed_by`, `confirmed_at`) VALUES
(4, 1, 500.00, '2020-06-07', NULL, 'closed', '2020-06-07 10:44:25', '2020-06-07 13:17:23', 1, 1, '2020-06-07 13:17:23'),
(5, 1, 5000.00, '2020-06-07', NULL, 'closed', '2020-06-07 13:31:03', '2020-06-07 13:32:13', 1, 1, '2020-06-07 13:32:13'),
(6, 4, 22.00, '2011-10-11', NULL, 'closed', '2020-06-16 11:13:50', '2020-06-16 11:14:56', 1, 1, '2020-06-16 11:14:56'),
(7, 1, 55.00, '2020-06-16', NULL, 'closed', '2020-06-16 16:02:12', '2020-06-16 16:03:03', 116, 116, '2020-06-16 16:03:03');

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

--
-- Dumping data for table `payment_items`
--

INSERT INTO `payment_items` (`id`, `payment_id`, `model_id`, `model_type`, `amount`, `created_at`, `updated_at`) VALUES
(2, 4, 2, 'App\\Models\\PurchaseInvoice', 0, '2020-06-07 11:58:41', '2020-06-07 13:16:48'),
(12, 7, 8, 'App\\Models\\PurchaseInvoice', 55, '2020-06-16 16:02:23', '2020-06-16 16:03:03');

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
(173, 'payments destroy', 'web', '2020-06-16 16:04:13', '2020-06-16 16:04:13');

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

--
-- Dumping data for table `purchase_installments`
--

INSERT INTO `purchase_installments` (`id`, `supplier_id`, `invoice_id`, `amount`, `date`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 52.00, '2020-06-04', NULL, 'closed', '2020-06-04 11:04:49', '2020-06-04 11:17:59');

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

--
-- Dumping data for table `purchase_invoices`
--

INSERT INTO `purchase_invoices` (`id`, `supplier_id`, `code`, `purchase_invoice_number`, `inventory_id`, `total`, `final_total`, `total_after_discount`, `discount`, `payment_type`, `discount_type`, `discount_amount`, `total_taxes_amount`, `paid_amount`, `remaining_amount`, `status`, `date`, `confirmed_by`, `confirmed_at`, `notes`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 'code', '123654', 2, 0.00, 0.00, 0.00, 0.00, 'cash', 'percent', 0.00, 0.00, 0.00, 0.00, 'closed', '2020-06-04', 1, '2020-06-07 13:43:59', NULL, '2020-06-03 12:58:55', '2020-06-07 13:43:59', 1),
(2, 1, 'code', '123654', 2, 80.00, 72.00, 72.00, 8.00, 'post_paid', 'percent', 10.00, 0.00, 72.00, 0.00, 'closed', '2020-06-01', 1, '2020-06-04 11:17:59', 'general notes', '2020-06-03 12:59:09', '2020-06-07 13:17:23', 1),
(3, 1, 'code', 'dddd', 2, 50.00, 50.00, 50.00, 0.00, 'cash', 'percent', 0.00, 0.00, 50.00, 0.00, 'closed', '2020-06-07', 1, '2020-06-07 13:43:57', NULL, '2020-06-07 09:38:21', '2020-06-07 13:43:57', 1),
(4, 1, 'code', '123654', 2, 1500.00, 1500.00, 1500.00, 0.00, 'cash', 'percent', 0.00, 0.00, 1500.00, 0.00, 'closed', '2020-06-07', 1, '2020-06-07 13:43:51', NULL, '2020-06-07 13:20:26', '2020-06-07 13:43:51', 1),
(6, 1, '234235', '234235', 2, 9420.00, 9420.00, 9420.00, 0.00, 'cash', 'percent', 0.00, 0.00, 9420.00, 0.00, 'closed', '2020-06-16', 1, '2020-06-16 11:02:10', NULL, '2020-06-16 11:02:03', '2020-06-16 11:02:10', 1),
(7, 1, '44444', '44444', 2, 1196.00, 1148.16, 1148.16, 47.84, 'cash', 'percent', 4.00, 0.00, 1148.16, 0.00, 'closed', '2020-06-16', 1, '2020-06-16 11:03:38', NULL, '2020-06-16 11:03:30', '2020-06-16 11:03:38', 1),
(8, 1, 'test', 'tset', 2, 220.00, 220.00, 220.00, 0.00, 'post_paid', 'percent', 0.00, 0.00, 57.00, 163.00, 'closed', '2020-06-16', 116, '2020-06-16 16:00:30', NULL, '2020-06-16 16:00:05', '2020-06-16 16:03:03', 116);

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

--
-- Dumping data for table `purchase_invoice_items`
--

INSERT INTO `purchase_invoice_items` (`id`, `item_id`, `inventory_id`, `invoice_id`, `amount`, `price`, `unit_price`, `sale_price`, `purchase_price`, `notes`, `created_at`, `updated_at`) VALUES
(21, 3, 2, 2, 2.00, 40.00, 40.00, 40.00, 40.00, 'test', '2020-06-04 11:04:49', '2020-06-04 11:04:49'),
(22, 2, 2, 3, 1.00, 50.00, 50.00, 55.00, 50.00, '0', '2020-06-07 09:38:21', '2020-06-07 09:38:21'),
(23, 2, 2, 4, 30.00, 50.00, 50.00, 55.00, 50.00, '0', '2020-06-07 13:20:26', '2020-06-07 13:20:26'),
(25, 6, 2, 6, 4.00, 5.00, 3.00, 4.00, 5.00, '0', '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(26, 7, 2, 6, 40.00, 234.00, 324.00, 234.00, 234.00, '0', '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(27, 8, 2, 6, 40.00, 1.00, 1.00, 1.00, 1.00, '0', '2020-06-16 11:02:03', '2020-06-16 11:02:03'),
(28, 6, 2, 7, 4.00, 5.00, 3.00, 4.00, 5.00, '1', '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(29, 7, 2, 7, 5.00, 234.00, 324.00, 234.00, 234.00, '2', '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(30, 8, 2, 7, 6.00, 1.00, 1.00, 1.00, 1.00, '3', '2020-06-16 11:03:30', '2020-06-16 11:03:30'),
(32, 6, 2, 8, 44.00, 5.00, 3.00, 4.00, 5.00, '0', '2020-06-16 16:00:17', '2020-06-16 16:00:17');

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
(2, 'web', '', '2020-06-09 06:35:14', '2020-06-16 08:10:52', 'ادارة المخازن', 'ادارة المخازن'),
(3, 'web', '', '2020-06-10 13:32:41', '2020-06-16 08:09:11', 'ادارة العملاء', 'ادارة العملاء'),
(4, 'web', 'e', '2020-06-15 08:15:36', '2020-06-16 08:06:56', 'ادارة المستخدمين', 'ادارة المستخدمين'),
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
(1, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(3, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(4, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(5, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(6, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(7, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(8, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(9, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(10, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(11, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(12, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(13, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(14, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(14, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(14, 9, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(15, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(16, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(17, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(18, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(19, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(20, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(21, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(22, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(23, 7, '2020-06-16 16:04:26', '2020-06-16 16:04:26'),
(24, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(25, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(26, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(27, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(28, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(29, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(30, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(31, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(32, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(33, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(34, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(35, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(36, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(37, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(38, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(39, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(40, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(41, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(42, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(43, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(44, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(45, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(46, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(47, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(48, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(49, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(50, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(51, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(52, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(53, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(54, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(55, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(56, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(57, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(58, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(59, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(59, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(59, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(60, 9, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(61, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(62, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(63, 9, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(64, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(65, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(66, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(67, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(68, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(69, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(70, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(71, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(72, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(73, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(74, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(75, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(76, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(77, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(78, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(79, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(81, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(82, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(83, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(84, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(85, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(86, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(87, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(88, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(89, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(90, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(91, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(92, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(93, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(94, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(94, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(95, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(96, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(97, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(98, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(99, 9, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(100, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(101, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(102, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(103, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(104, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(105, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(106, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(107, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(108, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(109, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(109, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(110, 9, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(111, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(112, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(113, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(114, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(115, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(116, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(117, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(118, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(119, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(120, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(121, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(122, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(123, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(124, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(125, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(126, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(126, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(127, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(127, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(128, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(129, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(129, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(130, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(130, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(131, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(131, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(132, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(133, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(134, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(135, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(136, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(137, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(138, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(139, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(140, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(141, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(142, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(143, 4, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(144, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(145, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(146, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(147, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(148, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(149, 3, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(150, 2, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(151, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(152, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(153, 5, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(154, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(155, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(156, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(157, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(158, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(159, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(160, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(161, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(162, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(163, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(164, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(165, 8, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(167, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(168, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(169, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(170, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(171, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(172, 6, '2020-06-16 16:04:27', '2020-06-16 16:04:27'),
(173, 7, '2020-06-16 16:04:27', '2020-06-16 16:04:27');

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
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_invoices`
--

INSERT INTO `sales_invoices` (`id`, `client_id`, `code`, `sales_order_id`, `inventory_id`, `total`, `final_total`, `total_after_discount`, `discount`, `payment_type`, `discount_type`, `discount_amount`, `total_taxes_amount`, `paid_amount`, `remaining_amount`, `status`, `confirmed_by`, `confirmed_at`, `notes`, `created_at`, `updated_at`, `date`) VALUES
(1, 1, 'SINV', NULL, 2, 60.00, 70.00, 60.00, 0.00, 'cash', 'percent', 0.00, 0.00, 70.00, 0.00, 'closed', 1, '2020-06-09 06:29:08', NULL, '2020-06-08 13:44:34', '2020-06-09 06:29:08', NULL),
(2, 1, 'code', NULL, 2, 55.00, 67.75, 55.00, 0.00, 'cash', 'percent', 0.00, 0.00, 67.75, 0.00, 'closed', 1, '2020-06-10 14:12:51', NULL, '2020-06-10 14:12:34', '2020-06-10 14:12:51', NULL),
(5, 2, '11', NULL, 2, 129.00, 129.00, 129.00, 0.00, 'cash', 'percent', 0.00, 0.00, 129.00, 0.00, 'closed', 115, '2020-06-16 14:56:43', NULL, '2020-06-16 14:56:40', '2020-06-16 14:56:43', '2020-06-16'),
(6, 5, 'TEST123', NULL, 2, 150.00, 150.00, 150.00, 0.00, 'cash', 'percent', 0.00, 0.00, 150.00, 0.00, 'new', NULL, NULL, NULL, '2020-06-16 15:01:21', '2020-06-16 15:01:21', '2020-06-16'),
(10, 9, '34234', NULL, 2, 1170.00, 1170.00, 1170.00, 0.00, 'post_paid', 'percent', 0.00, 0.00, 1170.00, 0.00, 'closed', 115, '2020-06-16 15:24:11', NULL, '2020-06-16 15:22:13', '2020-06-16 15:31:36', '2020-06-16'),
(11, 9, 'test', NULL, 2, 4.00, 4.00, 4.00, 0.00, 'post_paid', 'percent', 0.00, 0.00, 4.00, 0.00, 'closed', 1, '2020-06-16 15:34:01', NULL, '2020-06-16 15:32:37', '2020-06-16 15:35:00', '2020-06-16'),
(12, 5, '324', NULL, 2, 3.00, 3.00, 3.00, 0.00, 'post_paid', 'percent', 0.00, 0.00, 3.00, 0.00, 'closed', 115, '2020-06-16 15:37:45', NULL, '2020-06-16 15:36:57', '2020-06-16 15:39:01', '2020-06-16');

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

--
-- Dumping data for table `sales_invoice_installments`
--

INSERT INTO `sales_invoice_installments` (`id`, `supplier_id`, `invoice_id`, `amount`, `date`, `notes`, `status`, `created_at`, `updated_at`, `client_id`) VALUES
(1, NULL, 10, 12.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:22:13', '2020-06-16 15:24:11', 9),
(2, NULL, 10, 444.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:22:13', '2020-06-16 15:24:11', 9),
(3, NULL, 10, 555.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:22:13', '2020-06-16 15:24:11', 9),
(4, NULL, 10, 36.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:22:13', '2020-06-16 15:24:11', 9),
(9, NULL, 11, 2.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:33:58', '2020-06-16 15:34:01', 9),
(10, NULL, 11, 1.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:33:58', '2020-06-16 15:34:01', 9),
(11, NULL, 12, 1.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:36:57', '2020-06-16 15:37:45', 5),
(12, NULL, 12, 1.00, '2020-06-16', NULL, 'closed', '2020-06-16 15:36:57', '2020-06-16 15:37:45', 5);

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

--
-- Dumping data for table `sales_invoice_items`
--

INSERT INTO `sales_invoice_items` (`id`, `item_id`, `inventory_id`, `invoice_id`, `amount`, `price`, `unit_price`, `sale_price`, `purchase_price`, `notes`, `created_at`, `updated_at`) VALUES
(7, 4, 2, 1, 1.00, 60.00, 60.00, 60.00, 30.00, '0', '2020-06-08 14:02:22', '2020-06-08 14:02:22'),
(9, 2, 2, 2, 1.00, 55.00, 50.00, 55.00, 50.00, '0', '2020-06-10 14:12:47', '2020-06-10 14:12:47'),
(14, 6, 2, 5, 3.00, 43.00, 3.00, 43.00, 5.00, '0', '2020-06-16 14:56:40', '2020-06-16 14:56:40'),
(15, 6, 2, 6, 30.00, 4.00, 3.00, 4.00, 5.00, '0', '2020-06-16 15:01:21', '2020-06-16 15:01:21'),
(16, 8, 2, 6, 30.00, 1.00, 1.00, 1.00, 1.00, '0', '2020-06-16 15:01:21', '2020-06-16 15:01:21'),
(23, 7, 2, 10, 5.00, 234.00, 324.00, 234.00, 234.00, '0', '2020-06-16 15:22:13', '2020-06-16 15:22:13'),
(26, 6, 2, 11, 1.00, 4.00, 3.00, 4.00, 5.00, '0', '2020-06-16 15:33:58', '2020-06-16 15:33:58'),
(27, 8, 2, 12, 3.00, 1.00, 1.00, 1.00, 1.00, '0', '2020-06-16 15:36:57', '2020-06-16 15:36:57');

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

--
-- Dumping data for table `sales_invoice_taxes`
--

INSERT INTO `sales_invoice_taxes` (`id`, `sales_invoice_id`, `tax_id`, `total`, `amount`, `tax_type`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 10, 10, 'amount', '2020-06-08 14:02:22', '2020-06-08 14:02:22'),
(6, 2, 1, 3, 5, 'percent', '2020-06-10 14:12:47', '2020-06-10 14:12:47'),
(7, 2, 2, 10, 10, 'amount', '2020-06-10 14:12:47', '2020-06-10 14:12:47'),
(10, 4, 1, 1, 5, 'percent', '2020-06-16 14:55:51', '2020-06-16 14:55:51'),
(11, 4, 2, 10, 10, 'amount', '2020-06-16 14:55:51', '2020-06-16 14:55:51');

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
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `client_id`, `code`, `date`, `inventory_id`, `total`, `final_total`, `total_after_discount`, `discount`, `discount_type`, `discount_amount`, `total_taxes_amount`, `status`, `confirmed_by`, `confirmed_at`, `notes`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 1, 'code', NULL, 2, 120.00, 120.00, 120.00, 0.00, 'percent', 0.00, 0.00, 'new', 115, '2020-06-16 14:46:12', NULL, '2020-06-07 09:28:16', '2020-06-16 14:46:12', 1),
(4, 5, 'aaaaaa', '2020-06-16', 2, 936.00, 936.00, 936.00, 0.00, 'percent', 0.00, 0.00, 'new', 115, '2020-06-16 14:48:48', NULL, '2020-06-16 14:48:45', '2020-06-16 14:48:48', 115),
(5, 8, '1111111111111111', '2020-06-16', 2, 480.00, 480.00, 480.00, 0.00, 'percent', 0.00, 0.00, 'new', NULL, NULL, NULL, '2020-06-16 14:57:38', '2020-06-16 14:57:38', 115);

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

--
-- Dumping data for table `sales_order_items`
--

INSERT INTO `sales_order_items` (`id`, `item_id`, `inventory_id`, `invoice_id`, `amount`, `price`, `unit_price`, `sale_price`, `purchase_price`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 1, 3.00, 40.00, 40.00, 40.00, 40.00, '0', '2020-06-07 09:28:16', '2020-06-07 09:28:16'),
(7, 7, 2, 4, 4.00, 234.00, 324.00, 234.00, 234.00, '0', '2020-06-16 14:48:45', '2020-06-16 14:48:45'),
(8, 6, 2, 5, 2.00, 5.00, 3.00, 43.00, 5.00, '0', '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(9, 7, 2, 5, 2.00, 234.00, 324.00, 234.00, 234.00, '0', '2020-06-16 14:57:38', '2020-06-16 14:57:38'),
(10, 8, 2, 5, 2.00, 1.00, 1.00, 1.00, 1.00, '0', '2020-06-16 14:57:38', '2020-06-16 14:57:38');

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

--
-- Dumping data for table `sms_messages`
--

INSERT INTO `sms_messages` (`id`, `message`, `created_at`, `updated_at`) VALUES
(2, 'm', '2020-06-14 07:17:43', '2020-06-14 07:17:43'),
(3, 'ddd', '2020-06-14 08:02:37', '2020-06-14 08:02:37'),
(4, 'Dolor velit dolorem', '2020-06-14 12:12:38', '2020-06-14 12:12:38'),
(5, 'Dolor velit dolorem', '2020-06-14 12:24:16', '2020-06-14 12:24:16');

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

--
-- Dumping data for table `sms_message_phones`
--

INSERT INTO `sms_message_phones` (`id`, `sms_message_id`, `phone`, `created_at`, `updated_at`, `client_id`) VALUES
(1, 1, '01001587086', '2020-06-14 07:13:14', '2020-06-14 07:13:14', 4),
(2, 1, '+1 (504) 422-8337', '2020-06-14 07:13:14', '2020-06-14 07:13:14', 8),
(3, 1, '55464465', '2020-06-14 07:13:14', '2020-06-14 07:13:14', 1),
(4, 6, '01001587086', '2020-06-16 10:43:43', '2020-06-16 10:43:43', 12),
(5, 6, '+201159401701', '2020-06-16 10:43:43', '2020-06-16 10:43:43', 15);

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

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `address`, `phone`, `notes`, `initial_balance`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'Angela Deleon', 'hajap@mailinator.net', 'Sunt qui doloremque', '+1 (524) 966-3384', 'Modi sit facilis acc', 20.00, 5163.00, '2020-04-23 10:47:41', '2020-06-16 16:03:03'),
(4, 'Jason Hansen', 'mybib@mailinator.com', 'Ut cillum tempora im', '+1 (903) 766-5225', 'Earum nesciunt simi', 50.00, 28.00, '2020-04-23 10:58:19', '2020-06-16 11:14:56'),
(5, 'Cole Hull', 'xegyla@mailinator.net', 'Voluptate consequunt', '+1 (372) 868-2733', 'Obcaecati iste sed q', 1.00, 1.00, '2020-06-10 14:23:42', '2020-06-10 14:23:42'),
(8, '333test', '333333@queentechsolutions.net', 'ahmad tayseer', '+201159401701', NULL, 333.00, 333.00, '2020-06-16 15:56:24', '2020-06-16 15:56:30');

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

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'tax invoice percent', 5, 'percent', NULL, NULL),
(2, 'tax invoice amount', 10, 'amount', NULL, NULL);

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
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `image`, `remember_token`, `created_at`, `updated_at`, `is_super_admin`) VALUES
(1, 'admin', 'admin2@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/user/159232508073216.', NULL, '2020-04-14 12:14:07', '2020-06-16 14:31:20', 1),
(4, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(7, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(8, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(9, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(10, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(11, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(12, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(13, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(14, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(15, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(16, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(17, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(18, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(19, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(20, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(21, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(22, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(23, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(24, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(25, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(26, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(27, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(28, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(29, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(30, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(31, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(32, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(33, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(34, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(35, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(36, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(37, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(38, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(39, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(40, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(41, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(42, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(43, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(44, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(45, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(46, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(47, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(48, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(49, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(50, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(51, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(52, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(53, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(54, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(55, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(56, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(57, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(58, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(59, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(60, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(61, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(62, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(63, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(64, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(65, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(66, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(67, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(68, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(69, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(70, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(71, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(72, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(73, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(74, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(75, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(76, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(77, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(78, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(79, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(80, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(81, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(82, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(83, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(84, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(85, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(86, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(87, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(88, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(89, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(90, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(91, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(92, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(93, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(94, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(95, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(96, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(97, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(98, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(99, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(100, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(101, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(102, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(103, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(104, 'admin', 'admin@admin.com', NULL, '$2y$10$IY3HaqmxqOsXQ9ny0w27QO6S1qcBT1MqqcD9m6GeNNgHfx4YvbfbS', NULL, '/uploads/admins/159178812999449.jpg', NULL, '2020-04-14 12:14:07', '2020-06-10 09:22:09', 1),
(105, 'update test user data', 'test@test.com', NULL, '$2y$10$58gxGuEj.R47grURgtVllOnfp15f.kTSkKW/fFyUTpUyn0RxKqUiK', NULL, '/uploads/user/158824237187873.png', NULL, '2020-04-30 08:26:11', '2020-04-30 08:26:46', 0),
(106, 'user', 'user@user.com', NULL, '$2y$10$80NszjTOxLbQg/k.U9B9nO5ghviZXcSTsYx7LeDr5AHJ0pBccRk7.', NULL, '/uploads/user/159179234618230.png', NULL, '2020-06-10 10:32:26', '2020-06-10 10:36:52', 1),
(107, 'Carl Fischer', 'dipowymile@mailinator.com', NULL, '$2y$10$XaMrvqMazO/B38A2j/OHI.obSNd.Li1EYjVWBlakTav4Es6JlyyO6', NULL, '/uploads/user/159180265250934.png', NULL, '2020-06-10 13:24:12', '2020-06-10 13:24:12', 0),
(109, 'users_manager@gmail.com', 'users_manager@gmail.com', NULL, '$2y$10$csgrQ8ZdHJ43AiNjAkIbZezfp772JSP0v1Zek44XyCsLAeuZINcZm', NULL, '/uploads/user/159231073487211.jpeg', 'K70xRklMYes0Rq2L2p1RvipLTvEkyv54mutttAws6PIrKMYGlbQWAK95Pmdw', '2020-06-16 08:55:06', '2020-06-16 10:32:14', 0),
(112, 'client_manager', 'client_manager@gmail.com', NULL, '$2y$10$WucbzVMJTuS6KcjsNrv6OOjKTvvMBCtmwdUzdGmW7TL8d3Ydgr8q6', NULL, NULL, NULL, '2020-06-16 12:26:00', '2020-06-16 12:26:59', 0),
(113, 'store', 'stores_manager@gmail.com', NULL, '$2y$10$yq7Bl2g/Fx3PxepGaRb47.rZ8LhsXMZ8iJbI8pJvcFhAmOiPxTMEW', NULL, NULL, NULL, '2020-06-16 13:54:52', '2020-06-16 13:54:52', 0),
(114, 'marketing_user', 'marketing_user@gmail.com', NULL, '$2y$10$QOQLKoHeFFJeXnO8otAIEul389n4DM4vxwzpyGW3WY4IP4.HFrb/q', NULL, '/uploads/user/159232400737616.jpeg', NULL, '2020-06-16 14:13:27', '2020-06-16 14:13:27', 0),
(115, 'sales_manager', 'sales_manager@gmail.com', NULL, '$2y$10$XONPqVD55vW.a5NFcNaW3OVnfS3ZxrZohdP6SdgDa4fvIKqjUBvvG', NULL, '/uploads/user/159232502744814.', NULL, '2020-06-16 14:30:27', '2020-06-16 14:30:27', 0),
(116, 'purchas_invoices_manager@gmail.com', 'purchas_invoices_manager@gmail.com', NULL, '$2y$10$1KCBh.nA.GLpabSOIhVKku8ihk8t8QsIXjN/8fVAoWyQ9AH6SHksm', NULL, '/uploads/user/159232999979733.png', NULL, '2020-06-16 15:53:19', '2020-06-16 15:53:19', 0),
(117, 'setting_manager', 'setting_manager@gmail.com', NULL, '$2y$10$lbF5x//13sFZT.XF7KSPJOPtDLTHkYkdKUxP8BJq87Fz/xpddJX0.', NULL, '/uploads/user/159233138979613.jpg', NULL, '2020-06-16 16:16:29', '2020-06-16 16:16:29', 0),
(118, 'logs_manager', 'logs_manager@gmail.com', NULL, '$2y$10$TveuiqVd4GLHboLuSk5tG.xi.eLRmAsGfJxPnd5G1uJ.6hLlS6xu2', NULL, '/uploads/user/159233215176714.jpeg', NULL, '2020-06-16 16:29:11', '2020-06-16 16:29:11', 0);

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
  `label` text COLLATE utf8mb4_unicode_ci,
  `value` text COLLATE utf8mb4_unicode_ci,
  `sort` int(11) NOT NULL DEFAULT '0',
  `cols` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `type`, `options`, `created_at`, `updated_at`, `label`, `value`, `sort`, `cols`) VALUES
(1, 'item_status', 'checkbox', 'class=\"form-check\" ', NULL, NULL, 'for_sale', 'sale', 1, 'col-md-6'),
(2, 'item_status', 'checkbox', 'class=\"form-check\" ', NULL, NULL, 'for_rent', 'rent', 2, 'col-md-6'),
(3, 'width', 'number', 'class=\"form-control\" ', NULL, NULL, 'width', NULL, 3, 'col-md-6'),
(4, 'height', 'text', 'class=\"form-control\" ', NULL, NULL, 'height', NULL, 4, 'col-md-6');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `client_interests`
--
ALTER TABLE `client_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `collection_items`
--
ALTER TABLE `collection_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `connection_ways`
--
ALTER TABLE `connection_ways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `connection_way_statuses`
--
ALTER TABLE `connection_way_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item_variations`
--
ALTER TABLE `item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lead_comments`
--
ALTER TABLE `lead_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `lead_operations`
--
ALTER TABLE `lead_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lead_users`
--
ALTER TABLE `lead_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_ways`
--
ALTER TABLE `marketing_ways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `page_messages`
--
ALTER TABLE `page_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_items`
--
ALTER TABLE `payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `purchase_installments`
--
ALTER TABLE `purchase_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_invoice_items`
--
ALTER TABLE `purchase_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales_invoice_installments`
--
ALTER TABLE `sales_invoice_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sales_invoice_taxes`
--
ALTER TABLE `sales_invoice_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_messages`
--
ALTER TABLE `sms_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sms_message_phones`
--
ALTER TABLE `sms_message_phones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

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
