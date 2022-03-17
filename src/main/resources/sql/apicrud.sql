-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-03-2022 a las 00:16:44
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
(1003, 900, 1, 40, 'Nuez cuartos EL', 1260, 501, 0),
(2000, 320, 1, 41, 'Pera Desecada', 450, 200, 1),
(2002, 520, 1, 50, 'Damasco Turco', 780, 401, 1),
(2003, 380, 1, 50, 'Durazno', 570, 300, 1),
(2004, 120, 1, 67, 'Pasa de Uva Flame', 200, 100, 1),
(3001, 80, 1, 60, 'Sesamo Integral', 128, 700, 2),
(3002, 110, 1, 60, 'Girasol', 176, 500, 2),
(3003, 180, 1, 60, 'Chia', 288, 300, 2),
(3004, 400, 1, 50, 'Quinoa', 600, 400, 2),
(3005, 280, 1, 40, 'Sesamo Negro', 392, 500, 2);

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
(5, 'Ana', 'Flores', 'anaflores@gmail.com', 'Los Fogones 2755', '(341)156-585969'),
(6, 'Juana', 'Casas', 'juanacasas@gmail.com', 'Italia 2512', '(341)155-555969'),
(7, 'Julia', 'Moreno', 'jumoreno@gmail.com', 'España 261', '(341)156-357841'),
(8, 'Tony', 'Robles', 'tonyrobles@gmail.com', 'Galvez 1850', '(341)156-577769'),
(9, 'Renzo', 'Cotroco', 'renzocotroco@gmail.com', 'Ayacucho 11 bis', '(341)156-855215'),
(10, 'Raul', 'Osmendia', 'raulosmendia@gmail.com', 'Virasoro 4560', '(341)155-223667'),
(23, 'Laura', 'Roca', 'lauroca@gmail.com', 'Pte. Roca 3452', '(341)153-135874'),
(24, 'David', 'Larroca', 'davidlr@gmail.com', 'San Luis 724', '(341)156-888122');

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
(25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_de_items`
--

CREATE TABLE `lineas_de_items` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` bigint(20) NOT NULL,
  `total_linea` bigint(20) NOT NULL,
  `articulo` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `apellido`, `email`, `nombre`, `password`, `rol`, `username`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '$2a$10$y0h2gPdfFrw/NtdcUQ1BC.xwN6ErQl4jI82U7DeeK50wpM9CqwGk2', 'ROLE_ADMIN', 'admin@admin.com'),
(2, 'user', 'user@user.com', 'user', '$2a$10$hnbnO7ox68Fi3s5lR3PcOOFBcHuKLX0Y7NW8B2oVDEBcmKMJoOkle', 'ROLE_USER', 'user@user.com');

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
-- Indices de la tabla `lineas_de_items`
--
ALTER TABLE `lineas_de_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd3k30t0ewsgryg333qnjokqw9` (`articulo`),
  ADD KEY `FKo7fkm7nbroo3oewyq6djm9c00` (`pedido_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg7202lk0hwxn04bmdl2thth5b` (`cliente_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_de_items`
--
ALTER TABLE `lineas_de_items`
  ADD CONSTRAINT `FKd3k30t0ewsgryg333qnjokqw9` FOREIGN KEY (`articulo`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `FKo7fkm7nbroo3oewyq6djm9c00` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FKg7202lk0hwxn04bmdl2thth5b` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
