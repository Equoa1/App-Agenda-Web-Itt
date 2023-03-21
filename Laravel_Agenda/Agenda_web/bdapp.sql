-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2023 a las 06:50:47
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@edoc.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment`
--

CREATE TABLE `appointment` (
  `appoid` int(11) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '2022-06-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam`
--

CREATE TABLE `exam` (
  `idexamen` int(11) NOT NULL,
  `examendes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaexamen` date NOT NULL,
  `hora` time NOT NULL,
  `capacidad` int(11) NOT NULL,
  `profesor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `exam`
--

INSERT INTO `exam` (`idexamen`, `examendes`, `fechaexamen`, `hora`, `capacidad`, `profesor`, `created_at`, `updated_at`) VALUES
(3, 'Examen', '2023-03-20', '18:27:00', 12, '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `numerodecita` int(11) DEFAULT NULL,
  `usuario_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaid` int(11) DEFAULT NULL,
  `fecha_examen` datetime DEFAULT NULL,
  `examen_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(42, '2023_03_09_214841_create_sessions_table', 1),
(58, '2023_03_04_212103_create_usuarios_table', 2),
(95, '2014_10_12_200000_add_two_factor_columns_to_users_table', 4),
(99, '2023_03_15_104718_create_sessions_table', 5),
(163, '2014_10_12_000000_create_users_table', 6),
(164, '2014_10_12_100000_create_password_resets_table', 6),
(165, '2019_08_19_000000_create_failed_jobs_table', 6),
(166, '2019_12_14_000001_create_personal_access_tokens_table', 6),
(167, '2023_02_27_082811_create_exam_table', 6),
(168, '2023_02_28_083405_create_inscripcion_table', 6),
(169, '2023_03_15_011647_create_users_table', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(1, 'patient@edoc.com', 'Test Patient', '123', 'Sri Lanka', '0000000000', '2000-01-01', '0120000000'),
(2, 'emhashenudara@gmail.com', 'Hashen Udara', '123', 'Sri Lanka', '0110000000', '2022-06-03', '0700000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Personal Access Token', 'b2834032e2674a060d4b127421568318af212c8c2996a6e62c4f30eb2c27324f', '[\"*\"]', NULL, '2023-03-20 05:14:24', '2023-03-20 05:14:24'),
(2, 'App\\Models\\User', 1, 'Personal Access Token', '61b6fc391db1273facb5d2facb56d567a118ac67fd5a4b54300e29075aa2d986', '[\"*\"]', NULL, '2023-03-20 05:26:32', '2023-03-20 05:26:32'),
(3, 'App\\Models\\User', 1, 'Personal Access Token', '08a35ed8cb1b17a904d17e2c6cb4a90e8efdeae2f0a680c11d70a48604dbe781', '[\"*\"]', NULL, '2023-03-20 05:34:00', '2023-03-20 05:34:00'),
(4, 'App\\Models\\User', 1, 'Personal Access Token', '8c1c0786d1a9bda0216d529fdb46f885aa01021a29ab9a74ecc99d27e82c0c8e', '[\"*\"]', NULL, '2023-03-20 05:49:09', '2023-03-20 05:49:09'),
(5, 'App\\Models\\User', 1, 'Personal Access Token', '63e25de84cfd3b34333325c8afb2e5c2e2061ffffb540071a19ab88e71d28d3b', '[\"*\"]', NULL, '2023-03-20 05:50:40', '2023-03-20 05:50:40'),
(6, 'App\\Models\\User', 2, 'Personal Access Token', '14a6c7f2d5c44fd4f82473703655ab965032ab12151089a06ffacadb97e6f084', '[\"*\"]', NULL, '2023-03-20 07:20:54', '2023-03-20 07:20:54'),
(7, 'App\\Models\\User', 2, 'Personal Access Token', '3ee70dbd25f147212591f97b99e60aa79506724ebddb4b1be00f8e79e727bf05', '[\"*\"]', NULL, '2023-03-20 07:21:48', '2023-03-20 07:21:48'),
(8, 'App\\Models\\User', 2, 'Personal Access Token', 'c279b0343943a349da727c710a20eab73c55c097a458e45c098150053c5a2b8a', '[\"*\"]', NULL, '2023-03-20 07:23:34', '2023-03-20 07:23:34'),
(9, 'App\\Models\\User', 2, 'Personal Access Token', '28dba61c3942de970a3b545c7171b7fbe3b68bbd2fd3ca84d5d325e1d59063b3', '[\"*\"]', NULL, '2023-03-20 07:26:20', '2023-03-20 07:26:20'),
(10, 'App\\Models\\User', 1, 'Personal Access Token', '87f2e52eed61693d8f0d41c0d60c0e312eeaf54a362544c30f2081346f75684b', '[\"*\"]', NULL, '2023-03-21 11:18:47', '2023-03-21 11:18:47'),
(11, 'App\\Models\\User', 1, 'Personal Access Token', 'b29d93597fd959920cf8777f6cd143c4d28498a09aed513616a6b19d0e175026', '[\"*\"]', NULL, '2023-03-21 11:19:54', '2023-03-21 11:19:54'),
(12, 'App\\Models\\User', 1, 'Personal Access Token', '8d1f3edf3a68e67dce1c76e9119e8fff440315c2608f4c2459af1534ddf177a1', '[\"*\"]', NULL, '2023-03-21 11:21:54', '2023-03-21 11:21:54'),
(13, 'App\\Models\\User', 1, 'Personal Access Token', '23a8a4f0c23dbb9c9a66fdd2e0a0c56bd0858989336a9330426e613a4b5de82a', '[\"*\"]', NULL, '2023-03-21 11:23:28', '2023-03-21 11:23:28'),
(14, 'App\\Models\\User', 1, 'Personal Access Token', '082337dad79458bab4aee3c40e25a55fc0f43f69eb2c72149e99ce0f6ffbb6a7', '[\"*\"]', NULL, '2023-03-21 11:24:47', '2023-03-21 11:24:47'),
(15, 'App\\Models\\User', 1, 'Personal Access Token', '04b2de6698f1d9e5199a1515a74a72c51d7e28ef9e596527c870a0c26f91bd69', '[\"*\"]', NULL, '2023-03-21 11:26:02', '2023-03-21 11:26:02'),
(16, 'App\\Models\\User', 1, 'Personal Access Token', 'af0fad44c08ad85ca6ed0dbde91079ee6fa9d0a799421ecf1fd20c88df2c0b7e', '[\"*\"]', NULL, '2023-03-21 11:26:53', '2023-03-21 11:26:53'),
(17, 'App\\Models\\User', 1, 'Personal Access Token', 'd5c871a79facdb85b2241b14a6483586a0a525090277be004d936fe3b24cc78a', '[\"*\"]', NULL, '2023-03-21 11:29:26', '2023-03-21 11:29:26'),
(18, 'App\\Models\\User', 1, 'Personal Access Token', '2cc884d89f66152b65ea47899a96c703b01ec6643a2424ea8ef655e6a4c76a98', '[\"*\"]', NULL, '2023-03-21 11:34:15', '2023-03-21 11:34:15'),
(19, 'App\\Models\\User', 1, 'Personal Access Token', '60bee34c560c0c85b0eef069746795b4a9895dcb13a8f3767b4d15b77ba8fd24', '[\"*\"]', NULL, '2023-03-21 11:35:04', '2023-03-21 11:35:04'),
(20, 'App\\Models\\User', 1, 'Personal Access Token', 'c93de901d6d0d04b3a60492c5253a27d1d9442ff990bdde2ea08752bf5d2b4a3', '[\"*\"]', NULL, '2023-03-21 11:36:34', '2023-03-21 11:36:34'),
(21, 'App\\Models\\User', 1, 'Personal Access Token', 'dc38ab0407ef8e9f3b4943d5d69191bb3f4bd3914b176f319c1de8e8ff4ebf45', '[\"*\"]', NULL, '2023-03-21 11:40:01', '2023-03-21 11:40:01'),
(22, 'App\\Models\\User', 1, 'Personal Access Token', 'ae7038cf3b581541b799ee240aef25ac9ba98109c6e0bf803061ddebf17aa359', '[\"*\"]', NULL, '2023-03-21 11:43:43', '2023-03-21 11:43:43'),
(23, 'App\\Models\\User', 1, 'Personal Access Token', '42b5fa1edaa6911555259970ef6fb5e3f840e780e8b79151e5d63343253a4af4', '[\"*\"]', NULL, '2023-03-21 11:44:23', '2023-03-21 11:44:23'),
(24, 'App\\Models\\User', 1, 'Personal Access Token', 'b2205bd69c57603bfe6770fdd75fdf4043d9d1a00b2d2bb6fefc7ca5c7a713f6', '[\"*\"]', NULL, '2023-03-21 11:46:37', '2023-03-21 11:46:37'),
(25, 'App\\Models\\User', 1, 'Personal Access Token', '416a47c18bbab377b0cb4ccf4bc5106bdb44ac3253843610ac060a738629ec8a', '[\"*\"]', NULL, '2023-03-21 11:47:49', '2023-03-21 11:47:49'),
(26, 'App\\Models\\User', 1, 'Personal Access Token', '3bee3724a8c277ccb91e3d240ad6901feef1f82bac1451ced529067f3ec354fb', '[\"*\"]', NULL, '2023-03-21 11:49:43', '2023-03-21 11:49:43'),
(27, 'App\\Models\\User', 1, 'Personal Access Token', 'de1c540900fee81c6a9e07a87bb09dcea9ba177d08a4fd310127af2a4a949035', '[\"*\"]', NULL, '2023-03-21 11:50:58', '2023-03-21 11:50:58'),
(28, 'App\\Models\\User', 1, 'Personal Access Token', '968968c0e6897f3bda99f17c849657331e087d4932cb1d474dbcae660bb5e72e', '[\"*\"]', NULL, '2023-03-21 11:51:50', '2023-03-21 11:51:50'),
(29, 'App\\Models\\User', 1, 'Personal Access Token', '62a240227306322d0a0171dc439d0754b934929f5bebfabf31b62b9b5a6faef0', '[\"*\"]', NULL, '2023-03-21 11:55:43', '2023-03-21 11:55:43'),
(30, 'App\\Models\\User', 1, 'Personal Access Token', 'a658afe5310a8f266f3baaac98855aeaf51f27e15d7e4709ab6a3448ad0cf667', '[\"*\"]', NULL, '2023-03-21 11:58:04', '2023-03-21 11:58:04'),
(31, 'App\\Models\\User', 1, 'Personal Access Token', 'e6ae7d79261b27f3d27e0af893492299f324364e7a9839fef235280b787d0d03', '[\"*\"]', NULL, '2023-03-21 11:59:06', '2023-03-21 11:59:06'),
(32, 'App\\Models\\User', 1, 'Personal Access Token', '6cc085fbdeb483ca1a703b4e42766ab569fee8c5c8ed49ee273247b2689796d8', '[\"*\"]', NULL, '2023-03-21 12:00:14', '2023-03-21 12:00:14'),
(33, 'App\\Models\\User', 2, 'Personal Access Token', 'fa00b89f2e54228b750a71afda2b05640f85afa7fd2533714cab42fc4fb7979e', '[\"*\"]', NULL, '2023-03-21 12:01:23', '2023-03-21 12:01:23'),
(34, 'App\\Models\\User', 1, 'Personal Access Token', '2f5204ac30353031dc141369531b916a6802bd22c59f0c6ff479dae44ac3055b', '[\"*\"]', NULL, '2023-03-21 12:08:34', '2023-03-21 12:08:34'),
(35, 'App\\Models\\User', 2, 'Personal Access Token', '61400c29b7748bf41886a7562c34aa1db5bb612eeef0229fb8219dd19f07ff04', '[\"*\"]', NULL, '2023-03-21 12:08:54', '2023-03-21 12:08:54'),
(36, 'App\\Models\\User', 1, 'Personal Access Token', 'd704b216e34f4116d32dedac80b4252c3267e0afca141b94a6526a919fbd5557', '[\"*\"]', NULL, '2023-03-21 12:33:09', '2023-03-21 12:33:09'),
(37, 'App\\Models\\User', 2, 'Personal Access Token', '9f11e2a43fad3a73047667c1561721c29482218133431262e3bb9b62d8ae9bd9', '[\"*\"]', NULL, '2023-03-21 12:33:37', '2023-03-21 12:33:37'),
(38, 'App\\Models\\User', 1, 'Personal Access Token', 'fbc9cf91602a717e7db6546706cd1c1337428c8fc45989bb9f7e4367b871f70b', '[\"*\"]', NULL, '2023-03-21 12:35:13', '2023-03-21 12:35:13'),
(39, 'App\\Models\\User', 1, 'Personal Access Token', '18bf39798206146c922b23848679191c4da973577c61f6c3dbcfb71be0c15288', '[\"*\"]', NULL, '2023-03-21 12:36:05', '2023-03-21 12:36:05'),
(40, 'App\\Models\\User', 1, 'Personal Access Token', 'afe5969e7f244c90d1f0e955023ca9c8f1cf3fb6f239cc3d19e4a092b5e3c77c', '[\"*\"]', NULL, '2023-03-21 12:37:13', '2023-03-21 12:37:13'),
(41, 'App\\Models\\User', 1, 'Personal Access Token', 'd4bf16e804acafb3098c1620deb5e4e8f29ca7a3cb8a4f16e6353e720bca70ee', '[\"*\"]', NULL, '2023-03-21 12:38:40', '2023-03-21 12:38:40'),
(42, 'App\\Models\\User', 1, 'Personal Access Token', '1151730bed5cdab04e87253de98ccada787a5458ca94f8ddd6845691bc438665', '[\"*\"]', NULL, '2023-03-21 12:39:25', '2023-03-21 12:39:25'),
(43, 'App\\Models\\User', 1, 'Personal Access Token', '7a31ccedd0c8743c9250ac30db4a7ecb3a961d785106014b800d82f038245d72', '[\"*\"]', NULL, '2023-03-21 12:41:25', '2023-03-21 12:41:25'),
(44, 'App\\Models\\User', 1, 'Personal Access Token', 'a838cd184a0747dfcb784d561612c7e564e21055c825060684336c56d314a596', '[\"*\"]', NULL, '2023-03-21 12:42:55', '2023-03-21 12:42:55'),
(45, 'App\\Models\\User', 1, 'Personal Access Token', '66bf4524769a48bf6c45c817bad0136c397122a1101ecc3dfa6125b68f6f86d5', '[\"*\"]', NULL, '2023-03-21 12:44:05', '2023-03-21 12:44:05'),
(46, 'App\\Models\\User', 1, 'Personal Access Token', 'b80f052aeb6ab821b89eda4bff0f5c47a222cb511b2dda54d0f5582f0d8cf480', '[\"*\"]', NULL, '2023-03-21 12:45:23', '2023-03-21 12:45:23'),
(47, 'App\\Models\\User', 1, 'Personal Access Token', 'c3407f5279f999742d19ff108010bd11b4b7d85b65f13ca5648f4011c32e379b', '[\"*\"]', NULL, '2023-03-21 12:46:17', '2023-03-21 12:46:17'),
(48, 'App\\Models\\User', 1, 'Personal Access Token', '6a69d31c574c107103372c6aee888f94bedbb625093794e8d758609b407443db', '[\"*\"]', NULL, '2023-03-21 12:47:46', '2023-03-21 12:47:46'),
(49, 'App\\Models\\User', 1, 'Personal Access Token', '5e86e3a52df2da289e1842a86d4a148fa206473eed2d109c51d78dfdb2942e8c', '[\"*\"]', NULL, '2023-03-21 12:48:45', '2023-03-21 12:48:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `proid` int(11) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`proid`, `correo`, `nombre`, `password`) VALUES
(5, 'victor.castro18@tectijuana.edu.mx', 'Victor Castro Rivera', 'mierda77'),
(4, 'iissaavvaa@hotmail.com', 'Isaac Valdez Contreras2', 'isaacvaldez77');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule`
--

CREATE TABLE `schedule` (
  `scheduleid` int(11) NOT NULL,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(9, '1', 'Examen', '2023-03-17', '01:03:00', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dONyBJbzkDgOByYZaDPRXxcal5Lvmn5P7zVqtzLy', NULL, '192.168.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRwZmdjMXptQkVQT1RXWllOaDNkRHFOemhSdllYcFZsNFRwOGt5eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuNzg6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1679375741),
('h0L3tXisxXJk25EDWAODsZ8I6FZSxCBRwMfOkppo', NULL, '192.168.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk1CZVJxS3liQVRMVDdyYkN3bnl1Z3VGVmFXUnIwdHJYdXgydnQzdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuNzg6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1679359866),
('tqHwfjz3a0yfgDH948Qof0jZ86ajZVGTgXGY7gp0', 3, '192.168.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWGsyN2tJZ24zaWc4UlV5VVlwZU9MS3lSb2dlNHFlMDROQkwxMGlkRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRHdUl5NTJiVFpKUnh3WFVQYk5sdkkudEE5cUR5dkZYVEdmb1ovN1BCQ2FzRDB3R3J5NFFLcSI7fQ==', 1678879529),
('znfWaheIJ3F6yCz96GDUMK3D5oODK8fuS5Lqr9L0', 3, '192.168.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.41', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMFNJc0NOVWZMTGVzNG1wRjI0Z3ZoTEZvcUVPZW11SjZvSE1HeDNUcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuNzg6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkR3VJeTUyYlRaSlJ4d1hVUGJObHZJLnRBOXFEeXZGWFRHZm9aLzdQQkNhc0Qwd0dyeTRRS3EiO30=', 1678953118);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

CREATE TABLE `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Accident and emergency medicine'),
(2, 'Allergology'),
(3, 'Anaesthetics'),
(4, 'Biological hematology'),
(5, 'Cardiology'),
(6, 'Child psychiatry'),
(7, 'Clinical biology'),
(8, 'Clinical chemistry'),
(9, 'Clinical neurophysiology'),
(10, 'Clinical radiology'),
(11, 'Dental, oral and maxillo-facial surgery'),
(12, 'Dermato-venerology'),
(13, 'Dermatology'),
(14, 'Endocrinology'),
(15, 'Gastro-enterologic surgery'),
(16, 'Gastroenterology'),
(17, 'General hematology'),
(18, 'General Practice'),
(19, 'General surgery'),
(20, 'Geriatrics'),
(21, 'Immunology'),
(22, 'Infectious diseases'),
(23, 'Internal medicine'),
(24, 'Laboratory medicine'),
(25, 'Maxillo-facial surgery'),
(26, 'Microbiology'),
(27, 'Nephrology'),
(28, 'Neuro-psychiatry'),
(29, 'Neurology'),
(30, 'Neurosurgery'),
(31, 'Nuclear medicine'),
(32, 'Obstetrics and gynecology'),
(33, 'Occupational medicine'),
(34, 'Ophthalmology'),
(35, 'Orthopaedics'),
(36, 'Otorhinolaryngology'),
(37, 'Paediatric surgery'),
(38, 'Paediatrics'),
(39, 'Pathology'),
(40, 'Pharmacology'),
(41, 'Physical medicine and rehabilitation'),
(42, 'Plastic surgery'),
(43, 'Podiatric Medicine'),
(44, 'Podiatric Surgery'),
(45, 'Psychiatry'),
(46, 'Public health and Preventive Medicine'),
(47, 'Radiology'),
(48, 'Radiotherapy'),
(49, 'Respiratory medicine'),
(50, 'Rheumatology'),
(51, 'Stomatology'),
(52, 'Thoracic surgery'),
(53, 'Tropical medicine'),
(54, 'Urology'),
(55, 'Vascular surgery'),
(56, 'Venereology');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `folio`, `matricula`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, '17882', '18210725', 'Isaac Valdez Contreras', 'iissaavvaa@hotmail.com', '$2y$10$UoPjQBNckjtbys4Jyy3mQudZ1aZ8knL/oareJ.bdlmJ0hqNF0RHcG', '2023-03-20 05:14:24', '2023-03-20 05:14:24'),
(2, '1820182', '18210726', 'Rogelio Martinez Lizarraga', 'isaac.valdez18@tectijuana.edu.mx', '$2y$10$W4sjyX/K9hmLlY5kIqOfjurQlDwd/xQxoQPaInQ3oEb8ahbxvbR/a', '2023-03-20 07:20:54', '2023-03-20 07:20:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@edoc.com', 'a'),
('victor.castro18@tectijuana.edu.mx', 'd'),
('patient@edoc.com', 'p'),
('emhashenudara@gmail.com', 'p'),
('iissaavvaa@hotmail.com', 'd');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aemail`);

--
-- Indices de la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `scheduleid` (`scheduleid`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `specialties` (`specialties`);

--
-- Indices de la tabla `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`idexamen`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`proid`);

--
-- Indices de la tabla `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleid`),
  ADD KEY `docid` (`docid`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `exam`
--
ALTER TABLE `exam`
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `proid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
