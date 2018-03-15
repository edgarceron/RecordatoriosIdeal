-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2016 a las 17:40:58
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdsofint_new`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metas_plato`
--

CREATE TABLE IF NOT EXISTS `metas_plato` (
`id` int(11) NOT NULL,
  `plato` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `fecha` bigint(20) NOT NULL,
  `punto` varchar(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `metas_plato`
--

INSERT INTO `metas_plato` (`id`, `plato`, `porcentaje`, `fecha`, `punto`) VALUES
(1, 1, 5, 1459123200, '021G'),
(2, 2, 10, 1459123200, '021G'),
(3, 3, 65, 1459123200, '021G'),
(4, 4, 15, 1459123200, '021G'),
(5, 5, 5, 1459123200, '021G'),
(6, 1, 5, 1459209600, '021G'),
(7, 2, 10, 1459209600, '021G'),
(8, 3, 65, 1459209600, '021G'),
(9, 4, 15, 1459209600, '021G'),
(10, 5, 5, 1459209600, '021G'),
(11, 1, 5, 1459296000, '021G'),
(12, 2, 10, 1459296000, '021G'),
(13, 3, 65, 1459296000, '021G'),
(14, 4, 15, 1459296000, '021G'),
(15, 5, 5, 1459296000, '021G'),
(16, 1, 5, 1459382400, '021G'),
(17, 2, 10, 1459382400, '021G'),
(18, 3, 65, 1459382400, '021G'),
(19, 4, 15, 1459382400, '021G'),
(20, 5, 5, 1459382400, '021G');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `metas_plato`
--
ALTER TABLE `metas_plato`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `metas_plato`
--
ALTER TABLE `metas_plato`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
