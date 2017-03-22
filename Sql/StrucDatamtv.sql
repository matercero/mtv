-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2017 a las 08:15:19
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mtv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL,
  `id_Inquilino` int(11) DEFAULT NULL,
  `id_Propiedad` int(11) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  `luzInicio` int(11) DEFAULT NULL,
  `luzFin` int(11) DEFAULT NULL,
  `aguaInicio` int(11) DEFAULT NULL,
  `aguaFin` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `municipio` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoPostal` int(11) DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `observaciones` varchar(4000) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inquilino`
--

INSERT INTO `inquilino` (`id`, `dni`, `nombre`, `apellidos`, `direccion`, `municipio`, `provincia`, `codigoPostal`, `mail`, `telefono`, `observaciones`) VALUES
(1, 0, 'Prueba 1', 'Apellidos 1', 'a', 'a', 'a', 1, 'a@a.com', 123456789, 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedad`
--

CREATE TABLE `propiedad` (
  `id` int(11) NOT NULL,
  `alias` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `municipio` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoPostal` int(11) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contadorLuz` int(11) DEFAULT NULL,
  `contadorAgua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `propiedad`
--

INSERT INTO `propiedad` (`id`, `alias`, `direccion`, `municipio`, `codigoPostal`, `provincia`, `contadorLuz`, `contadorAgua`) VALUES
(1, 'Pozo Nuevo calle', 'Pozo nuevo, 50, 2-1', 'Moron de la  Fra.', 41530, 'Sevilla', 0, 0),
(2, 'Pozo Nuevo interior', 'Pozo nuevo, 50, 2-1', 'Moron de la  Fra.', 41530, 'Sevilla', 0, 0),
(3, 'San Miguel 1', 'San Miguel, 5, 1', 'Moron de la  Fra.', 41530, 'Sevilla', 0, 0),
(4, 'San Miguel 2', 'San Miguel,5, 1', 'Moron de la  Fra.', 41530, 'Sevilla', 0, 0),
(5, 'San Miguel Local', 'Calle San Miguel, 5, local', 'MORON DE LA FRONTERA', 41530, 'sevilla', 0, 0),
(6, 'Pozo Nuevo Local', 'calle Pozo Nuevo, 50', '', 0, '', 0, 0),
(7, 'Eduardo dato', 'Calle Eduardo Dato', 'Moron de la Fra.', 41530, 'Sevilla', 0, 0),
(8, 'Sevilla', 'Calle Muñoz Pavon, ', 'Sevilla', 0, '', 0, 0),
(9, 'Eduardo dato parking', 'Calle Eduardo Dato', 'Moron de la Fra.', 41530, 'Sevilla', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `version`, `authority`) VALUES
(1, 0, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `version`, `account_expired`, `account_locked`, `enabled`, `password`, `password_expired`, `username`) VALUES
(1, 0, b'0', b'0', b'1', '$2a$10$OcQcIp84fiidWiXT1vH3J.uUp2Tz3pkzrPVMANrsVYR3s7rs10MOK', b'0', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inq_alq_ind` (`id_Inquilino`),
  ADD UNIQUE KEY `prop_alq_ind` (`id_Propiedad`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `FK7cf6fk7n6aj4xw2i7slniq5l5` FOREIGN KEY (`id_Propiedad`) REFERENCES `propiedad` (`id`),
  ADD CONSTRAINT `FKhn50uq52u1whmj57ttjmrtpu2` FOREIGN KEY (`id_Inquilino`) REFERENCES `inquilino` (`id`);

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
