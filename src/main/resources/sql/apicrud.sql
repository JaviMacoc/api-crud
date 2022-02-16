-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-02-2022 a las 14:44:26
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apicrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `costo` float DEFAULT NULL,
  `envase` int(11) DEFAULT NULL,
  `margen` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `tipo_de_articulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `costo`, `envase`, `margen`, `nombre`, `precio`, `stock`, `tipo_de_articulo`) VALUES
(1000, 1000, 1, 56, 'Almendra', 1560, 1000, 0),
(1001, 800, 1, 45, 'Nuez', 1160, 900, 0),
(1002, 1010, 1, 40, 'Castaña de cajú', 1414, 600, 0),
(1003, 900, 1, 40, 'Nuez cuartos EL', 1260, 500, 0),
(2000, 320, 1, 41, 'Pera Desecada', 450, 200, 1),
(2001, 450, 1, 60, 'Ciruela Desecada', 720, 450, 1),
(2002, 520, 1, 50, 'Damasco Turco', 780, 400, 1),
(2003, 380, 1, 50, 'Durazno', 570, 300, 1),
(2004, 120, 1, 67, 'Pasa de Uva Flame', 200, 100, 1),
(3001, 80, 1, 60, 'Sesamo Integral', 128, 700, 2),
(3002, 110, 1, 60, 'Girasol', 176, 500, 2),
(3003, 180, 1, 60, 'Chia', 288, 300, 2),
(3004, 400, 1, 50, 'Quinoa', 600, 400, 2),
(3005, 280, 1, 40, 'Sesamo Negro', 392, 500, 2),
(3006, 380, 1, 60, 'Sesamo Blanco', 608, 400, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `telefono` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `email`, `direccion`, `telefono`) VALUES
(5, 'Ana', 'Flores', 'anaflores@gmail.com', 'Los Fogones 2745', '(341)156-585969'),
(6, 'Juana', 'Casas', 'juanacasas@gmail.com', 'Italia 2512', '(341)155-555969'),
(7, 'Julia', 'Moreno', 'jumoreno@gmail.com', 'España 261', '(341)156-357841'),
(8, 'Tony', 'Robles', 'tonyrobles@gmail.com', 'Galvez 1850', '(341)156-577769'),
(9, 'Renzo', 'Cotroco', 'renzocotroco@gmail.com', 'Ayacucho 11 bis', '(341)156-855215'),
(10, 'Raul', 'Osmendia', 'raulosmendia@gmail.com', 'Virasoro 4560', '(341)155-223667');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
