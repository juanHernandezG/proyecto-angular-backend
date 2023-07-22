-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2023 a las 22:45:27
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
-- Estructura de tabla para la tabla `base`
--

CREATE TABLE `base` (
  `id_base` int(11) NOT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `talla_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `base`
--

INSERT INTO `base` (`id_base`, `tipo_id`, `talla_id`, `color_id`) VALUES
(1, 1, 2, 3),
(2, 1, 3, 1),
(3, 2, 4, 5),
(4, 2, 1, 2),
(5, 3, 5, 4),
(6, 1, 4, 2),
(7, 3, 3, 1),
(8, 2, 5, 4),
(9, 1, 1, 5),
(10, 3, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `color`) VALUES
(1, 'Blanco'),
(2, 'Negro'),
(3, 'Gris'),
(4, 'Rojo'),
(5, 'Azul'),
(6, 'Verde Claro'),
(7, 'Verde Oscuro'),
(8, 'Amarillo'),
(9, 'Burdeo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `id_detalles_pedido` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `rut` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`id_detalles_pedido`, `producto_id`, `nombre`, `rut`, `direccion`, `telefono`, `correo`) VALUES
(1, 1, 'Ana Martínez', '20.222.222-4', 'Avenida Libertad 123, Santiago', '+56 9 1234 5678', 'ana.martinez@example.com'),
(2, 2, 'Pedro Ramírez', '16.555.555-3', 'Calle Principal 456, Valparaíso', '+56 9 9876 5432', 'ramirez.pedro@example.com'),
(3, 3, 'Laura Silva', '18.888.888-1', 'Calle Florida 789, Concepción', '+56 9 1111 2222', 'lau.silva@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diseno`
--

CREATE TABLE `diseno` (
  `id_diseno` int(11) NOT NULL,
  `diseno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diseno`
--

INSERT INTO `diseno` (`id_diseno`, `diseno`) VALUES
(1, 'Calavera'),
(2, 'Flores'),
(3, 'Rayas'),
(4, 'Animales'),
(5, 'Geométrico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_Pedido` int(11) NOT NULL,
  `detalles_pedido_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_Pedido`, `detalles_pedido_id`, `fecha`, `estado`) VALUES
(1, 1, '2023-07-19', 1),
(2, 2, '2023-07-20', 0),
(3, 3, '2023-07-21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `base_id` int(11) DEFAULT NULL,
  `diseno_id` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `base_id`, `diseno_id`, `precio`) VALUES
(1, 1, 1, 15000),
(2, 2, 2, 15000),
(3, 3, 3, 15000),
(4, 4, 4, 15000),
(5, 5, 5, 15000),
(6, 1, 3, 15000),
(7, 2, 4, 15000),
(8, 3, 5, 15000),
(9, 4, 1, 15000),
(10, 5, 2, 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `id_talla` int(11) NOT NULL,
  `talla` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`id_talla`, `talla`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'Polera'),
(2, 'Polera manga larga'),
(3, 'Polerón canguro'),
(4, 'Polerón polo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `clave`) VALUES
(1, 'Juan Pérez', 'juan@example.com', '123456'),
(2, 'María López', 'maria@example.com', 'abcdef'),
(3, 'Carlos Gómez', 'carlos@example.com', 'qwerty');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`id_base`),
  ADD KEY `tipo_id` (`tipo_id`),
  ADD KEY `talla_id` (`talla_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`id_detalles_pedido`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `diseno`
--
ALTER TABLE `diseno`
  ADD PRIMARY KEY (`id_diseno`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `detalles_pedido_id` (`detalles_pedido_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `base_id` (`base_id`),
  ADD KEY `diseno_id` (`diseno_id`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`id_talla`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `base`
--
ALTER TABLE `base`
  ADD CONSTRAINT `base_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id_tipo`),
  ADD CONSTRAINT `base_ibfk_2` FOREIGN KEY (`talla_id`) REFERENCES `talla` (`id_talla`),
  ADD CONSTRAINT `base_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id_color`);

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`detalles_pedido_id`) REFERENCES `detallespedido` (`id_detalles_pedido`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`base_id`) REFERENCES `base` (`id_base`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`diseno_id`) REFERENCES `diseno` (`id_diseno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
