-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2018 a las 19:17:25
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(21, 'recordatorios', 'reporteDetallado', 'application.modules.recordatorios.controllers.acciones.ReporteDetalladoAction'),
(22, 'recordatorios', 'registrarLlamada', 'application.modules.recordatorios.controllers.acciones.RegistrarLlamadaAction'),
(23, 'recordatorios', 'reporteLlamadas', 'application.modules.recordatorios.controllers.acciones.ReporteLlamadasAction');

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
('CONSECUTIVO', 1000),
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
(751, 'admin', 'admin', 'admin', 1, 1, 1531327057),
(752, 'maestros', 'maestros', 'maestros', 1, 1, 1531327057),
(753, 'plugins', 'plugins', 'plugins', 1, 1, 1531327057),
(754, 'plugins', 'plugins', 'index', 1, 1, 1531327057),
(755, 'plugins', 'plugins', 'registrarplugin', 1, 1, 1531327058),
(756, 'plugins', 'plugins', 'unregistrarplugin', 1, 1, 1531327058),
(757, 'recordatorios', 'recordatorios', 'recordatorios', 1, 1, 1531327058),
(758, 'recordatorios', 'recordatorios', 'index', 1, 1, 1531327058),
(759, 'recordatorios', 'recordatorios', 'formularioSubir', 1, 1, 1531327058),
(760, 'recordatorios', 'recordatorios', 'subir', 1, 1, 1531327058),
(761, 'recordatorios', 'recordatorios', 'formularioOpciones', 1, 1, 1531327058),
(762, 'recordatorios', 'recordatorios', 'enviarCorreos', 1, 1, 1531327058),
(763, 'recordatorios', 'recordatorios', 'enviarSms', 1, 1, 1531327058),
(764, 'recordatorios', 'recordatorios', 'enviarLlamadas', 1, 1, 1531327058),
(765, 'recordatorios', 'recordatorios', 'reporte', 1, 1, 1531327058),
(766, 'recordatorios', 'recordatorios', 'guardarOpciones', 1, 1, 1531327058),
(767, 'recordatorios', 'recordatorios', 'reporteDetallado', 1, 1, 1531327058),
(768, 'recordatorios', 'recordatorios', 'registrarLlamada', 1, 1, 1531327058),
(769, 'recordatorios', 'recordatorios', 'reporteLlamadas', 1, 1, 1531327058),
(770, 'usuarios', 'usuarios', 'usuarios', 1, 1, 1531327058),
(771, 'usuarios', 'usuarios', 'index', 1, 1, 1531327058),
(772, 'usuarios', 'usuarios', 'view', 1, 1, 1531327058),
(773, 'usuarios', 'usuarios', 'create', 1, 1, 1531327058),
(774, 'usuarios', 'usuarios', 'borrar', 1, 1, 1531327058),
(775, 'usuarios', 'usuarios', 'perfil', 1, 1, 1531327058),
(776, 'usuarios', 'usuarios', 'verperfil', 1, 1, 1531327058),
(777, 'usuarios', 'usuarios', 'borrarperfil', 1, 1, 1531327058),
(778, 'usuarios', 'usuarios', 'grupo', 1, 1, 1531327058);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios_enviados`
--

CREATE TABLE `recordatorios_enviados` (
  `id_cita_recordatorio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(6) NOT NULL,
  `recibida` varchar(2) NOT NULL
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
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Edgar Mauricio', 'Ceron Florez', 0, 0, 'edgar.ceron@correounivalle.edu.co', '', '', 1, -1, 1390152537, 1, '1', '+573176483290', '', ''),

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `citas_recordatorios`
--
ALTER TABLE `citas_recordatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=839;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil_contenido`
--
ALTER TABLE `perfil_contenido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=779;

--
-- AUTO_INCREMENT de la tabla `sofint_users`
--
ALTER TABLE `sofint_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recordatorios_enviados`
--
ALTER TABLE `recordatorios_enviados`
  ADD CONSTRAINT `recordatorios_enviados_ibfk_1` FOREIGN KEY (`id_cita_recordatorio`) REFERENCES `citas_recordatorios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
