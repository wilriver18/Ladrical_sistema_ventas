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


-- Volcando estructura de base de datos para ladrical
CREATE DATABASE IF NOT EXISTS `ladrical` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ladrical`;

-- Volcando estructura para tabla ladrical.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idcategoria`, `nombre`, `condicion`) VALUES
	(1, 'LADRILLO', 1),
	(2, 'CEMENTO', 1),
	(3, 'ESTUCO', 1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.comp_pago
CREATE TABLE IF NOT EXISTS `comp_pago` (
  `id_comp_pago` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `serie_comprobante` varchar(3) NOT NULL,
  `num_comprobante` varchar(7) NOT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.comp_pago: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `comp_pago` DISABLE KEYS */;
INSERT INTO `comp_pago` (`id_comp_pago`, `nombre`, `serie_comprobante`, `num_comprobante`, `condicion`) VALUES
	(2, 'Boleta', '000', '9999999', 1);
/*!40000 ALTER TABLE `comp_pago` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.datos_negocio
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ladrical.datos_negocio: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_negocio` DISABLE KEYS */;
INSERT INTO `datos_negocio` (`id_negocio`, `nombre`, `ndocumento`, `documento`, `direccion`, `telefono`, `email`, `logo`, `pais`, `ciudad`, `nombre_impuesto`, `monto_impuesto`, `moneda`, `simbolo`, `condicion`) VALUES
	(6, 'LADRICAL', 'NIT', 1010101010, 'POTOSI BOLIVIA', 72144532, 'ladrical@hotmail.com', '', 'BOLIVIA', 'POTOSI', 'IVA', 16.00, 'BOLIVIANOS', 'BS/', 1);
/*!40000 ALTER TABLE `datos_negocio` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.detalle_venta
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.detalle_venta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idproducto`, `cantidad`, `precio_venta`, `descuento`) VALUES
	(1, 1, 33, 1, 6.00, 0.00),
	(2, 1, 32, 1, 4.00, 0.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.movimiento
CREATE TABLE IF NOT EXISTS `movimiento` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo` varchar(25) NOT NULL,
  `vendedor` varchar(255) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idmovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ladrical.movimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.permiso: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
	(1, 'Inicio'),
	(2, 'Almacen'),
	(3, 'Ventas'),
	(4, 'Personal');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.persona
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.persona: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `fecha`) VALUES
	(2, 'Cliente', 'Jose', 'NIT', '12345678944', 'LA PAZ', '', 'jose@ho.com', NULL),
	(3, 'Proveedor', 'Maria', 'NIT', '12345678911', 'CBBA', '', 'maria@gmail.com', NULL),
	(4, 'Cliente', 'Veronica', 'NIT', '75662354', 'TARIJA', '', 'veronica@gmail.com', NULL),
	(5, 'Cliente', 'prueba', 'NIT', '71883852', 'POTOSI', '', 'prueba@hotmail.com', '0000-00-00'),
	(6, 'Cliente', 'Gregorio', 'CEDULA', '4334626', 'Av Heroinas entre oquendo', '46484987', 'alesn@hotmail.com', '1995-06-22');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.personal
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

-- Volcando datos para la tabla ladrical.personal: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` (`idpersonal`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `imagen`, `condicion`) VALUES
	(1, 'Usuario Administrador', 'DNI', '71883851', 'Guadalupe', '952761400', 'Manuel_13_1998@Hotmail.com', 'Administrador', '1570311068.png', 1),
	(2, 'ROEL CHURATA QUISPE', 'DNI', '2542522', 'kkaka', '855558', 'test1@test1.com', 'Vendedor', '1607292444.png', 1),
	(3, 'PRUEBA', 'DNI', '78996532', 'Calle #12', '952761400', 'manuel_13_1998@hotmail.com', 'Administrador', '1625439652.jpg', 1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.producto
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`idproducto`, `idcategoria`, `codigo`, `nombre`, `stock`, `precio`, `fecha`, `descripcion`, `imagen`, `condicion`, `modelo`, `numserie`) VALUES
	(31, 1, '', 'Ladrillo 6 huecos', 632, 3.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243604.jpg', 1, 'Indeca', ''),
	(32, 1, '', '6 hueco mitad', 200, 4.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243432.png', 1, 'Indeca', ''),
	(33, 1, '', 'Gambote', 1000, 6.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243485.jpg', 1, 'Indeca', ''),
	(34, 1, '', 'Ladrillo Visto 16 huecos', 6512, 5.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243576.png', 1, 'Indeca', ''),
	(35, 1, '', 'Ladrillo decorativo', 6552, 2.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243656.jpg', 1, 'Indeca', ''),
	(36, 1, '', 'Ladrillo de estilo rústico', 5656, 3.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648243706.png', 1, 'Indeca', '');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersonal` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_personal1_idx` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`, `idpersonal`, `login`, `clave`, `condicion`) VALUES
	(1, 1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
	(4, 2, 'wilmer', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
	(19, 3, 'prueba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
	(21, 6, 'gregory', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.usuario_permiso
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.usuario_permiso: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
	(8, 1, 1),
	(9, 1, 2),
	(10, 1, 3),
	(11, 1, 4),
	(12, 1, 5),
	(13, 1, 5),
	(14, 1, 6),
	(15, 1, 7);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;

-- Volcando estructura para tabla ladrical.venta
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.venta: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`idventa`, `idcliente`, `idPersonal`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `ventacredito`, `formapago`, `numoperacion`, `fechadeposito`, `descuento`, `totalrecibido`, `vuelto`, `estado`, `DOV_Nombre`) VALUES
	(1, 2, 1, 'Boleta', '001', '0000001', '2022-03-27 00:00:00', 16.00, 10.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 20, 10, 'Aceptado', NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
