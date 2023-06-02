-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2023 a las 08:11:32
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `urusawa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `codigo` varchar(10) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`codigo`, `password`) VALUES
('admin', 'admin123'),
('mesa01', '1234'),
('mesa02', '4543'),
('mesa03', '0987'),
('mesa04', '6546'),
('mesa05', '4235'),
('mesa06', '3523'),
('mesa07', '1523'),
('mesa08', '5235'),
('mesa09', '2354'),
('mesa10', '0896'),
('mesa11', '1243'),
('mesa12', '7567'),
('mesa13', '4643'),
('mesa14', '7657'),
('mesa15', '0985');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `codigo_mesa` varchar(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `estado_pedido` varchar(50) DEFAULT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`codigo_mesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`, `estado_pedido`, `id_pedido`) VALUES
('mesa02', 'AGUA', 2.00, 3, '2023-06-01 09:59:16', 'Realizado', 1),
('mesa01', 'MAKI SPICY CRAB 6uds', 5.00, 1, '2023-06-01 14:23:21', 'pendiente', 14),
('mesa01', 'MAKI ESPARRAGOS 6uds', 5.00, 1, '2023-06-01 14:23:21', 'pendiente', 15),
('mesa01', 'SASHIMI SALMON', 6.00, 1, '2023-06-01 14:23:21', 'pendiente', 16),
('mesa01', 'RAMEN', 6.00, 1, '2023-06-01 14:23:21', 'pendiente', 17),
('mesa01', 'TARTAR DE ATÚN', 12.50, 1, '2023-06-01 14:23:21', 'pendiente', 18),
('mesa01', 'TARTAR DE SALMON', 12.50, 1, '2023-06-01 14:23:21', 'pendiente', 19),
('mesa02', 'SASHIMI SALMON', 6.00, 3, '2023-06-01 15:15:22', 'pendiente', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
