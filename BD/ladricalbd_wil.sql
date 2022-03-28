-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ventas
CREATE DATABASE IF NOT EXISTS `ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ventas`;

-- Volcando estructura para tabla ventas.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.datos_negocio
CREATE TABLE IF NOT EXISTS `datos_negocio` (
  `id_negocio` int(11) NOT NULL AUTO_INCREMENT,
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
  `condicion` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_negocio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ventas.datos_negocio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_negocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_negocio` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_producto1_idx` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.movimiento
CREATE TABLE IF NOT EXISTS `movimiento` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo` varchar(25) NOT NULL,
  `vendedor` varchar(255) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idmovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ventas.movimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.permiso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.personal: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT IGNORE INTO `personal` (`idpersonal`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `imagen`, `condicion`) VALUES
	(1, 'Usuario Administrador', 'DNI', '71883851', 'Guadalupe', '952761400', 'Manuel_13_1998@Hotmail.com', 'Administrador', '1570311068.png', 1),
	(2, 'ROEL CHURATA QUISPE', 'DNI', '2542522', 'kkaka', '855558', 'test1@test1.com', 'Vendedor', '1607292444.png', 1),
	(3, 'PRUEBA', 'DNI', '78996532', 'Calle #12', '952761400', 'manuel_13_1998@hotmail.com', 'Administrador', '1625439652.jpg', 1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
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
  `numserie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_categoria1_idx` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.producto: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT IGNORE INTO `producto` (`idproducto`, `idcategoria`, `codigo`, `nombre`, `stock`, `precio`, `fecha`, `descripcion`, `imagen`, `condicion`, `modelo`, `numserie`) VALUES
	(13, 1, 'DFDF', 'SAMSUMG GALAXY A72', 0, 1800.00, '2021-06-08', 'SAMSUMG', '1624656994.jpg', 1, NULL, NULL),
	(14, 1, 'IICG', 'CURSO DE PRUEBA 2', 11, 500.00, '2021-06-10', 'CURSO 2', '1623459324.jpg', 1, NULL, NULL),
	(15, 4, 'IICG', 'BAKHOU BOXER', 9, 520.00, '2021-06-25', 'M', '1624657051.jpg', 1, NULL, NULL),
	(16, 1, 'NEZY', 'PRODUCTO', 6, 200.00, '2021-06-25', 'M', 'anonymous.png', 1, NULL, NULL),
	(17, 1, '25554', 'Coca Cola', 195, 200.00, '2021-06-11', 'xd', 'anonymous.png', 1, NULL, NULL),
	(18, 1, 'DDSDS', 'COCA SD', 198, 200.00, '2021-06-30', 'XD', 'anonymous.png', 1, NULL, NULL),
	(19, 1, 'IICG', 'Coca Cola', 10, 100.00, '2021-07-02', 'M', 'anonymous.png', 1, NULL, NULL),
	(20, 1, 'ed', 'fg', 400, 100.00, '2021-07-08', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
	(21, 1, 'sdsdd', 'BAKHOU BOXER', 100, 80.00, '2021-06-11', 'ss', 'anonymous.png', 1, NULL, NULL),
	(22, 1, 'fggf', 'Manuel', 9, 1.00, '2021-06-11', 'kj', '1623461526.jpg', 1, NULL, NULL),
	(23, 1, 'f', 'no se gurda la imagen', 10, 100000.00, '0000-00-00', 'sdd', '1623461744.jpg', 1, NULL, NULL),
	(24, 1, 'ghghgh', 'esta si', 10, 40.00, '0000-00-00', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
	(25, 1, '2442', 'pruebaaaa', 72, 25.00, '2021-05-15', 'dfdfdf\r\n', 'anonymous.png', 1, NULL, NULL),
	(26, 1, 'ASDSD', 'PROBANDO LA IMG', 200, 100.00, '2021-06-11', 'PROBANDO', 'anonymous.png', 1, NULL, NULL),
	(27, 1, 'SDASAS', 'PRUEBA IMG', 20, 5.00, '2021-06-11', 'XDD', '1623464750.jpeg', 1, NULL, NULL),
	(28, 1, 'HHJ', 'ererrtt', 11, 10.00, '2021-06-11', 'HGH', 'anonymous.png', 1, NULL, NULL),
	(29, 1, 'GHGH', 'FULL SMARTV HD', 10, 1200.00, '2021-06-11', 'LG', '1624656608.jpg', 1, 'm', 's'),
	(30, 1, '', 'CURSO DE PRUEBA 24444', 5, 85.00, '2021-07-04', 'M', '1625413837.png', 1, 'modelo', 'serie');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersonal` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_personal1_idx` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`idusuario`, `idpersonal`, `login`, `clave`, `condicion`) VALUES
	(1, 1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
	(4, 2, 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 1),
	(19, 3, 'AD', 'c7bf4bbdbcd88d9d7f7c7b299c94e9e52091af2fd2888ecf85a9d6a4160b4184', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.usuario_permiso
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.usuario_permiso: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT IGNORE INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
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
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;

-- Volcando estructura para tabla ventas.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
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
  `DOV_Nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_Personal1_idx` (`idPersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ventas.venta: ~35 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT IGNORE INTO `venta` (`idventa`, `idcliente`, `idPersonal`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `ventacredito`, `formapago`, `numoperacion`, `fechadeposito`, `descuento`, `totalrecibido`, `vuelto`, `estado`, `DOV_Nombre`) VALUES
	(47, 2, 1, 'Boleta', '001', '0000001', '2021-06-17 00:00:00', 18.00, 1400.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(48, 4, 1, 'Boleta', '001', '0000002', '2021-04-01 00:00:00', 18.00, 39.20, 'Si', 'Transferencia', '', '0000-00-00 00:00:00', 2, 100, 60.8, 'Aceptado', NULL),
	(49, 2, 1, 'Boleta', '001', '0000003', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(50, 2, 1, 'Boleta', '001', '0000004', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 500, 'Aceptado', NULL),
	(51, 4, 1, 'Boleta', '001', '0000005', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(52, 2, 1, 'Boleta', '001', '0000006', '2021-06-17 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(53, 2, 1, 'Boleta', '001', '0000007', '2021-06-18 00:00:00', 18.00, 505.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(54, 4, 1, 'Boleta', '001', '0000008', '2021-05-01 00:00:00', 18.00, 25.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 25, 'Aceptado', NULL),
	(55, 4, 1, 'Boleta', '001', '0000009', '2021-06-19 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(56, 2, 1, 'Factura', '001', '0000001', '2021-06-19 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(57, 4, 1, 'Nota', '001', '0000001', '2021-06-19 00:00:00', 0.00, 1000.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(58, 2, 1, 'Boleta', '001', '0000010', '2021-06-20 00:00:00', 18.00, 1000.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(59, 2, 1, 'Boleta', '001', '0000011', '2021-06-21 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(60, 2, 1, 'Boleta', '001', '0000012', '2021-06-21 00:00:00', 18.00, 180.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 10, 0, 0, 'Aceptado', NULL),
	(61, 2, 1, 'Boleta', '001', '0000013', '2021-06-22 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(62, 2, 1, 'Boleta', '001', '0000014', '2021-06-23 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(64, 2, 1, 'Boleta', '001', '0000015', '2021-06-25 00:00:00', 18.00, 25.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(65, 2, 1, 'Boleta', '001', '0000016', '2021-06-25 00:00:00', 18.00, 200.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(66, 4, 1, 'Boleta', '001', '0000017', '2021-06-25 00:00:00', 18.00, 25.00, 'No', 'Transferencia', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(67, 2, 1, 'Boleta', '001', '0000018', '2021-06-25 00:00:00', 18.00, 4100.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 5000, 900, 'Aceptado', NULL),
	(68, 2, 1, 'Boleta', '001', '0000019', '2021-06-29 00:00:00', 18.00, 825.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 175, 'Aceptado', NULL),
	(69, 2, 1, 'Boleta', '001', '0000020', '2021-07-01 00:00:00', 18.00, 500.00, 'No', 'Tarjeta', '0221212458454', '2021-07-01 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(70, 2, 2, 'Boleta', '001', '0000021', '2021-07-04 00:00:00', 18.00, 25.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(71, 2, 1, 'Boleta', '001', '0000022', '2021-07-04 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(72, 2, 1, 'Boleta', '001', '0000023', '2021-03-01 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(73, 2, 1, 'Boleta', '001', '0000024', '2021-07-08 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(74, 2, 1, 'Boleta', '001', '0000025', '2021-07-10 00:00:00', 18.00, 500.00, 'Si', 'Tarjeta', '11212', '2021-07-10 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(75, 2, 1, 'Boleta', '001', '0000026', '2021-07-11 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
	(76, 2, 1, 'Boleta', '001', '0000027', '2021-07-11 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
	(77, 4, 1, 'Boleta', '001', '0000028', '2021-07-12 00:00:00', 18.00, 200.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(78, 2, 1, 'Boleta', '001', '0000029', '2022-03-26 00:00:00', 18.00, 720.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 280, 'Aceptado', NULL),
	(79, 4, 1, 'Boleta', '001', '0000030', '2022-03-27 00:00:00', 18.00, 400.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 500, 100, 'Aceptado', NULL),
	(80, 2, 1, 'Boleta', '001', '0000031', '2022-03-27 00:00:00', 18.00, 400.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 600, 'Aceptado', NULL),
	(81, 4, 1, 'Boleta', '001', '0000032', '2022-03-27 00:00:00', 18.00, 10.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 40, 'Aceptado', NULL),
	(82, 2, 1, 'Boleta', '001', '0000033', '2022-03-27 00:00:00', 18.00, 30.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 20, 'Aceptado', NULL),
	(83, 5, 1, 'Boleta', '001', '0000034', '2022-03-27 00:00:00', 18.00, 40.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 100, 60, 'Aceptado', NULL),
	(84, 4, 1, 'Boleta', '001', '0000035', '2022-03-27 00:00:00', 18.00, 10.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 40, 'Aceptado', NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
