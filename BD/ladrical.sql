-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2022 a las 06:28:52
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

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

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `condicion`) VALUES
(1, 'LADRILLO', 1),
(2, 'CEMENTO', 1),
(3, 'ESTUCO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_pago`
--

CREATE TABLE `comp_pago` (
  `id_comp_pago` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `serie_comprobante` varchar(3) NOT NULL,
  `num_comprobante` varchar(7) NOT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comp_pago`
--

INSERT INTO `comp_pago` (`id_comp_pago`, `nombre`, `serie_comprobante`, `num_comprobante`, `condicion`) VALUES
(2, 'Boleta', '000', '9999999', 1);

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

--
-- Volcado de datos para la tabla `datos_negocio`
--

INSERT INTO `datos_negocio` (`id_negocio`, `nombre`, `ndocumento`, `documento`, `direccion`, `telefono`, `email`, `logo`, `pais`, `ciudad`, `nombre_impuesto`, `monto_impuesto`, `moneda`, `simbolo`, `condicion`) VALUES
(6, 'LADRICAL', 'NIT', 1010101010, 'POTOSI BOLIVIA', 72144532, 'ladrical@hotmail.com', '', 'BOLIVIA', 'POTOSI', 'IVA', 16.00, 'BOLIVIANOS', 'BS/', 1);

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

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idproducto`, `cantidad`, `precio_venta`, `descuento`) VALUES
(1, 1, 33, 1, '6.00', '0.00'),
(2, 1, 32, 1, '4.00', '0.00'),
(3, 2, 34, 1, '5.00', '0.00'),
(4, 3, 41, 25, '2.00', '0.00'),
(5, 3, 40, 1, '4.00', '0.00');

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

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `fecha`) VALUES
(2, 'Cliente', 'Jose', 'NIT', '12345678944', 'LA PAZ', '', 'jose@ho.com', NULL),
(3, 'Proveedor', 'Maria', 'NIT', '12345678911', 'CBBA', '', 'maria@gmail.com', NULL),
(4, 'Cliente', 'Veronica', 'NIT', '75662354', 'TARIJA', '', 'veronica@gmail.com', NULL),
(5, 'Cliente', 'maria', 'DNI', '71883852', 'POTOSI', '', 'prueba@hotmail.com', '0000-00-00'),
(6, 'Cliente', 'Gregorio', 'CEDULA', '4334626', 'Av Heroinas entre oquendo', '46484987', 'alesn@hotmail.com', '1995-06-22');

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
(1, 'Usuario Administrador', 'DNI', '71883851', 'Guadalupe', '952761400', 'Manuel_13_1998@Hotmail.com', 'Administrador', '1648439985.jpg', 1),
(2, 'ROEL CHURATA QUISPE', 'DNI', '2542522', 'kkaka', '855558', 'test1@test1.com', 'Vendedor', '1648440006.jpg', 1),
(3, 'Gregorio', 'CEDULA', '4334626', 'Av Final Panamericana', '46484987', 'Gregorio@hotmail.com', 'Administrador', '1648440129.jpg', 1),
(4, 'Julia', 'CEDULA', '43464889', 'Av los Angeles', '46484987', 'julia@hotmail.com', 'Gerente', '1648440195.jpg', 1);

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
(37, 1, '', 'Ladrillo 6 huecos', 9009, '2.00', '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440702.jpg', 1, 'Indeca', ''),
(38, 1, '', 'Ladrillo de estilo rústico', 545, '5.00', '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440736.png', 1, 'Indeca', ''),
(39, 1, '', 'Ladrillo decorativo', 5666, '3.00', '0000-00-00', '', '1648440761.jpg', 1, 'Indeca', ''),
(40, 1, '', 'Ladrillo de estilo rústico', 6554, '4.00', '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440791.jpg', 1, 'Indeca', ''),
(41, 1, '', 'ladrillo pequeño', 465, '2.00', '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440828.png', 1, 'Indeca', ''),
(42, 1, '', 'Ladrillo 6 huecos', 5455, '4.00', '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440860.jpg', 1, 'Indeca', '');

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
(4, 2, 'wilmer', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
(19, 3, 'prueba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
(21, 6, 'gregory', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1);

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
(15, 1, 7);

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
(1, 2, 1, 'Boleta', '001', '0000001', '2022-03-27 00:00:00', '16.00', '10.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 20, 10, 'Aceptado', NULL),
(2, 4, 1, 'Boleta', '001', '0000002', '2022-03-27 00:00:00', '16.00', '5.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
(3, 6, 1, 'Boleta', '001', '0000003', '2022-03-27 00:00:00', '16.00', '54.00', 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL);

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
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `datos_negocio`
--
ALTER TABLE `datos_negocio`
  MODIFY `id_negocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idpersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
