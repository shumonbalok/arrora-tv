-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2020 at 10:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arroratube`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-music',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Tv Shows', 'Ducimus enim sit.', 'glyphicon glyphicon-blackboard', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(2, 'Movies', 'Neque culpa.', 'glyphicon glyphicon-film', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(3, 'Sports', 'Voluptatem necessitatibus.', 'glyphicon glyphicon-king', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(4, 'Songs', 'Eum facere adipisci.', 'glyphicon glyphicon-music', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(5, 'News', 'News Category', 'glyphicon glyphicon-envelope', '2020-11-11 05:50:08', '2020-11-11 05:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `user_id`, `title`, `description`, `image`, `banner`, `created_at`, `updated_at`) VALUES
('21f7c9a0-2378-418c-8455-efa84e0d6caf', 'd49c239e-dff2-4baf-9a79-70457df71e66', 'Yasmin Thiel II', 'Optio ea optio.', NULL, NULL, '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('450c2bc1-501e-4666-b4e7-e9bc5ebd0381', '37d63e47-7248-4268-af49-7d236ef4eb74', 'Mrs. Jacquelyn Cole', 'Qui facilis.', NULL, NULL, '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('f29098b1-4139-4370-b29f-54c673bf6932', '90fc4087-693a-48d0-8547-f0d3840ad8ee', 'Mable Krajcik', 'Exercitationem at.', NULL, NULL, '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('ced9637b-aef9-4380-ba77-7a83f9ff9b1d', 'fa84ab79-6ad7-43f6-9f60-775387f5f551', 'Arlene Rodriguez', 'Ratione hic.', NULL, NULL, '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('fbbdde3e-962f-4e04-b050-bc672d7946d8', 'f719f629-8ef6-4f2b-9095-000cb7c66b46', 'Asa Konopelski', 'Vitae reprehenderit.', NULL, NULL, '2020-11-08 23:33:07', '2020-11-08 23:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `video_id`, `comment_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'd49c239e-dff2-4baf-9a79-70457df71e66', 'e8f4c588-1bbf-4412-bd56-42f4baccf462', NULL, 'very nice video', '2020-11-09 00:13:09', '2020-11-09 00:13:09'),
(2, '37d63e47-7248-4268-af49-7d236ef4eb74', 'e8f4c588-1bbf-4412-bd56-42f4baccf462', NULL, 'Memorable', '2020-11-09 00:16:08', '2020-11-09 00:16:08'),
(3, '37d63e47-7248-4268-af49-7d236ef4eb74', 'e8f4c588-1bbf-4412-bd56-42f4baccf462', 1, 'Buford Oberbrunner yes', '2020-11-09 00:16:24', '2020-11-09 00:16:24'),
(5, 'd49c239e-dff2-4baf-9a79-70457df71e66', 'e8f4c588-1bbf-4412-bd56-42f4baccf462', 1, 'Dr. Murl Moen th', '2020-11-09 00:19:36', '2020-11-09 00:19:36'),
(6, '37d63e47-7248-4268-af49-7d236ef4eb74', '9ccf5e91-31ed-4494-9081-b6cb7f77567d', NULL, 'Good', '2020-11-09 00:28:39', '2020-11-09 00:28:39'),
(7, 'd49c239e-dff2-4baf-9a79-70457df71e66', '85bf77dd-bbee-402d-a24a-56a0fe2131ac', NULL, 'Love reserve here', '2020-11-13 01:14:45', '2020-11-13 01:18:46');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(31, 'default', '{\"uuid\":\"12ef1838-54ab-426b-9f9f-1bec9d919f1f\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":1:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":9:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:22:\\\"\\u0000*\\u0000conversionFileNamer\\\";O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\DefaultConversionFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"150\\\";s:6:\\\"height\\\";s:3:\\\"150\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";s:4:\\\"auto\\\";}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1605259551, 1605259551);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Channel', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'd2f3cc60-e263-4ad2-9fea-48f898407ecf', 'images', 'tweterProfile', 'tweterProfile.jpg', 'image/jpeg', 'public', 'public', 57223, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 1, '2020-11-09 02:22:45', '2020-11-09 02:22:48'),
(3, 'App\\Channel', '21f7c9a0-2378-418c-8455-efa84e0d6caf', '5003322c-314c-43cb-aeb6-0abca1fdab81', 'banner-images', 'shallow-focus-photography-of-windchimes-544986', 'shallow-focus-photography-of-windchimes-544986.jpg', 'image/jpeg', 'public', 'public', 2195727, '[]', '[]', '[]', 2, '2020-11-13 01:25:50', '2020-11-13 01:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_10_101550_create_channels_table', 1),
(5, '2020_10_12_082910_create_media_table', 1),
(6, '2020_10_14_023301_create_subscriptions_table', 1),
(7, '2020_10_17_100525_create_videos_table', 1),
(8, '2020_10_18_080435_create_jobs_table', 1),
(9, '2020_10_24_085124_create_categories_table', 1),
(10, '2020_10_24_085408_create_subcategories_table', 1),
(11, '2020_11_04_100547_create_votes_table', 1),
(12, '2020_11_06_062801_create_comments_table', 1),
(13, '2020_11_11_112707_create_video_histories_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'debitis', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(2, 3, 'aut', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(3, 4, 'expedita', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(4, 2, 'ut', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(5, 3, 'molestiae', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(6, 3, 'ut', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(7, 3, 'id', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(8, 4, 'repudiandae', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(9, 4, 'aut', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(10, 1, 'laborum', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(11, 4, 'dolorem', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(12, 2, 'quo', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(13, 3, 'aspernatur', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(14, 1, 'exercitationem', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(15, 4, 'totam', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
(16, 4, 'molestias', '2020-11-08 23:33:07', '2020-11-08 23:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `channel_id`, `created_at`, `updated_at`) VALUES
('dc9a04da-7183-4cbe-bbc1-b26cd92a1f8e', 'f719f629-8ef6-4f2b-9095-000cb7c66b46', '21f7c9a0-2378-418c-8455-efa84e0d6caf', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('1cdb4345-cce8-4d1e-8f72-8cea08d201a4', '37d63e47-7248-4268-af49-7d236ef4eb74', 'f29098b1-4139-4370-b29f-54c673bf6932', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('4f85f709-6289-4054-96b3-34c55d7ac0d3', 'd49c239e-dff2-4baf-9a79-70457df71e66', 'ced9637b-aef9-4380-ba77-7a83f9ff9b1d', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('1a6af0ed-3a7c-48c0-a784-4e18557ec1aa', 'd49c239e-dff2-4baf-9a79-70457df71e66', 'ced9637b-aef9-4380-ba77-7a83f9ff9b1d', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('7d59d482-505d-4719-8a7f-b857b1482f36', '90fc4087-693a-48d0-8547-f0d3840ad8ee', 'f29098b1-4139-4370-b29f-54c673bf6932', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('30c36e6d-095e-4051-8c54-712d63e25385', 'f719f629-8ef6-4f2b-9095-000cb7c66b46', '21f7c9a0-2378-418c-8455-efa84e0d6caf', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('6bd095e4-82dd-4d30-86f1-b992cbd900f0', 'fa84ab79-6ad7-43f6-9f60-775387f5f551', 'fbbdde3e-962f-4e04-b050-bc672d7946d8', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('dee79f77-7a9e-4754-802c-84e518581696', 'd49c239e-dff2-4baf-9a79-70457df71e66', 'ced9637b-aef9-4380-ba77-7a83f9ff9b1d', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('c4b2b1fa-d55f-4ee3-ad59-8d45a957c99d', 'f719f629-8ef6-4f2b-9095-000cb7c66b46', 'ced9637b-aef9-4380-ba77-7a83f9ff9b1d', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('cc44855c-3be2-4931-a8e0-6ed3c083c817', '37d63e47-7248-4268-af49-7d236ef4eb74', 'ced9637b-aef9-4380-ba77-7a83f9ff9b1d', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('cc71ad0f-14c2-4fb8-ae71-73d9ab4d55e1', 'f719f629-8ef6-4f2b-9095-000cb7c66b46', 'fbbdde3e-962f-4e04-b050-bc672d7946d8', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('491245c2-a40d-450f-99d0-1f02a4a4c000', '37d63e47-7248-4268-af49-7d236ef4eb74', 'fbbdde3e-962f-4e04-b050-bc672d7946d8', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('b59896d9-05e1-4a83-8109-fcde23558b1b', '37d63e47-7248-4268-af49-7d236ef4eb74', 'f29098b1-4139-4370-b29f-54c673bf6932', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('912ead70-0dff-4fcc-b9dc-dfad4914bac4', 'd49c239e-dff2-4baf-9a79-70457df71e66', '450c2bc1-501e-4666-b4e7-e9bc5ebd0381', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('3e307b33-1bce-48a8-89d4-2523f4f5a77f', 'fa84ab79-6ad7-43f6-9f60-775387f5f551', '21f7c9a0-2378-418c-8455-efa84e0d6caf', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('67b4c504-09a1-4979-a83c-8a1b097410c8', '37d63e47-7248-4268-af49-7d236ef4eb74', '21f7c9a0-2378-418c-8455-efa84e0d6caf', '2020-11-09 00:21:55', '2020-11-09 00:21:55'),
('7629899f-b08c-4a97-8fab-c5b455a8150f', 'd49c239e-dff2-4baf-9a79-70457df71e66', 'f29098b1-4139-4370-b29f-54c673bf6932', '2020-11-13 01:10:36', '2020-11-13 01:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('37d63e47-7248-4268-af49-7d236ef4eb74', 'Dr. Murl Moen', 'abdiel.zemlak@example.org', '2020-11-08 23:33:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TAjuOAS0c3', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('d49c239e-dff2-4baf-9a79-70457df71e66', 'Buford Oberbrunner', 'admin@admin.com', '2020-11-08 23:33:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NkoZL5sSFz', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('f719f629-8ef6-4f2b-9095-000cb7c66b46', 'Quinten Kuhic', 'greenfelder.raoul@example.org', '2020-11-08 23:33:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9BSbaDlS9Y', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('90fc4087-693a-48d0-8547-f0d3840ad8ee', 'Rashawn Ebert IV', 'rodrick73@example.org', '2020-11-08 23:33:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'suQOuyluaY', '2020-11-08 23:33:07', '2020-11-08 23:33:07'),
('fa84ab79-6ad7-43f6-9f60-775387f5f551', 'Elisa Hodkiewicz', 'tromp.polly@example.org', '2020-11-08 23:33:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'A7XfnSBgRc', '2020-11-08 23:33:07', '2020-11-08 23:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persentage` int(11) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `channel_id`, `title`, `persentage`, `thumbnail`, `description`, `views`, `path`, `category_id`, `subcategory_id`, `status`, `created_at`, `updated_at`) VALUES
('e8f4c588-1bbf-4412-bd56-42f4baccf462', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'impedit et voluptas est illum. Ipsum et ipsa minus totC', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/e8f4c588-1bbf-4412-bd56-42f4baccf462/e8f4c588-1bbf-4412-bd56-42f4baccf462.png', 'impedit et voluptas est illum. Ipsum et ipsa minus totC', 1, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/TYAG9c42kVY52BWvK2DGPzgomYxU7xiWr8D4clps.mp4', 1, 1, 0, '2020-11-09 00:08:56', '2020-11-09 00:21:40'),
('3b9047b5-05c1-4ba0-b38a-d1c7789fe2a5', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'The Laravel framework has a few system requirements. All of these requirements are sa', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/3b9047b5-05c1-4ba0-b38a-d1c7789fe2a5/3b9047b5-05c1-4ba0-b38a-d1c7789fe2a5.png', 'The Laravel framework has a few system requirements. All of these requirements are satisfied by the Laravel Homestead virtual machine, so it\'s highly recommended that you use Homestead as your local Laravel development environment.', 5, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/2c19XDT2a2M5WzjKKZAcx3DT0Bk1j6IwgUqnjvZi.mp4', 2, 4, 0, '2020-11-09 00:08:56', '2020-11-11 17:25:29'),
('a97ba9bc-9d8f-48cc-b01d-813ada51ed30', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'it\'s highly recommended that you use Homestead as your local Laravel development environment.', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/a97ba9bc-9d8f-48cc-b01d-813ada51ed30/a97ba9bc-9d8f-48cc-b01d-813ada51ed30.png', 'The Laravel framework has a few system requirements. All of these requirements are satisfied by the Laravel Homestead virtual machine, so it\'s highly recommended that you use Homestead as your local Laravel development environment.', 0, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/M95MfkPCedbIkkOQYnZCwqkvfgEUsUZj0yweMIs2.mp4', 3, 2, 0, '2020-11-09 00:08:58', '2020-11-09 00:12:07'),
('9ccf5e91-31ed-4494-9081-b6cb7f77567d', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'All of these requirements are satisfied by the Laravel Homestead', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/9ccf5e91-31ed-4494-9081-b6cb7f77567d/9ccf5e91-31ed-4494-9081-b6cb7f77567d.png', 'The Laravel framework has a few system requirements. All of these requirements are satisfied by the Laravel Homestead virtual machine, so it\'s highly recommended that you use Homestead as your local Laravel development environment.', 3, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/PcDzhhmu89gmPZuOFdPUWptGm7utjxosKNf2Gy3K.mp4', 2, 4, 0, '2020-11-09 00:09:00', '2020-11-11 17:24:23'),
('9556980a-1a74-4bf1-9efe-1fb6815ca72c', '450c2bc1-501e-4666-b4e7-e9bc5ebd0381', 'Lorem ipsum dolor sit amet', 100, '/storage/videos/450c2bc1-501e-4666-b4e7-e9bc5ebd0381/thumbnails/9556980a-1a74-4bf1-9efe-1fb6815ca72c/9556980a-1a74-4bf1-9efe-1fb6815ca72c.png', 'Lorem ipsum dolor sit ametLorem ipsum dolor sit amet', 0, 'channels/450c2bc1-501e-4666-b4e7-e9bc5ebd0381/VnZc2BnilVjoz9OuWYRkTeuKwVBbzDZ7wvyk3bcX.mp4', 3, 7, 0, '2020-11-09 00:14:13', '2020-11-09 00:14:54'),
('063c08c8-a755-4d00-ae52-bfb7ee7d9eee', '450c2bc1-501e-4666-b4e7-e9bc5ebd0381', 'Spsum dolor sit amet', 100, '/storage/videos/450c2bc1-501e-4666-b4e7-e9bc5ebd0381/thumbnails/063c08c8-a755-4d00-ae52-bfb7ee7d9eee/063c08c8-a755-4d00-ae52-bfb7ee7d9eee.png', 'Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet', 5, 'channels/450c2bc1-501e-4666-b4e7-e9bc5ebd0381/W0XecmORH7zAwwalPgi93jJbgJOHKm8IyckHXrc9.mp4', 1, 1, 0, '2020-11-09 00:14:14', '2020-11-12 02:58:02'),
('85bf77dd-bbee-402d-a24a-56a0fe2131ac', 'f29098b1-4139-4370-b29f-54c673bf6932', 'In the onInfinite function, we request a page of news and pushed them into list everytime', 100, '/storage/videos/f29098b1-4139-4370-b29f-54c673bf6932/thumbnails/85bf77dd-bbee-402d-a24a-56a0fe2131ac/85bf77dd-bbee-402d-a24a-56a0fe2131ac.png', 'In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,', 1, 'channels/f29098b1-4139-4370-b29f-54c673bf6932/w7b8kTFV5Z3LDZi9PAHjltGbMG6CvWHxQyA0T9W4.mp4', 2, 4, 0, '2020-11-12 18:39:32', '2020-11-13 01:11:32'),
('a89f744c-514c-4b58-b885-ab7b34307c07', 'f29098b1-4139-4370-b29f-54c673bf6932', 'we had been requested 10 pages of news,', 100, '/storage/videos/f29098b1-4139-4370-b29f-54c673bf6932/thumbnails/a89f744c-514c-4b58-b885-ab7b34307c07/a89f744c-514c-4b58-b885-ab7b34307c07.png', 'In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,', 0, 'channels/f29098b1-4139-4370-b29f-54c673bf6932/77KmNoiPZ8Rvo09p4eeLDvP2LsyZmQb4P2e2g3y6.mp4', 3, 7, 0, '2020-11-12 18:39:32', '2020-11-12 18:41:03'),
('f34b16bf-766f-480d-bdb8-c65c0ab29891', 'f29098b1-4139-4370-b29f-54c673bf6932', 'we request a page of news and pushed them into list everytime,', 100, '/storage/videos/f29098b1-4139-4370-b29f-54c673bf6932/thumbnails/f34b16bf-766f-480d-bdb8-c65c0ab29891/f34b16bf-766f-480d-bdb8-c65c0ab29891.png', 'In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,In the onInfinite function, we request a page of news and pushed them into list everytime, if we had been requested 10 pages of news,', 1, 'channels/f29098b1-4139-4370-b29f-54c673bf6932/R84u4snHxcplaocz5CkxEGb8B9tUu3DGT87GvjYQ.mp4', 4, 3, 0, '2020-11-12 18:39:32', '2020-11-12 23:14:57'),
('3eb863ee-b923-4837-9c6e-533f7ad152e0', 'f29098b1-4139-4370-b29f-54c673bf6932', 'it will display the no more data prompt that we customized in template for user.', 100, '/storage/videos/f29098b1-4139-4370-b29f-54c673bf6932/thumbnails/3eb863ee-b923-4837-9c6e-533f7ad152e0/3eb863ee-b923-4837-9c6e-533f7ad152e0.png', 'it will display the no more data prompt that we customized in template for user.it will display the no more data prompt that we customized in template for user.it will display the no more data prompt that we customized in template for user.it will display the no more data prompt that we customized in template for user.', 0, 'channels/f29098b1-4139-4370-b29f-54c673bf6932/P33E90TBA1k5vM6W7QWIGWjjraJvp0PJngsi4O6h.mp4', 4, 11, 0, '2020-11-12 18:39:34', '2020-11-12 18:42:23'),
('bd8679a8-1574-4936-9cfa-650cd7cc780c', 'f29098b1-4139-4370-b29f-54c673bf6932', 'Prompt that we customized in template for user.', 100, '/storage/videos/f29098b1-4139-4370-b29f-54c673bf6932/thumbnails/bd8679a8-1574-4936-9cfa-650cd7cc780c/bd8679a8-1574-4936-9cfa-650cd7cc780c.png', 'it will display the no more data prompt that we customized in template for user.it will display the no more data prompt that we customized in template for user.', 0, 'channels/f29098b1-4139-4370-b29f-54c673bf6932/rNiUXjqFdjnhf1JxAFzMA1duRq3ycxKW8EDrDrjX.mp4', 1, 1, 0, '2020-11-12 18:39:36', '2020-11-12 18:42:40'),
('41f16c7e-8552-4f54-a7bc-c2b3df3411d5', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'MarkGreen yes but just wanting to do that doesn\'t mean you should', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/41f16c7e-8552-4f54-a7bc-c2b3df3411d5/41f16c7e-8552-4f54-a7bc-c2b3df3411d5.png', 'MarkGreen yes but just wanting to do that doesn\'t mean you should write it in a weird form just because it happens to be fastest', 0, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/kFf2baxnROhAfhCfZ7hkoxMlsUjiRAiW6uHdpAp7.mp4', 1, 1, 0, '2020-11-12 22:41:41', '2020-11-12 22:42:40'),
('240cd265-b6c4-4d0d-a629-5e5ffd0814f1', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'write it in a weird form just because it happens to be fastest', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/240cd265-b6c4-4d0d-a629-5e5ffd0814f1/240cd265-b6c4-4d0d-a629-5e5ffd0814f1.png', 'MarkGreen yes but just wanting to do that doesn\'t mean you should write it in a weird form just because it happens to be fastest', 0, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/g4SVJRtcLRxGAVWol6aFqtJqKlCR7tLdqzHUK7Hu.mp4', 2, 12, 0, '2020-11-12 22:41:42', '2020-11-12 22:42:57'),
('09a699a6-67ae-4a30-a6bf-98d394da8b61', '21f7c9a0-2378-418c-8455-efa84e0d6caf', 'MarkGreen yes but just wanting to do that update', 100, '/storage/videos/21f7c9a0-2378-418c-8455-efa84e0d6caf/thumbnails/09a699a6-67ae-4a30-a6bf-98d394da8b61/09a699a6-67ae-4a30-a6bf-98d394da8b61.png', 'MarkGreen yes but just wanting to do that doesn\'t mean you should write it in a weird form just because it happens to be fastestMarkGreen yes but just wanting to do that doesn\'t mean you should write it in a weird form just because it happens to be fastest', 2, 'channels/21f7c9a0-2378-418c-8455-efa84e0d6caf/eEKXocM2vk0aFUYE4vU6GjEwoxbAEa3722SuCIji.mp4', 1, 10, 0, '2020-11-12 22:41:42', '2020-11-13 01:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `video_histories`
--

CREATE TABLE `video_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_histories`
--

INSERT INTO `video_histories` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 'd49c239e-dff2-4baf-9a79-70457df71e66', '3b9047b5-05c1-4ba0-b38a-d1c7789fe2a5', NULL, '2020-11-11 17:25:29'),
(2, 'd49c239e-dff2-4baf-9a79-70457df71e66', '9ccf5e91-31ed-4494-9081-b6cb7f77567d', NULL, '2020-11-11 17:24:23'),
(3, 'd49c239e-dff2-4baf-9a79-70457df71e66', '063c08c8-a755-4d00-ae52-bfb7ee7d9eee', NULL, '2020-11-11 17:25:15'),
(4, 'd49c239e-dff2-4baf-9a79-70457df71e66', 'f34b16bf-766f-480d-bdb8-c65c0ab29891', NULL, '2020-11-12 23:14:57'),
(5, 'd49c239e-dff2-4baf-9a79-70457df71e66', '85bf77dd-bbee-402d-a24a-56a0fe2131ac', NULL, '2020-11-13 01:11:32'),
(6, 'd49c239e-dff2-4baf-9a79-70457df71e66', '09a699a6-67ae-4a30-a6bf-98d394da8b61', NULL, '2020-11-13 01:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `type` enum('up','down') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'up',
  `voteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voteable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `vote`, `type`, `voteable_type`, `voteable_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'up', 'App\\Comment', '1', '37d63e47-7248-4268-af49-7d236ef4eb74', '2020-11-09 00:16:16', '2020-11-09 00:16:16'),
(2, NULL, 'up', 'App\\Comment', '2', 'd49c239e-dff2-4baf-9a79-70457df71e66', '2020-11-09 00:16:53', '2020-11-09 00:16:53'),
(3, NULL, 'up', 'App\\Comment', '3', 'd49c239e-dff2-4baf-9a79-70457df71e66', '2020-11-09 00:16:57', '2020-11-09 00:17:00'),
(4, NULL, 'up', 'App\\Video', 'e8f4c588-1bbf-4412-bd56-42f4baccf462', '37d63e47-7248-4268-af49-7d236ef4eb74', '2020-11-09 00:22:08', '2020-11-09 02:24:03'),
(5, NULL, 'up', 'App\\Video', '9ccf5e91-31ed-4494-9081-b6cb7f77567d', '37d63e47-7248-4268-af49-7d236ef4eb74', '2020-11-09 00:28:26', '2020-11-09 00:28:26'),
(6, NULL, 'up', 'App\\Video', '3b9047b5-05c1-4ba0-b38a-d1c7789fe2a5', '37d63e47-7248-4268-af49-7d236ef4eb74', '2020-11-09 02:24:06', '2020-11-09 02:24:06'),
(7, NULL, 'up', 'App\\Video', '063c08c8-a755-4d00-ae52-bfb7ee7d9eee', 'd49c239e-dff2-4baf-9a79-70457df71e66', '2020-11-13 01:09:50', '2020-11-13 01:09:54'),
(8, NULL, 'up', 'App\\Video', 'bd8679a8-1574-4936-9cfa-650cd7cc780c', 'd49c239e-dff2-4baf-9a79-70457df71e66', '2020-11-13 01:09:56', '2020-11-13 01:22:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `video_histories`
--
ALTER TABLE `video_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `video_histories`
--
ALTER TABLE `video_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
