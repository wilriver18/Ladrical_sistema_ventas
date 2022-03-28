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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.persona: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `fecha`) VALUES
	(2, 'Cliente', 'Jose', 'CEDULA', '12345678944', 'LA PAZ', '', 'jose@ho.com', NULL),
	(3, 'Proveedor', 'Maria', 'CEDULA', '12345678911', 'CBBA', '', 'maria@gmail.com', NULL),
	(4, 'Cliente', 'Veronica', 'CEDULA', '75662354', 'TARIJA', '', 'veronica@gmail.com', NULL),
	(5, 'Cliente', 'prueba', 'CEDULA', '71883852', 'POTOSI', '', 'prueba@hotmail.com', '0000-00-00'),
	(7, 'Cliente', 'JUAN VELASCO VILLARROEL', 'CEDULA', '123456', 'CALLE RICARDO MUJIA NRO 757  - SOPOCACHI LA PAZ', '72144532', 'juan@hotmail.com', '1987-02-01');
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
	(1, 'Usuario Administrador', 'CEDULA', '71883851', 'Guadalupe', '952761400', 'administrador@Hotmail.com', 'Administrador', '1570311068.png', 1),
	(2, 'WILMER RIVERO NINA', 'CEDULA', '6977297', 'La Paz', '72144532', 'wil_river18@hotmail.com', 'RESP. ALAMCENES', '1648472819.jpg', 1),
	(3, 'PRUEBA', 'CEDULA', '123456789', 'Calle #12', '78996532', 'prueba_venta@hotmail.com', 'Res. Ventas', '1648472849.jpg', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`idproducto`, `idcategoria`, `codigo`, `nombre`, `stock`, `precio`, `fecha`, `descripcion`, `imagen`, `condicion`, `modelo`, `numserie`) VALUES
	(37, 1, '', 'Ladrillo 6 huecos', 9009, 2.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440702.jpg', 1, 'Indeca', ''),
	(38, 1, '', 'Ladrillo de estilo rústico', 545, 5.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440736.png', 1, 'Indeca', ''),
	(39, 1, '', 'Ladrillo decorativo', 5666, 3.00, '0000-00-00', '', '1648440761.jpg', 1, 'Indeca', ''),
	(40, 1, '', 'Ladrillo de estilo rústico', 6554, 4.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440791.jpg', 1, 'Indeca', ''),
	(41, 1, '', 'ladrillo pequeño', 465, 2.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440828.png', 1, 'Indeca', ''),
	(42, 1, '', 'Ladrillo 6 huecos', 5455, 4.00, '0000-00-00', 'Un ladrillo es un material de construcción, normalmente cerámico y con forma ortoédrica, cuyas dimensiones más normales permiten que un operario lo pueda colocar con una sola mano.', '1648440860.jpg', 1, 'Indeca', '');
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
	(4, 2, 'almacen', '58d5287a13c5cde5cba9c6ac99bcba47940d568495dffc9ed3865e375e5c9354', 1),
	(19, 3, 'ventas', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ladrical.usuario_permiso: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
	(8, 1, 1),
	(9, 1, 2),
	(10, 1, 3),
	(11, 1, 4),
	(12, 1, 5),
	(13, 1, 5),
	(14, 1, 6),
	(15, 1, 7),
	(63, 19, 1),
	(64, 19, 3),
	(65, 4, 1),
	(66, 4, 2);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
