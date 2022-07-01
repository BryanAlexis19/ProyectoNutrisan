-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-06-2022 a las 19:27:12
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_nutrisan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add categoria_alimento', 1, 'add_categoria_alimento'),
(2, 'Can change categoria_alimento', 1, 'change_categoria_alimento'),
(3, 'Can delete categoria_alimento', 1, 'delete_categoria_alimento'),
(4, 'Can view categoria_alimento', 1, 'view_categoria_alimento'),
(5, 'Can add paciente', 2, 'add_paciente'),
(6, 'Can change paciente', 2, 'change_paciente'),
(7, 'Can delete paciente', 2, 'delete_paciente'),
(8, 'Can view paciente', 2, 'view_paciente'),
(9, 'Can add trabajador', 3, 'add_trabajador'),
(10, 'Can change trabajador', 3, 'change_trabajador'),
(11, 'Can delete trabajador', 3, 'delete_trabajador'),
(12, 'Can view trabajador', 3, 'view_trabajador'),
(13, 'Can add diagnostico', 4, 'add_diagnostico'),
(14, 'Can change diagnostico', 4, 'change_diagnostico'),
(15, 'Can delete diagnostico', 4, 'delete_diagnostico'),
(16, 'Can view diagnostico', 4, 'view_diagnostico'),
(17, 'Can add alimento', 5, 'add_alimento'),
(18, 'Can change alimento', 5, 'change_alimento'),
(19, 'Can delete alimento', 5, 'delete_alimento'),
(20, 'Can view alimento', 5, 'view_alimento'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$GmhK0amk2b3dmntv3S4R03$qW++Cdg64ZJr1LUCoz3nAlhKBFPEWseVlE+qU+QJBeM=', '2022-06-27 21:14:44.603322', 1, 'admin', 'Bryan', 'Diaz Dreyfus', 'librale19@gmail.com', 1, 1, '2022-06-22 04:10:53.000000'),
(2, 'pbkdf2_sha256$320000$VwBuWISmspJQFoJ4ouxz8V$LxeSwmIdoCP1zGTm66Su43VY+EV/goach2CFoGlbfy4=', '2022-06-26 03:56:43.124283', 1, 'sduenas', 'Sofia', 'Dueñas Arámbulo', 'samda19@gmail.com', 1, 1, '2022-06-23 02:57:46.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-23 02:57:46.977792', '2', 'sduenas', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-06-23 02:59:00.335819', '65749053', ' ', 1, '[{\"added\": {}}]', 3, 1),
(3, '2022-06-23 03:02:04.982006', '2', 'sduenas', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]', 9, 1),
(4, '2022-06-24 04:48:48.834483', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 9, 1),
(5, '2022-06-25 21:49:10.642920', '1', 'Cereales y Derivados', 1, '[{\"added\": {}}]', 1, 2),
(6, '2022-06-25 21:49:23.410562', '2', 'Verduras, Hortalizas y Derivados', 1, '[{\"added\": {}}]', 1, 2),
(7, '2022-06-25 22:42:05.462099', 'A1', 'Achita, kiwicha o achis', 1, '[{\"added\": {}}]', 5, 1),
(8, '2022-06-25 22:53:10.592020', 'B3', 'Ají amarillo fresco', 1, '[{\"added\": {}}]', 5, 1),
(9, '2022-06-25 22:58:57.457578', '3', 'Frutas y Derivados', 1, '[{\"added\": {}}]', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(5, 'nutriApp', 'alimento'),
(1, 'nutriApp', 'categoria_alimento'),
(4, 'nutriApp', 'diagnostico'),
(2, 'nutriApp', 'paciente'),
(3, 'nutriApp', 'trabajador'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-22 04:07:19.074691'),
(2, 'auth', '0001_initial', '2022-06-22 04:07:19.977884'),
(3, 'admin', '0001_initial', '2022-06-22 04:07:20.156905'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-22 04:07:20.168900'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-22 04:07:20.181472'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-22 04:07:20.292554'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-22 04:07:20.375092'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-22 04:07:20.407974'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-22 04:07:20.420109'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-22 04:07:20.502812'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-22 04:07:20.508526'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-22 04:07:20.523705'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-22 04:07:20.616463'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-22 04:07:20.699471'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-22 04:07:20.727362'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-22 04:07:20.742252'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-22 04:07:20.823360'),
(18, 'nutriApp', '0001_initial', '2022-06-22 04:07:21.322071'),
(19, 'sessions', '0001_initial', '2022-06-22 04:07:21.396139'),
(20, 'nutriApp', '0002_rename_companiante_parentezco_paciente_acompaniante_parentezco', '2022-06-25 18:14:32.812126'),
(21, 'nutriApp', '0003_alter_paciente_acompaniante_parentezco', '2022-06-25 19:46:58.023625');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2uwcg36uhrhg786nh072s0nytg1tre84', '.eJxVjDsOwjAQBe_iGllOvP5R0nMGa3dt4wBypDipEHeHSCmgfTPzXiLitta49bzEKYmzGMTpdyPkR247SHdst1ny3NZlIrkr8qBdXueUn5fD_Tuo2Ou3RuCMwSfL4DEZUmzIQx5GxY5K0DbAaJMnx6U4yGCNCVq74mxQpKwW7w_6Qze9:1o5EjP:FIP4DeA1JlAc5xhQueF4TqJH79jLSczhdmseX4RAXlI', '2022-07-09 22:58:23.297220'),
('43sfqy6uuqrdb284x3hbi8ysenr4twwr', '.eJxVjDsOwjAQBe_iGllOvP5R0nMGa3dt4wBypDipEHeHSCmgfTPzXiLitta49bzEKYmzGMTpdyPkR247SHdst1ny3NZlIrkr8qBdXueUn5fD_Tuo2Ou3RuCMwSfL4DEZUmzIQx5GxY5K0DbAaJMnx6U4yGCNCVq74mxQpKwW7w_6Qze9:1o5w4C:FiS6HqFHKvFhuYEKxIWGy2PuVnC4-vfpKcrIlgGIjj8', '2022-07-11 21:14:44.612491'),
('7dxw8aukye2k1jdxyz6v8d196wu5j425', 'e30:1o4bIT:a4W3L5VTrVNtqmthdPqcnbeRtCqnUNNs7b6S42-9Zio', '2022-07-08 04:51:57.498139'),
('d53i7khtc2mpej7xxhk9mt1ir1hkv46h', 'e30:1o4bI9:kpmiiMc6f_8tf3nyWBin-uG7bhqXR8mgG2ovwbsNi1I', '2022-07-08 04:51:37.871696'),
('ewhmo55m4m9qnesrewl4rb8jxzawyqec', 'e30:1o4c5Z:AVzNftWox03dvC180qdzKjSN00iMIXkby_PBoj0cqMA', '2022-07-08 05:42:41.641653'),
('jutybb8k2uqacen3z82wn41e0bbml28y', 'e30:1o4bBs:P9dmZdiOdYxae9wlmQHQ-L5Vo6XA4A8UZDmRaNLMSBk', '2022-07-08 04:45:08.237943'),
('lon31doae087gd9qvfk2w4okmrf1z0t7', 'e30:1o4bxO:rYp-8qLYfWzvoLUYiB9VE0vedSCMCOM0nAFTMcAfqB8', '2022-07-08 05:34:14.683521'),
('r8tw53cjx3af6e1abrgh8ex6aca1xe4a', 'e30:1o4bvn:3SodtP8cKFprBvYqBNshPfPvVJDzMVY8O2P0k8yfwIo', '2022-07-08 05:32:35.224962'),
('shqyr1cv0fso8c9actp1nauej7t9kzfd', 'e30:1o4bLi:E2W-thjyRquKEjnOXJ6V2MHthXt5oEhf6MGLRvhZSoU', '2022-07-08 04:55:18.582729'),
('uhcaurcf7s6ozy1mdjr5q1g6ci952177', 'e30:1o4aRb:cv3pEj31Q84_kvpQdn0r7CLXbzOqq23r7YYWONBNBq0', '2022-07-08 03:57:19.023493');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutriApp_alimento`
--

CREATE TABLE `nutriApp_alimento` (
  `codigo_alimento` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_alimento` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `energ` decimal(10,2) DEFAULT NULL,
  `agua` decimal(10,2) DEFAULT NULL,
  `prot_t` decimal(10,2) DEFAULT NULL,
  `grasa_t` decimal(10,2) DEFAULT NULL,
  `carboh` decimal(10,2) DEFAULT NULL,
  `fib` decimal(10,2) DEFAULT NULL,
  `calc` decimal(10,2) DEFAULT NULL,
  `fosf` decimal(10,2) DEFAULT NULL,
  `zinc` decimal(10,2) DEFAULT NULL,
  `hier` decimal(10,2) DEFAULT NULL,
  `b_carot` decimal(10,2) DEFAULT NULL,
  `vit_a` decimal(10,2) DEFAULT NULL,
  `tiam` decimal(10,2) DEFAULT NULL,
  `ribo` decimal(10,2) DEFAULT NULL,
  `niac` decimal(10,2) DEFAULT NULL,
  `vit_c` decimal(10,2) DEFAULT NULL,
  `aci_fol` decimal(10,2) DEFAULT NULL,
  `sodio` decimal(10,2) DEFAULT NULL,
  `potas` decimal(10,2) DEFAULT NULL,
  `categoria_alimento_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nutriApp_alimento`
--

INSERT INTO `nutriApp_alimento` (`codigo_alimento`, `nombre_alimento`, `energ`, `agua`, `prot_t`, `grasa_t`, `carboh`, `fib`, `calc`, `fosf`, `zinc`, `hier`, `b_carot`, `vit_a`, `tiam`, `ribo`, `niac`, `vit_c`, `aci_fol`, `sodio`, `potas`, `categoria_alimento_id`) VALUES
('B3', 'Ají amarillo fresco', '39.00', '88.90', '0.90', '0.70', '8.80', '0.00', '31.00', '21.00', '0.00', '0.90', '0.00', '445.00', '0.06', '0.58', '1.25', '60.00', '0.00', '0.00', '0.00', 2),
('h76', 'SOFIA', '0.00', '0.00', '7888.00', '10000.00', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutriApp_categoria_alimento`
--

CREATE TABLE `nutriApp_categoria_alimento` (
  `id` bigint NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `estado_registro` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nutriApp_categoria_alimento`
--

INSERT INTO `nutriApp_categoria_alimento` (`id`, `nombre_categoria`, `fecha_registro`, `estado_registro`) VALUES
(1, 'Cereales y Derivados', '2022-06-25 21:49:10.642385', 1),
(2, 'Verduras, Hortalizas y Derivados', '2022-06-25 21:49:23.409792', 1),
(3, 'Frutas y Derivados', '2022-06-25 22:58:57.456735', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutriApp_diagnostico`
--

CREATE TABLE `nutriApp_diagnostico` (
  `id` bigint NOT NULL,
  `estado_nutri` longtext COLLATE utf8mb4_general_ci,
  `req_ener` decimal(10,2) DEFAULT NULL,
  `req_carboh` decimal(10,2) DEFAULT NULL,
  `req_prot` decimal(10,2) DEFAULT NULL,
  `req_grasa` decimal(10,2) DEFAULT NULL,
  `tipo_patologia` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_dieta` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `r24_ener` decimal(10,2) DEFAULT NULL,
  `r24_carboh` decimal(10,2) DEFAULT NULL,
  `r24_prot` decimal(10,2) DEFAULT NULL,
  `r24_grasa` decimal(10,2) DEFAULT NULL,
  `r24_analisis` longtext COLLATE utf8mb4_general_ci,
  `fc_analisis` longtext COLLATE utf8mb4_general_ci,
  `recomendaciones` longtext COLLATE utf8mb4_general_ci,
  `fecha_registro` datetime(6) NOT NULL,
  `estado_registro` tinyint(1) NOT NULL,
  `file1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paciente_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `trabajador_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutriApp_paciente`
--

CREATE TABLE `nutriApp_paciente` (
  `doc_identidad_pac` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido_paterno` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido_materno` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `domicilio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `genero` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grado_instruccion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_seguro` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `religion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ocupacion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado_civil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grupo_etnico` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acompaniante_nombre` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acompaniante_parentezco` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `estado_registro` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nutriApp_paciente`
--

INSERT INTO `nutriApp_paciente` (`doc_identidad_pac`, `apellido_paterno`, `apellido_materno`, `nombre`, `fecha_nacimiento`, `lugar_nacimiento`, `telefono`, `domicilio`, `genero`, `email`, `grado_instruccion`, `tipo_seguro`, `religion`, `ocupacion`, `estado_civil`, `grupo_etnico`, `acompaniante_nombre`, `acompaniante_parentezco`, `fecha_registro`, `estado_registro`) VALUES
('06588872', 'Diaz', 'Chiok', 'Leonardo', '1954-10-22', 'Lima', '998004399', 'El Agustino', 'M', 'leodichis@gmail.com', 'Tecnica', 'Essalud', '', '', 'Divorciado', '', '', 'Hijo(a)', '2022-06-25 18:58:09.104935', 1),
('12349876', 'Pistolas', 'Canevaro', 'Pancho', '2022-01-21', 'Lima', '999777555', 'Aqui', 'M', '', 'Sin Grado', 'Sin seguro', '', '', 'Divorciado', '', '', 'Otro', '2022-06-25 19:50:13.013641', 1),
('15447633', 'Arambulo', 'Fernandez', 'Susana del Carmen', '1960-09-15', 'Paramonga', '999999999', 'Los Cipreses', 'F', 'susyarf@gmail.com', 'Tecnica', 'EPS', 'Catolica', 'Ama de Casa', 'Casado', 'Otro', 'Carmen Dueñas Arambulo', 'Hijo(a)', '2022-06-26 04:59:11.928618', 1),
('21341234', 'Mendez', 'Flores', 'Prudencio', '1996-02-12', 'Aqui', '132412341', 'Los cristales', 'F', '', 'Sin Grado', 'Ministerio de Salud', '', '', 'Casado', '', '', 'Madre', '2022-06-25 20:11:54.015967', 1),
('25415678', 'Dreyfus', 'Gutierrez', 'Lita', '1962-03-12', 'Lima Peru', '991706884', 'El Agustino', 'M', 'lbdreyfus@gmail.com', 'Secundaria', 'Ministerio de Salud', 'otro', 'otro', 'Viudo', 'otro', 'leonardo', 'Otro', '2022-06-25 18:49:29.508075', 1),
('27340912', 'Pistolas', 'Mendez', 'Pancho', '1997-12-12', 'Maynas', '089709817', 'Calle las Begonias', 'M', '', 'Primaria', 'Sin seguro', '', '', 'Divorciado', '', '', 'Otro', '2022-06-25 20:06:46.735404', 1),
('52346234', 'Polastri', 'Diaz', 'Soli', '1993-05-04', 'asdfasfd', '123412341', 'sdf4erasf', 'M', '', 'Secundaria', 'Essalud', '', '', 'Divorciado', '', '', 'Otro', '2022-06-25 20:58:27.677343', 0),
('70482171', 'Diaz', 'Dreyfus', 'Bryan', '2022-06-08', 'Lima', '991746203', 'Pasaje Julio C. Tello 349 - El Agustino', 'M', 'librale19@gmail.com', 'Tecnica', 'Essalud', 'Catolico', 'Digitador Asistencial', 'Soltero', 'Raza Fina', '', '', '2022-06-25 21:22:52.442354', 1),
('81723409', 'Logitech', 'Vaso', 'Luis', '1993-12-06', 'Aca pue', '981723409', 'Las ritas', 'F', '', 'Secundaria', 'Essalud', '', '', 'Casado', '', '', NULL, '2022-06-25 21:16:17.014153', 0),
('98237569', 'Jorge-blanco', 'terrones', 'pangis', '1993-12-06', 'Aca pue', '981723409', 'Las ritas', 'F', '', 'Secundaria', 'Essalud', '', '', 'Casado', '', '', '', '2022-06-25 21:17:39.737849', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutriApp_trabajador`
--

CREATE TABLE `nutriApp_trabajador` (
  `doc_identidad_trab` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `genero` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `especialidad` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `domicilio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nutriApp_trabajador`
--

INSERT INTO `nutriApp_trabajador` (`doc_identidad_trab`, `genero`, `especialidad`, `domicilio`, `telefono`, `usuario_id`) VALUES
('65749053', 'F', 'Nutricionista', 'Calle Los Cipreses 184 - Paramonga', '994538549', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `nutriApp_alimento`
--
ALTER TABLE `nutriApp_alimento`
  ADD PRIMARY KEY (`codigo_alimento`),
  ADD KEY `nutriApp_alimento_categoria_alimento_i_f58cec62_fk_nutriApp_` (`categoria_alimento_id`);

--
-- Indices de la tabla `nutriApp_categoria_alimento`
--
ALTER TABLE `nutriApp_categoria_alimento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nutriApp_diagnostico`
--
ALTER TABLE `nutriApp_diagnostico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nutriApp_diagnostico_paciente_id_125906b1_fk_nutriApp_` (`paciente_id`),
  ADD KEY `nutriApp_diagnostico_trabajador_id_22bd5c34_fk_nutriApp_` (`trabajador_id`);

--
-- Indices de la tabla `nutriApp_paciente`
--
ALTER TABLE `nutriApp_paciente`
  ADD PRIMARY KEY (`doc_identidad_pac`);

--
-- Indices de la tabla `nutriApp_trabajador`
--
ALTER TABLE `nutriApp_trabajador`
  ADD PRIMARY KEY (`doc_identidad_trab`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `nutriApp_categoria_alimento`
--
ALTER TABLE `nutriApp_categoria_alimento`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `nutriApp_diagnostico`
--
ALTER TABLE `nutriApp_diagnostico`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `nutriApp_alimento`
--
ALTER TABLE `nutriApp_alimento`
  ADD CONSTRAINT `nutriApp_alimento_categoria_alimento_i_f58cec62_fk_nutriApp_` FOREIGN KEY (`categoria_alimento_id`) REFERENCES `nutriApp_categoria_alimento` (`id`);

--
-- Filtros para la tabla `nutriApp_diagnostico`
--
ALTER TABLE `nutriApp_diagnostico`
  ADD CONSTRAINT `nutriApp_diagnostico_paciente_id_125906b1_fk_nutriApp_` FOREIGN KEY (`paciente_id`) REFERENCES `nutriApp_paciente` (`doc_identidad_pac`),
  ADD CONSTRAINT `nutriApp_diagnostico_trabajador_id_22bd5c34_fk_nutriApp_` FOREIGN KEY (`trabajador_id`) REFERENCES `nutriApp_trabajador` (`doc_identidad_trab`);

--
-- Filtros para la tabla `nutriApp_trabajador`
--
ALTER TABLE `nutriApp_trabajador`
  ADD CONSTRAINT `nutriApp_trabajador_usuario_id_7a02a274_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
