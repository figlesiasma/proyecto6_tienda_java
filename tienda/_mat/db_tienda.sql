-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2016 a las 13:16:05
-- Versión del servidor: 5.5.44
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `adm_id` int(11) NOT NULL,
  `adm_nombre` char(30) COLLATE utf8_bin NOT NULL,
  `adm_dni` char(9) COLLATE utf8_bin NOT NULL,
  `adm_password` char(30) COLLATE utf8_bin NOT NULL,
  `rol_id` tinyint(4) NOT NULL,
  `adm_email` char(50) COLLATE utf8_bin NOT NULL,
  `adm_activo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`adm_id`, `adm_nombre`, `adm_dni`, `adm_password`, `rol_id`, `adm_email`, `adm_activo`) VALUES
(1, 'felipe', '46452322G', '12345', 2, 'felipe_iglesias@hotmail.com', b'1'),
(3, 'juan', '46452322R', '12345', 1, 'juan@juan.es', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `com_id` int(11) NOT NULL,
  `com_fecha` date NOT NULL,
  `com_cantidad` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tabla factura linea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `fac_id` int(11) NOT NULL,
  `fac_fecha` date NOT NULL,
  `fac_total` double NOT NULL,
  `com_id` int(11) NOT NULL,
  `fac_iva` double NOT NULL,
  `usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `prod_id` int(6) NOT NULL,
  `prod_nombre` char(30) COLLATE utf8_bin NOT NULL,
  `prod_cantidad` int(6) NOT NULL,
  `prod_precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`prod_id`, `prod_nombre`, `prod_cantidad`, `prod_precio`) VALUES
(1, 'Guzzi California II', 2, 6000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` tinyint(4) NOT NULL,
  `rol_nombre` char(13) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_nombre`) VALUES
(1, 'administrador'),
(2, 'root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_dni` char(9) COLLATE utf8_bin NOT NULL,
  `usu_password` char(30) COLLATE utf8_bin NOT NULL,
  `usu_nombre` char(50) COLLATE utf8_bin NOT NULL,
  `usu_email` char(50) COLLATE utf8_bin NOT NULL,
  `usu_activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_dni`, `usu_password`, `usu_nombre`, `usu_email`, `usu_activo`) VALUES
(1, '46452322G', '12345', 'felipe', 'felipe_iglesias@hotmail.com', 1),
(11, '44444444Y', '12345', 'jorge', 'jorge@jorge.es', 1),
(12, '44665522E', '12345', 'dani', 'dani@dani.es', 1),
(13, '12345612G', '12345', 'sergio', 'sergio@sergio.es', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`adm_id`),
  ADD UNIQUE KEY `adm_id` (`adm_id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `adm_id_2` (`adm_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`com_id`),
  ADD UNIQUE KEY `prod_id` (`prod_id`),
  ADD KEY `cli_id` (`usu_id`),
  ADD KEY `prod_id_2` (`prod_id`),
  ADD KEY `prod_id_3` (`prod_id`),
  ADD KEY `cli_id_2` (`usu_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`fac_id`),
  ADD KEY `com_id` (`com_id`),
  ADD KEY `usu_id` (`usu_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`prod_id`),
  ADD UNIQUE KEY `prod_id` (`prod_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`),
  ADD UNIQUE KEY `rol_id` (`rol_id`),
  ADD KEY `rol_nombre` (`rol_nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `usu_activo` (`usu_activo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `prod_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `compra` (`com_id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
