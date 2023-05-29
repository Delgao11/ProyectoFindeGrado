-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2023 a las 13:10:28
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
-- Estructura de tabla para la tabla `pedidomesa01`
--

CREATE TABLE `pedidomesa01` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa01`
--

INSERT INTO `pedidomesa01` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(61, 1, 'MAKI SALMON TEMPURA 6uds', 5.00, 2, '2023-05-29 07:52:43'),
(62, 1, 'MAKI SPICY CRAB 6uds', 5.00, 1, '2023-05-29 07:52:43'),
(63, 1, 'RAMEN', 6.00, 1, '2023-05-29 07:52:43'),
(67, 1, 'ENOKI HAMICHI 6uds', 5.00, 3, '2023-05-29 09:02:05'),
(68, 1, 'AGUA', 2.00, 1, '2023-05-29 09:02:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa02`
--

CREATE TABLE `pedidomesa02` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa02`
--

INSERT INTO `pedidomesa02` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(9, 2, 'COCACOLA', 2.00, 4, '2023-05-29 07:52:55'),
(10, 2, 'AGUA', 2.00, 5, '2023-05-29 08:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa03`
--

CREATE TABLE `pedidomesa03` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa03`
--

INSERT INTO `pedidomesa03` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 3, 'COCACOLA', 2.00, 1, '2023-05-29 07:53:24'),
(2, 3, 'COCACOLA', 2.00, 1, '2023-05-29 07:53:24'),
(3, 3, 'MAKI SAFARI 6uds', 4.00, 1, '2023-05-29 07:53:24'),
(4, 3, 'COCACOLA', 2.00, 1, '2023-05-29 07:53:24'),
(5, 3, 'COCACOLA LIGHT', 2.00, 1, '2023-05-29 07:53:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa04`
--

CREATE TABLE `pedidomesa04` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa05`
--

CREATE TABLE `pedidomesa05` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa05`
--

INSERT INTO `pedidomesa05` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 5, 'COCACOLA', 2.00, 1, '2023-05-29 07:53:39'),
(2, 5, 'AGUA', 2.00, 1, '2023-05-29 07:53:39'),
(3, 5, 'AQUARIUS', 2.00, 1, '2023-05-29 07:53:39'),
(4, 5, 'MAKI SALMON TEMPURA 6uds', 5.00, 1, '2023-05-29 07:53:39'),
(5, 5, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1, '2023-05-29 07:53:39'),
(6, 5, 'MAKI AGUACATE 6uds', 4.00, 1, '2023-05-29 07:53:39'),
(7, 5, 'AGUA', 2.00, 1, '2023-05-29 07:53:39'),
(8, 5, 'AQUARIUS', 2.00, 1, '2023-05-29 07:53:39'),
(9, 5, 'MAKI SALMON TEMPURA 6uds', 5.00, 1, '2023-05-29 07:53:39'),
(10, 5, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1, '2023-05-29 07:53:39'),
(11, 5, 'MAKI AGUACATE 6uds', 4.00, 1, '2023-05-29 07:53:39'),
(12, 5, 'AGUA', 2.00, 1, '2023-05-29 07:53:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa06`
--

CREATE TABLE `pedidomesa06` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa06`
--

INSERT INTO `pedidomesa06` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(20, 6, 'AGUA', 2.00, 10, '2023-05-29 07:53:50'),
(21, 6, 'GYOZA 12uds', 7.00, 1, '2023-05-29 07:53:50'),
(22, 6, 'AGUA', 2.00, 10, '2023-05-29 07:53:50'),
(23, 6, 'GYOZA 12uds', 7.00, 1, '2023-05-29 07:53:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa07`
--

CREATE TABLE `pedidomesa07` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa08`
--

CREATE TABLE `pedidomesa08` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa08`
--

INSERT INTO `pedidomesa08` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 8, 'ENOKI HAMICHI 6uds', 5.00, 1, '2023-05-29 07:54:00'),
(2, 8, 'AGUA', 2.00, 1, '2023-05-29 07:54:00'),
(3, 8, 'AGUA', 2.00, 1, '2023-05-29 07:54:00'),
(4, 8, 'COCACOLA LIGHT', 2.00, 1, '2023-05-29 07:54:00'),
(5, 8, 'COCACOLA', 2.00, 4, '2023-05-29 07:54:00'),
(6, 8, 'AGUA', 2.00, 10, '2023-05-29 07:54:00'),
(7, 8, 'GYOZA 12uds', 7.00, 1, '2023-05-29 07:54:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa09`
--

CREATE TABLE `pedidomesa09` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa09`
--

INSERT INTO `pedidomesa09` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 9, 'COCACOLA', 2.00, 1, '2023-05-29 07:54:10'),
(2, 9, 'COCACOLA', 2.00, 1, '2023-05-29 07:54:10'),
(3, 9, 'MAKI SAFARI 6uds', 4.00, 1, '2023-05-29 07:54:10'),
(4, 9, 'AGUA', 2.00, 1, '2023-05-29 07:54:10'),
(5, 9, 'MAKI SAFARI 6uds', 4.00, 1, '2023-05-29 07:54:10'),
(6, 9, 'MAKI ATÚN PICANTE 6uds', 4.00, 1, '2023-05-29 07:54:10'),
(7, 9, 'AGUA', 2.00, 1, '2023-05-29 07:54:10'),
(8, 9, 'AQUARIUS', 2.00, 1, '2023-05-29 07:54:10'),
(9, 9, 'MAKI SALMON TEMPURA 6uds', 5.00, 1, '2023-05-29 07:54:10'),
(10, 9, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1, '2023-05-29 07:54:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa10`
--

CREATE TABLE `pedidomesa10` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa10`
--

INSERT INTO `pedidomesa10` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 10, 'AGUA', 2.00, 1, '2023-05-29 07:54:21'),
(2, 10, 'AQUARIUS', 2.00, 1, '2023-05-29 07:54:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa11`
--

CREATE TABLE `pedidomesa11` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa11`
--

INSERT INTO `pedidomesa11` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 11, 'COCACOLA LIGHT', 2.00, 1, '2023-05-29 07:54:32'),
(2, 11, 'COCACOLA', 2.00, 1, '2023-05-29 07:54:32'),
(3, 11, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1, '2023-05-29 07:54:32'),
(4, 11, 'AGUA', 2.00, 1, '2023-05-29 07:54:32'),
(5, 11, 'RAMEN', 6.00, 1, '2023-05-29 07:54:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa12`
--

CREATE TABLE `pedidomesa12` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa12`
--

INSERT INTO `pedidomesa12` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 12, 'AGUA', 2.00, 1, '2023-05-29 07:54:44'),
(2, 12, 'MAKI SAFARI 6uds', 4.00, 1, '2023-05-29 07:54:44'),
(3, 12, 'MAKI ATÚN PICANTE 6uds', 4.00, 1, '2023-05-29 07:54:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa13`
--

CREATE TABLE `pedidomesa13` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa14`
--

CREATE TABLE `pedidomesa14` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa14`
--

INSERT INTO `pedidomesa14` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 14, 'AQUARIUS', 2.00, 1, '2023-05-29 07:55:04'),
(2, 14, 'CocaCola Zero', 2.00, 1, '2023-05-29 07:55:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa15`
--

CREATE TABLE `pedidomesa15` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa15`
--

INSERT INTO `pedidomesa15` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`, `fecha_hora`) VALUES
(1, 15, 'COCACOLA LIGHT', 2.00, 1, '2023-05-29 07:55:14'),
(2, 15, 'COCACOLA', 2.00, 1, '2023-05-29 07:55:14'),
(3, 15, 'COCACOLA LIGHT', 2.00, 1, '2023-05-29 07:55:14'),
(4, 15, 'COCACOLA', 2.00, 1, '2023-05-29 07:55:14'),
(5, 15, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1, '2023-05-29 07:55:14'),
(6, 15, 'MAKI SALMON TEMPURA 6uds', 5.00, 1, '2023-05-29 07:55:14'),
(7, 15, 'AGUA', 2.00, 1, '2023-05-29 07:55:14');

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
-- Indices de la tabla `pedidomesa01`
--
ALTER TABLE `pedidomesa01`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa02`
--
ALTER TABLE `pedidomesa02`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa03`
--
ALTER TABLE `pedidomesa03`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa04`
--
ALTER TABLE `pedidomesa04`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa05`
--
ALTER TABLE `pedidomesa05`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa06`
--
ALTER TABLE `pedidomesa06`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa07`
--
ALTER TABLE `pedidomesa07`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa08`
--
ALTER TABLE `pedidomesa08`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa09`
--
ALTER TABLE `pedidomesa09`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa10`
--
ALTER TABLE `pedidomesa10`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa11`
--
ALTER TABLE `pedidomesa11`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa12`
--
ALTER TABLE `pedidomesa12`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa13`
--
ALTER TABLE `pedidomesa13`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa14`
--
ALTER TABLE `pedidomesa14`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidomesa15`
--
ALTER TABLE `pedidomesa15`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidomesa01`
--
ALTER TABLE `pedidomesa01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `pedidomesa02`
--
ALTER TABLE `pedidomesa02`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidomesa03`
--
ALTER TABLE `pedidomesa03`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidomesa04`
--
ALTER TABLE `pedidomesa04`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidomesa05`
--
ALTER TABLE `pedidomesa05`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidomesa06`
--
ALTER TABLE `pedidomesa06`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pedidomesa07`
--
ALTER TABLE `pedidomesa07`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidomesa08`
--
ALTER TABLE `pedidomesa08`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedidomesa09`
--
ALTER TABLE `pedidomesa09`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidomesa10`
--
ALTER TABLE `pedidomesa10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidomesa11`
--
ALTER TABLE `pedidomesa11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidomesa12`
--
ALTER TABLE `pedidomesa12`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidomesa13`
--
ALTER TABLE `pedidomesa13`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa14`
--
ALTER TABLE `pedidomesa14`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidomesa15`
--
ALTER TABLE `pedidomesa15`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
