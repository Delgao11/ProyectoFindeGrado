-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 15:30:14
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
-- Estructura de tabla para la tabla `pedidomesa`
--

CREATE TABLE `pedidomesa` (
  `codigomesa` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidomesa`
--

INSERT INTO `pedidomesa` (`codigomesa`, `titulo`, `precio`, `cantidad`) VALUES
(NULL, 'FANTA DE NARANJA', 2.00, NULL),
(NULL, 'FANTA DE NARANJA', 2.00, NULL),
(NULL, 'COCACOLA LIGHT', 2.00, NULL),
(NULL, 'COCACOLA LIGHT', 2.00, NULL),
(NULL, 'COCACOLA LIGHT', 2.00, NULL),
(NULL, 'COCACOLA LIGHT', 2.00, NULL),
(NULL, 'COCACOLA LIGHT', 2.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa01`
--

CREATE TABLE `pedidomesa01` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa01`
--

INSERT INTO `pedidomesa01` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`) VALUES
(1, 1, 'COCACOLA LIGHT', 2.00, 1),
(2, 1, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1),
(3, 1, 'MAKI SALMON TEMPURA 6uds', 5.00, 1),
(4, 1, 'AGUA', 2.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa02`
--

CREATE TABLE `pedidomesa02` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa03`
--

CREATE TABLE `pedidomesa03` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa06`
--

CREATE TABLE `pedidomesa06` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa07`
--

CREATE TABLE `pedidomesa07` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
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
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa09`
--

CREATE TABLE `pedidomesa09` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa10`
--

CREATE TABLE `pedidomesa10` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa11`
--

CREATE TABLE `pedidomesa11` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa12`
--

CREATE TABLE `pedidomesa12` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa13`
--

CREATE TABLE `pedidomesa13` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
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
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa15`
--

CREATE TABLE `pedidomesa15` (
  `id` int(11) NOT NULL,
  `codigomesa` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidomesa15`
--

INSERT INTO `pedidomesa15` (`id`, `codigomesa`, `titulo`, `precio`, `cantidad`) VALUES
(1, 15, 'COCACOLA LIGHT', 2.00, 1),
(2, 15, 'COCACOLA', 2.00, 1),
(3, 15, 'COCACOLA LIGHT', 2.00, 1),
(4, 15, 'COCACOLA', 2.00, 1),
(5, 15, 'MAKI GAMBA TEMPURA 6uds', 4.00, 1),
(6, 15, 'MAKI SALMON TEMPURA 6uds', 5.00, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidomesa02`
--
ALTER TABLE `pedidomesa02`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa03`
--
ALTER TABLE `pedidomesa03`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa04`
--
ALTER TABLE `pedidomesa04`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa05`
--
ALTER TABLE `pedidomesa05`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa06`
--
ALTER TABLE `pedidomesa06`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa07`
--
ALTER TABLE `pedidomesa07`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa08`
--
ALTER TABLE `pedidomesa08`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa09`
--
ALTER TABLE `pedidomesa09`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa10`
--
ALTER TABLE `pedidomesa10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa11`
--
ALTER TABLE `pedidomesa11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa12`
--
ALTER TABLE `pedidomesa12`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa13`
--
ALTER TABLE `pedidomesa13`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa14`
--
ALTER TABLE `pedidomesa14`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa15`
--
ALTER TABLE `pedidomesa15`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
