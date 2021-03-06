-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2016 a las 15:40:17
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
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `costo_unitario` int(11) NOT NULL,
  `fecha_creacion` bigint(20) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=137 ;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `unidad`, `costo_unitario`, `fecha_creacion`, `usuario`) VALUES
(1, 'CAJA DOMICILIO COMBO', 'UNIDAD', 255, 1455302351, 3),
(2, 'CAMARONES', 'KILO', 27000, 1455566458, 3),
(3, 'CARNE PROCESADA  TERIYAKI', 'BOLSA', 12156, 1455566905, 3),
(4, 'CERDO MARINADO BBQ', 'BOLSA', 6124, 1455566978, 3),
(5, 'CERDO AGRIDULCE 0,5 KG', 'BOLSA', 6833, 1455567112, 3),
(6, 'CARNE MONGOLIAN SR WOK 0,5 KG', 'BOLSA', 8691, 1455567151, 3),
(7, 'COSTILLA PROCESADA', 'UNIDAD', 2819, 1455567218, 3),
(8, 'JAMON', 'KILO', 21597, 1455567240, 3),
(9, 'POLLO PROCESADO BOURBON', 'BOLSA', 7866, 1455567257, 3),
(10, 'POLLO PROCESADO NARANJA x 1,5 kg', 'BOLSA', 10789, 1455567306, 3),
(11, 'POLLO PROCESADO TERIYAKI', 'BOLSA', 12116, 1455567342, 3),
(12, 'MANTEQUILLA', 'UNIDAD', 2207, 1455567420, 3),
(13, 'LAMINA LUMPIA', 'UNIDAD', 140, 1455567441, 3),
(14, 'HUEVO LIQUIDO', 'KILO', 4616, 1455567488, 3),
(15, 'PAPA FRANCESA', 'KILO', 5837, 1455567511, 3),
(16, 'HIELO', 'KILO', 500, 1455567533, 3),
(17, 'SALSA KOREAN', 'KILO', 0, 1455567550, 3),
(18, 'SALSA BBQ CHINA', 'KILO', 0, 1455567563, 3),
(19, 'SALSA BBQ COSTILLAS', 'KILO', 6090, 1455567603, 3),
(20, 'SALSA BOURBON', 'KILO', 2625, 1455567621, 3),
(21, 'SALSA CHOP SUEY', 'KILO', 12549, 1455567688, 3),
(22, 'SALSA KUNG PAO', 'KILO', 2950, 1455568027, 3),
(23, 'SALSA NARANJA', 'KILO', 2635, 1455568099, 3),
(24, 'SALSA TERIYAKY', 'KILO', 1943, 1455568113, 3),
(25, 'SALSA OSTRAS', 'KILO', 16814, 1455568127, 3),
(26, 'SALSA SOYA', 'KILO', 1680, 1455568169, 3),
(27, 'SALSA MONGOLIAN', 'KILO', 3500, 1455568326, 3),
(28, 'SALSA AGRIDULCE PICANTE', 'KILO', 2500, 1455568344, 3),
(29, 'AJI (SRIRACHA)', 'UNIDAD', 12300, 1455568360, 3),
(30, 'SALSA SOYA SACHET', 'UNIDAD', 32, 1455568374, 3),
(31, 'SALSA AGRIDULCE SACHET', 'UNIDAD', 32, 1455568388, 3),
(32, 'SALSA TOMATE SACHET', 'UNIDAD', 32, 1455568403, 3),
(33, 'ACEITE DE MAIZ', 'UNIDAD', 85000, 1455568417, 3),
(34, 'FECULA', 'KILO', 0, 1455568431, 3),
(35, 'HUEVO', 'UNIDAD', 0, 1455568445, 3),
(36, 'ARROZ CRUDO', 'KILO', 3300, 1455568460, 3),
(37, 'CONDIMENTO 5 ESPECIES', 'KILO', 77958, 1455568500, 3),
(38, 'CONDIMENTO WOK', 'KILO', 3990, 1455568515, 3),
(39, 'MANI', 'KILO', 6897, 1455568535, 3),
(40, 'MEZCLARINA', 'KILO', 5570, 1455568550, 3),
(41, 'PASTA', 'KILO', 11250, 1455568570, 3),
(42, 'AJO EN ESCAMAS', 'KILO', 7672, 1455568584, 3),
(43, 'AJONJOLI', 'KILO', 9000, 1455568602, 3),
(44, 'PLATO SR WOK CUADRADO', 'UNIDAD', 203, 1455568616, 3),
(45, 'PLATO SR WOK REDONDO', 'UNIDAD', 148, 1455568630, 3),
(46, 'BANDEJA BIG WOK', 'UNIDAD', 880, 1455568645, 3),
(47, 'PLATO PARA BANDEJA BIG WOK', 'UNIDAD', 0, 1455568666, 3),
(48, 'TAPA PARA BANDEJA BIG WOK', 'UNIDAD', 650, 1455568774, 3),
(49, 'BANDEJA DUO WOK', 'UNIDAD', 62, 1455568790, 3),
(50, 'VASO CRISTAL 12 ONZAS', 'UNIDAD', 41, 1455568804, 3),
(51, 'VASO CARTON 16 OZ', 'UNIDAD', 99, 1455568816, 3),
(52, 'VASO CARTON 22 OZ', 'UNIDAD', 106, 1455568830, 3),
(53, 'CAJA DOMICILIO COMBO', 'UNIDAD', 255, 1455568844, 3),
(54, 'CAJA DOMICILIO PORCION', 'UNIDAD', 132, 1455568859, 3),
(55, 'CAJA CHINA X 16', 'UNIDAD', 179, 1455568891, 3),
(56, 'CAJA CHINA X 25', 'UNIDAD', 268, 1455568905, 3),
(57, 'PORTACOMIDA SD C1', 'UNIDAD', 58, 1455568927, 3),
(58, 'BOLSA 16X20', 'UNIDAD', 46, 1455568945, 3),
(59, 'BOLSA 4X8', 'UNIDAD', 13, 1455569047, 3),
(60, 'BOLSA 9X12', 'UNIDAD', 15, 1455569232, 3),
(61, 'BOLSAS 10X15', 'UNIDAD', 21, 1455569258, 3),
(62, 'BOLSAS T20', 'UNIDAD', 42, 1455569274, 3),
(63, 'BOLSAS T30', 'UNIDAD', 111, 1455569288, 3),
(64, 'BOLSAS T40', 'UNIDAD', 119, 1455569304, 3),
(65, 'COPA 1/2 ONZA', 'UNIDAD', 14, 1455569321, 3),
(66, 'CUCHARAS', 'UNIDAD', 46, 1455569415, 3),
(67, 'CUCHILLO', 'UNIDAD', 46, 1455569432, 3),
(68, 'GUANTES', 'UNIDAD', 15, 1455569447, 3),
(69, 'INDIVIDUAL', 'UNIDAD', 24, 1455569461, 3),
(70, 'PALILLOS', 'UNIDAD', 2, 1455569476, 3),
(71, 'PALILLOS CHINOS', 'UNIDAD', 104, 1455569491, 3),
(72, 'PITILLO', 'UNIDAD', 10, 1455569524, 3),
(73, 'SERVILLETAS', 'UNIDAD', 12, 1455569539, 3),
(74, 'TAPA 1.5', 'UNIDAD', 0, 1455569555, 3),
(75, 'TENEDOR', 'UNIDAD', 39, 1455569593, 3),
(76, 'BIB PEPSI LIGHT', 'OZ', 0, 1455569608, 3),
(77, 'BIB SEVEN UP', 'OZ', 42, 1455569623, 3),
(78, 'BIB NARANJA PIÑA', 'OZ', 0, 1455569638, 3),
(79, 'BIB NARANJA', 'OZ', 0, 1455569657, 3),
(80, 'BIB COLOMBIANA', 'OZ', 42, 1455569670, 3),
(81, 'BIB MANZANA', 'OZ', 42, 1455569684, 3),
(82, 'BIB PEPSI', 'OZ', 42, 1455569699, 3),
(83, 'BIB UVA', 'OZ', 34, 1455569713, 3),
(84, 'BIB MR TEA LIMON ', 'OZ', 36, 1455569727, 3),
(85, 'BIB MR TEA DURAZNO', 'OZ', 36, 1455569743, 3),
(86, 'MANZANA PET 500', 'UNIDAD', 0, 1455569756, 3),
(87, 'PEPSI PET 500', 'UNIDAD', 0, 1455569770, 3),
(88, '7 UP PET 500', 'UNIDAD', 0, 1455570369, 3),
(89, 'PEPSI LIGHT PET 500', 'UNIDAD', 0, 1455570404, 3),
(90, 'COLOMBIANA PET 500', 'UNIDAD', 0, 1455570419, 3),
(91, 'UVA PET 500', 'UNIDAD', 0, 1455570437, 3),
(92, 'MANZANA PET 600', 'UNIDAD', 1387, 1455570451, 3),
(93, 'PEPSI PET 600', 'UNIDAD', 1387, 1455570467, 3),
(94, '7 UP PET 600', 'UNIDAD', 1387, 1455570512, 3),
(95, 'PEPSI LIGHT PET 600', 'UNIDAD', 1387, 1455570531, 3),
(96, 'COLOMBIANA PET 600', 'UNIDAD', 1387, 1455570545, 3),
(97, 'UVA PET 600', 'UNIDAD', 1387, 1455570560, 3),
(98, 'AGUA CRISTAL SIN GAS', 'UNIDAD', 1003, 1455570580, 3),
(99, 'AGUA CRISTAL CON GAS', 'UNIDAD', 1003, 1455570594, 3),
(100, 'H2O FRUTOS TROPICALES', 'UNIDAD', 0, 1455570609, 3),
(101, 'H2O LIMA LIMON', 'UNIDAD', 0, 1455570623, 3),
(102, 'MR TEA DURAZNO BOTELLA', 'UNIDAD', 862, 1455570640, 3),
(103, 'MR TEA LIMON BOTELLA', 'UNIDAD', 862, 1455570660, 3),
(104, 'MANZANA BOTELLA', 'UNIDAD', 810, 1455570675, 3),
(105, 'PEPSI BOTELLA', 'UNIDAD', 810, 1455570692, 3),
(106, 'COLOMBIANA BOTELLA', 'UNIDAD', 810, 1455570705, 3),
(107, 'PEPSI LIGHT BOTELLA', 'UNIDAD', 810, 1455570718, 3),
(108, '7 UP BOTELLA', 'UNIDAD', 810, 1455570858, 3),
(109, 'NARANJA PIÑA BOTELLA', 'UNIDAD', 810, 1455570871, 3),
(110, 'UVA BOTELLA', 'UNIDAD', 810, 1455570884, 3),
(111, 'NARANJA BOTELLA', 'UNIDAD', 810, 1455570901, 3),
(112, 'HIT MANGO BOTELLA', 'UNIDAD', 767, 1455570914, 3),
(113, 'HIT LULO BOTELLA', 'UNIDAD', 0, 1455570926, 3),
(114, 'HIT NARANJA PIÑA BOTELLA', 'UNIDAD', 767, 1455570937, 3),
(115, 'HIT MORA BOTELLA', 'UNIDAD', 767, 1455570951, 3),
(116, 'HIT FRUTOS TROPICALES BOTELLA', 'UNIDAD', 0, 1455570964, 3),
(117, 'APIO', 'KILO', 1350, 1455570989, 3),
(118, 'BROCOLI', 'KILO', 2900, 1455571004, 3),
(119, 'CEBOLLA CABEZONA', 'KILO', 2990, 1455571019, 3),
(120, 'CEBOLLA LARGA', 'KILO', 2200, 1455571033, 3),
(121, 'CEBOLLA PUERRO', 'KILO', 0, 1455571046, 3),
(122, 'CEBOLLA ROJA', 'KILO', 0, 1455571059, 3),
(123, 'CEBOLLIN', 'KILO', 6000, 1455571073, 3),
(124, 'CIDRA', 'KILO', 1400, 1455571086, 3),
(125, 'COLIFLOR', 'KILO', 2900, 1455571162, 3),
(126, 'HABICHUELA', 'KILO', 2900, 1455571178, 3),
(127, 'LECHUGA', 'KILO', 1900, 1455571195, 3),
(128, 'PIMENTON ROJO', 'KILO', 3800, 1455571208, 3),
(129, 'REPOLLO', 'KILO', 1700, 1455571225, 3),
(130, 'ZANAHORIA', 'KILO', 1700, 1455571240, 3),
(131, 'PIMENTON VERDE', 'KILO', 3800, 1455571270, 3),
(132, 'CALABACIN', 'KILO', 1350, 1455571282, 3),
(133, 'GENGIBRE', 'KILO', 8900, 1455571304, 3),
(134, 'CHAMPIÑON', 'KILO', 7500, 1455571317, 3),
(135, 'RAIZ CHINA', 'KILO', 1200, 1455571339, 3),
(136, 'PIÑA ', 'KILO', 2300, 1455571355, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
