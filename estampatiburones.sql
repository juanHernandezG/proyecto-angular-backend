-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2023 a las 22:26:17
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
-- Base de datos: `estampatiburones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diseno`
--

CREATE TABLE `diseno` (
  `iddiseno` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diseno`
--

INSERT INTO `diseno` (`iddiseno`, `nombre`, `imagen`) VALUES
(7, 'Nirvana', 'https://www.gustore.cl/img/estampados/4449/4449.png'),
(8, 'Kurt Cobain', 'https://www.gustore.cl/img/estampados/3793/3793.png'),
(9, 'Los Peces Del Infierno', 'https://www.gustore.cl/img/estampados/7916/7916.png'),
(10, 'Gojo', 'https://www.gustore.cl/img/estampados/5727/5727.png'),
(11, 'Free Rick', 'https://www.gustore.cl/img/estampados/2588/2588.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `idenvio` int(11) NOT NULL,
  `productosid` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`idenvio`, `productosid`, `nombre`, `apellido`, `rut`, `ciudad`, `direccion`, `celular`, `correo`) VALUES
(1, '20,21', 'Jorge', 'Hormazabal', '206281430', 'Chillan', 'andres bello', '978451212', 'totex@totex.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prod`
--

CREATE TABLE `prod` (
  `idprod` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `talla` varchar(5) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prod`
--

INSERT INTO `prod` (`idprod`, `tipo`, `color`, `talla`, `precio`, `stock`, `imagen`) VALUES
(11, 1, 'Blanca', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7'),
(12, 1, 'Blanca', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7'),
(13, 1, 'Blanca', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7'),
(14, 1, 'Blanca', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7'),
(15, 1, 'Negra', 'S', 7000, 10, 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7'),
(16, 1, 'Negra', 'M', 7000, 10, 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7'),
(17, 1, 'Negra', 'L', 7000, 10, 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7'),
(18, 1, 'Negra', 'XL', 7000, 10, 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7'),
(19, 1, 'Gris', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7'),
(20, 1, 'Gris', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7'),
(21, 1, 'Gris', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7'),
(22, 1, 'Gris', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7'),
(23, 1, 'Roja', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7'),
(24, 1, 'Roja', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7'),
(25, 1, 'Roja', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7'),
(26, 1, 'Roja', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7'),
(27, 1, 'Azul', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7'),
(28, 1, 'Azul', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7'),
(29, 1, 'Azul', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7'),
(30, 1, 'Azul', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7'),
(31, 1, 'Verde', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7'),
(32, 1, 'Verde', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7'),
(33, 1, 'Verde', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7'),
(34, 1, 'Verde', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7'),
(35, 1, 'Amarilla', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7'),
(36, 1, 'Amarilla', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7'),
(37, 1, 'Amarilla', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7'),
(38, 1, 'Amarilla', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7'),
(39, 1, 'Burdeo', 'S', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7'),
(40, 1, 'Burdeo', 'M', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7'),
(41, 1, 'Burdeo', 'L', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7'),
(42, 1, 'Burdeo', 'XL', 7000, 5, 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7'),
(43, 2, 'Blanca', 'S', 8000, 3, 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7'),
(44, 2, 'Blanca', 'M', 8000, 5, 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7'),
(45, 2, 'Blanca', 'L', 8000, 5, 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7'),
(46, 2, 'Blanca', 'XL', 8000, 5, 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7'),
(47, 2, 'Negra', 'S', 8000, 10, 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7'),
(48, 2, 'Negra', 'M', 8000, 10, 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7'),
(49, 2, 'Negra', 'L', 8000, 10, 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7'),
(50, 2, 'Negra', 'XL', 8000, 10, 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7'),
(51, 3, 'Blanco', 'S', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7'),
(52, 3, 'Blanco', 'M', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7'),
(53, 3, 'Blanco', 'L', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7'),
(54, 3, 'Blanco', 'XL', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7'),
(55, 3, 'Negro', 'S', 15000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7'),
(56, 3, 'Negro', 'M', 15000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7'),
(57, 3, 'Negro', 'L', 15000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7'),
(58, 3, 'Negro', 'XL', 15000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7'),
(59, 3, 'Gris', 'S', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7'),
(60, 3, 'Gris', 'M', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7'),
(61, 3, 'Gris', 'L', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7'),
(62, 3, 'Gris', 'XL', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7'),
(63, 3, 'Azul', 'S', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7'),
(64, 3, 'Azul', 'M', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7'),
(65, 3, 'Azul', 'L', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7'),
(66, 3, 'Azul', 'XL', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7'),
(67, 3, 'Rojo', 'S', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7'),
(68, 3, 'Rojo', 'M', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7'),
(69, 3, 'Rojo', 'L', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7'),
(70, 3, 'Rojo', 'XL', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7'),
(71, 3, 'Burdeo', 'S', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7'),
(72, 3, 'Burdeo', 'M', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7'),
(73, 3, 'Burdeo', 'L', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7'),
(74, 3, 'Burdeo', 'XL', 15000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7'),
(83, 4, 'Blanco', 'S', 12000, 4, 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7'),
(84, 4, 'Blanco', 'M', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7'),
(85, 4, 'Blanco', 'L', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7'),
(86, 4, 'Blanco', 'XL', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7'),
(87, 4, 'Negro', 'S', 12000, 9, 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7'),
(88, 4, 'Negro', 'M', 12000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7'),
(89, 4, 'Negro', 'L', 12000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7'),
(90, 4, 'Negro', 'XL', 12000, 10, 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7'),
(91, 4, 'Gris', 'S', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7'),
(92, 4, 'Gris', 'M', 12000, 4, 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7'),
(93, 4, 'Gris', 'L', 12000, 4, 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7'),
(94, 4, 'Gris', 'XL', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7'),
(95, 4, 'Rojo', 'S', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7'),
(96, 4, 'Rojo', 'M', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7'),
(97, 4, 'Rojo', 'L', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7'),
(98, 4, 'Rojo', 'XL', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7'),
(99, 4, 'Azul', 'S', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7'),
(100, 4, 'Azul', 'M', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7'),
(101, 4, 'Azul', 'L', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7'),
(102, 4, 'Azul', 'XL', 12000, 5, 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `talla` varchar(6) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `diseno` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `idtalla` int(11) NOT NULL,
  `talla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`idtalla`, `talla`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idtipo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idtipo`, `nombre`, `imagen`) VALUES
(1, 'Polera', 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7'),
(2, 'Polera Manga Larga', 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7'),
(3, 'Polerón Canguro', 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7'),
(4, 'Polerón Polo', 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `clave`) VALUES
(4, 'seba', 'seba@example.com', '$2b$10$MCVUjJxOqzPRFWoo1f/Dge3v/flVpHqYSzxglZl88MWpv1p5NJ.Qq'),
(8, 'Estampa Tiburones', 'admin@estampatiburones.cl', '$2b$10$DnetQ2Mmn9lc7GamNyKpceNw83woxFtxrr7g.rrpiuaZyxmlC8ok2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diseno`
--
ALTER TABLE `diseno`
  ADD PRIMARY KEY (`iddiseno`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`idenvio`);

--
-- Indices de la tabla `prod`
--
ALTER TABLE `prod`
  ADD PRIMARY KEY (`idprod`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idtipo` (`idtipo`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idtalla`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `diseno`
--
ALTER TABLE `diseno`
  MODIFY `iddiseno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `idenvio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `prod`
--
ALTER TABLE `prod`
  MODIFY `idprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idtalla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prod`
--
ALTER TABLE `prod`
  ADD CONSTRAINT `prod_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
