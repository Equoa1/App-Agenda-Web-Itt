-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2023 a las 11:04:09
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
  `appoid` int(11) NOT NULL,
  `udi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numerodecita` int(11) DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `usuario_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(170, '2014_10_12_000000_create_users_table', 6),
(171, '2014_10_12_100000_create_password_resets_table', 6),
(172, '2019_08_19_000000_create_failed_jobs_table', 6),
(173, '2019_12_14_000001_create_personal_access_tokens_table', 6),
(174, '2023_02_27_082811_create_exam_table', 6),
(175, '2023_02_28_083405_create_inscripcion_table', 6),
(176, '2023_03_15_011647_create_users_table', 6);

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
(1, 'App\\Models\\User', 1, 'Personal Access Token', '9e302ca6bc75c34abcceee83481f229c6bff364e4ab6fba51f61d97256a98166', '[\"*\"]', NULL, '2023-03-21 13:00:58', '2023-03-21 13:00:58'),
(2, 'App\\Models\\User', 1, 'Personal Access Token', '60eae0c709f0066f55ba3236492e69198ddbfc6b54ea904cb1f28496eea748ef', '[\"*\"]', NULL, '2023-03-21 13:02:08', '2023-03-21 13:02:08'),
(3, 'App\\Models\\User', 1, 'Personal Access Token', '43dee894de2f49707923087d82139f798e73dd3afeeab4783f67be930dae05f6', '[\"*\"]', NULL, '2023-03-21 13:03:43', '2023-03-21 13:03:43'),
(4, 'App\\Models\\User', 1, 'Personal Access Token', '6f32a841fb9aaf9145758285fac609d3ae27e08fc73a4df289b8d06e1798e6ce', '[\"*\"]', NULL, '2023-03-21 13:05:50', '2023-03-21 13:05:50'),
(5, 'App\\Models\\User', 1, 'Personal Access Token', 'edaec69ee4b053899499d70c8894b510ec749bb9db65b4c0b71f7c94a4b136f4', '[\"*\"]', NULL, '2023-03-21 14:04:28', '2023-03-21 14:04:28'),
(6, 'App\\Models\\User', 1, 'Personal Access Token', 'aa0455314a0b5cc68f3ec8ea6788cc8668f4059650cf9d05226c3bc6b770e265', '[\"*\"]', NULL, '2023-03-21 14:05:21', '2023-03-21 14:05:21'),
(7, 'App\\Models\\User', 1, 'Personal Access Token', '287a0c6e39792cb372d26f10e0709e34b6c47195d4cb643270c9dddd24378f37', '[\"*\"]', NULL, '2023-03-21 14:05:50', '2023-03-21 14:05:50'),
(8, 'App\\Models\\User', 1, 'Personal Access Token', '93f645c283c6939dced237aaee6ecd428b2e2de4209b32967926a609700e4935', '[\"*\"]', NULL, '2023-03-21 14:07:41', '2023-03-21 14:07:41'),
(9, 'App\\Models\\User', 1, 'Personal Access Token', '9e7dd5aea86bfa2c86f1fe80248b32e2d984e0110f51563f2b663d9acfa69d90', '[\"*\"]', NULL, '2023-03-21 16:39:09', '2023-03-21 16:39:09'),
(10, 'App\\Models\\User', 1, 'Personal Access Token', 'bbc24b41150162012b4636308e8a3489a81ca6fa1081276a572d0c9018b4fe87', '[\"*\"]', NULL, '2023-03-21 16:40:32', '2023-03-21 16:40:32'),
(11, 'App\\Models\\User', 1, 'Personal Access Token', '106814cc15bfcf0b13cd62c317228519ad12c1a030f0c1d814e7df449dc9251d', '[\"*\"]', NULL, '2023-03-21 16:41:34', '2023-03-21 16:41:34'),
(12, 'App\\Models\\User', 1, 'Personal Access Token', 'fb7108413fad1af0462e0e8cb2ca2005032d874339a2afa53211295cb07f9194', '[\"*\"]', NULL, '2023-03-21 16:43:20', '2023-03-21 16:43:20'),
(13, 'App\\Models\\User', 1, 'Personal Access Token', 'b1e1d7cf62d1406f77a51ae33dcb08fbc99926be5b5dd797218cae9fd2de2c6f', '[\"*\"]', NULL, '2023-03-21 16:43:58', '2023-03-21 16:43:58'),
(14, 'App\\Models\\User', 1, 'Personal Access Token', '52d62e02356ceffa6837a7fa31b9c111372c145015b1b119f9ae9748069062e7', '[\"*\"]', NULL, '2023-03-21 16:44:30', '2023-03-21 16:44:30'),
(15, 'App\\Models\\User', 1, 'Personal Access Token', 'd87a33cb66f6d35e2a94df9ee5d95ffbee34f667ba59ed8cb7af35c5d930fb76', '[\"*\"]', NULL, '2023-03-21 16:46:01', '2023-03-21 16:46:01'),
(16, 'App\\Models\\User', 1, 'Personal Access Token', 'a721d3a4c80463689f3485a9c2f0932d018d7704fad365dd8ac836794a150169', '[\"*\"]', NULL, '2023-03-21 16:46:30', '2023-03-21 16:46:30'),
(17, 'App\\Models\\User', 2, 'Personal Access Token', 'd5814bd36bf8316f80f91659638f8445b17e65f75c6e264622e00408e654160f', '[\"*\"]', NULL, '2023-03-21 16:47:52', '2023-03-21 16:47:52'),
(18, 'App\\Models\\User', 2, 'Personal Access Token', '5a46e6ab6f3eee380f9f10db11f802f10f68a1155c0df4cb00d69aed6aef3731', '[\"*\"]', NULL, '2023-03-21 16:48:22', '2023-03-21 16:48:22'),
(19, 'App\\Models\\User', 2, 'Personal Access Token', 'd9b2ef93a4991261f577ab0e2e1453d1f53a2d7bb64634a40c97889b27f7b699', '[\"*\"]', NULL, '2023-03-21 16:48:42', '2023-03-21 16:48:42'),
(20, 'App\\Models\\User', 2, 'Personal Access Token', 'a6babf04e8b3d1675a5d989c34debb5f84b0715d60031e98e470852f0152788c', '[\"*\"]', NULL, '2023-03-21 16:49:20', '2023-03-21 16:49:20'),
(21, 'App\\Models\\User', 2, 'Personal Access Token', 'b7d653e7855afd4d6ba8d6ddb701c8804e9e9c5fcf8ce3abc71e9b89e0d9dd16', '[\"*\"]', NULL, '2023-03-21 16:49:56', '2023-03-21 16:49:56'),
(22, 'App\\Models\\User', 2, 'Personal Access Token', '39e065eefc139442f7dbd5dde6f772d371b87bcc639706236fff2f0eb97b3073', '[\"*\"]', NULL, '2023-03-21 16:55:58', '2023-03-21 16:55:58'),
(23, 'App\\Models\\User', 2, 'Personal Access Token', '81c2f3189542cbd969ae48f2c8211778f4ec258cbbe41670d146ca5ff2815e77', '[\"*\"]', NULL, '2023-03-21 16:56:30', '2023-03-21 16:56:30'),
(24, 'App\\Models\\User', 2, 'Personal Access Token', '809004e00f30886acd02082c514484bdcfef6f85caf18334b4d623b68f1830ba', '[\"*\"]', NULL, '2023-03-21 16:57:54', '2023-03-21 16:57:54'),
(25, 'App\\Models\\User', 2, 'Personal Access Token', '13a431809c2282a3408deca3c6867ed478a61b0a2aeed3aa7c3c5521d1b69f9c', '[\"*\"]', NULL, '2023-03-22 02:54:07', '2023-03-22 02:54:07'),
(26, 'App\\Models\\User', 2, 'Personal Access Token', '1d23dc63b98f357085a8f950ebd87da4f99631bb7c7ec472c9968534b174a229', '[\"*\"]', NULL, '2023-03-22 02:55:19', '2023-03-22 02:55:19'),
(27, 'App\\Models\\User', 2, 'Personal Access Token', '0d019bab53342112fd64759bf1c424bd3dbd23512d9a12468cd85b9f39a5e6c7', '[\"*\"]', NULL, '2023-03-22 02:56:40', '2023-03-22 02:56:40'),
(28, 'App\\Models\\User', 2, 'Personal Access Token', 'd6881697358fa468138c8686d0405134ab0c88d7d8dbe47ca899569df1437645', '[\"*\"]', NULL, '2023-03-22 02:57:42', '2023-03-22 02:57:42'),
(29, 'App\\Models\\User', 2, 'Personal Access Token', '98d1ef8a1c2dc66202db07e8d07fa00d82224ad4c10352a786076a8fb5bf7a63', '[\"*\"]', NULL, '2023-03-22 03:02:04', '2023-03-22 03:02:04'),
(30, 'App\\Models\\User', 2, 'Personal Access Token', '13f78f0c19e33f7c494ed1328139e014e26337009a5ec464be39302e5733b5fa', '[\"*\"]', NULL, '2023-03-22 03:02:47', '2023-03-22 03:02:47'),
(31, 'App\\Models\\User', 2, 'Personal Access Token', '670be1d66868f8be45adf63fc9899c38bd6c141e4effd53e41f225ee645d7ea3', '[\"*\"]', NULL, '2023-03-22 03:14:26', '2023-03-22 03:14:26'),
(32, 'App\\Models\\User', 2, 'Personal Access Token', '713d7c0509b9bf6b6e2267cd06aaa5bd53d303ddb6cf8eac9a85ecf0758a73fd', '[\"*\"]', NULL, '2023-03-22 03:19:17', '2023-03-22 03:19:17'),
(33, 'App\\Models\\User', 2, 'Personal Access Token', '3991910a75704945b8711d4599429788ed3473538ffb8b2ad0f8bc0961f0279f', '[\"*\"]', NULL, '2023-03-22 03:21:13', '2023-03-22 03:21:13'),
(34, 'App\\Models\\User', 2, 'Personal Access Token', '7eeae021aaefa2faa2fd77bb34f813d7abe94126cfa87814373de0788bcede80', '[\"*\"]', NULL, '2023-03-22 03:22:46', '2023-03-22 03:22:46'),
(35, 'App\\Models\\User', 2, 'Personal Access Token', '3802c01c181ce0d8939cca864194f78d73185575cb3dcc3bbcc9d56bc9cb3525', '[\"*\"]', NULL, '2023-03-22 03:24:32', '2023-03-22 03:24:32'),
(36, 'App\\Models\\User', 2, 'Personal Access Token', '0273d466985b7c605d508387d00107336f685960c464e7df5000f1558d4c2ea0', '[\"*\"]', NULL, '2023-03-22 03:25:46', '2023-03-22 03:25:46'),
(37, 'App\\Models\\User', 2, 'Personal Access Token', '2d4eaf1fd4b6ab6375b847a53a22256bef21d734166b8b6d00e1f92f297105c4', '[\"*\"]', NULL, '2023-03-22 03:26:42', '2023-03-22 03:26:42'),
(38, 'App\\Models\\User', 2, 'Personal Access Token', '227c23460a9a90193537cdcb29decd23922e721082967ab94b0249cdbbc8862c', '[\"*\"]', NULL, '2023-03-22 03:29:38', '2023-03-22 03:29:38'),
(39, 'App\\Models\\User', 2, 'Personal Access Token', '5d40a283cf8ca2c7afde48fa95794046a778dc2671f249671afe0332cb8487ae', '[\"*\"]', NULL, '2023-03-22 03:30:45', '2023-03-22 03:30:45'),
(40, 'App\\Models\\User', 2, 'Personal Access Token', 'b8d3d0c34909650eaf3c43fa838ced320b8c5383b302cecc8606a0676830ed58', '[\"*\"]', NULL, '2023-03-22 04:31:58', '2023-03-22 04:31:58'),
(41, 'App\\Models\\User', 2, 'Personal Access Token', '8d6dd456943af0a69377e73026ad80c34be1c1e0f1cd7cadaba201239294026f', '[\"*\"]', NULL, '2023-03-22 04:44:07', '2023-03-22 04:44:07'),
(42, 'App\\Models\\User', 2, 'Personal Access Token', '617429d19ed089de0031ee37444bba9b15b8369115330ec3991220438c57855d', '[\"*\"]', NULL, '2023-03-22 04:48:44', '2023-03-22 04:48:44'),
(43, 'App\\Models\\User', 2, 'Personal Access Token', 'bc328c0fef8a946894ed29919bf5489c402ae6420d1aca589b48e46418f0918c', '[\"*\"]', NULL, '2023-03-22 04:59:30', '2023-03-22 04:59:30'),
(44, 'App\\Models\\User', 2, 'Personal Access Token', 'f31984bdaccabac798eb261586a94a18ea13b1f6d730b565c0027dcbb80287fd', '[\"*\"]', NULL, '2023-03-22 05:00:29', '2023-03-22 05:00:29'),
(45, 'App\\Models\\User', 2, 'Personal Access Token', 'aa5643ac1a7aa5d1e99e1b80d679033d69a986de0c098bee6597960cf0745fee', '[\"*\"]', NULL, '2023-03-22 05:02:47', '2023-03-22 05:02:47'),
(46, 'App\\Models\\User', 2, 'Personal Access Token', '40eba248b9765b0c4d8281c5c2c5a9bc371aa1529d4e7c349a2920465c77d90e', '[\"*\"]', NULL, '2023-03-22 05:04:20', '2023-03-22 05:04:20'),
(47, 'App\\Models\\User', 2, 'Personal Access Token', 'bea5c4a5a7c49fc268970aa3f6f1767abba1359669292c7249df3d247047a9d1', '[\"*\"]', NULL, '2023-03-22 05:07:40', '2023-03-22 05:07:40'),
(48, 'App\\Models\\User', 2, 'Personal Access Token', '96ea2a29a7220dc424e4fc9066c5ed8ac01d896034356e25335ea946f7f5160c', '[\"*\"]', NULL, '2023-03-22 05:11:02', '2023-03-22 05:11:02'),
(49, 'App\\Models\\User', 1, 'Personal Access Token', 'aad378720efba1cf1ca6feb963848fe102d934adeb9249307c20652a9f737623', '[\"*\"]', NULL, '2023-03-22 05:13:31', '2023-03-22 05:13:31'),
(50, 'App\\Models\\User', 2, 'Personal Access Token', '47d70e78bf0f47532ee0076aefedc955e755eef0a80e707e874de704c6c7aebc', '[\"*\"]', NULL, '2023-03-22 05:14:27', '2023-03-22 05:14:27'),
(51, 'App\\Models\\User', 2, 'Personal Access Token', '148025cc448744bff8b49e4ec9538e3a66b2a94c907e18191e4cbcd2dd7b9a81', '[\"*\"]', NULL, '2023-03-22 05:21:38', '2023-03-22 05:21:38'),
(52, 'App\\Models\\User', 2, 'Personal Access Token', '14161f5d950ef464e4b7aefa844d7971cff4fc8df023f5131adf354e6272224a', '[\"*\"]', NULL, '2023-03-22 05:26:11', '2023-03-22 05:26:11'),
(53, 'App\\Models\\User', 2, 'Personal Access Token', '2e46f1be4f342957e24621320a2caa555b728c0f7ca132768964ca6529de42c5', '[\"*\"]', NULL, '2023-03-22 05:27:33', '2023-03-22 05:27:33'),
(54, 'App\\Models\\User', 1, 'Personal Access Token', '83eb9bacefaa5ba49699f0566a1f7c1f914be74b42ea4426818588ffacd27c41', '[\"*\"]', NULL, '2023-03-22 05:27:54', '2023-03-22 05:27:54'),
(55, 'App\\Models\\User', 2, 'Personal Access Token', 'bc002ff076fe569ae9513744d591c34b7da98c43d24e49b813118295f5919ead', '[\"*\"]', NULL, '2023-03-22 06:28:40', '2023-03-22 06:28:40'),
(56, 'App\\Models\\User', 2, 'Personal Access Token', '1c36868246bca2d285f3a26f937c743cb81f5bcad3ac8a094ddabb4f101b87e2', '[\"*\"]', NULL, '2023-03-22 06:59:17', '2023-03-22 06:59:17'),
(57, 'App\\Models\\User', 1, 'Personal Access Token', '6a36a91142a245c5dec8bb717a98179feb303a467f949ae8e698c6bf8fdc4fdb', '[\"*\"]', NULL, '2023-03-22 16:05:04', '2023-03-22 16:05:04'),
(58, 'App\\Models\\User', 2, 'Personal Access Token', 'cb33150e340d3a64946be06077a96e0328b22d2469a8a401eb7507b6f00e4c06', '[\"*\"]', NULL, '2023-03-22 16:08:30', '2023-03-22 16:08:30'),
(59, 'App\\Models\\User', 2, 'Personal Access Token', '482404231cabce5b41edd847ea3bbf23ef996da18630738585031b70f33f0d78', '[\"*\"]', NULL, '2023-03-22 16:08:32', '2023-03-22 16:08:32'),
(60, 'App\\Models\\User', 1, 'Personal Access Token', '4307e77518008062a9aeb9f7919a0f96c3a19ebd0b87731b50a9cef15e2f5a80', '[\"*\"]', NULL, '2023-03-22 16:09:28', '2023-03-22 16:09:28');

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
('dONyBJbzkDgOByYZaDPRXxcal5Lvmn5P7zVqtzLy', NULL, '192.168.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.44', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRwZmdjMXptQkVQT1RXWllOaDNkRHFOemhSdllYcFZsNFRwOGt5eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xOTIuMTY4LjEuNzg6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1679378160),
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
(1, '197201', '18210725', 'Isaac Valdez Contreras', 'isaac.cvaldez18@tectijuana.edu.mx', '$2y$10$3IHKuB.v0BGMcL9AsJpv.eW.YN.jy84.LhtL9w4Rk3AoQ4ZVoBJgm', '2023-03-21 13:00:58', '2023-03-21 13:00:58'),
(2, '6135181', '18210726', 'Isaac Valdez Contreras', 'iissaavvaa@hotmail.com', '$2y$10$QoGdTmZWsz7ZcPwKx7ih9efkpV97.tctSbv7yMruIgvUSXkrHcRaa', '2023-03-21 16:47:52', '2023-03-21 16:47:52');

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
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`appoid`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `matricula` (`matricula`);

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
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de la tabla `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
