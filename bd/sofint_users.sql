-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2016 a las 15:30:07
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdsofint`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofint_users`
--

CREATE TABLE IF NOT EXISTS `sofint_users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `sofint_users`
--

INSERT INTO `sofint_users` (`id`, `nick`, `password`, `nombre`, `apellido`, `telefono`, `movil`, `email`, `foto`, `direccion`, `perfil`, `estado`, `fecha_creacion`, `dat1`, `dat2`, `dat3`, `dat4`, `dat5`) VALUES
(3, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Juan', 'ruiz', 3763662, 3173418547, 'nojuancho@hotmail.com', 'na', 'Avenida 6ta No 13 62', 1, 1, 1390152537, 1, '615', '1', '0', ''),
(7, 'juan', '827ccb0eea8a706c4c34a16891f84e7b', '', '', 0, 0, '', '', '', 4, 1, 1450756420, 0, '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sofint_users`
--
ALTER TABLE `sofint_users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sofint_users`
--
ALTER TABLE `sofint_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
