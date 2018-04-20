-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2018 a las 03:49:35
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sofintcorporativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id` int(11) NOT NULL,
  `modulo` varchar(20) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `ruta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `modulo`, `accion`, `ruta`) VALUES
(1, 'plugins', 'index', 'application.modules.plugins.controllers.acciones.IndexAction'),
(2, 'plugins', 'registrarplugin', 'application.modules.plugins.controllers.acciones.RegistrarpluginAction'),
(3, 'plugins', 'unregistrarplugin', 'application.modules.plugins.controllers.acciones.UnregistrarpluginAction'),
(4, 'usuarios', 'index', 'application.modules.usuarios.controllers.acciones.IndexAction'),
(5, 'usuarios', 'view', 'application.modules.usuarios.controllers.acciones.ViewAction'),
(6, 'usuarios', 'create', 'application.modules.usuarios.controllers.acciones.CreateAction'),
(7, 'usuarios', 'borrar', 'application.modules.usuarios.controllers.acciones.BorrarAction'),
(8, 'usuarios', 'perfil', 'application.modules.usuarios.controllers.acciones.PerfilAction'),
(9, 'usuarios', 'verperfil', 'application.modules.usuarios.controllers.acciones.VerperfilAction'),
(10, 'usuarios', 'borrarperfil', 'application.modules.usuarios.controllers.acciones.BorrarperfilAction'),
(11, 'usuarios', 'grupo', 'application.modules.usuarios.controllers.acciones.GrupoAction'),
(12, 'recordatorios', 'index', 'application.modules.recordatorios.controllers.acciones.IndexAction'),
(13, 'recordatorios', 'formularioSubir', 'application.modules.recordatorios.controllers.acciones.FormularioSubirAction'),
(14, 'recordatorios', 'subir', 'application.modules.recordatorios.controllers.acciones.SubirAction'),
(15, 'recordatorios', 'formularioOpciones', 'application.modules.recordatorios.controllers.acciones.FormularioOpcionesAction'),
(16, 'recordatorios', 'enviarCorreos', 'application.modules.recordatorios.controllers.acciones.EnviarCorreosAction'),
(17, 'recordatorios', 'enviarSms', 'application.modules.recordatorios.controllers.acciones.EnviarSmsAction'),
(18, 'recordatorios', 'enviarLlamadas', 'application.modules.recordatorios.controllers.acciones.EnviarLlamadasAction'),
(19, 'recordatorios', 'reporte', 'application.modules.recordatorios.controllers.acciones.ReporteAction'),
(20, 'recordatorios', 'guardarOpciones', 'application.modules.recordatorios.controllers.acciones.GuardarOpcionesAction'),
(21, 'recordatorios', 'reporteDetallado', 'application.modules.recordatorios.controllers.acciones.ReporteDetalladoAction');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_recordatorios`
--

CREATE TABLE `citas_recordatorios` (
  `id` int(11) NOT NULL,
  `nombre_paciente` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `nombre_profesional` varchar(30) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `servicio` varchar(40) NOT NULL,
  `mensaje` text NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `sede` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `citas_recordatorios`
--

INSERT INTO `citas_recordatorios` (`id`, `nombre_paciente`, `fecha`, `nombre_profesional`, `direccion`, `servicio`, `mensaje`, `correo`, `telefono`, `sede`) VALUES
(1, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50  numero 10 A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(2, 'Kristhian David', '2018-04-09 08:10:00', 'OSCAR CONDE', 'CALLE 50  numero 10 A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(3, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(4, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(5, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(6, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(7, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(8, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(9, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(10, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(11, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', NULL),
(12, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', NULL),
(13, 'Edgar Ceron', '2018-04-06 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', 'Centro'),
(14, 'Kristhian David', '2018-04-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '102', 'Sur'),
(15, 'Edgar Mauricio Ceron', '2018-04-20 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '101', 'Centro'),
(16, 'Kristhian David Ceron', '2018-04-21 08:10:00', 'LUNA RICAUTE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizacion, Historia clinica, copago o cuota moderadora.  Llegar 15 minutos antes', 'kagenekosama@gmail.com', '102', 'Sur');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`) VALUES
(1, 'ADMINISTRACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `ID` int(11) NOT NULL,
  `accion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`ID`, `accion`, `usuario`, `fecha`) VALUES
(1, 12, 1, '2018-03-15 02:30:12'),
(2, 12, 1, '2018-03-19 14:04:12'),
(3, 14, 1, '2018-03-19 14:04:15'),
(4, 12, 1, '2018-03-19 14:04:28'),
(5, 12, 1, '2018-03-19 14:04:48'),
(6, 14, 1, '2018-03-19 14:04:49'),
(7, 16, 1, '2018-03-19 14:04:55'),
(8, 16, 1, '2018-03-19 17:46:57'),
(9, 16, 1, '2018-03-19 17:47:20'),
(10, 16, 1, '2018-03-19 17:49:12'),
(11, 12, 1, '2018-03-19 17:56:56'),
(12, 14, 1, '2018-03-19 17:56:59'),
(13, 14, 1, '2018-03-19 17:58:59'),
(14, 14, 1, '2018-03-19 18:03:40'),
(15, 14, 1, '2018-03-19 18:03:49'),
(16, 14, 1, '2018-03-19 18:05:54'),
(17, 14, 1, '2018-03-19 18:06:01'),
(18, 16, 1, '2018-03-19 18:06:35'),
(19, 16, 1, '2018-03-20 20:08:39'),
(20, 16, 1, '2018-03-20 20:11:53'),
(21, 16, 1, '2018-03-20 20:12:14'),
(22, 16, 1, '2018-03-20 20:13:17'),
(23, 16, 1, '2018-03-20 20:13:55'),
(24, 16, 1, '2018-03-20 20:18:11'),
(25, 16, 1, '2018-03-20 20:21:54'),
(26, 16, 1, '2018-03-20 22:37:59'),
(27, 16, 1, '2018-03-20 22:38:26'),
(28, 16, 1, '2018-03-20 22:38:41'),
(29, 16, 1, '2018-03-20 22:41:48'),
(30, 16, 1, '2018-03-20 22:43:08'),
(31, 16, 1, '2018-03-20 22:45:54'),
(32, 16, 1, '2018-03-20 22:47:46'),
(33, 16, 1, '2018-03-20 22:48:02'),
(34, 16, 1, '2018-03-20 22:49:24'),
(35, 16, 1, '2018-03-20 22:50:06'),
(36, 16, 1, '2018-03-20 23:07:27'),
(37, 16, 1, '2018-03-20 23:09:21'),
(38, 16, 1, '2018-03-20 23:09:37'),
(39, 16, 1, '2018-03-20 23:17:10'),
(40, 16, 1, '2018-03-20 23:18:31'),
(41, 16, 1, '2018-03-20 23:21:50'),
(42, 16, 1, '2018-03-20 23:24:09'),
(43, 16, 1, '2018-03-20 23:29:37'),
(44, 16, 1, '2018-03-20 23:36:30'),
(45, 16, 1, '2018-03-20 23:38:43'),
(46, 16, 1, '2018-03-20 23:40:21'),
(47, 16, 1, '2018-03-20 23:44:07'),
(48, 16, 1, '2018-03-21 01:07:27'),
(49, 16, 1, '2018-03-21 01:09:48'),
(50, 16, 1, '2018-03-21 01:21:37'),
(51, 16, 1, '2018-03-21 01:33:31'),
(52, 16, 1, '2018-03-21 01:36:52'),
(53, 16, 1, '2018-03-21 01:44:09'),
(54, 16, 1, '2018-03-21 01:45:06'),
(55, 16, 1, '2018-03-21 01:46:40'),
(56, 16, 1, '2018-03-21 01:48:18'),
(57, 16, 1, '2018-03-21 01:57:29'),
(58, 16, 1, '2018-03-21 01:58:33'),
(59, 16, 1, '2018-03-21 02:02:10'),
(60, 16, 1, '2018-03-21 02:02:59'),
(61, 16, 1, '2018-03-21 02:05:16'),
(62, 16, 1, '2018-03-23 13:25:34'),
(63, 0, 1, '2018-03-28 15:20:09'),
(64, 16, 1, '2018-03-28 15:20:09'),
(65, 16, 1, '2018-03-28 15:21:53'),
(66, 16, 1, '2018-03-28 15:27:01'),
(67, 16, 1, '2018-03-28 15:28:15'),
(68, 16, 1, '2018-03-28 15:30:46'),
(69, 16, 1, '2018-03-28 15:31:04'),
(70, 16, 1, '2018-03-28 15:35:27'),
(71, 16, 1, '2018-03-28 15:37:10'),
(72, 12, 1, '2018-03-28 15:37:42'),
(73, 14, 1, '2018-03-28 15:37:46'),
(74, 14, 1, '2018-03-28 15:40:48'),
(75, 14, 1, '2018-03-28 15:40:50'),
(76, 14, 1, '2018-03-28 15:41:05'),
(77, 14, 1, '2018-03-28 15:41:37'),
(78, 14, 1, '2018-03-28 15:41:45'),
(79, 14, 1, '2018-03-28 15:44:32'),
(80, 14, 1, '2018-03-28 15:44:39'),
(81, 14, 1, '2018-03-28 15:48:24'),
(82, 14, 1, '2018-03-28 15:49:00'),
(83, 14, 1, '2018-03-28 15:57:06'),
(84, 14, 1, '2018-03-28 15:57:17'),
(85, 14, 1, '2018-03-28 16:00:18'),
(86, 14, 1, '2018-03-28 16:00:22'),
(87, 14, 1, '2018-03-28 16:02:44'),
(88, 14, 1, '2018-03-28 16:05:37'),
(89, 16, 1, '2018-03-28 16:08:45'),
(90, 16, 1, '2018-03-28 16:26:43'),
(91, 16, 1, '2018-03-28 16:27:57'),
(92, 16, 1, '2018-03-28 16:29:06'),
(93, 16, 1, '2018-03-28 21:29:10'),
(94, 14, 1, '2018-03-28 21:29:25'),
(95, 0, 1, '2018-03-28 21:29:38'),
(96, 16, 1, '2018-03-28 21:29:38'),
(97, 17, 1, '2018-03-28 21:30:07'),
(98, 12, 1, '2018-03-28 21:31:33'),
(99, 14, 1, '2018-03-28 21:31:35'),
(100, 14, 1, '2018-03-28 21:33:13'),
(101, 17, 1, '2018-03-28 21:33:27'),
(102, 17, 1, '2018-03-28 21:39:24'),
(103, 17, 1, '2018-03-28 21:40:07'),
(104, 17, 1, '2018-03-28 21:40:32'),
(105, 17, 1, '2018-03-28 21:40:55'),
(106, 17, 1, '2018-03-28 21:42:27'),
(107, 17, 1, '2018-03-28 21:55:51'),
(108, 17, 1, '2018-03-28 21:55:59'),
(109, 17, 1, '2018-03-28 21:56:13'),
(110, 17, 1, '2018-03-28 21:57:49'),
(111, 17, 1, '2018-03-28 21:58:25'),
(112, 17, 1, '2018-03-28 21:58:46'),
(113, 17, 1, '2018-03-28 22:07:12'),
(114, 17, 1, '2018-03-28 22:08:10'),
(115, 17, 1, '2018-03-28 22:09:15'),
(116, 17, 1, '2018-03-28 22:09:31'),
(117, 17, 1, '2018-03-28 22:13:56'),
(118, 17, 1, '2018-03-28 22:14:09'),
(119, 0, 1, '2018-04-05 17:54:34'),
(120, 12, 1, '2018-04-05 17:54:37'),
(121, 14, 1, '2018-04-05 17:54:39'),
(122, 14, 1, '2018-04-05 18:18:46'),
(123, 14, 1, '2018-04-05 18:18:53'),
(124, 14, 1, '2018-04-05 18:19:04'),
(125, 12, 1, '2018-04-05 18:19:07'),
(126, 12, 1, '2018-04-05 18:21:08'),
(127, -1, 1, '2018-04-05 18:21:16'),
(128, 0, 1, '2018-04-05 18:21:18'),
(129, 12, 1, '2018-04-05 18:23:35'),
(130, 18, 1, '2018-04-05 18:23:47'),
(131, 12, 1, '2018-04-05 18:27:14'),
(132, 14, 1, '2018-04-05 18:27:17'),
(133, 14, 1, '2018-04-05 18:27:23'),
(134, 14, 1, '2018-04-05 18:27:25'),
(135, 18, 1, '2018-04-05 18:27:32'),
(136, 14, 1, '2018-04-05 18:31:09'),
(137, 14, 1, '2018-04-05 18:31:20'),
(138, 18, 1, '2018-04-05 18:31:32'),
(139, 18, 1, '2018-04-05 18:33:59'),
(140, 18, 1, '2018-04-05 18:35:09'),
(141, 12, 1, '2018-04-05 18:35:27'),
(142, 14, 1, '2018-04-05 18:35:29'),
(143, 14, 1, '2018-04-05 18:35:34'),
(144, 18, 1, '2018-04-05 18:35:37'),
(145, 14, 1, '2018-04-05 18:38:52'),
(146, 14, 1, '2018-04-05 18:38:56'),
(147, 18, 1, '2018-04-05 18:39:01'),
(148, 14, 1, '2018-04-05 18:39:03'),
(149, 14, 1, '2018-04-05 18:39:08'),
(150, 18, 1, '2018-04-05 18:39:11'),
(151, 14, 1, '2018-04-05 18:39:38'),
(152, 14, 1, '2018-04-05 18:39:43'),
(153, 18, 1, '2018-04-05 18:39:46'),
(154, 14, 1, '2018-04-05 18:41:10'),
(155, 14, 1, '2018-04-05 18:41:17'),
(156, 18, 1, '2018-04-05 18:41:19'),
(157, 14, 1, '2018-04-05 18:42:16'),
(158, 14, 1, '2018-04-05 18:42:21'),
(159, 18, 1, '2018-04-05 18:42:23'),
(160, 14, 1, '2018-04-05 18:43:27'),
(161, 14, 1, '2018-04-05 18:43:31'),
(162, 18, 1, '2018-04-05 18:43:33'),
(163, 14, 1, '2018-04-05 18:44:33'),
(164, 14, 1, '2018-04-05 18:44:38'),
(165, 18, 1, '2018-04-05 18:44:40'),
(166, 14, 1, '2018-04-05 18:46:23'),
(167, 14, 1, '2018-04-05 18:46:29'),
(168, 18, 1, '2018-04-05 18:46:31'),
(169, 18, 1, '2018-04-05 18:46:54'),
(170, 14, 1, '2018-04-05 18:47:25'),
(171, 14, 1, '2018-04-05 18:47:33'),
(172, 18, 1, '2018-04-05 18:47:35'),
(173, 14, 1, '2018-04-05 18:48:10'),
(174, 14, 1, '2018-04-05 18:48:15'),
(175, 18, 1, '2018-04-05 18:48:17'),
(176, 14, 1, '2018-04-05 18:52:57'),
(177, 18, 1, '2018-04-05 19:05:49'),
(178, 14, 1, '2018-04-05 19:05:59'),
(179, 18, 1, '2018-04-05 19:06:01'),
(180, 18, 1, '2018-04-05 19:06:02'),
(181, 14, 1, '2018-04-05 19:06:05'),
(182, 18, 1, '2018-04-05 19:06:38'),
(183, 18, 1, '2018-04-05 19:10:47'),
(184, 18, 1, '2018-04-05 19:20:02'),
(185, 18, 1, '2018-04-05 19:23:32'),
(186, 18, 1, '2018-04-05 19:23:44'),
(187, 18, 1, '2018-04-05 19:24:23'),
(188, 18, 1, '2018-04-05 19:24:24'),
(189, 18, 1, '2018-04-05 19:26:12'),
(190, 14, 1, '2018-04-05 19:34:37'),
(191, 14, 1, '2018-04-05 19:34:43'),
(192, 18, 1, '2018-04-05 19:34:52'),
(193, 18, 1, '2018-04-05 19:38:10'),
(194, 18, 1, '2018-04-05 19:38:11'),
(195, 18, 1, '2018-04-05 19:38:53'),
(196, 18, 1, '2018-04-05 19:38:57'),
(197, 18, 1, '2018-04-05 19:39:13'),
(198, 18, 1, '2018-04-05 19:41:17'),
(199, 18, 1, '2018-04-05 19:43:20'),
(200, 12, 1, '2018-04-05 20:09:44'),
(201, 14, 1, '2018-04-05 20:09:45'),
(202, 14, 1, '2018-04-05 20:09:53'),
(203, 18, 1, '2018-04-05 20:10:00'),
(204, 14, 1, '2018-04-05 20:38:23'),
(205, 14, 1, '2018-04-05 20:38:24'),
(206, 14, 1, '2018-04-05 20:38:26'),
(207, 14, 1, '2018-04-05 20:38:37'),
(208, 18, 1, '2018-04-05 20:39:14'),
(209, 14, 1, '2018-04-05 20:45:43'),
(210, 14, 1, '2018-04-05 20:45:53'),
(211, 18, 1, '2018-04-05 20:45:56'),
(212, 14, 1, '2018-04-05 20:47:48'),
(213, 14, 1, '2018-04-05 20:47:58'),
(214, 18, 1, '2018-04-05 20:48:00'),
(215, 14, 1, '2018-04-05 20:54:17'),
(216, 14, 1, '2018-04-05 20:54:31'),
(217, 18, 1, '2018-04-05 20:54:33'),
(218, 14, 1, '2018-04-05 21:03:26'),
(219, 14, 1, '2018-04-05 21:03:31'),
(220, 18, 1, '2018-04-05 21:03:35'),
(221, 12, 1, '2018-04-19 15:21:31'),
(222, 12, 1, '2018-04-19 15:37:37'),
(223, 19, 1, '2018-04-19 15:37:39'),
(224, 19, 1, '2018-04-19 15:40:07'),
(225, 19, 1, '2018-04-19 15:40:23'),
(226, 19, 1, '2018-04-19 15:42:14'),
(227, 19, 1, '2018-04-19 15:42:29'),
(228, 19, 1, '2018-04-19 15:44:21'),
(229, 19, 1, '2018-04-19 15:45:07'),
(230, 19, 1, '2018-04-19 15:45:19'),
(231, 19, 1, '2018-04-19 15:46:05'),
(232, 19, 1, '2018-04-19 15:48:20'),
(233, 19, 1, '2018-04-19 15:49:37'),
(234, 19, 1, '2018-04-19 15:50:03'),
(235, 19, 1, '2018-04-19 15:50:28'),
(236, 19, 1, '2018-04-19 15:51:01'),
(237, 19, 1, '2018-04-19 15:51:49'),
(238, 19, 1, '2018-04-19 15:51:52'),
(239, 19, 1, '2018-04-19 15:57:22'),
(240, 19, 1, '2018-04-19 16:05:03'),
(241, 19, 1, '2018-04-19 16:05:34'),
(242, 19, 1, '2018-04-19 16:05:39'),
(243, 19, 1, '2018-04-19 16:05:40'),
(244, 19, 1, '2018-04-19 16:05:40'),
(245, 19, 1, '2018-04-19 16:05:41'),
(246, 19, 1, '2018-04-19 16:05:42'),
(247, 19, 1, '2018-04-19 16:05:48'),
(248, 19, 1, '2018-04-19 16:06:12'),
(249, 19, 1, '2018-04-19 16:06:29'),
(250, 19, 1, '2018-04-19 16:06:51'),
(251, 19, 1, '2018-04-19 16:07:04'),
(252, 19, 1, '2018-04-19 16:09:20'),
(253, 19, 1, '2018-04-19 16:12:57'),
(254, 19, 1, '2018-04-19 16:13:10'),
(255, 19, 1, '2018-04-19 16:13:28'),
(256, 19, 1, '2018-04-19 16:13:38'),
(257, 19, 1, '2018-04-19 16:15:35'),
(258, 19, 1, '2018-04-19 16:15:39'),
(259, 19, 1, '2018-04-19 16:17:34'),
(260, 19, 1, '2018-04-19 16:19:13'),
(261, 19, 1, '2018-04-19 16:19:41'),
(262, 19, 1, '2018-04-19 16:19:45'),
(263, 19, 1, '2018-04-19 16:22:01'),
(264, 19, 1, '2018-04-19 16:32:54'),
(265, 19, 1, '2018-04-19 16:33:14'),
(266, 19, 1, '2018-04-19 16:34:26'),
(267, 19, 1, '2018-04-19 16:34:30'),
(268, 19, 1, '2018-04-19 16:35:57'),
(269, 19, 1, '2018-04-19 16:36:18'),
(270, 19, 1, '2018-04-19 16:38:02'),
(271, 19, 1, '2018-04-19 16:39:38'),
(272, 19, 1, '2018-04-19 16:40:30'),
(273, 19, 1, '2018-04-19 16:41:04'),
(274, 19, 1, '2018-04-19 16:41:52'),
(275, 19, 1, '2018-04-19 16:43:05'),
(276, 19, 1, '2018-04-19 16:45:06'),
(277, 19, 1, '2018-04-19 16:46:34'),
(278, 19, 1, '2018-04-19 16:48:23'),
(279, 19, 1, '2018-04-19 16:49:17'),
(280, 19, 1, '2018-04-19 16:50:42'),
(281, 19, 1, '2018-04-19 16:50:50'),
(282, 19, 1, '2018-04-19 16:51:52'),
(283, 19, 1, '2018-04-19 16:53:08'),
(284, 19, 1, '2018-04-19 16:59:12'),
(285, 19, 1, '2018-04-19 16:59:41'),
(286, 19, 1, '2018-04-19 16:59:43'),
(287, 19, 1, '2018-04-19 16:59:46'),
(288, 19, 1, '2018-04-19 17:02:25'),
(289, 16, 1, '2018-04-19 17:03:15'),
(290, 19, 1, '2018-04-19 17:03:24'),
(291, 12, 1, '2018-04-19 17:04:54'),
(292, 14, 1, '2018-04-19 17:04:56'),
(293, 14, 1, '2018-04-19 17:05:08'),
(294, 14, 1, '2018-04-19 17:05:14'),
(295, 12, 1, '2018-04-19 17:05:17'),
(296, 16, 1, '2018-04-19 17:05:25'),
(297, 16, 1, '2018-04-19 17:08:03'),
(298, 12, 1, '2018-04-19 17:09:26'),
(299, 19, 1, '2018-04-19 17:09:30'),
(300, 19, 1, '2018-04-19 17:09:36'),
(301, 12, 1, '2018-04-19 17:16:45'),
(302, 14, 1, '2018-04-19 17:17:17'),
(303, 0, 1, '2018-04-19 17:43:08'),
(304, 12, 1, '2018-04-19 17:43:11'),
(305, 19, 1, '2018-04-19 17:48:16'),
(306, 12, 1, '2018-04-19 17:48:22'),
(307, 19, 1, '2018-04-19 17:48:54'),
(308, 19, 1, '2018-04-19 17:48:57'),
(309, 12, 1, '2018-04-19 17:48:59'),
(310, 15, 1, '2018-04-19 17:49:00'),
(311, 15, 1, '2018-04-19 17:50:11'),
(312, 15, 1, '2018-04-19 17:51:01'),
(313, 12, 1, '2018-04-19 17:52:46'),
(314, 19, 1, '2018-04-19 17:53:02'),
(315, 12, 1, '2018-04-20 00:54:35'),
(316, 19, 1, '2018-04-20 00:54:38'),
(317, 19, 1, '2018-04-20 00:58:25'),
(318, 19, 1, '2018-04-20 00:59:10'),
(319, 19, 1, '2018-04-20 01:00:45'),
(320, 19, 1, '2018-04-20 01:00:59'),
(321, 19, 1, '2018-04-20 01:01:10'),
(322, 19, 1, '2018-04-20 01:02:27'),
(323, 19, 1, '2018-04-20 01:02:57'),
(324, 19, 1, '2018-04-20 01:03:06'),
(325, 19, 1, '2018-04-20 01:03:13'),
(326, 19, 1, '2018-04-20 01:03:21'),
(327, 19, 1, '2018-04-20 01:03:37'),
(328, 19, 1, '2018-04-20 01:03:42'),
(329, 19, 1, '2018-04-20 01:04:26'),
(330, 19, 1, '2018-04-20 01:04:32'),
(331, 19, 1, '2018-04-20 01:04:43'),
(332, 12, 1, '2018-04-20 01:04:47'),
(333, 12, 1, '2018-04-20 01:05:04'),
(334, 19, 1, '2018-04-20 01:05:05'),
(335, 21, 1, '2018-04-20 01:05:07'),
(336, 19, 1, '2018-04-20 01:05:13'),
(337, 21, 1, '2018-04-20 01:18:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_creacion` bigint(20) NOT NULL,
  `version` varchar(20) NOT NULL,
  `desarrollador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `estado`, `fecha_creacion`, `version`, `desarrollador`) VALUES
('admin', 'admin', 1, 1459344759, '1', 'nojuancho@hotmail.com'),
('maestros', 'maestros', 1, 1464791267, '1', 'nojuancho@hotmail.com'),
('plugins', 'plugins', 1, 1459344760, '1', 'nojuancho@hotmail.com'),
('recordatorios', 'recordatorios', 1, 1520774998, '1', 'nojuancho@hotmail.com'),
('usuarios', 'usuarios', 1, 1459344761, '1', 'nojuancho@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `opcion` varchar(20) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`opcion`, `valor`) VALUES
('DIAS_ANTES', 3),
('NUM_CAMPANA', 1),
('NUM_RECORDATORIOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_creacion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`, `descripcion`, `fecha_creacion`) VALUES
(1, 'ADMINISTRADOR', 'Administrador del sistema', 1459345066);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_contenido`
--

CREATE TABLE `perfil_contenido` (
  `id` int(11) NOT NULL,
  `modulo` varchar(20) NOT NULL,
  `controlador` varchar(20) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  `fecha_creacion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil_contenido`
--

INSERT INTO `perfil_contenido` (`id`, `modulo`, `controlador`, `accion`, `estado`, `perfil`, `fecha_creacion`) VALUES
(698, 'admin', 'admin', 'admin', 1, 1, 1524186300),
(699, 'maestros', 'maestros', 'maestros', 1, 1, 1524186300),
(700, 'plugins', 'plugins', 'plugins', 1, 1, 1524186300),
(701, 'plugins', 'plugins', 'index', 1, 1, 1524186301),
(702, 'plugins', 'plugins', 'registrarplugin', 1, 1, 1524186301),
(703, 'plugins', 'plugins', 'unregistrarplugin', 1, 1, 1524186301),
(704, 'recordatorios', 'recordatorios', 'recordatorios', 1, 1, 1524186301),
(705, 'recordatorios', 'recordatorios', 'index', 1, 1, 1524186301),
(706, 'recordatorios', 'recordatorios', 'formularioSubir', 1, 1, 1524186301),
(707, 'recordatorios', 'recordatorios', 'subir', 1, 1, 1524186301),
(708, 'recordatorios', 'recordatorios', 'formularioOpciones', 1, 1, 1524186301),
(709, 'recordatorios', 'recordatorios', 'enviarCorreos', 1, 1, 1524186301),
(710, 'recordatorios', 'recordatorios', 'enviarSms', 1, 1, 1524186301),
(711, 'recordatorios', 'recordatorios', 'enviarLlamadas', 1, 1, 1524186301),
(712, 'recordatorios', 'recordatorios', 'reporte', 1, 1, 1524186301),
(713, 'recordatorios', 'recordatorios', 'guardarOpciones', 1, 1, 1524186301),
(714, 'recordatorios', 'recordatorios', 'reporteDetallado', 1, 1, 1524186301),
(715, 'usuarios', 'usuarios', 'usuarios', 1, 1, 1524186301),
(716, 'usuarios', 'usuarios', 'index', 1, 1, 1524186301),
(717, 'usuarios', 'usuarios', 'view', 1, 1, 1524186301),
(718, 'usuarios', 'usuarios', 'create', 1, 1, 1524186301),
(719, 'usuarios', 'usuarios', 'borrar', 1, 1, 1524186301),
(720, 'usuarios', 'usuarios', 'perfil', 1, 1, 1524186301),
(721, 'usuarios', 'usuarios', 'verperfil', 1, 1, 1524186301),
(722, 'usuarios', 'usuarios', 'borrarperfil', 1, 1, 1524186301),
(723, 'usuarios', 'usuarios', 'grupo', 1, 1, 1524186301);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios_enviados`
--

CREATE TABLE `recordatorios_enviados` (
  `id_cita_recordatorio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recordatorios_enviados`
--

INSERT INTO `recordatorios_enviados` (`id_cita_recordatorio`, `fecha`, `tipo`) VALUES
(1, '2018-04-05', 'CALL'),
(3, '2018-04-05', 'CALL'),
(4, '2018-04-05', 'CALL'),
(5, '2018-04-05', 'CALL'),
(6, '2018-04-05', 'CALL'),
(7, '2018-04-05', 'CALL'),
(8, '2018-04-05', 'CALL'),
(9, '2018-04-05', 'CALL'),
(10, '2018-04-05', 'CALL'),
(11, '2018-04-05', 'CALL'),
(12, '2018-04-05', 'CALL'),
(13, '2018-04-05', 'CALL'),
(14, '2018-04-05', 'CALL'),
(15, '2018-04-19', 'E-MAIL'),
(16, '2018-04-19', 'E-MAIL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofint_users`
--

CREATE TABLE `sofint_users` (
  `id` int(11) NOT NULL,
  `nick` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `movil` bigint(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `direccion` text NOT NULL,
  `perfil` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_creacion` int(11) NOT NULL,
  `dat1` int(11) NOT NULL,
  `dat2` varchar(50) NOT NULL,
  `dat3` varchar(100) NOT NULL,
  `dat4` varchar(50) NOT NULL,
  `dat5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofint_users`
--

INSERT INTO `sofint_users` (`id`, `nick`, `password`, `nombre`, `apellido`, `telefono`, `movil`, `email`, `foto`, `direccion`, `perfil`, `estado`, `fecha_creacion`, `dat1`, `dat2`, `dat3`, `dat4`, `dat5`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Edgar Mauricio', 'Ceron Florez', 0, 0, 'edgar.ceron@correounivalle.edu.co', '', '', 1, -1, 1390152537, 1, '1', '+573176483290', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `citas_recordatorios`
--
ALTER TABLE `citas_recordatorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`opcion`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil_contenido`
--
ALTER TABLE `perfil_contenido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recordatorios_enviados`
--
ALTER TABLE `recordatorios_enviados`
  ADD PRIMARY KEY (`id_cita_recordatorio`,`fecha`,`tipo`);

--
-- Indices de la tabla `sofint_users`
--
ALTER TABLE `sofint_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `citas_recordatorios`
--
ALTER TABLE `citas_recordatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `perfil_contenido`
--
ALTER TABLE `perfil_contenido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;
--
-- AUTO_INCREMENT de la tabla `sofint_users`
--
ALTER TABLE `sofint_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recordatorios_enviados`
--
ALTER TABLE `recordatorios_enviados`
  ADD CONSTRAINT `recordatorios_enviados_ibfk_1` FOREIGN KEY (`id_cita_recordatorio`) REFERENCES `citas_recordatorios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
