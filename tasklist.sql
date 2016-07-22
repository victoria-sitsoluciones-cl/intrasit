-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-07-2016 a las 18:43:07
-- Versión del servidor: 5.5.44-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tasklist`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idCCosto` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ordenFormulario` int(11) DEFAULT NULL,
  `tooltip` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `idCcosto` (`idCCosto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `idCCosto`, `nombre`, `ordenFormulario`, `tooltip`) VALUES
(1, 1, 'Decodificadores', 1, 'Selecciona el decodificador de tu gusto y luego indicas cuántos quieres. '),
(2, 1, 'Materiales instalación TV Satelital', 2, 'Selecciona los materiales que necesitas para tu instalación. Recuerda que cada antena necesita su LNB. Y que el LNB single utiliza un cable, el LNB doble, 2 cables y el cuádruple, 4 cables. '),
(3, 2, 'Cámaras', 2, NULL),
(4, 2, 'DVR', 3, NULL),
(12, 2, 'KIT CCTV', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ccosto`
--

CREATE TABLE IF NOT EXISTS `ccosto` (
  `idCcosto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCcosto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ccosto`
--

INSERT INTO `ccosto` (`idCcosto`, `nombre`) VALUES
(1, 'TV Satelital'),
(2, 'Cámaras de vigilancia'),
(3, 'Citofonía'),
(4, 'Redes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rut` int(11) DEFAULT NULL,
  `nombres` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `whatsapp` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `correo` (`correo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `rut`, `nombres`, `apellidos`, `correo`, `direccion`, `telefono`, `whatsapp`) VALUES
(1, NULL, '', '', 'dfasfdasd@fds.df', '', NULL, NULL),
(2, NULL, '', '', 'qwerty@asd.asd', '', NULL, NULL),
(3, NULL, '', '', 'qwerty2@asd.asd', NULL, NULL, NULL),
(4, NULL, 'asd', '', 'qwerty3@asd.asd', NULL, NULL, NULL),
(5, NULL, 'victoria', 'orellana', 'victoria@sitsoluciones.cl', NULL, NULL, NULL),
(6, NULL, 'victoria', '...', 'victoria.orellana.g@gmail.com', NULL, 123, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE IF NOT EXISTS `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idCcosto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` int(11) NOT NULL,
  `idDespacho` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `valorDetalle` int(11) NOT NULL,
  `valorDespacho` int(11) NOT NULL,
  `porcentajeFormaPago` int(11) NOT NULL,
  `correoEnviado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCotizacion`),
  KEY `idCcosto` (`idCcosto`,`idCliente`,`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`idCotizacion`, `idCcosto`, `idCliente`, `fecha`, `idUsuario`, `idDespacho`, `idFormaPago`, `valorDetalle`, `valorDespacho`, `porcentajeFormaPago`, `correoEnviado`) VALUES
(1, 1, 1, '2016-06-25 21:22:17', 1, 0, 0, 0, 0, 0, 0),
(2, 1, 1, '2016-06-25 21:22:59', 1, 0, 0, 0, 0, 0, 0),
(3, 1, 3, '2016-06-25 21:33:50', 1, 0, 0, 0, 0, 0, 0),
(4, 1, 4, '2016-06-25 21:39:05', 1, 0, 0, 0, 0, 0, 0),
(5, 1, 3, '2016-06-25 21:41:20', 1, 0, 0, 0, 0, 0, 0),
(6, 1, 4, '2016-06-25 21:42:37', 1, 0, 0, 0, 0, 0, 0),
(7, 1, 3, '2016-06-25 21:45:51', 1, 0, 0, 0, 0, 0, 0),
(8, 1, 4, '2016-06-25 22:40:46', 1, 0, 0, 0, 0, 0, 0),
(9, 1, 3, '2016-06-30 20:23:53', 1, 0, 0, 0, 0, 0, 0),
(10, 1, 3, '2016-06-30 20:25:21', 1, 2, 1, 127000, 5000, 0, 0),
(11, 1, 3, '2016-06-30 20:29:36', 1, 1, 3, 230000, 0, 5, 0),
(12, 1, 5, '2016-07-04 01:28:49', 1, 0, 0, 0, 0, 0, 0),
(13, 1, 5, '2016-07-04 10:45:43', 1, 0, 0, 0, 0, 0, 0),
(14, 1, 5, '2016-07-04 10:46:51', 1, 1, 1, 95000, 0, 0, 0),
(15, 1, 5, '2016-07-08 23:03:40', 3, 1, 1, 95000, 0, 0, 0),
(16, 1, 6, '2016-07-09 23:38:39', 3, 1, 1, 115000, 0, 0, 0),
(17, 1, 6, '2016-07-18 20:59:06', 3, 1, 1, 28000, 0, 0, 0),
(18, 1, 6, '2016-07-18 21:01:41', 3, 1, 1, 115000, 0, 0, 0),
(19, 1, 6, '2016-07-18 21:04:36', 3, 1, 1, 95000, 0, 0, 0),
(20, 1, 6, '2016-07-18 21:18:33', 3, 1, 1, 95000, 0, 0, 0),
(21, 1, 6, '2016-07-18 21:20:20', 3, 1, 1, 115000, 0, 0, 0),
(22, 1, 6, '2016-07-18 21:22:43', 3, 1, 1, 95000, 0, 0, 0),
(23, 1, 6, '2016-07-18 22:36:21', 3, 1, 1, 110000, 0, 0, 0),
(24, 1, 6, '2016-07-19 20:59:45', 3, 1, 1, 5000, 0, 0, 0),
(25, 1, 6, '2016-07-19 21:01:19', 3, 1, 1, 115000, 0, 0, 0),
(26, 1, 6, '2016-07-19 21:05:13', 3, 1, 1, 115000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho`
--

CREATE TABLE IF NOT EXISTS `despacho` (
  `idDespacho` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`idDespacho`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `despacho`
--

INSERT INTO `despacho` (`idDespacho`, `nombre`, `valor`) VALUES
(1, 'Gratuito dentro de anillo de AVespucio', 0),
(2, 'Fuera de anillo de AVespucio', 5000),
(3, 'Comunas rurales RM', 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleCotizacion`
--

CREATE TABLE IF NOT EXISTS `detalleCotizacion` (
  `idDetalleCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idCotizacion` int(11) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `idServicio` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `valorU` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleCotizacion`),
  KEY `idCotizacion` (`idCotizacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `detalleCotizacion`
--

INSERT INTO `detalleCotizacion` (`idDetalleCotizacion`, `idCotizacion`, `idProducto`, `idServicio`, `cantidad`, `valorU`) VALUES
(1, 6, 1, 0, 1, 115000),
(2, 7, 1, 0, 1, 115000),
(3, 7, 0, 3, 1, 5000),
(4, 8, 1, 0, 1, 115000),
(5, 8, 3, 0, 1, 5000),
(6, 8, 4, 0, 1, 3000),
(7, 8, 8, 0, 1, 2000),
(8, 8, 0, 1, 1, 10000),
(9, 8, 0, 2, 1, 10000),
(10, 9, 1, 0, 1, 115000),
(11, 9, 8, 0, 1, 2000),
(12, 9, 0, 2, 1, 10000),
(13, 10, 1, 0, 1, 115000),
(14, 10, 8, 0, 1, 2000),
(15, 10, 0, 2, 1, 10000),
(16, 11, 1, 0, 2, 115000),
(17, 12, 1, 0, 1, 115000),
(18, 12, 3, 0, 1, 5000),
(19, 12, 4, 0, 1, 3000),
(20, 12, 8, 0, 1, 2000),
(21, 12, 0, 1, 1, 10000),
(22, 12, 0, 2, 1, 10000),
(23, 13, 1, 0, 1, 115000),
(24, 13, 3, 0, 1, 5000),
(25, 13, 0, 1, 1, 10000),
(26, 14, 2, 0, 1, 95000),
(27, 15, 2, 0, 1, 95000),
(28, 16, 1, 0, 1, 115000),
(29, 17, 3, 0, 1, 5000),
(30, 17, 4, 0, 1, 3000),
(31, 17, 5, 0, 1, 5000),
(32, 17, 6, 0, 1, 15000),
(33, 18, 1, 0, 1, 115000),
(34, 19, 2, 0, 1, 95000),
(35, 20, 2, 0, 1, 95000),
(36, 21, 1, 0, 1, 115000),
(37, 22, 2, 0, 1, 95000),
(38, 23, 2, 0, 1, 95000),
(39, 23, 3, 0, 1, 5000),
(40, 23, 0, 1, 1, 10000),
(41, 24, 10, 0, 1, 5000),
(42, 25, 1, 0, 1, 115000),
(43, 26, 1, 0, 1, 115000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaPago`
--

CREATE TABLE IF NOT EXISTS `formaPago` (
  `idFormaPago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `porcentaje` decimal(10,0) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `formaPago`
--

INSERT INTO `formaPago` (`idFormaPago`, `nombre`, `porcentaje`, `logo`) VALUES
(1, 'Transferencia bancaria', 0, ''),
(2, 'Redcompra - webpay', 2, 'images/redcompra.gif'),
(3, 'T. Crédito - webpay', 5, 'images/tcredito.gif');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`) VALUES
(1, 'Administrador(a)'),
(2, 'Colaborador(a)'),
(3, 'Visitante web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idPadre` int(11) DEFAULT NULL,
  `valorNeto` int(11) NOT NULL,
  `linkProveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `linkFoto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoria`, `nombre`, `idPadre`, `valorNeto`, `linkProveedor`, `linkFoto`) VALUES
(1, 1, 'MiuiBox Z', 0, 115000, '', ''),
(2, 1, 'Freesky Freeduo F1', NULL, 95000, '', ''),
(3, 2, 'Antena', NULL, 5000, '', ''),
(4, 2, 'LNB single', NULL, 3000, '', ''),
(5, 2, 'LNB doble', NULL, 5000, '', ''),
(6, 2, 'LNB cuádruple', NULL, 15000, '', ''),
(8, 2, 'Cable 20 mts.', NULL, 2000, '', ''),
(9, 12, 'Kit CCTV 4 cámaras, HDD 1TB, DVR 4Ch', NULL, 150000, '', ''),
(10, 2, 'Cable UTP 20 mts.', NULL, 5000, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `idCcosto` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `uMedida` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `valorNeto` int(11) NOT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `idCcosto` (`idCcosto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `idCcosto`, `nombre`, `uMedida`, `valorNeto`) VALUES
(1, 1, 'Instalación y orientación', 'antena(s)', 10000),
(2, 1, 'Cableado', 'punto(s) TV', 10000),
(3, 1, 'cableado internet', 'punto(s)', 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idPerfil` (`idPerfil`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `email_2` (`email`),
  KEY `nombre` (`nombre`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `password`, `nombre`, `idPerfil`) VALUES
(1, 'victoria@sitsoluciones.cl', '50519b4526d7ed1f613f27f364163d60', 'Victoria Orellana', 1),
(2, 'carlos@sitsoluciones.cl', '50519b4526d7ed1f613f27f364163d60', 'Carlos Villagra', 2),
(3, 'anonimo@sitsoluciones.cl', '', 'Visitante web', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE IF NOT EXISTS `visita` (
  `idVisitas` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `referer` varchar(250) NOT NULL,
  PRIMARY KEY (`idVisitas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisitas`, `idCliente`, `IP`, `fecha`, `referer`) VALUES
(1, 1, '1111111', '2016-07-07 11:33:23', ''),
(2, 5, '127.0.0.1', '2016-07-07 15:01:44', ''),
(3, 5, '127.0.0.1', '2016-07-07 15:08:52', ''),
(4, 5, '127.0.0.1', '2016-07-07 18:15:18', ''),
(5, 5, '127.0.0.1', '2016-07-07 22:25:28', ''),
(6, 5, '127.0.0.1', '2016-07-08 00:36:49', ''),
(7, 5, '127.0.0.1', '2016-07-08 00:41:09', ''),
(8, 5, '127.0.0.1', '2016-07-08 00:46:07', ''),
(9, 5, '127.0.0.1', '2016-07-08 00:47:49', ''),
(10, 5, '127.0.0.1', '2016-07-08 00:49:43', ''),
(11, 5, '127.0.0.1', '2016-07-08 00:53:28', ''),
(12, 5, '127.0.0.1', '2016-07-08 12:41:48', ''),
(13, 5, '127.0.0.1', '2016-07-08 18:59:35', ''),
(14, 5, '127.0.0.1', '2016-07-08 23:01:57', ''),
(15, 5, '127.0.0.1', '2016-07-08 23:33:57', ''),
(16, 5, '127.0.0.1', '2016-07-08 23:37:20', ''),
(17, 5, '127.0.0.1', '2016-07-09 23:28:00', ''),
(18, 6, '127.0.0.1', '2016-07-09 23:30:09', ''),
(19, 6, '127.0.0.1', '2016-07-18 19:49:48', 'http://localhost/cotizadorweb/'),
(20, 6, '127.0.0.1', '2016-07-18 20:57:28', 'http://localhost/cotizadorweb/index.html'),
(21, 6, '127.0.0.1', '2016-07-18 21:20:05', 'http://localhost/cotizadorweb/'),
(22, 6, '127.0.0.1', '2016-07-18 22:36:01', 'http://localhost/cotizadorweb/'),
(23, 6, '127.0.0.1', '2016-07-18 23:20:46', 'http://localhost/cotizadorweb/'),
(24, 6, '127.0.0.1', '2016-07-19 10:40:05', 'http://localhost/cotizadorweb/'),
(25, 6, '127.0.0.1', '2016-07-19 20:40:42', 'http://localhost/cotizadorweb/');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idCcosto`) REFERENCES `ccosto` (`idCcosto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idCcosto`) REFERENCES `ccosto` (`idCcosto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
