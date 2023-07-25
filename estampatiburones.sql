-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2023 a las 19:51:50
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
-- Estructura de tabla para la tabla `diseño`
--

CREATE TABLE `diseño` (
  `iddiseno` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diseño`
--

INSERT INTO `diseño` (`iddiseno`, `nombre`, `imagen`) VALUES
(1, 'Pollos hermanos', 'https://www.gustore.cl/img/estampados/2083/2083.png'),
(2, 'Kakashi y Gojo', 'https://www.gustore.cl/img/estampados/8895/8895.png'),
(3, 'Kakashi', 'https://www.gustore.cl/img/estampados/7241/7241.png'),
(4, 'Gojo', 'https://www.gustore.cl/img/estampados/5570/5570.png'),
(5, 'Nirvana 2', 'https://www.gustore.cl/img/estampados/4449/4449.png'),
(6, 'Nirvana 1', 'https://www.gustore.cl/img/estampados/174/174.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `idenvio` int(11) NOT NULL,
  `productosid` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mangalarga`
--

CREATE TABLE `mangalarga` (
  `idmangalarga` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mangalarga`
--

INSERT INTO `mangalarga` (`idmangalarga`, `color`, `imagen`, `precio`, `tipo`, `talla`, `stock`) VALUES
(1, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7', 8000, 2, 'S', 10),
(2, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7', 8000, 2, 'M', 10),
(3, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7', 8000, 2, 'L', 10),
(4, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/blancoMangaLarga_800x945.png?v=new7', 8000, 2, 'XL', 10),
(5, 'Negra', 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7', 8000, 2, 'S', 10),
(6, 'Negra', 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7', 8000, 2, 'M', 10),
(7, 'Negra', 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7', 8000, 2, 'L', 10),
(8, 'Negra', 'https://www.gustore.cl/temp/img/poleras/negraMangaLarga_800x945.png?v=new7', 8000, 2, 'XL', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polera`
--

CREATE TABLE `polera` (
  `idpolera` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `polera`
--

INSERT INTO `polera` (`idpolera`, `color`, `imagen`, `precio`, `tipo`, `talla`, `stock`) VALUES
(1, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7', 8000, 1, 'S', 10),
(2, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7', 8000, 1, 'M', 10),
(3, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7', 8000, 1, 'L', 10),
(4, 'Blanca', 'https://www.gustore.cl/temp/img/poleras/poleraBlanca_800x859.png?v=new7', 8000, 1, 'XL', 10),
(5, 'Negra', 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7', 8000, 1, 'S', 10),
(6, 'Negra', 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7', 8000, 1, 'M', 10),
(7, 'Negra', 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7', 8000, 1, 'L', 10),
(8, 'Negra', 'https://www.gustore.cl/temp/img/poleras/poleraNegra_800x859.png?v=new7', 8000, 1, 'XL', 10),
(9, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7', 8000, 1, 'S', 10),
(10, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7', 8000, 1, 'M', 10),
(11, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7', 8000, 1, 'L', 10),
(12, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleraGris_800x859.png?v=new7', 8000, 1, 'XL', 10),
(13, 'Roja', 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7', 8000, 1, 'S', 10),
(14, 'Roja', 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7', 8000, 1, 'M', 10),
(15, 'Roja', 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7', 8000, 1, 'L', 10),
(16, 'Roja', 'https://www.gustore.cl/temp/img/poleras/poleraRoja_800x859.png?v=new7', 8000, 1, 'XL', 10),
(17, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7', 8000, 1, 'S', 10),
(18, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7', 8000, 1, 'M', 10),
(19, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7', 8000, 1, 'L', 10),
(20, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleraAzulRey_800x859.png?v=new7', 8000, 1, 'XL', 10),
(21, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7', 8000, 1, 'S', 10),
(22, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7', 8000, 1, 'M', 10),
(23, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7', 8000, 1, 'L', 10),
(24, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleraVerde_800x859.png?v=new7', 8000, 1, 'XL', 10),
(25, 'Amarilla', 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7', 8000, 1, 'S', 10),
(26, 'Amarilla', 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7', 8000, 1, 'M', 10),
(27, 'Amarilla', 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7', 8000, 1, 'L', 10),
(28, 'Amarilla', 'https://www.gustore.cl/temp/img/poleras/poleraAmarilla_800x859.png?v=new7', 8000, 1, 'XL', 10),
(29, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7', 8000, 1, 'S', 10),
(30, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7', 8000, 1, 'M', 10),
(31, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7', 8000, 1, 'L', 10),
(32, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleraBurdeo_800x859.png?v=new7', 8000, 1, 'XL', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poleron`
--

CREATE TABLE `poleron` (
  `idpoleron` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `poleron`
--

INSERT INTO `poleron` (`idpoleron`, `color`, `imagen`, `precio`, `tipo`, `talla`, `stock`) VALUES
(1, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7', 20000, 3, 'S', 10),
(2, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7', 20000, 3, 'M', 10),
(3, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7', 20000, 3, 'L', 10),
(4, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronBlanco_800x800.png?v=new7', 20000, 3, 'XL', 10),
(5, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7', 20000, 3, 'S', 10),
(6, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7', 20000, 3, 'M', 10),
(7, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7', 20000, 3, 'L', 10),
(8, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronNegro_800x800.png?v=new7', 20000, 3, 'XL', 10),
(9, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7', 20000, 3, 'S', 10),
(10, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7', 20000, 3, 'M', 10),
(11, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7', 20000, 3, 'L', 10),
(12, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronGris_800x800.png?v=new7', 20000, 3, 'XL', 10),
(13, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7', 20000, 3, 'S', 10),
(14, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7', 20000, 3, 'M', 10),
(15, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7', 20000, 3, 'L', 10),
(16, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronAzulMarino_800x800.png?v=new7', 20000, 3, 'XL', 10),
(17, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7', 20000, 3, 'S', 10),
(18, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7', 20000, 3, 'M', 10),
(19, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7', 20000, 3, 'L', 10),
(20, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronRojo_800x800.png?v=new7', 20000, 3, 'XL', 10),
(21, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7', 20000, 3, 'S', 10),
(22, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7', 20000, 3, 'M', 10),
(23, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7', 20000, 3, 'L', 10),
(24, 'Burdeo', 'https://www.gustore.cl/temp/img/poleras/poleronBurdeo_800x800.png?v=new7', 20000, 3, 'XL', 10),
(25, 'Amarillo', 'https://www.gustore.cl/temp/img/poleras/poleronAmarillo_800x800.png?v=new7', 20000, 3, 'S', 10),
(26, 'Amarillo', 'https://www.gustore.cl/temp/img/poleras/poleronAmarillo_800x800.png?v=new7', 20000, 3, 'M', 10),
(27, 'Amarillo', 'https://www.gustore.cl/temp/img/poleras/poleronAmarillo_800x800.png?v=new7', 20000, 3, 'L', 10),
(28, 'Amarillo', 'https://www.gustore.cl/temp/img/poleras/poleronAmarillo_800x800.png?v=new7', 20000, 3, 'XL', 10),
(29, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleronVerdeBosque_800x800.png?v=new7', 20000, 3, 'S', 10),
(30, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleronVerdeBosque_800x800.png?v=new7', 20000, 3, 'M', 10),
(31, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleronVerdeBosque_800x800.png?v=new7', 20000, 3, 'L', 10),
(32, 'Verde', 'https://www.gustore.cl/temp/img/poleras/poleronVerdeBosque_800x800.png?v=new7', 20000, 3, 'XL', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polo`
--

CREATE TABLE `polo` (
  `idpolo` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `polo`
--

INSERT INTO `polo` (`idpolo`, `color`, `imagen`, `precio`, `tipo`, `talla`, `stock`) VALUES
(1, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7', 15000, 4, 'S', 10),
(2, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7', 15000, 4, 'M', 10),
(3, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7', 15000, 4, 'L', 10),
(4, 'Blanco', 'https://www.gustore.cl/temp/img/poleras/poleronPoloBlanco_800x800.png?v=new7', 15000, 4, 'XL', 10),
(5, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7', 15000, 4, 'S', 10),
(6, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7', 15000, 4, 'M', 10),
(7, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7', 15000, 4, 'L', 10),
(8, 'Negro', 'https://www.gustore.cl/temp/img/poleras/poleronPoloNegro_800x800.png?v=new7', 15000, 4, 'XL', 10),
(9, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7', 15000, 4, 'S', 10),
(10, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7', 15000, 4, 'M', 10),
(11, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7', 15000, 4, 'L', 10),
(12, 'Gris', 'https://www.gustore.cl/temp/img/poleras/poleronPoloGrisMelange_800x800.png?v=new7', 15000, 4, 'XL', 10),
(13, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7', 15000, 4, 'S', 10),
(14, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7', 15000, 4, 'M', 10),
(15, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7', 15000, 4, 'L', 10),
(16, 'Rojo', 'https://www.gustore.cl/temp/img/poleras/poleronPoloRojo_800x800.png?v=new7', 15000, 4, 'XL', 10),
(17, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7', 15000, 4, 'S', 10),
(18, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7', 15000, 4, 'M', 10),
(19, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7', 15000, 4, 'L', 10),
(20, 'Azul', 'https://www.gustore.cl/temp/img/poleras/poleronPoloAzulMarino_800x800.png?v=new7', 15000, 4, 'XL', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipoid` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `disenoid` int(11) DEFAULT NULL,
  `imagenprenda` varchar(100) DEFAULT NULL,
  `imagendiseno` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Juan Pérez', 'juan@example.com', '123456'),
(2, 'María López', 'maria@example.com', 'abcdef'),
(3, 'Carlos Gómez', 'carlos@example.com', 'qwerty'),
(4, 'seba', 'seba@example.com', '$2b$10$MCVUjJxOqzPRFWoo1f/Dge3v/flVpHqYSzxglZl88MWpv1p5NJ.Qq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diseño`
--
ALTER TABLE `diseño`
  ADD PRIMARY KEY (`iddiseno`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`idenvio`),
  ADD KEY `productosid` (`productosid`);

--
-- Indices de la tabla `mangalarga`
--
ALTER TABLE `mangalarga`
  ADD PRIMARY KEY (`idmangalarga`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `polera`
--
ALTER TABLE `polera`
  ADD PRIMARY KEY (`idpolera`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `poleron`
--
ALTER TABLE `poleron`
  ADD PRIMARY KEY (`idpoleron`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `polo`
--
ALTER TABLE `polo`
  ADD PRIMARY KEY (`idpolo`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `tipoid` (`tipoid`),
  ADD KEY `disenoid` (`disenoid`);

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
-- AUTO_INCREMENT de la tabla `diseño`
--
ALTER TABLE `diseño`
  MODIFY `iddiseno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `idenvio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mangalarga`
--
ALTER TABLE `mangalarga`
  MODIFY `idmangalarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `polera`
--
ALTER TABLE `polera`
  MODIFY `idpolera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `poleron`
--
ALTER TABLE `poleron`
  MODIFY `idpoleron` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `polo`
--
ALTER TABLE `polo`
  MODIFY `idpolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`productosid`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `mangalarga`
--
ALTER TABLE `mangalarga`
  ADD CONSTRAINT `mangalarga_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `polera`
--
ALTER TABLE `polera`
  ADD CONSTRAINT `polera_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `poleron`
--
ALTER TABLE `poleron`
  ADD CONSTRAINT `poleron_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `polo`
--
ALTER TABLE `polo`
  ADD CONSTRAINT `polo_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipoid`) REFERENCES `tipo` (`idtipo`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`disenoid`) REFERENCES `diseño` (`iddiseno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
