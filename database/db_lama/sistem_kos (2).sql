-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2026 at 01:17 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_kos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-dam@gmail.com|127.0.0.1', 'i:1;', 1782124831),
('laravel-cache-dam@gmail.com|127.0.0.1:timer', 'i:1782124831;', 1782124831),
('laravel-cache-damun@gamail.com|127.0.0.1', 'i:1;', 1782180718),
('laravel-cache-damun@gamail.com|127.0.0.1:timer', 'i:1782180718;', 1782180718),
('laravel-cache-damun@gamil.com|127.0.0.1', 'i:1;', 1782180706),
('laravel-cache-damun@gamil.com|127.0.0.1:timer', 'i:1782180706;', 1782180706);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `penyewa_id` bigint UNSIGNED NOT NULL,
  `pemilik_id` bigint UNSIGNED NOT NULL,
  `kos_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `penyewa_cleared_at` timestamp NULL DEFAULT NULL,
  `pemilik_cleared_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `penyewa_id`, `pemilik_id`, `kos_id`, `created_at`, `updated_at`, `penyewa_cleared_at`, `pemilik_cleared_at`) VALUES
(1, 27, 35, 40, '2026-06-24 09:15:55', '2026-06-24 09:15:55', NULL, NULL),
(2, 27, 25, 31, '2026-06-24 10:06:07', '2026-06-24 10:06:07', NULL, NULL),
(3, 37, 35, 40, '2026-07-05 12:37:05', '2026-07-05 12:37:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `chat_id`, `sender_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 27, 'halo', 1, '2026-06-24 09:16:07', '2026-06-24 09:23:53'),
(2, 1, 35, 'KNPA YA KAK?', 1, '2026-06-24 09:24:06', '2026-06-24 09:24:22'),
(3, 1, 27, 'P', 1, '2026-06-25 04:01:43', '2026-06-27 11:57:49'),
(4, 1, 35, 'halo kak ada yg bisa saya bantu?', 0, '2026-06-29 04:04:24', '2026-06-29 04:04:24'),
(5, 3, 37, 'Halo Pak, Apakah Sudah bisa di tempati Kamar nya saya sudah membayar dan sudah terverifikasi', 1, '2026-07-05 12:38:10', '2026-07-05 12:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamars`
--

CREATE TABLE `kamars` (
  `id` bigint UNSIGNED NOT NULL,
  `kos_id` bigint UNSIGNED NOT NULL,
  `nama_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `harga` bigint NOT NULL,
  `tipe_harga` enum('bulanan','tahunan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('tersedia','terisi') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tersedia',
  `foto` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fasilitas` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamars`
--

INSERT INTO `kamars` (`id`, `kos_id`, `nama_kamar`, `deskripsi`, `harga`, `tipe_harga`, `status`, `foto`, `created_at`, `updated_at`, `fasilitas`) VALUES
(90, 29, '1', 'Air dan Listrik sudah include &  Maksimal 2 orang', 800000, 'bulanan', 'tersedia', '[\"kamar/6G4BMA66G5DvyGSjcLVz99gk9IPilrrTSdB0k8ZL.jpg\", \"kamar/5WnkcLeZZFFOYakxpBMtskZQzUehYSj1EkwriLnJ.jpg\", \"kamar/d3Bjk6qNy9myPiGA7Hy6g0FldFJz4dq08wLSGZGK.jpg\"]', '2026-06-15 23:08:35', '2026-06-15 23:08:35', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(91, 29, '2', 'Air dan Listrik sudah include & Maksimal 2 orang', 800000, 'bulanan', 'tersedia', '[\"kamar/bj3o5ztoleRfQw7aqQnEd03Sv0KBGwEQqURMQTQj.jpg\", \"kamar/RQNm5tZAhBW3wAFxBJcoPPVNxVAX9f6yaMvsgOix.jpg\", \"kamar/agtIH2tTgcrZJYEwsCX6hRlNH8QVaUYQSm24qych.jpg\"]', '2026-06-15 23:09:42', '2026-06-15 23:09:42', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(92, 29, '3', 'Air dan Listrik sudah include & Maksimal 2 orang', 8000000, 'tahunan', 'tersedia', '[\"kamar/pIhQ330YqMUCg75APQqX7lD6MoWMdO6dUYyXBmyA.jpg\", \"kamar/IF4KB18ZqaTWTq6Llkh0gJeaEqxwyf2VpIafVwHo.jpg\", \"kamar/YhblpvXIE5kUunC0Psewfv1En7YGZHLnmAobeqYa.jpg\"]', '2026-06-15 23:11:34', '2026-06-16 01:50:26', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\"]'),
(93, 30, '1', NULL, 800000, 'bulanan', 'tersedia', '[\"kamar/xz7iwi5I5usFCKoQkdS7qbvQsyza8NFOvwIqbuDQ.jpg\", \"kamar/xcjJwQmijQzm17emuChQ3teZhm7rSrKxHMmRgOSX.jpg\", \"kamar/1NbPqaR5OpmyH9NxIupysplY0JTutlVSq9peOHIi.jpg\"]', '2026-06-15 23:35:38', '2026-06-15 23:39:30', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(94, 30, '2', 'sudah include air dan listrik', 7000000, 'tahunan', 'tersedia', '[\"kamar/OYVnaV5gZrTbRPblNYGbpnG20pVov81qAophstBe.jpg\", \"kamar/z345QiOQXXkCZG9YcGYtExYZnWlIkYU6FSjinxO9.jpg\", \"kamar/GaaOEafdi9tWqGEC9puNIO67Sz07JeJO34BYgULS.jpg\"]', '2026-06-15 23:37:06', '2026-06-15 23:39:20', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(95, 30, '3', 'sudah include air dan listrik', 800000, 'bulanan', 'tersedia', '[\"kamar/aKDsr0Lj5csPriKP0ivC6u8ewG7ly6i4QUalEszx.jpg\", \"kamar/Iesa9fdoE7RZKqEgX9y18yyuxtFmnDnYmGSQc3wB.jpg\", \"kamar/lJfOlul1WlKiJ2HcRuSbNdxuD2rqDqUn9EZcSoQN.jpg\"]', '2026-06-15 23:37:48', '2026-06-15 23:39:02', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(96, 30, '4', 'sudah include air dan listrik', 800000, 'bulanan', 'tersedia', '[\"kamar/GlsJPTwUA9vlTzLRaar5wpXtkEashqCDN8SviOHM.jpg\", \"kamar/fHExXfQsINSsCMsYj81whefBOgaETfwb1zImhvNO.jpg\", \"kamar/w2deZ9IrPHLpN0JG6mh7UjWvwyyOW7TwpIEs8hhr.jpg\"]', '2026-06-15 23:38:51', '2026-06-15 23:38:51', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(97, 30, '5', 'sudah include air dan listrik', 800000, 'bulanan', 'tersedia', '[\"kamar/sVvyK6TfnVRYEtyASBi2RQH0ZFJX14NONCtgZVA3.jpg\", \"kamar/L3gvPfRt1ezzWZ6Yx19b5Pnn8Y4IqllhpKmsekwg.jpg\", \"kamar/bBOwZpffbw5T5qNf6BwNAxN77JRGeRCh9dYo6ZIp.jpg\"]', '2026-06-15 23:41:35', '2026-06-15 23:41:35', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(98, 30, '6', 'sudah include air dan listrik', 800000, 'bulanan', 'tersedia', '[\"kamar/35lB6FkBH22c989T4YXq3cbcxMIPyqcwnBoZYfDL.jpg\", \"kamar/MgRZPtBWKZi24hiLFFPu0eelhJQ1MmyKW5YjaxZj.jpg\", \"kamar/kFVHNDqOCJJjq0n8j87GNnNO4S1EKTUKXawIJDt8.jpg\"]', '2026-06-15 23:42:33', '2026-06-15 23:42:33', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(99, 31, '1', 'sudah termasuk include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/uUABTnK0x7IBxpgB8WKC4hmbNk5IdclHPsqLiKrO.jpg\", \"kamar/p9N0eePuUIBicT2edglfmhj7KaUbnH6plOnFQOYj.jpg\", \"kamar/eAG4CJXaxNV2ApltLiEp4AYPnfU362CUIrnzJR7Q.jpg\"]', '2026-06-16 00:12:01', '2026-06-28 02:12:08', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(100, 31, '2', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/HDFasZ3lwZncMR4XNSEwnZfQNVqxim5IXKmSNvxT.jpg\", \"kamar/WCC6tD1IzVK3sqi9TCDMDW3OD6UegxvbedF9ukWE.jpg\", \"kamar/85P4BrW4klxePfEYWzPF0YTKfVSxP9E9WoVZykNy.jpg\"]', '2026-06-16 00:12:36', '2026-06-16 00:12:36', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(101, 31, '3', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/ADpuhige2fiSIjBsA10xIMBvZJCvXBb0o3lT9Ust.jpg\", \"kamar/PFF76KSl48cWdymzU53A9hdr6NoGpXWSSaNmnhVU.jpg\", \"kamar/wECEfyz3ik1EdpZDV48p0jLkuzSoyVOllwDYKgOZ.jpg\"]', '2026-06-16 00:13:11', '2026-06-16 00:13:11', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(102, 31, '4', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/hXmIPzsHQ8O1a2TTNKiMjTCh0nhgOlkhZIVNOK3M.jpg\", \"kamar/h9dDDrOIrWWyOrNebuqNrLndxOnBI51ln7S1PiEI.jpg\", \"kamar/2bD9vayxUAYbb013xAfSn0i4lMfAqbNOGJjNbr97.jpg\"]', '2026-06-16 00:13:45', '2026-06-16 00:13:56', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\"]'),
(104, 31, '6', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/jV93EPfsyARyWClflh64EkhU0DQ11XNtyhlsESPS.jpg\", \"kamar/xnCa2p1ZNiLu4uzkG8OaQXhhHHb0kG2RNgRxg2a3.jpg\", \"kamar/JflwPEphf875IGBJqkLTar84lk4uxX3btYCgLjDT.jpg\"]', '2026-06-16 00:15:11', '2026-06-16 00:15:11', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(105, 31, '7', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/KOzcxWn4NXaFa1IJNosb7dQNOCAwhdRbZNX6LWDQ.jpg\", \"kamar/FhYevnqInmipn1zANrGolkmXyI1lsrkjfICsyn0j.jpg\", \"kamar/JcrBlO0swgIzqKIIdoGoCpWskTTSaXpSrb76tKek.jpg\"]', '2026-06-16 00:15:41', '2026-06-16 00:15:41', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(106, 31, '8', 'sudah include air dan listrik', 600000, 'bulanan', 'tersedia', '[\"kamar/mgrIB4ptlJewHo9HJUspRAt3tcPkznj55Melp2KT.jpg\", \"kamar/39CsTLrazqeRoWcKMaWu9FI89AqK60nHOBEFVkel.jpg\", \"kamar/MCTOfV3MHEv5XNdmKZqxQQYTTW3YuUjZjktUNaP9.jpg\"]', '2026-06-16 00:16:34', '2026-06-16 00:16:34', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(107, 33, '1', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 600000, 'bulanan', 'tersedia', '[\"kamar/NBua0UErk4wIXK3U1vNhaPZCETAxZHeDc9nqboP5.jpg\", \"kamar/PDQKKzzclVkqU4mvLdsxWYH7G3GPnrpT7h6CHba9.jpg\", \"kamar/hwgIS8VmSrf3JtHcUK6snNEKs6XQIWSdDu7uH1co.jpg\"]', '2026-06-16 01:01:28', '2026-06-16 01:01:28', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(108, 33, '2', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 600000, 'bulanan', 'tersedia', '[\"kamar/Qt5dSx0vR92AUIaP2mwrs8wOxeDntvkDUYiOnbTL.jpg\", \"kamar/mhtJKxfOJDK5ebU7WYr8lSdYR5ZEBgpHq4WAY52m.jpg\", \"kamar/zuBWZJy1IP3d2HqBaIrAr2DiUFzUh8LJJRakYjRZ.jpg\"]', '2026-06-16 01:02:11', '2026-06-16 01:02:11', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(109, 33, '3', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 600000, 'bulanan', 'tersedia', '[\"kamar/xeXQKfY7tPFNhsEcoyGlfNtZ1velHnlI4dz6Ul4W.jpg\", \"kamar/33PvvsvNgaiUS3wVViVm2o4RnxHidp8mwajLjcXy.jpg\", \"kamar/gGMn24iE5AzmfS9I6jtFsTLp8hgTexqPgx9DLBIx.jpg\"]', '2026-06-16 01:03:01', '2026-06-16 01:03:01', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(110, 34, 'A3', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 750000, 'bulanan', 'tersedia', '[\"kamar/8so8JzwikUEOpV1mZ7SFgWtJSv0AFVSM7gzWvVhf.png\", \"kamar/wyxFf1yqHYaZNOmK8DdKRZACsZuyo5rffA7DWOeD.jpg\"]', '2026-06-16 01:31:24', '2026-06-16 01:31:24', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(111, 34, 'A5', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 750000, 'bulanan', 'tersedia', '[\"kamar/dNeNJiFgyk07dYXruDXCHx1L4HedVWlPlrHUF6b7.png\", \"kamar/iTjFrHY8XqSlIVHsuu0ESE3muvvoXS8H5kaCCCPG.jpg\"]', '2026-06-16 01:32:01', '2026-06-16 01:32:01', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(112, 34, 'A2', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 750000, 'bulanan', 'tersedia', '[\"kamar/JOhkBEObd7Zuq5XchBXcaNsUOBiBwfgHMmB312SU.png\", \"kamar/wt7UtMzioD6GKDLGiJFbWcOhUT85osJm8pYuxWDC.jpg\"]', '2026-06-16 01:32:32', '2026-06-16 01:32:32', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(113, 35, '01', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 650000, 'bulanan', 'tersedia', '[\"kamar/YTf2475QEbCrEmDJCECkszHpznuW0Tb8Oj5BFfJn.png\", \"kamar/Voz0uvIuXqdGExgncWmfsIJVYGg34lhZKiqlf90G.jpg\"]', '2026-06-16 01:45:28', '2026-06-16 01:46:56', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\"]'),
(114, 35, '02', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 650000, 'bulanan', 'tersedia', '[\"kamar/uVPUhx6GXA9b5JZPLVkoKeQcyM4EHmMoGFYWvApI.jpg\", \"kamar/HXBSxVZJIE7nRX9a3IPvWbvswSiHnGPaJ9sjYhJU.png\"]', '2026-06-16 01:46:23', '2026-06-16 01:46:42', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\"]'),
(115, 35, '03', 'Biyaya terseubut sudah include air dan listrik dan fasilitas lain nya', 650000, 'bulanan', 'tersedia', '[\"kamar/z4Ljh2WClP8oZ7pKTShfyo975i9IFY3Ob7YVMQuC.png\", \"kamar/L0jNBWZuM2ygdDTrzKVo4eCjNTH5yp2zBDSgxFeW.jpg\"]', '2026-06-16 01:47:46', '2026-06-16 01:47:46', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(116, 36, '1', 'Biyaya terseubut sudah include air,listrik dan fasilitas lain nya', 600000, 'bulanan', 'tersedia', '[\"kamar/URK0oJFYTlsyhp6wSJUKKgwRkgqgs9fmYFPhRup4.jpg\", \"kamar/X42WQvlYLApxvFSDHcIrGcx8dsuUQZkgbohVM8nU.jpg\", \"kamar/PrUYoGasUkDKhcdtTYPwk5IAw8B5lznRT58PomPT.jpg\"]', '2026-06-16 02:21:01', '2026-06-16 02:21:01', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(117, 36, '2', 'Biyaya terseubut sudah include air, listrik dan fasilitas lain nya', 600000, 'bulanan', 'tersedia', '[\"kamar/AYYFRcMBVqjYTZgUxmOfNbansGJCzTDmtZXDbgwY.jpg\", \"kamar/79YApTAvuegxEPKEvwJZLCcxBmDli2P97uf4O8bG.jpg\", \"kamar/EShLMVTx34x0kffTmQYSnefKiJXOcP9lJCh1JWg7.jpg\"]', '2026-06-16 02:21:44', '2026-06-16 02:21:44', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(118, 36, '3', 'Biyaya terseubut sudah include air, listrik dan fasilitas lain nya', 6800000, 'tahunan', 'tersedia', '[\"kamar/IX2nAohpUHbDjs9vNxRHYE8Kd4aF6y4Er1EPSRxX.jpg\", \"kamar/SRdgAjN47cppiCnuq7WWfsKMT8dEPk18eSYAbIo8.jpg\", \"kamar/tco7zlNRiuCepVN9GqiNCGYg2W8HaIrHmtgvpWWn.jpg\"]', '2026-06-16 02:22:34', '2026-06-16 02:22:34', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(119, 37, 'A01', 'Biayaya Kamar Sudah termasuk Air,listrik dan fasilitas lainnya', 600000, 'bulanan', 'tersedia', '[\"kamar/KzsW1GnctkXBe2P94zywCN5t7cAj3FnNFKmDAaaE.jpg\", \"kamar/LwPZXLiVzeqsoQpyA9pGl15c2QhU2sDKJ9RX9edF.jpg\", \"kamar/juf6hk3gXvdRQbgWLWgUculp2kghtKbSQe6IMqm3.jpg\"]', '2026-06-16 05:09:04', '2026-06-16 05:09:04', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(120, 37, 'A02', 'Biayaya Kamar Sudah termasuk Air,listrik dan fasilitas lainnya', 600000, 'bulanan', 'tersedia', '[\"kamar/L7FDBvzx4fUG3nc0udj0tFR4bI5Sa5tutDe6hEWr.jpg\", \"kamar/rvLAkfGlLtlDtIfOLXkXVqu4xnzfUGM3NU3xdkDJ.jpg\", \"kamar/ZUyaZj0tAG1FdRmxaWFJXl9zLXAGnqA6ClPRTQgi.jpg\"]', '2026-06-16 05:09:33', '2026-06-16 05:09:33', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(121, 37, 'A03', 'Biayaya Kamar Sudah termasuk Air,listrik dan fasilitas lainnya', 600000, 'bulanan', 'tersedia', '[\"kamar/jBWEmbFOaU9EcfXBwiRBSiGBPsSOhUf1W5XcmrC7.jpg\", \"kamar/PE4mjgMvBy2BNOZYBYEjirLvWIR6dJmXWqygPGI4.jpg\", \"kamar/ZpSWeeBzA2n8gfDPJipZJxv3dytDdbJbSauKUulG.jpg\"]', '2026-06-16 05:10:06', '2026-06-16 05:10:06', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(122, 39, '01', 'Biyaya Kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/IC8CvLETx8C8cT04pZB3S9YgEYPaAqrDgWPsWLRq.jpg\", \"kamar/kUm2QRDQ3oA3AKdfQTdg9fydrw68gqXch4Rk0hqu.jpg\", \"kamar/3rS19O2Dey5LHRhqyMWJjaOqVqKfdTviMsCrwbK8.jpg\"]', '2026-06-22 09:25:47', '2026-06-22 09:25:47', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(123, 39, '02', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/Z8qEqKTzWGCotMT03X62qEIVoITKHgTgLivTeRH8.jpg\", \"kamar/in1DpsMfIKLWbMebtH6mKdXbJyo7zJ4SakwRk9iF.jpg\", \"kamar/VclihsrwI3ODtwv6oD8DiYIqB6JtrLb0Amsu8GiB.jpg\"]', '2026-06-22 09:27:51', '2026-06-22 09:27:51', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(124, 39, '03', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/uLuSsS3Yg4MfQJ62T7QXQQa7i6N51yCQm2Zcjjs5.jpg\", \"kamar/RCH8zX8m3M8gfx4i9B7HrwIB0u0ruzCpsqA4A4Pi.jpg\", \"kamar/53gcbZ513u4an171mvHgmHAOKEawqJnZWty2eQ84.jpg\"]', '2026-06-22 09:28:42', '2026-06-22 09:28:42', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(125, 39, '04', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/bj4g118n8KEB8dLZOdBYtlibousppTP7x3j9TyAA.jpg\", \"kamar/SV49poisCGVGxVnVbdLPebRxismww9YTGV1oo4HP.jpg\", \"kamar/lKfky6ztKLQbGa9CnJUSmFKjgoGKJU9yURmNIpFT.jpg\"]', '2026-06-22 09:30:32', '2026-06-22 09:30:32', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(126, 39, '05', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/yMhAUqPd98VAK7AEnkWVAaP5V2L8SrFtfYNU93vz.jpg\", \"kamar/eypJplykBYwCci2zr0lOfj5ed4EXJfez5mqyT8Eh.jpg\", \"kamar/BMjpCowkbvHtmMrpTPrDRDC0UlD3KbEUHs5NnUoB.jpg\"]', '2026-06-22 09:38:28', '2026-06-22 09:38:28', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\"]'),
(127, 39, '06', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/5dVBmw1AB30mn1PxT0xxTOBCoYuSMRVpg9IniAcH.jpg\", \"kamar/HCsJNNq1GKOoCVcwTsl930Ti5rAMYfegVR25nJyo.jpg\", \"kamar/dlL5cRIkrfX0tUKAdu9V5HsB5s9q3wJix8x8OND7.jpg\"]', '2026-06-22 09:39:16', '2026-06-22 09:44:26', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\"]'),
(130, 40, 'A03', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/W7J58ouEEIt5c6Nd6IVpg4cqwKk3bxMBM4t2j4zQ.jpg\", \"kamar/YvNU5iPiJAfkRCoSWW0XBEIZTO81UmVKpcBNYNHi.jpg\", \"kamar/zzgqKJ2zfb6WU9HqUzFtOMcmfrBLQWMMt85Dcsfv.jpg\"]', '2026-06-22 09:53:31', '2026-06-22 09:53:31', '[\"Kamar Mandi Dalam\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(131, 40, 'A04', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/VSFFXzRamqT4MWq1ivn3QLAnjSKK3M8QOivtWxRO.jpg\", \"kamar/RI2OKZfAmpyIuv1v32cuKifBhtuYwpNgDAwPStYO.jpg\", \"kamar/8HWjQdaHj3VX7zvbRFH0IEtOcfiKTMdTSNkMH9y9.jpg\"]', '2026-06-22 09:54:14', '2026-06-22 09:54:14', '[\"Kamar Mandi Dalam\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(132, 40, 'AC 01', 'Biyaya kamar sudah termasuk listrik & PDAM', 1000000, 'bulanan', 'tersedia', '[\"kamar/M8Y2F8UhBYTxhAmm3M4QP7J2vHM6ESEdzgFQi7hF.jpg\", \"kamar/nCSjFxZRPFwQRxK0Z2SFXxSQrJusQSYtcQGQzpDx.jpg\", \"kamar/1uvJU83C2cVGolBEaolS7DouLHUjdWaVhKNqjvlu.jpg\"]', '2026-06-22 09:55:41', '2026-06-22 09:55:41', '[\"Kamar Mandi Dalam\", \"AC\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(133, 40, 'AC 02', 'Biyaya kamar sudah termasuk listrik & PDAM', 1000000, 'bulanan', 'tersedia', '[\"kamar/GnJlinc66QG4zqGG9TrV3Ueuzu2uTfxxOoAFxjIQ.jpg\", \"kamar/a6mGRLirwoFdjqykoRVBcHBcSpsFzROgjpcAldQj.jpg\", \"kamar/yHAlXvoZ8s5tD1nhZynt3ZndM0DnfFfXdiwnWNy9.jpg\"]', '2026-06-22 09:56:35', '2026-06-22 09:56:35', '[\"Kamar Mandi Dalam\", \"AC\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(134, 40, 'A01', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'terisi', '[\"kamar/46AHS0A0wpojnCFcgvi9NnCK1jqmzLBY5JfqwRmk.jpg\", \"kamar/gl60Fk21wD1gnyCymdfxK0Lo5WdSr4nf97OBfhfP.jpg\", \"kamar/tyfGcQrL0xmCJNmAaB5YGfyjSurpmmipZJnxg0hL.jpg\"]', '2026-06-27 11:32:58', '2026-06-27 12:26:24', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]'),
(135, 40, 'A02', 'Biyaya kamar sudah termasuk listrik & PDAM', 600000, 'bulanan', 'tersedia', '[\"kamar/8TJLzIZrHuTyxfG8Yq9WSDrT3tLoooU9J5M4cPOI.jpg\", \"kamar/94j4dswfTPj4rhbEZMJQ0qfanwfJkRckGpEEk7ot.jpg\", \"kamar/Bxhi5HE1H6ZLJ2Cdeu72wUKbOrruWM9JU0wdKmGj.jpg\"]', '2026-06-27 12:16:31', '2026-06-27 12:16:31', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\"]');

-- --------------------------------------------------------

--
-- Table structure for table `kos`
--

CREATE TABLE `kos` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama_kos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_kos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `fasilitas` json DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('menunggu','disetujui','ditolak','nonaktif') COLLATE utf8mb4_unicode_ci DEFAULT 'menunggu',
  `tanggal_verifikasi` timestamp NULL DEFAULT NULL,
  `edit_request_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak_ada',
  `edit_request_data` json DEFAULT NULL,
  `edit_request_alasan` text COLLATE utf8mb4_unicode_ci,
  `edit_requested_at` timestamp NULL DEFAULT NULL,
  `alasan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kos`
--

INSERT INTO `kos` (`id`, `user_id`, `nama_kos`, `lokasi`, `tipe_kos`, `deskripsi`, `fasilitas`, `foto`, `status`, `tanggal_verifikasi`, `edit_request_status`, `edit_request_data`, `edit_request_alasan`, `edit_requested_at`, `alasan`, `created_at`, `updated_at`, `is_read`, `latitude`, `longitude`) VALUES
(29, 22, 'RIA KOST', 'Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Putri', 'KOS DEKAT KAMPUS POLINDRA', '[\"Parkir\", \"CCTV\", \"Dapur\", \"Wifi\"]', '[\"kos\\/gMpPMw6bPjBAsCM6zMlnVAs7DSKS0arvRTwVE5TF.jpg\",\"kos\\/DXhHeRuk8ShTMdCskSpOZ6JSRV0qM6ZvIHCTs7yw.jpg\"]', 'disetujui', '2026-06-15 23:05:09', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-15 23:02:47', '2026-06-15 23:05:26', 1, '-6.4005784', '108.2100865'),
(30, 24, 'SS KOST', 'Jl. Raya Lohbener Lama Blok Bukasem, RT.022/RW.005, Lohbener, Kabupaten Indramayu', 'Putri', 'sekitar 300 meter utara Politeknik Negeri Indramayu / Polindra.', '[\"Parkir\", \"CCTV\", \"Dapur\", \"Wifi\"]', '[\"kos\\/WijQeAqSFbTIMtXIG4dk6A2vJMNSNFJpQIOSv3MS.jpg\",\"kos\\/RKp4yaaNfzls1ab8QvdzrLo4h3SkM3ehvOJwM2lB.jpg\",\"kos\\/nmtECbHRY22LE8GDZAZg21WgeyXzTXWRaYmR5Txv.jpg\"]', 'disetujui', '2026-06-15 23:43:20', 'disetujui', '{\"foto\": [\"kos/WijQeAqSFbTIMtXIG4dk6A2vJMNSNFJpQIOSv3MS.jpg\", \"kos/RKp4yaaNfzls1ab8QvdzrLo4h3SkM3ehvOJwM2lB.jpg\", \"kos/nmtECbHRY22LE8GDZAZg21WgeyXzTXWRaYmR5Txv.jpg\"], \"lokasi\": \"Jl. Raya Lohbener Lama Blok Bukasem, RT.022/RW.005, Lohbener, Kabupaten Indramayu\", \"latitude\": \"-6.4005784\", \"nama_kos\": \"SS KOST\", \"tipe_kos\": \"Putri\", \"deskripsi\": \"sekitar 300 meter utara Politeknik Negeri Indramayu / Polindra.\", \"fasilitas\": [\"Parkir\", \"CCTV\", \"Dapur\", \"Wifi\"], \"longitude\": \"108.2100865\"}', NULL, '2026-06-15 23:42:57', NULL, '2026-06-15 23:27:21', '2026-06-15 23:43:57', 1, '-6.4005784', '108.2100865'),
(31, 25, 'KOS HJ RONI', 'Jl. Raya Lohbener, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Putri', 'Dekat Kampus Politeknik Negeri Indramayu / Polindra', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/9GuxpAFSoLgsINhKJkeDCKh15XhzkPvKz1sMm146.jpg\",\"kos\\/RVKdruOY535PCAp3lncgUAvgGbPR7ls6J4ABWYYr.jpg\"]', 'disetujui', '2026-06-16 00:03:32', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 00:02:50', '2026-06-16 00:03:48', 1, '-6.4005784', '108.2100865'),
(33, 28, 'AMI AMI KOST', 'Jl. Raya Lohbener No.47, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Campur', 'Lingkungan bersih aman dan nyaman , karna di lengkapi dengan pagar berlapis 2, dan kebersihan', '[\"Parkir\", \"CCTV\", \"Mushola\", \"Dapur\", \"Wifi\"]', '[\"kos\\/XDviUD8qmjCZdFLUqNS1PkF3G18OMVI7k36xbVuI.jpg\",\"kos\\/MJWgPT03xzPK7PQaxq1surGbB7rN7ERwiE3GypGC.jpg\",\"kos\\/DviwXZTealJk8KqwsgJdgnI6tVULmuFMoJaVzV8C.jpg\"]', 'disetujui', '2026-06-16 00:59:35', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 00:59:05', '2026-06-16 00:59:43', 1, '-6.4005784', '108.2100865'),
(34, 29, 'LARISA KOS', 'Jalan Raya Celeng, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Putri', 'KOS DEKAT KAMPUS POLINDRA', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/tgByTzyEbUU48v4d9lmDS6juEEwpl2p77XRBiYCL.jpg\",\"kos\\/llz8UiPm35HZoOfyBFjWdKiOr3Ri3XCVHnlY6gcP.jpg\"]', 'disetujui', '2026-06-16 01:30:20', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 01:29:48', '2026-06-16 01:30:20', 0, '-6.4005784', '108.2100865'),
(35, 30, 'KOS H. DERI', 'H7RM+F3G, Legok, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Putra', 'DEKAT AREA KAMPUS POLINDRA', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/NyBevvXQgm0nAg3EC56Ccr2z2APABAYYNn6kLDTn.jpg\",\"kos\\/B1tDnCZattCzrSHwfwml7ZyDWpXqeSziwKx6up6e.jpg\"]', 'disetujui', '2026-06-16 01:43:27', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 01:43:06', '2026-06-16 01:43:37', 1, '-6.4005784', '108.2100865'),
(36, 31, 'LESTARI KOS', 'H7XJ+RXX, Jalan Bypass, RT.04/RW.01, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'Campur', 'Kos dekat kampus polindra', '[\"Parkir\", \"Mushola\", \"Dapur\", \"Wifi\"]', '[\"kos\\/A9IJdZydhNUDo5MMdruB12poAHRpgP01JXGqBz4h.jpg\",\"kos\\/Wep7bZ5kJgwgqP1MPcLfh2exew16vC0AUCJ6QuAM.jpg\",\"kos\\/5kvbvXssqi7AkUI6DXXHUTfiAHPg2kHSeOLKoPNA.jpg\"]', 'disetujui', '2026-06-16 02:15:49', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 02:15:31', '2026-06-16 02:16:03', 1, '-6.4005784', '108.2100865'),
(37, 32, 'KOS PUTRI', 'Desa Lohbener, Kecamatan Lohbener, Kabupaten Indramayu, RT 022/RW 005, Jawa Barat 45252, berada di samping Kos H. Roni', 'Putri', 'Kos Dekat area Kampus Polindra', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/7UFNUnsWIx6UTBOSn9JSX5qzcEm8jy9vRSeKNy4Z.jpg\",\"kos\\/WfOiG0JXyekLTglNEcu448aB18iBiWBSQri97rmJ.jpg\"]', 'disetujui', '2026-06-16 05:07:41', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-16 05:06:49', '2026-06-16 05:07:57', 1, '-6.4005784', '108.2100865'),
(38, 34, 'KOS MAHESWARI', 'Desa krasak blok pulo RT 023 RW 005 kecamatan Jatibarang kabupaten Indramayu. Kode pos 45273 (kos Maheswari)', 'Putri', 'Kos nyaman & aman', '[\"Parkir\", \"Dapur\", \"Wifi\"]', '[\"kos\\/eqbwVjVMW6U5VLA9JuCYsghugDvevvujC42duBiK.jpg\",\"kos\\/ejqeeNiEjz5cUmkaYQp1jeMMnQRaA41A6WYGmJaB.jpg\",\"kos\\/lcPEUJ0f1Xa2XYtOnxQexAEayyKFP5UGvBKUx6NB.jpg\"]', 'ditolak', '2026-06-21 20:01:20', 'tidak_ada', NULL, NULL, NULL, 'Alamat kos berada di luar Kecamatan Lohbener, yang menjadi cakupan rekomendasi pada sistem.', '2026-06-21 19:55:56', '2026-06-21 20:01:20', 0, '-6.4005784', '108.2100865'),
(39, 33, 'KOS JURMIYAH', 'RT 022/RW 005, Blok Bukasem, Desa Legok, Kecamatan Lohbener, Kabupaten Indramayu, Jawa Barat 45273,', 'Putri', 'Kos area sekitar polindra terdekat', '[\"Parkir\", \"Wifi\"]', '[\"kos\\/1QFoz3E51jHl4lyOowqndCfhkWU62EeXLyAZFYQW.jpg\",\"kos\\/KqhjQyB6F97u2z1cEXgcvbUklyZhVNzxFsROwA6E.jpg\",\"kos\\/wgmp78HGAhY0KjIE88eudwZN1H5EpHIRUAcnsleg.jpg\"]', 'disetujui', '2026-06-22 09:23:38', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-22 09:22:45', '2026-06-22 09:24:09', 1, '-6.4005784', '108.2100865'),
(40, 35, 'KOS UNGU (RIZKI NABILAH)', 'Kos Ungu (Rizki Nabilah) (Gang Kuwu Hamzah/Blok Bukasem) Alamat: Depan POLINDRA Jl.Raya Pantura Lama Lohbener-Indramayu 45252', 'Putri', 'Kos Dekat Area kampus Polindra', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/Xss04p8juiRSxy5DdoffozOHS8AlWA8bqouvvxum.jpg\",\"kos\\/b86RASTRphHFgMSuqFQvTlEim1ZaWsWSwdxKVX3v.jpg\",\"kos\\/tins3sn3HTaw8o8ZHFbm9TYTU0Lgg1pKfNBM9Nm1.jpg\"]', 'disetujui', '2026-06-22 09:50:08', 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-22 09:49:40', '2026-06-27 11:57:36', 1, '-6.4005784', '108.2100865'),
(41, 36, 'KOS CITRA', 'Jalan Raya Lohbener Lama, Desa Legok, Kecamatan Lohbener, Kabupaten Indramayu, Jawa Barat 45252,', 'Putra', 'Kos area kampus polindra', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/mrmbcyl9ozWYW2G8GDS53oltqB77DDwv1GED0cgF.jpg\",\"kos\\/yrdb6fpizOpDnwWo6oin4TxcHL16JUH6qtz9yiK5.jpg\"]', 'menunggu', NULL, 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-22 10:04:51', '2026-06-22 10:04:51', 0, '-6.4005784', '108.2100865'),
(42, 36, 'KOS CITRA 2', 'Jalan Raya Lohbener Lama, Desa Legok, Kecamatan Lohbener, Kabupaten Indramayu, Jawa Barat 45252,', 'Putri', 'Kos Area dekat kampus polindra', '[\"Parkir\", \"CCTV\", \"Dapur\", \"Wifi\"]', '[\"kos\\/lD8BS9wBQKT69fLZJ0jeIM5J2CqFwNAkKPMWHRoy.jpg\",\"kos\\/0UZOSzG1z9ET1tkkY2LtihOdekMGzYS36NgrTKTe.jpg\"]', 'menunggu', NULL, 'tidak_ada', NULL, NULL, NULL, NULL, '2026-06-22 10:05:47', '2026-06-22 10:05:47', 0, '-6.4005784', '108.2100865'),
(43, 35, 'KOS UNGU 2', 'Rizki Nabilah, Jalan Raya Pantura Lama Gang Kuwu Hamzah, Legok (KOS UNGU : Kamar B5), KAB. INDRAMAYU, LOHBENER, JAWA BARAT, ID, 45252', 'Campur', 'KOST AREA DEKAT KAMPUS POLINDRA', '[\"Parkir\", \"CCTV\", \"Wifi\"]', '[\"kos\\/qU7c31Tq02R4QWO6OIHkIUEzSFE0MflVX52faEDH.jpg\",\"kos\\/rftar0Ypbq3uk01VMaFxpNrakauZkkcohNXyYxYu.jpg\",\"kos\\/3Tu8T4DqDgvClhsS0xTGTgjltJ6Xa8oE9eATrUkQ.jpg\"]', 'menunggu', NULL, 'tidak_ada', NULL, NULL, NULL, NULL, '2026-07-05 10:31:40', '2026-07-05 10:31:40', 0, '-6.4005784', '108.2100865');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `kos_id` bigint UNSIGNED DEFAULT NULL,
  `aktivitas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `kos_id`, `aktivitas`, `keterangan`, `created_at`, `updated_at`) VALUES
(57, 22, 29, 'Menambahkan Kos', 'RIA KOST', '2026-06-15 23:02:47', '2026-06-15 23:02:47'),
(58, 22, 29, 'Update Data Kos', 'RIA KOST', '2026-06-15 23:03:07', '2026-06-15 23:03:07'),
(59, 24, 30, 'Menambahkan Kos', 'SS KOS 2', '2026-06-15 23:27:21', '2026-06-15 23:27:21'),
(60, 24, 30, 'Update Data Kos', 'SS KOST', '2026-06-15 23:30:12', '2026-06-15 23:30:12'),
(61, 24, 30, 'Update Data Kos', 'SS KOST 1 DAN 2', '2026-06-15 23:31:23', '2026-06-15 23:31:23'),
(62, 24, 30, 'Ajukan Perubahan Data Kos', 'SS KOST 1 DAN 2', '2026-06-15 23:42:57', '2026-06-15 23:42:57'),
(63, 25, 31, 'Menambahkan Kos', 'KOS HJ RONI', '2026-06-16 00:02:50', '2026-06-16 00:02:50'),
(65, 28, 33, 'Menambahkan Kos', 'AMI AMI KOST', '2026-06-16 00:59:05', '2026-06-16 00:59:05'),
(66, 29, 34, 'Menambahkan Kos', 'LARISA KOS', '2026-06-16 01:29:48', '2026-06-16 01:29:48'),
(67, 30, 35, 'Menambahkan Kos', 'KOS H. DERI', '2026-06-16 01:43:06', '2026-06-16 01:43:06'),
(68, 31, 36, 'Menambahkan Kos', 'LESTARI KOS', '2026-06-16 02:15:31', '2026-06-16 02:15:31'),
(69, 32, 37, 'Menambahkan Kos', 'KOS PUTRI', '2026-06-16 05:06:49', '2026-06-16 05:06:49'),
(70, 34, 38, 'Menambahkan Kos', 'KOS MAHESWARI', '2026-06-21 19:55:56', '2026-06-21 19:55:56'),
(71, 33, 39, 'Menambahkan Kos', 'KOS JURMIYAH', '2026-06-22 09:22:46', '2026-06-22 09:22:46'),
(72, 35, 40, 'Menambahkan Kos', 'KOS UNGU (RIZKI NABILAH)', '2026-06-22 09:49:40', '2026-06-22 09:49:40'),
(73, 36, 41, 'Menambahkan Kos', 'KOS CITRA', '2026-06-22 10:04:51', '2026-06-22 10:04:51'),
(74, 36, 42, 'Menambahkan Kos', 'KOS CITRA 2', '2026-06-22 10:05:47', '2026-06-22 10:05:47'),
(75, 35, 43, 'Menambahkan Kos', 'KOS UNGU 2', '2026-07-05 10:31:40', '2026-07-05 10:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayarans`
--

CREATE TABLE `metode_pembayarans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama_metode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metode_pembayarans`
--

INSERT INTO `metode_pembayarans` (`id`, `user_id`, `nama_metode`, `atas_nama`, `no_rekening`, `gambar`, `status`, `created_at`, `updated_at`) VALUES
(5, 25, 'BNI', 'RONIANSYAH', '0911298765443', NULL, 'aktif', '2026-06-27 10:17:42', '2026-06-27 10:27:30'),
(6, 25, 'SEABANK', 'RONI', '8765432677', NULL, 'aktif', '2026-06-27 10:21:25', '2026-06-27 10:21:25'),
(7, 25, 'BRI', 'RONIANSYAH', '076622181888', NULL, 'aktif', '2026-06-27 10:21:54', '2026-06-27 10:21:54'),
(8, 35, 'BRI', 'Damudin', '419901009718532', NULL, 'aktif', '2026-06-27 10:40:34', '2026-06-27 10:40:34'),
(9, 35, 'BNI', 'Damudin', '1987654323455', NULL, 'aktif', '2026-06-27 10:41:05', '2026-06-27 10:41:05'),
(10, 29, 'BNI', 'LARISSA', '16543276712', NULL, 'aktif', '2026-06-27 11:34:41', '2026-06-27 11:35:42'),
(11, 29, 'BRI', 'LARISSA', '47839228371', NULL, 'aktif', '2026-06-27 11:35:07', '2026-06-27 11:35:54'),
(12, 29, 'BSI', 'LARISSA', '23338891933', NULL, 'aktif', '2026-06-27 11:35:25', '2026-06-27 11:36:07'),
(13, 22, 'BCA', 'RIANI', '2744812984422', NULL, 'aktif', '2026-06-27 11:37:54', '2026-06-27 11:37:54'),
(14, 22, 'SEABANK', 'RIANI', '12839474649911', NULL, 'aktif', '2026-06-27 11:38:29', '2026-06-27 11:38:29'),
(15, 22, 'BNI', 'RIANI', '1908765432379', NULL, 'aktif', '2026-06-27 11:38:49', '2026-06-27 11:39:13'),
(16, 30, 'BNI', 'Ahmad Deri', '235689076534', NULL, 'aktif', '2026-06-27 11:40:22', '2026-06-27 11:40:22'),
(17, 30, 'BCA', 'Ahmad Deri', '4578927635411', NULL, 'aktif', '2026-06-27 11:40:45', '2026-06-27 11:40:53'),
(18, 30, 'BSI', 'Ahmad Deri', '145768698393', NULL, 'aktif', '2026-06-27 11:41:23', '2026-06-27 11:41:34'),
(19, 31, 'BRI', 'LESTARI', '436789273901', NULL, 'aktif', '2026-06-27 11:42:32', '2026-06-27 11:42:32'),
(20, 31, 'BCA', 'LESTARI', '127893764993', NULL, 'aktif', '2026-06-27 11:43:00', '2026-06-27 11:43:00'),
(21, 31, 'BNI', 'LESTARI', '2568173635192', NULL, 'aktif', '2026-06-27 11:43:49', '2026-06-27 11:43:49'),
(22, 28, 'BCA', 'AMIKOS', '1298765765', NULL, 'aktif', '2026-06-27 11:44:55', '2026-06-27 11:46:05'),
(23, 28, 'BRI', 'AMIKOS', '2398764518', NULL, 'aktif', '2026-06-27 11:45:17', '2026-06-27 11:46:21'),
(24, 28, 'BNI', 'AMIKOS', '1678907654', NULL, 'aktif', '2026-06-27 11:45:38', '2026-06-27 11:46:36'),
(25, 24, 'BSI', 'YAHYA AULIA', '1235783926', NULL, 'aktif', '2026-06-27 11:48:03', '2026-06-27 11:48:42'),
(26, 24, 'BCA', 'YAHYA AULIA', '4521873941', NULL, 'aktif', '2026-06-27 11:48:32', '2026-06-27 11:48:32'),
(27, 24, 'BRI', 'YAHYA AULIA', '1456288963', NULL, 'aktif', '2026-06-27 11:49:00', '2026-06-27 11:49:00'),
(28, 32, 'BNI', 'DIANA PUTRI', '1289273683', NULL, 'aktif', '2026-06-27 11:51:04', '2026-06-27 11:51:04'),
(29, 32, 'BSI', 'DIANA PUTRI', '4563789112', NULL, 'aktif', '2026-06-27 11:51:29', '2026-06-27 11:51:44'),
(30, 32, 'BCA', 'DIANA PUTRI', '2347993711', NULL, 'aktif', '2026-06-27 11:52:01', '2026-06-27 11:52:01'),
(31, 33, 'BNI', 'WARTINI', '2478965411', NULL, 'aktif', '2026-06-27 11:53:21', '2026-06-27 11:53:21'),
(32, 33, 'BSI', 'WARTINI', '1467893622', NULL, 'aktif', '2026-06-27 11:54:48', '2026-06-27 11:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_15_041720_add_role_to_users_table', 1),
(5, '2026_02_16_042302_add_alamat_to_users_table', 2),
(6, '2026_02_18_010138_create_kos_table', 3),
(7, '2026_02_18_011240_add_fasilitas_to_kos_table', 4),
(8, '2026_02_18_012936_add_alasan_to_kos_table', 5),
(9, '2026_02_18_070240_create_log_aktivitas_table', 6),
(10, '2026_02_19_033111_create_kamars_table', 7),
(11, '2026_02_19_034647_add_fasilitas_to_kamars_table', 8),
(12, '2026_02_19_235004_add_photo_to_users_table', 9),
(13, '2026_02_20_223415_create_user_preferences_table', 10),
(14, '2026_02_21_020407_create_pengajuan_sewas_table', 11),
(15, '2026_02_21_023238_add_total_and_alasan_to_pengajuan_sewas', 12),
(16, '2026_02_21_025808_create_metode_pembayarans_table', 13),
(17, '2026_02_21_035020_create_pembayarans_table', 14),
(19, '2026_02_21_193944_change_foto_to_json_in_kamars_table', 15),
(20, '2026_02_22_082857_add_is_read_to_kos_and_pengajuan', 16),
(21, '2026_02_23_034943_update_status_default_on_users_table', 17),
(22, '2026_02_25_140714_add_status_notif_to_pengajuan_table', 18),
(23, '2026_02_25_220620_add_status_notif_to_pembayarans', 19),
(24, '2026_02_25_224047_add_alasan_to_pembayarans_table', 20),
(25, '2026_04_17_000001_add_verification_and_edit_request_to_kos_table', 21),
(26, '2026_04_17_120000_add_tagihan_snapshot_to_pembayarans_table', 21),
(27, '2026_04_17_000002_add_jenis_pengajuan_to_pengajuan_sewas_table', 22),
(28, '2026_04_17_000003_add_is_read_to_pembayarans_table', 22),
(29, '2026_06_02_042205_add_latitude_longitude_to_kos_table', 23),
(30, '2026_06_24_000001_create_chats_table', 24),
(31, '2026_06_29_072935_add_cleared_at_to_chats_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('agstiin0128@gmail.com', '$2y$12$G.Tvpok3FEKLeS0U2tQEQO/D2i1gLpUlSFhOdTkVxT5OmXGBVGPGC', '2026-04-09 20:18:01'),
('sitiazizah28035@gmail.com', '$2y$12$XOHVf6LXS9fNLTv6Z744IOdx0y2pAH4BszttCaNJ5lnA/GYBPVPUi', '2026-04-09 20:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint UNSIGNED NOT NULL,
  `pengajuan_sewa_id` bigint UNSIGNED NOT NULL,
  `metode_id` bigint UNSIGNED NOT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `durasi_tagihan` int UNSIGNED NOT NULL DEFAULT '1',
  `nominal_tagihan` bigint UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('menunggu','dikonfirmasi','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `alasan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_notif` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `pengajuan_sewa_id`, `metode_id`, `bukti`, `durasi_tagihan`, `nominal_tagihan`, `status`, `alasan`, `created_at`, `updated_at`, `status_notif`, `is_read`) VALUES
(49, 54, 9, 'bukti/8RNJL9iy5v5sdJ0gM9RowYONpbGXbJhlbWTuEMSl.jpg', 1, 600000, 'dikonfirmasi', NULL, '2026-06-27 12:21:56', '2026-06-27 12:26:24', 0, 0),
(50, 55, 5, 'bukti/Yqv8vc5UnNSbIuaMeG64qlTJFOD6SWwQaShMXcjW.jpg', 1, 600000, 'dikonfirmasi', NULL, '2026-06-28 02:09:34', '2026-06-28 02:12:08', 1, 1),
(51, 56, 9, 'bukti/KfhCrmzreIFZY9pSLO41Q5w0bFfYIh7i0et9PoLk.jpg', 1, 600000, 'ditolak', 'Kurang Nominal', '2026-07-05 12:13:19', '2026-07-05 13:04:38', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_sewas`
--

CREATE TABLE `pengajuan_sewas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `kos_id` bigint UNSIGNED NOT NULL,
  `kamar_id` bigint UNSIGNED NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `durasi` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `jenis_pengajuan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sewa_baru',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bayar` bigint DEFAULT NULL,
  `alasan` text COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `status_notif` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengajuan_sewas`
--

INSERT INTO `pengajuan_sewas` (`id`, `user_id`, `kos_id`, `kamar_id`, `tanggal_mulai`, `durasi`, `status`, `jenis_pengajuan`, `created_at`, `updated_at`, `total_bayar`, `alasan`, `is_read`, `status_notif`) VALUES
(54, 27, 40, 134, '2026-06-09', 1, 'aktif', 'sewa_baru', '2026-06-27 12:18:10', '2026-06-27 12:26:24', 600000, NULL, 1, 0),
(55, 37, 31, 99, '2026-05-19', 1, 'selesai', 'sewa_baru', '2026-06-28 02:08:08', '2026-06-28 02:12:08', 600000, NULL, 1, 0),
(56, 37, 40, 135, '2026-07-02', 1, 'disetujui', 'sewa_baru', '2026-07-05 10:49:05', '2026-07-05 11:51:37', 600000, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3SYbUXY5Ts5RF5ZtuMvoHAxcfU9Q8lxdH4LzA0P0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS011VUhIUHpEb1dSSWpGQnNoZ0VTNERxdkpxcEh0QXl5RXUyaDdtRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1783325418),
('gKazmOeoG9rykxfpp96ZpJQqnkiCoSyTOiURZkoC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU44MFVrcjJMb3FNNVowZkZvMDJFU2k4bllLUVdicENyNEF4YzU5RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1783325391),
('OkO406n6tlsPnZYgVPf79WRcOToXOcDFO5YAfPAw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHo0TlpZUFhEYUl6dmdOSWVMT0F0emNkVTBLcU9tdEhzRzhQc2NtRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0LXVucmVhZC1jb3VudCI7czo1OiJyb3V0ZSI7czoxNzoiY2hhdC51bnJlYWQuY291bnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783318260);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','pemilik','penyewa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'penyewa',
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `no_hp`, `alamat`, `status`) VALUES
(1, 'Admin', 'admin@kos.com', '1779505596.jfif', NULL, '$2y$12$1RdsDboSe4YOiynRICM72.fLn7FmvrUqKwVheqd07Y4lZ1pJFGSWy', NULL, '2026-02-14 21:29:20', '2026-05-22 20:06:36', 'admin', NULL, NULL, ''),
(22, 'Ria kos', 'ria@gmail.com', NULL, NULL, '$2y$12$VvRxl1tiBSLWrLgqISqpTOY1L40UZT.wMHATChluUqNu3B2PTM4Iu', NULL, '2026-06-15 22:58:07', '2026-06-15 22:58:07', 'pemilik', '08973221493', 'H7XJ+CX4, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'aktif'),
(24, 'sskos', 'sskos@gmail.com', NULL, NULL, '$2y$12$QtRYioAmdqAnT3/ALwEtZOM219zmYgvBWIe/EZDa8EPk6O4EgjW9q', NULL, '2026-06-15 23:20:23', '2026-06-15 23:20:23', 'pemilik', '0811223950', 'Jl. Raya Lohbener Lama Blok Bukasem, RT.022/RW.005, Lohbener, Kabupaten Indramayu', 'aktif'),
(25, 'Roni', 'roni@gmail.com', NULL, NULL, '$2y$12$fUfCNAc1MEmyaLi4c9wjjunHKVDbopYi.4O50pE6pAOLkfSvG1SKy', NULL, '2026-06-16 00:01:02', '2026-06-16 00:01:02', 'pemilik', '081912924538', 'Jl. Raya Lohbener, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'aktif'),
(27, 'Azizah salsa', 'sitiazizah28035@gmail.com', 'profile/S2cHvuBHd1JwdYT4UjLZflOIeNMlcImIgXm3AbCa.jpg', NULL, '$2y$12$Csb6k3Fwxx1wLcsInYkor.c2XITGDD5kXPk/T1cyrJZuyFXI9zMjG', NULL, '2026-06-16 00:30:04', '2026-06-27 12:34:43', 'penyewa', '083120870370', NULL, 'aktif'),
(28, 'ami', 'ami@gmail.com', NULL, NULL, '$2y$12$.SC46iRFBL6icrUeFxI6zerJ.3IGLTtoeDIYDG8v9VIQJt2BqcRUa', NULL, '2026-06-16 00:52:51', '2026-06-16 00:52:51', 'pemilik', '082115978173', 'Jl. Raya Lohbener No.47, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'aktif'),
(29, 'larisa', 'larisa@gmail.com', NULL, NULL, '$2y$12$sQRkkoccCnW31qFxPM.XC.APr/DktMlRcos9sYsjXYZK88Z7qOqSq', NULL, '2026-06-16 01:24:48', '2026-06-16 01:24:48', 'pemilik', '082114111667', 'Jalan Raya Celeng, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252 450,0 m', 'aktif'),
(30, 'Deri', 'deri@gmail.com', NULL, NULL, '$2y$12$AsndyAr/o7sygJfy30nFAOVdcscGBN23WQ0.vvv1nrifg.sGErife', NULL, '2026-06-16 01:39:10', '2026-06-16 01:39:10', 'pemilik', '081324448132', 'Legok, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'aktif'),
(31, 'lestari', 'lestari@gmail.com', NULL, NULL, '$2y$12$7ZBsmq2hnxAG8aSoppIYkuuwmmxxYI7bXhgJvKrPT5VtBOH2efTQe', NULL, '2026-06-16 02:00:32', '2026-06-16 02:00:32', 'pemilik', '081510770772', 'Jl.Raya Lohbener, Lohbener, Kec. Lohbener, Kabupaten Indramayu, Jawa Barat 45252', 'aktif'),
(32, 'diana', 'diana@gmail.com', NULL, NULL, '$2y$12$RQkO969ZVMI.R2DEL9Zcq.lQh823DZePFPiD94M83LQuRYZIcgzFu', NULL, '2026-06-16 05:02:52', '2026-06-16 05:02:52', 'pemilik', '0818828647', 'RT 022/RW 005, Desa Lohbener, Kecamatan Lohbener, Kabupaten Indramayu, Jawa Barat 45252, berada di samping Kos H. Roni', 'aktif'),
(33, 'Ibu wartini', 'wartini@gmail.com', NULL, NULL, '$2y$12$dTuaW1SUV.j/4jd0F4ka8.2cdVGpYI0Bj/Llgg9TbAr.QNLGR.IXi', NULL, '2026-06-16 05:12:04', '2026-06-16 05:12:04', 'pemilik', '087829855514', 'Blok Bukasem, Desa Legok, Kecamatan Lohbener, Kabupaten Indramayu, Kostan Mimi Jurmiyah (Ibu Watini), Kamar No. 01, RT 022/RW 005, Jawa Barat 45273, berada di depan rumah bercat kuning dan dekat rumah bercat abu-abu.', 'aktif'),
(34, 'Maryanti', 'maryanti@gmail.com', NULL, NULL, '$2y$12$g19myVIilKAspf2lxglw3eigDZUZlTjZFNLuOcyP7eAxtgSH7cUha', NULL, '2026-06-21 19:53:49', '2026-06-21 19:53:49', 'pemilik', '085221418041', 'Desa krasak blok pulo RT 023 RW 005 kecamatan Jatibarang kabupaten Indramayu. Kode pos 45273', 'aktif'),
(35, 'Damudin', 'damun@gmail.com', NULL, NULL, '$2y$12$wwXvRgpWD4a9h5.wZKNMje2H8jnPA/xMn3Kt/dukpT59YYRHVpPx6', NULL, '2026-06-22 09:46:52', '2026-06-22 09:46:52', 'pemilik', '083181220320', 'Jl.Raya Pantura Lama Lohbener-Indramayu 45252', 'aktif'),
(36, 'Kiki', 'kiki@gmail.com', NULL, NULL, '$2y$12$BEn2rUvKkTVLFWO4mG2IMexc054x1khqCmnpylltW0lyf5hON1U12', NULL, '2026-06-22 10:00:58', '2026-06-23 01:55:32', 'pemilik', '628312087038', 'Losari Lor, Kec. Losari, Kabupaten Brebes, Jawa Tengah 52255', 'aktif'),
(37, 'Amelia', 'amelia@gmail.com', 'profile/5PdWeKcjp3agaachMI8A3sODqQ13vzHe8AknCOEQ.jpg', NULL, '$2y$12$blVoKL35u20rBmsHmp66h.miknz2hQwiIQW98f4fy8gjXGcjpmpq.', NULL, '2026-06-27 10:34:58', '2026-07-05 13:25:30', 'penyewa', '08976544211', NULL, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `pref_harga` int DEFAULT NULL,
  `pref_tipe_kos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pref_fasilitas` json DEFAULT NULL,
  `pref_tipe_harga` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `pref_harga`, `pref_tipe_kos`, `pref_fasilitas`, `pref_tipe_harga`, `created_at`, `updated_at`) VALUES
(9, 27, 600042, 'putri,putri,putri,putri,putri', '[\"Kamar Mandi Dalam\", \"Kipas Angin\", \"Lemari Pakaian\", \"Tempat Tidur\", \"Cermin\", \"Meja\"]', 'bulanan,bulanan,bulanan,bulanan,bulanan', '2026-06-17 00:53:07', '2026-06-29 03:57:05'),
(11, 37, 601814, 'putri,putri,putri,putri,putri', '[\"Kamar Mandi Dalam\", \"Cermin\", \"Lemari Pakaian\", \"Meja\", \"Tempat Tidur\", \"Kipas Angin\"]', 'bulanan,bulanan,bulanan,bulanan,bulanan', '2026-06-28 02:06:34', '2026-07-05 13:01:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chats_penyewa_id_pemilik_id_kos_id_unique` (`penyewa_id`,`pemilik_id`,`kos_id`),
  ADD KEY `chats_pemilik_id_foreign` (`pemilik_id`),
  ADD KEY `chats_kos_id_foreign` (`kos_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_chat_id_foreign` (`chat_id`),
  ADD KEY `chat_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kamars`
--
ALTER TABLE `kamars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kamars_kos_id_foreign` (`kos_id`);

--
-- Indexes for table `kos`
--
ALTER TABLE `kos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kos_user_id_foreign` (`user_id`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_aktivitas_user_id_foreign` (`user_id`),
  ADD KEY `log_aktivitas_kos_id_foreign` (`kos_id`);

--
-- Indexes for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metode_pembayarans_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_pengajuan_sewa_id_foreign` (`pengajuan_sewa_id`),
  ADD KEY `pembayarans_metode_id_foreign` (`metode_id`);

--
-- Indexes for table `pengajuan_sewas`
--
ALTER TABLE `pengajuan_sewas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_sewas_user_id_foreign` (`user_id`),
  ADD KEY `pengajuan_sewas_kos_id_foreign` (`kos_id`),
  ADD KEY `pengajuan_sewas_kamar_id_foreign` (`kamar_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_preferences_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamars`
--
ALTER TABLE `kamars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `kos`
--
ALTER TABLE `kos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pengajuan_sewas`
--
ALTER TABLE `pengajuan_sewas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_pemilik_id_foreign` FOREIGN KEY (`pemilik_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_penyewa_id_foreign` FOREIGN KEY (`penyewa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kamars`
--
ALTER TABLE `kamars`
  ADD CONSTRAINT `kamars_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kos`
--
ALTER TABLE `kos`
  ADD CONSTRAINT `kos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_aktivitas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  ADD CONSTRAINT `metode_pembayarans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_metode_id_foreign` FOREIGN KEY (`metode_id`) REFERENCES `metode_pembayarans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayarans_pengajuan_sewa_id_foreign` FOREIGN KEY (`pengajuan_sewa_id`) REFERENCES `pengajuan_sewas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengajuan_sewas`
--
ALTER TABLE `pengajuan_sewas`
  ADD CONSTRAINT `pengajuan_sewas_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_sewas_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_sewas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
