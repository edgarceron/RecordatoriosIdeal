-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2016 a las 15:31:06
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
-- Estructura de tabla para la tabla `sofint_config`
--

CREATE TABLE IF NOT EXISTS `sofint_config` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nit` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `movil` bigint(20) NOT NULL,
  `web` varchar(200) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `gcalid` varchar(100) NOT NULL,
  `gmailuser` varchar(100) NOT NULL,
  `gmailclave` varchar(100) NOT NULL,
  `asterurl` varchar(100) NOT NULL,
  `asteruser` varchar(100) NOT NULL,
  `asterclave` varchar(100) NOT NULL,
  `dat1` int(11) NOT NULL,
  `dat2` varchar(100) NOT NULL,
  `dat3` varchar(100) NOT NULL,
  `dat4` varchar(100) NOT NULL,
  `dat5` varchar(100) NOT NULL,
  `dat6` varchar(100) NOT NULL,
  `dat7` varchar(100) NOT NULL,
  `dat8` varchar(100) NOT NULL,
  `dat9` varchar(100) NOT NULL,
  `dat10` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sofint_config`
--

INSERT INTO `sofint_config` (`id`, `nombre`, `nit`, `direccion`, `telefono`, `movil`, `web`, `logo`, `gcalid`, `gmailuser`, `gmailclave`, `asterurl`, `asteruser`, `asterclave`, `dat1`, `dat2`, `dat3`, `dat4`, `dat5`, `dat6`, `dat7`, `dat8`, `dat9`, `dat10`) VALUES
(1, 'Grupo Ingenieros Solutions', '1113641983-4', 'Avenida 6a # 18 69 \r\nEdificio Shopping las Fuentes\r\nOfi 000', 3763662, 3148446923, 'http://www.grupoingsolutions.com', 'yii.png', 'grupoingenieros.soluciones@gmail.com', 'grupoingenieros.soluciones@gmail.com', 'Juan.890922', '200.29.112.240', 'sofint', 'S0f1n7cRm', 0, 'Las Cotizaciones tienen una validez de 15 días.', 'Los pedidos se despachan previa aprobación de la consignación bancaria.', 'Facturas superiores a 8 días no tienen devolución.', 'Esta es la información que van a ver en el Dashboard', '0', '0', '0', '0', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sofint_config`
--
ALTER TABLE `sofint_config`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sofint_config`
--
ALTER TABLE `sofint_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
