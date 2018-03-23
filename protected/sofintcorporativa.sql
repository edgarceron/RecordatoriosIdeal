-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2018 a las 14:29:52
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
(16, 'recordatorios', 'enviarCorreos', 'application.modules.recordatorios.controllers.acciones.EnviarCorreosAction');

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
(7, 'Edgar Ceron', '2018-03-07 07:30:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '3176483290', NULL),
(8, 'Nancy Holgin', '2018-03-07 07:50:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '3176483290', NULL),
(9, 'Kristhian David', '2018-03-07 08:10:00', 'OSCAR CONDE', 'CALLE 50 #10A-08', 'FISIATRIA', 'Presentar Documento de identidad, Autorizaci?n, Historia cl?nica, copago o cuota moderadora.  Llegar 15 minutos antes', 'maurinin@yahoo.com', '3176483290', NULL);

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
(62, 16, 1, '2018-03-23 13:25:34');

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
(608, 'admin', 'admin', 'admin', 1, 1, 1521468284),
(609, 'maestros', 'maestros', 'maestros', 1, 1, 1521468284),
(610, 'plugins', 'plugins', 'plugins', 1, 1, 1521468284),
(611, 'plugins', 'plugins', 'index', 1, 1, 1521468284),
(612, 'plugins', 'plugins', 'registrarplugin', 1, 1, 1521468284),
(613, 'plugins', 'plugins', 'unregistrarplugin', 1, 1, 1521468284),
(614, 'recordatorios', 'recordatorios', 'recordatorios', 1, 1, 1521468284),
(615, 'recordatorios', 'recordatorios', 'index', 1, 1, 1521468284),
(616, 'recordatorios', 'recordatorios', 'formularioSubir', 1, 1, 1521468284),
(617, 'recordatorios', 'recordatorios', 'subir', 1, 1, 1521468284),
(618, 'recordatorios', 'recordatorios', 'formularioOpciones', 1, 1, 1521468284),
(619, 'recordatorios', 'recordatorios', 'enviarCorreos', 1, 1, 1521468284),
(620, 'usuarios', 'usuarios', 'usuarios', 1, 1, 1521468285),
(621, 'usuarios', 'usuarios', 'index', 1, 1, 1521468285),
(622, 'usuarios', 'usuarios', 'view', 1, 1, 1521468285),
(623, 'usuarios', 'usuarios', 'create', 1, 1, 1521468285),
(624, 'usuarios', 'usuarios', 'borrar', 1, 1, 1521468285),
(625, 'usuarios', 'usuarios', 'perfil', 1, 1, 1521468285),
(626, 'usuarios', 'usuarios', 'verperfil', 1, 1, 1521468285),
(627, 'usuarios', 'usuarios', 'borrarperfil', 1, 1, 1521468285),
(628, 'usuarios', 'usuarios', 'grupo', 1, 1, 1521468285);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios_enviados`
--

CREATE TABLE `recordatorios_enviados` (
  `id_cita_recordatorio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `citas_recordatorios`
--
ALTER TABLE `citas_recordatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `perfil_contenido`
--
ALTER TABLE `perfil_contenido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=629;
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
  ADD CONSTRAINT `recordatorios_enviados_ibfk_1` FOREIGN KEY (`id_cita_recordatorio`) REFERENCES `citas_recordatorios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
