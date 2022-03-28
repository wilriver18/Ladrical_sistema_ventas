-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2022 a las 02:17:18
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ladrical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_negocio`
--

CREATE TABLE `datos_negocio` (
  `id_negocio` int(11) NOT NULL,
  `nombre` varchar(80) CHARACTER SET utf8 NOT NULL,
  `ndocumento` varchar(20) NOT NULL,
  `documento` int(11) NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telefono` int(20) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pais` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `nombre_impuesto` varchar(10) NOT NULL,
  `monto_impuesto` float(4,2) NOT NULL,
  `moneda` varchar(10) NOT NULL,
  `simbolo` varchar(10) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idmovimiento` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo` varchar(25) NOT NULL,
  `vendedor` varchar(255) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Inicio'),
(2, 'Almacen'),
(3, 'Ventas'),
(4, 'Personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idpersonal` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `imagen`, `condicion`) VALUES
(1, 'Usuario Administrador', 'DNI', '71883851', 'Guadalupe', '952761400', 'Manuel_13_1998@Hotmail.com', 'Administrador', '1570311068.png', 1),
(2, 'ROEL CHURATA QUISPE', 'DNI', '2542522', 'kkaka', '855558', 'test1@test1.com', 'Vendedor', '1607292444.png', 1),
(3, 'PRUEBA', 'DNI', '78996532', 'Calle #12', '952761400', 'manuel_13_1998@hotmail.com', 'Administrador', '1625439652.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) NOT NULL DEFAULT 'anonymous.png',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `modelo` varchar(100) DEFAULT NULL,
  `numserie` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `idcategoria`, `codigo`, `nombre`, `stock`, `precio`, `fecha`, `descripcion`, `imagen`, `condicion`, `modelo`, `numserie`) VALUES
(13, 1, 'DFDF', 'SAMSUMG GALAXY A72', 0, '1800.00', '2021-06-08', 'SAMSUMG', '1624656994.jpg', 1, NULL, NULL),
(14, 1, 'IICG', 'CURSO DE PRUEBA 2', 11, '500.00', '2021-06-10', 'CURSO 2', '1623459324.jpg', 1, NULL, NULL),
(15, 4, 'IICG', 'BAKHOU BOXER', 9, '520.00', '2021-06-25', 'M', '1624657051.jpg', 1, NULL, NULL),
(16, 1, 'NEZY', 'PRODUCTO', 6, '200.00', '2021-06-25', 'M', 'anonymous.png', 1, NULL, NULL),
(17, 1, '25554', 'Coca Cola', 195, '200.00', '2021-06-11', 'xd', 'anonymous.png', 1, NULL, NULL),
(18, 1, 'DDSDS', 'COCA SD', 198, '200.00', '2021-06-30', 'XD', 'anonymous.png', 1, NULL, NULL),
(19, 1, 'IICG', 'Coca Cola', 10, '100.00', '2021-07-02', 'M', 'anonymous.png', 1, NULL, NULL),
(20, 1, 'ed', 'fg', 400, '100.00', '2021-07-08', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
(21, 1, 'sdsdd', 'BAKHOU BOXER', 100, '80.00', '2021-06-11', 'ss', 'anonymous.png', 1, NULL, NULL),
(22, 1, 'fggf', 'Manuel', 9, '1.00', '2021-06-11', 'kj', '1623461526.jpg', 1, NULL, NULL),
(23, 1, 'f', 'no se gurda la imagen', 10, '100000.00', '0000-00-00', 'sdd', '1623461744.jpg', 1, NULL, NULL),
(24, 1, 'ghghgh', 'esta si', 10, '40.00', '0000-00-00', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
(25, 1, '2442', 'pruebaaaa', 72, '25.00', '2021-05-15', 'dfdfdf\r\n', 'anonymous.png', 1, NULL, NULL),
(26, 1, 'ASDSD', 'PROBANDO LA IMG', 200, '100.00', '2021-06-11', 'PROBANDO', 'anonymous.png', 1, NULL, NULL),
(27, 1, 'SDASAS', 'PRUEBA IMG', 20, '5.00', '2021-06-11', 'XDD', '1623464750.jpeg', 1, NULL, NULL),
(28, 1, 'HHJ', 'ererrtt', 11, '10.00', '2021-06-11', 'HGH', 'anonymous.png', 1, NULL, NULL),
(29, 1, 'GHGH', 'FULL SMARTV HD', 10, '1200.00', '2021-06-11', 'LG', '1624656608.jpg', 1, 'm', 's'),
(30, 1, '', 'CURSO DE PRUEBA 24444', 5, '85.00', '2021-07-04', 'M', '1625413837.png', 1, 'modelo', 'serie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `idpersonal` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `idpersonal`, `login`, `clave`, `condicion`) VALUES
(1, 1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
(4, 2, 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 1),
(19, 3, 'AD', 'c7bf4bbdbcd88d9d7f7c7b299c94e9e52091af2fd2888ecf85a9d6a4160b4184', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(8, 1, 1),
(9, 1, 2),
(10, 1, 3),
(11, 1, 4),
(12, 1, 5),
(13, 1, 5),
(14, 1, 6),
(15, 1, 7),
(20, 4, 4),
(21, 1, 8),
(30, 5, 1),
(31, 5, 2),
(32, 5, 3),
(33, 5, 4),
(34, 5, 5),
(35, 5, 6),
(36, 5, 7),
(37, 5, 8),
(49, 19, 1),
(50, 19, 2),
(51, 19, 3),
(52, 19, 4),
(53, 19, 5),
(54, 19, 6),
(55, 19, 7),
(56, 19, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `ventacredito` varchar(20) NOT NULL,
  `formapago` varchar(50) DEFAULT NULL,
  `numoperacion` varchar(100) DEFAULT NULL,
  `fechadeposito` datetime DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `totalrecibido` double DEFAULT NULL,
  `vuelto` double DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `DOV_Nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idPersonal`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `ventacredito`, `formapago`, `numoperacion`, `fechadeposito`, `descuento`, `totalrecibido`, `vuelto`, `estado`, `DOV_Nombre`) VALUES
(47, 2, 1, 'Boleta', '001', '0000001', '2021-06-17 00:00:00', '18.00', '1400.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(48, 4, 1, 'Boleta', '001', '0000002', '2021-04-01 00:00:00', '18.00', '39.20', 'Si', 'Transferencia', '', '0000-00-00 00:00:00', 2, 100, 60.8, 'Aceptado', NULL),
(49, 2, 1, 'Boleta', '001', '0000003', '2021-06-17 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(50, 2, 1, 'Boleta', '001', '0000004', '2021-06-17 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 500, 'Aceptado', NULL),
(51, 4, 1, 'Boleta', '001', '0000005', '2021-06-17 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(52, 2, 1, 'Boleta', '001', '0000006', '2021-06-17 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(53, 2, 1, 'Boleta', '001', '0000007', '2021-06-18 00:00:00', '18.00', '505.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(54, 4, 1, 'Boleta', '001', '0000008', '2021-05-01 00:00:00', '18.00', '25.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 25, 'Aceptado', NULL),
(55, 4, 1, 'Boleta', '001', '0000009', '2021-06-19 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(56, 2, 1, 'Factura', '001', '0000001', '2021-06-19 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(57, 4, 1, 'Nota', '001', '0000001', '2021-06-19 00:00:00', '0.00', '1000.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(58, 2, 1, 'Boleta', '001', '0000010', '2021-06-20 00:00:00', '18.00', '1000.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(59, 2, 1, 'Boleta', '001', '0000011', '2021-06-21 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(60, 2, 1, 'Boleta', '001', '0000012', '2021-06-21 00:00:00', '18.00', '180.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 10, 0, 0, 'Aceptado', NULL),
(61, 2, 1, 'Boleta', '001', '0000013', '2021-06-22 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(62, 2, 1, 'Boleta', '001', '0000014', '2021-06-23 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(64, 2, 1, 'Boleta', '001', '0000015', '2021-06-25 00:00:00', '18.00', '25.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(65, 2, 1, 'Boleta', '001', '0000016', '2021-06-25 00:00:00', '18.00', '200.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(66, 4, 1, 'Boleta', '001', '0000017', '2021-06-25 00:00:00', '18.00', '25.00', 'No', 'Transferencia', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(67, 2, 1, 'Boleta', '001', '0000018', '2021-06-25 00:00:00', '18.00', '4100.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 5000, 900, 'Aceptado', NULL),
(68, 2, 1, 'Boleta', '001', '0000019', '2021-06-29 00:00:00', '18.00', '825.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 175, 'Aceptado', NULL),
(69, 2, 1, 'Boleta', '001', '0000020', '2021-07-01 00:00:00', '18.00', '500.00', 'No', 'Tarjeta', '0221212458454', '2021-07-01 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(70, 2, 2, 'Boleta', '001', '0000021', '2021-07-04 00:00:00', '18.00', '25.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(71, 2, 1, 'Boleta', '001', '0000022', '2021-07-04 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(72, 2, 1, 'Boleta', '001', '0000023', '2021-03-01 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(73, 2, 1, 'Boleta', '001', '0000024', '2021-07-08 00:00:00', '18.00', '500.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(74, 2, 1, 'Boleta', '001', '0000025', '2021-07-10 00:00:00', '18.00', '500.00', 'Si', 'Tarjeta', '11212', '2021-07-10 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(75, 2, 1, 'Boleta', '001', '0000026', '2021-07-11 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
(76, 2, 1, 'Boleta', '001', '0000027', '2021-07-11 00:00:00', '18.00', '500.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
(77, 4, 1, 'Boleta', '001', '0000028', '2021-07-12 00:00:00', '18.00', '200.00', 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(78, 2, 1, 'Boleta', '001', '0000029', '2022-03-26 00:00:00', '18.00', '720.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 280, 'Aceptado', NULL),
(79, 4, 1, 'Boleta', '001', '0000030', '2022-03-27 00:00:00', '18.00', '400.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 500, 100, 'Aceptado', NULL),
(80, 2, 1, 'Boleta', '001', '0000031', '2022-03-27 00:00:00', '18.00', '400.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 600, 'Aceptado', NULL),
(81, 4, 1, 'Boleta', '001', '0000032', '2022-03-27 00:00:00', '18.00', '10.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 40, 'Aceptado', NULL),
(82, 2, 1, 'Boleta', '001', '0000033', '2022-03-27 00:00:00', '18.00', '30.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 20, 'Aceptado', NULL),
(83, 5, 1, 'Boleta', '001', '0000034', '2022-03-27 00:00:00', '18.00', '40.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 100, 60, 'Aceptado', NULL),
(84, 4, 1, 'Boleta', '001', '0000035', '2022-03-27 00:00:00', '18.00', '10.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 40, 'Aceptado', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `datos_negocio`
--
ALTER TABLE `datos_negocio`
  ADD PRIMARY KEY (`id_negocio`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_producto1_idx` (`idproducto`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idmovimiento`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idpersonal`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_producto_categoria1_idx` (`idcategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `fk_usuario_personal1_idx` (`idpersonal`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  ADD KEY `fk_usuario_permiso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_Personal1_idx` (`idPersonal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_negocio`
--
ALTER TABLE `datos_negocio`
  MODIFY `id_negocio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idmovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idpersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
