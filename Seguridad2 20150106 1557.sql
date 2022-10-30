-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	6.0.3-alpha-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema wgestioncomuna
--

CREATE DATABASE IF NOT EXISTS wgestioncomuna;
USE wgestioncomuna;

--
-- Temporary table structure for view `agrupa_fdetalle`
--
DROP TABLE IF EXISTS `agrupa_fdetalle`;
DROP VIEW IF EXISTS `agrupa_fdetalle`;
CREATE TABLE `agrupa_fdetalle` (
  `ÚltimoDeFecha` date,
  `Remito` int(10),
  `SumaDeTotaliva` double(20,3),
  `SumaDepago` double(20,3),
  `SumaDeresta` double(20,3),
  `Diferencia` double(20,3)
);

--
-- Temporary table structure for view `articulos_ganancia`
--
DROP TABLE IF EXISTS `articulos_ganancia`;
DROP VIEW IF EXISTS `articulos_ganancia`;
CREATE TABLE `articulos_ganancia` (
  `NomEmp` varchar(255),
  `CodEmp` varchar(50),
  `Descrip` varchar(255),
  `CodArt` varchar(50),
  `Porcentaje` double(15,5),
  `CodCli` varchar(50),
  `NomCli` varchar(255),
  `CodRub` varchar(3)
);

--
-- Temporary table structure for view `articulos_rubros`
--
DROP TABLE IF EXISTS `articulos_rubros`;
DROP VIEW IF EXISTS `articulos_rubros`;
CREATE TABLE `articulos_rubros` (
  `Codigo` varchar(50),
  `Descrip` varchar(255),
  `Stock` double(15,3),
  `Pcosto` double(15,3),
  `Ganancia` double(15,2),
  `Pventa1` double(15,3),
  `Faltante` double(15,3),
  `Proveedor` varchar(50),
  `Pventa2` double(15,3),
  `Pventa3` double(15,3),
  `Pventa4` double(15,3),
  `Pventa5` double(15,3),
  `Pventa6` double(15,3),
  `Rubro` varchar(15),
  `Envase` varchar(1)
);

--
-- Temporary table structure for view `articulosclientesespeciales`
--
DROP TABLE IF EXISTS `articulosclientesespeciales`;
DROP VIEW IF EXISTS `articulosclientesespeciales`;
CREATE TABLE `articulosclientesespeciales` (
  `idArticulosClientes` int(10),
  `CodigoCliente` varchar(50),
  `Nombre` varchar(255),
  `CodigoArticulo` varchar(50),
  `Descrip` varchar(255),
  `Precio` double(15,5),
  `idTipoCondicion` varchar(3),
  `Descripcion` varchar(50),
  `ConsumoMinimo` int(10) unsigned
);

--
-- Temporary table structure for view `asignacion`
--
DROP TABLE IF EXISTS `asignacion`;
DROP VIEW IF EXISTS `asignacion`;
CREATE TABLE `asignacion` (
  `CodCLi` varchar(50),
  `FacturaRemito` int(10),
  `Codigo` varchar(30),
  `Cantidad` double(15,3),
  `Descript` varchar(255),
  `Precio` double(15,3),
  `Totaliva` double(15,3),
  `Pagado` varchar(50),
  `pago` double(15,3),
  `Fecha` date,
  `idFDetalle` int(10),
  `resta` double(15,3),
  `Ganancia_Vendedor` double(15,3),
  `Total` double(15,3),
  `pespecial` tinyint(1),
  `porcentaje` double(15,3),
  `Remito` int(10)
);

--
-- Temporary table structure for view `bidones`
--
DROP TABLE IF EXISTS `bidones`;
DROP VIEW IF EXISTS `bidones`;
CREATE TABLE `bidones` (
  `Fecha` date,
  `Cod_Cli` varchar(50),
  `Nombre` varchar(255),
  `Cod_art` varchar(30),
  `Detalle_art` varchar(255),
  `Cantidad` double(20,3)
);

--
-- Temporary table structure for view `carga_camion_art`
--
DROP TABLE IF EXISTS `carga_camion_art`;
DROP VIEW IF EXISTS `carga_camion_art`;
CREATE TABLE `carga_camion_art` (
  `Fecha` date,
  `Repartidor` varchar(50),
  `Codigo` varchar(50),
  `Articulo` varchar(50),
  `cantidad` double(15,5),
  `Rubro` varchar(15),
  `Comentario` varchar(50),
  `recarga` int(10),
  `total` double(22,5),
  `Sobrante` decimal(32,0),
  `Pventa1` double(15,3)
);

--
-- Temporary table structure for view `chequesmantenimiento`
--
DROP TABLE IF EXISTS `chequesmantenimiento`;
DROP VIEW IF EXISTS `chequesmantenimiento`;

--
-- Temporary table structure for view `chequesxdia`
--
DROP TABLE IF EXISTS `chequesxdia`;
DROP VIEW IF EXISTS `chequesxdia`;
CREATE TABLE `chequesxdia` (
  `Fecha` date,
  `SumaDeMonto` double(20,3)
);

--
-- Temporary table structure for view `clientes_repartos`
--
DROP TABLE IF EXISTS `clientes_repartos`;
DROP VIEW IF EXISTS `clientes_repartos`;
CREATE TABLE `clientes_repartos` (
  `Codigo` varchar(50),
  `Nombre` varchar(255),
  `Localidad` varchar(150),
  `nreparto` varchar(3),
  `descrip` varchar(50)
);

--
-- Temporary table structure for view `conceptosctas`
--
DROP TABLE IF EXISTS `conceptosctas`;
DROP VIEW IF EXISTS `conceptosctas`;
CREATE TABLE `conceptosctas` (
  `idconceptos` int(11),
  `ref` char(50),
  `descripcion` char(220),
  `idbancos` char(50),
  `idcuentas` int(11),
  `comentarios` char(225),
  `credito` tinyint(1),
  `debito` tinyint(1),
  `debe` tinyint(1),
  `haber` tinyint(1),
  `idcuentas2` int(11),
  `idcuentas01` int(10),
  `codigocuenta` varchar(50),
  `cuenta` varchar(255),
  `codigocuenta2` varchar(50),
  `cuenta2` varchar(255)
);

--
-- Temporary table structure for view `control_envases_articulo`
--
DROP TABLE IF EXISTS `control_envases_articulo`;
DROP VIEW IF EXISTS `control_envases_articulo`;
CREATE TABLE `control_envases_articulo` (
  `ÚltimoDeFecha` datetime,
  `Cod_Articulo` varchar(50),
  `ÚltimoDeArticulo` varchar(50),
  `SumaDeFaltante` decimal(32,0),
  `SumaDeSobrante` double,
  `Mora` double
);

--
-- Temporary table structure for view `control_envases_repartidor`
--
DROP TABLE IF EXISTS `control_envases_repartidor`;
DROP VIEW IF EXISTS `control_envases_repartidor`;
CREATE TABLE `control_envases_repartidor` (
  `ÚltimoDeFecha` datetime,
  `Cod_Repartidor` varchar(50),
  `ÚltimoDeRepartidor` varchar(50),
  `Cod_Articulo` varchar(50),
  `ÚltimoDeArticulo` varchar(50),
  `SumaDeFaltante` decimal(32,0),
  `SumaDeSobrante` double,
  `Mora` double
);

--
-- Temporary table structure for view `ctacte_agrupados`
--
DROP TABLE IF EXISTS `ctacte_agrupados`;
DROP VIEW IF EXISTS `ctacte_agrupados`;
CREATE TABLE `ctacte_agrupados` (
  `Id` int(10),
  `Fecha` datetime,
  `Codigo` varchar(50),
  `Nombre` varchar(50),
  `Debito` double(15,5),
  `Credito` double(15,5),
  `Saldo` double(15,5),
  `Comentario` varchar(50),
  `FechaCredito` datetime,
  `Importe` double(15,5),
  `Acreditado` varchar(1),
  `Ncredito` int(10),
  `Remito` int(10),
  `Ncheque` varchar(50),
  `fechainput` datetime,
  `anomes` int(10),
  `id_credito` int(10),
  `Noimputar` tinyint(1),
  `Nrecibo` int(10),
  `ctacte_padre` int(10)
);

--
-- Temporary table structure for view `ctacte_debito`
--
DROP TABLE IF EXISTS `ctacte_debito`;
DROP VIEW IF EXISTS `ctacte_debito`;
CREATE TABLE `ctacte_debito` (
  `ÚltimoDeFecha` date,
  `Remito` int(10),
  `SumaDeDebito` double(20,3)
);

--
-- Temporary table structure for view `ctacte_false`
--
DROP TABLE IF EXISTS `ctacte_false`;
DROP VIEW IF EXISTS `ctacte_false`;
CREATE TABLE `ctacte_false` (
  `Codigo` varchar(50),
  `SumaDeCredito` double(20,3),
  `ÚltimoDeanomes` int(10)
);

--
-- Temporary table structure for view `ctacte_rango`
--
DROP TABLE IF EXISTS `ctacte_rango`;
DROP VIEW IF EXISTS `ctacte_rango`;
CREATE TABLE `ctacte_rango` (
  `ÚltimoDeFecha` date,
  `Codigo` varchar(50),
  `Nombre` varchar(255),
  `SumaDeDebito` double(20,3),
  `SumaDeCredito` double(20,3),
  `Expr1` double(20,3),
  `codigo_num` int(10),
  `reparto` varchar(3)
);

--
-- Temporary table structure for view `ctactesaldos`
--
DROP TABLE IF EXISTS `ctactesaldos`;
DROP VIEW IF EXISTS `ctactesaldos`;
CREATE TABLE `ctactesaldos` (
  `Codigo` varchar(50),
  `d` double(20,3),
  `c` double(20,3),
  `Expr1` double(20,3)
);

--
-- Temporary table structure for view `devol`
--
DROP TABLE IF EXISTS `devol`;
DROP VIEW IF EXISTS `devol`;
CREATE TABLE `devol` (
  `DetalleCodigo` varchar(30),
  `SumaDeCantidad` double(20,3),
  `SumaDeImpuesto1` double(20,3),
  `Detalle` varchar(255),
  `Codigo` varchar(50),
  `ÚltimoDeFecha` date,
  `ÚltimoDeNombre` varchar(255),
  `Mora` double(20,3),
  `SumaDeenvases` decimal(32,0),
  `ÚltimoDerepartidor` varchar(3),
  `ÚltimoDeEnvase` int(10),
  `MoraEmpleado` double(20,3),
  `Envase` varchar(1)
);

--
-- Temporary table structure for view `devol2`
--
DROP TABLE IF EXISTS `devol2`;
DROP VIEW IF EXISTS `devol2`;
CREATE TABLE `devol2` (
  `CodDet` varchar(30),
  `SumaDeCantidad` double(20,3),
  `SumaDeImpuesto1` double(20,3),
  `Detalle` varchar(255),
  `Codigo` varchar(50),
  `ÚltimoDeFecha` date,
  `ÚltimoDeNombre` varchar(255),
  `Mora` double(20,3)
);

--
-- Temporary table structure for view `devol3`
--
DROP TABLE IF EXISTS `devol3`;
DROP VIEW IF EXISTS `devol3`;
CREATE TABLE `devol3` (
  `CodDet` varchar(30),
  `SumaDeCantidad` double(20,3),
  `SumaDeImpuesto1` double(20,3),
  `Detalle` varchar(255),
  `Codigo` varchar(50),
  `ÚltimoDeFecha` date,
  `ÚltimoDeNombre` varchar(255),
  `Mora` double(20,3),
  `SumaDeCredito` double(19,2),
  `ÚltimoDerepartidor` varchar(3),
  `Envase` varchar(1)
);

--
-- Temporary table structure for view `devol4`
--
DROP TABLE IF EXISTS `devol4`;
DROP VIEW IF EXISTS `devol4`;
CREATE TABLE `devol4` (
  `CodDet` varchar(30),
  `SumaDeCantidad` double(20,3),
  `SumaDeImpuesto1` double(20,3),
  `Detalle` varchar(255),
  `Codigo` varchar(50),
  `ÚltimoDeFecha` date,
  `ÚltimoDeNombre` varchar(255),
  `Mora` double(20,3),
  `SumaDeenvases` decimal(32,0),
  `ÚltimoDerepartidor` varchar(3),
  `Envase` varchar(1)
);

--
-- Temporary table structure for view `devol_articulo`
--
DROP TABLE IF EXISTS `devol_articulo`;
DROP VIEW IF EXISTS `devol_articulo`;
CREATE TABLE `devol_articulo` (
  `ÚltimoDeCodigo1` varchar(30),
  `SumaDeCantidad` double(20,3),
  `SumaDeImpuesto1` double(20,3),
  `Detalle` varchar(255),
  `ÚltimoDeCodigo` varchar(50),
  `ÚltimoDeFecha` date,
  `ÚltimoDeNombre` varchar(255),
  `Mora` double(20,3),
  `SumaDeenvases` decimal(32,0),
  `repartidor` varchar(3),
  `ÚltimoDeEnvase` int(10),
  `MoraEmpleado` double(20,3),
  `Envase` varchar(1)
);

--
-- Temporary table structure for view `vistaarticulos`
--
DROP TABLE IF EXISTS `vistaarticulos`;
DROP VIEW IF EXISTS `vistaarticulos`;
CREATE TABLE `vistaarticulos` (
  `idArticulos` int(10),
  `Codigo` varchar(50),
  `CodigoNum` int(10),
  `CodigoBarra` varchar(50),
  `Descrip` varchar(255),
  `idSubRubros` varchar(3),
  `SubRubro` varchar(255),
  `idRubros` varchar(3),
  `Rubro` varchar(255),
  `idPorcentajeIva` int(10) unsigned,
  `Porcentaje` double,
  `CProveedor` int(10),
  `Proveedor` varchar(255),
  `idFabricantes` varchar(3),
  `Fabricante` varchar(255),
  `PCosto` double(15,3),
  `PVenta1` double(15,3),
  `PVenta2` double(15,3),
  `PVenta3` double(15,3),
  `PVenta4` double(15,3),
  `PVenta5` double(15,3),
  `PVenta6` double(15,3),
  `PVentaConIva` double,
  `Ganancia` double(15,2),
  `Fecha_Alta` date,
  `Fecha_Modificacion` date,
  `Peso_u` double(15,2),
  `Peso_t` double(15,2),
  `Stock` double(15,3),
  `Valorizacion` double(20,3),
  `StockMin` double(15,3),
  `StockMax` double(15,3),
  `Faltante` double(15,3),
  `Dimensiones` varchar(50),
  `MensajeEmergente` varchar(50),
  `Observaciones` longtext,
  `Envase` varchar(1),
  `Ganancia_Vendedor` double(15,3)
);

--
-- Temporary table structure for view `vistaarticulos2`
--
DROP TABLE IF EXISTS `vistaarticulos2`;
DROP VIEW IF EXISTS `vistaarticulos2`;
CREATE TABLE `vistaarticulos2` (
  `idArticulos` int(10),
  `Codigo` varchar(50),
  `CodigoNum` int(10),
  `CodigoBarra` varchar(50),
  `Descrip` varchar(255),
  `idSubRubros` varchar(3),
  `SubRubro` varchar(255),
  `idRubros` varchar(3),
  `Rubro` varchar(255),
  `idPorcentajeIva` int(10) unsigned,
  `Porcentaje` double,
  `CProveedor` int(10),
  `Proveedor` varchar(255),
  `idFabricantes` varchar(3),
  `Fabricante` varchar(255),
  `PCosto` double(15,3),
  `PVenta1` double(15,3),
  `PVenta2` double(15,3),
  `PVenta3` double(15,3),
  `PVenta4` double(15,3),
  `PVenta5` double(15,3),
  `PVenta6` double(15,3),
  `PVentaConIva` double,
  `Ganancia` double(15,2),
  `Fecha_Alta` date,
  `Fecha_Modificacion` date,
  `Peso_u` double(15,2),
  `Peso_t` double(15,2),
  `Stock` double(15,3),
  `StockMin` double(15,3),
  `StockMax` double(15,3),
  `Faltante` double(15,3),
  `Dimensiones` varchar(50),
  `MensajeEmergente` varchar(50),
  `Observaciones` longtext,
  `Envase` varchar(1),
  `Ganancia_Vendedor` double(15,3)
);

--
-- Temporary table structure for view `vistaarticulos3`
--
DROP TABLE IF EXISTS `vistaarticulos3`;
DROP VIEW IF EXISTS `vistaarticulos3`;
CREATE TABLE `vistaarticulos3` (
  `idArticulos` int(10),
  `Codigo` varchar(50),
  `CodigoNum` int(10),
  `CodigoBarra` varchar(50),
  `Descrip` varchar(255),
  `idSubRubros` varchar(3),
  `SubRubro` varchar(255),
  `idRubros` varchar(3),
  `Rubro` varchar(255),
  `idPorcentajeIva` int(10) unsigned,
  `Porcentaje` double,
  `CProveedor` int(10),
  `Proveedor` varchar(255),
  `idFabricantes` varchar(3),
  `Fabricante` varchar(255),
  `PCosto` double(15,3),
  `PVenta1` double(15,3),
  `PVenta2` double(15,3),
  `PVenta3` double(15,3),
  `PVenta4` double(15,3),
  `PVenta5` double(15,3),
  `PVenta6` double(15,3),
  `PVentaConIva` double,
  `Ganancia` double(15,2),
  `Fecha_Alta` date,
  `Fecha_Modificacion` date,
  `Peso_u` double(15,2),
  `Peso_t` double(15,2),
  `Stock` double(15,3),
  `StockMin` double(15,3),
  `StockMax` double(15,3),
  `Faltante` double(15,3),
  `Dimensiones` varchar(50),
  `MensajeEmergente` varchar(50),
  `Observaciones` longtext,
  `Envase` varchar(1),
  `Ganancia_Vendedor` double(15,3)
);

--
-- Temporary table structure for view `vistaarticulos4`
--
DROP TABLE IF EXISTS `vistaarticulos4`;
DROP VIEW IF EXISTS `vistaarticulos4`;
CREATE TABLE `vistaarticulos4` (
  `idArticulos` int(10),
  `Codigo` varchar(50),
  `CodigoNum` int(10),
  `CodigoBarra` varchar(50),
  `Descrip` varchar(255),
  `idSubRubros` varchar(3),
  `SubRubro` varchar(255),
  `idRubros` varchar(3),
  `Rubro` varchar(255),
  `idPorcentajeIva` int(10) unsigned,
  `Porcentaje` double,
  `CProveedor` int(10),
  `Proveedor` varchar(255),
  `idFabricantes` varchar(3),
  `Fabricante` varchar(255),
  `PCosto` double(15,3),
  `PVenta1` double(15,3),
  `PVenta2` double(15,3),
  `PVenta3` double(15,3),
  `PVenta4` double(15,3),
  `PVenta5` double(15,3),
  `PVenta6` double(15,3),
  `PVentaConIva` double,
  `Ganancia` double(15,2),
  `Fecha_Alta` date,
  `Fecha_Modificacion` date,
  `Peso_u` double(15,2),
  `Peso_t` double(15,2),
  `Stock` double(15,3),
  `Valorizacion` double(20,3),
  `StockMin` double(15,3),
  `StockMax` double(15,3),
  `Faltante` double(15,3),
  `Dimensiones` varchar(50),
  `MensajeEmergente` varchar(50),
  `Observaciones` longtext,
  `Envase` varchar(1),
  `Ganancia_Vendedor` double(15,3)
);

--
-- Definition of table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
CREATE TABLE `actividades` (
  `idActividades` varchar(3) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idActividades`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actividades`
--

/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;


--
-- Definition of table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Fecha_pe` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Tarea` longtext,
  `Notas` longtext,
  `Periodo` varchar(50) DEFAULT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `codigo_cli` varchar(50) DEFAULT NULL,
  `codigo_ctacte` varchar(50) DEFAULT NULL,
  `codigo_caja` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `usuario_nota` varchar(50) DEFAULT NULL,
  `Leida` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;


--
-- Definition of table `art_cli_envases`
--

DROP TABLE IF EXISTS `art_cli_envases`;
CREATE TABLE `art_cli_envases` (
  `articulo` varchar(50) DEFAULT NULL,
  `cliente` varchar(50) DEFAULT NULL,
  `envases` int(10) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `art_cli_envases`
--

/*!40000 ALTER TABLE `art_cli_envases` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_cli_envases` ENABLE KEYS */;


--
-- Definition of table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `idArticulos` int(10) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) DEFAULT NULL,
  `CodigoNum` int(10) DEFAULT NULL,
  `CodigoBarra` varchar(50) DEFAULT NULL,
  `Descrip` varchar(255) DEFAULT NULL,
  `idRubros` varchar(15) DEFAULT NULL,
  `idSubRubros` varchar(15) DEFAULT NULL,
  `Foto` longblob,
  `idPorcentajeIva` varchar(3) DEFAULT NULL,
  `idProveedor` varchar(50) DEFAULT NULL,
  `idFabricantes` varchar(3) DEFAULT NULL,
  `Pcosto` double(15,3) DEFAULT NULL,
  `Pventa1` double(15,3) DEFAULT NULL,
  `Pventa2` double(15,3) DEFAULT NULL,
  `Pventa3` double(15,3) DEFAULT NULL,
  `Pventa4` double(15,3) DEFAULT NULL,
  `Pventa5` double(15,3) DEFAULT NULL,
  `Pventa6` double(15,3) DEFAULT NULL,
  `Ganancia` double(15,2) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `Peso_u` double(15,2) DEFAULT '0.00',
  `Peso_t` double(15,2) DEFAULT '0.00',
  `Stock` double(15,3) DEFAULT NULL,
  `StockMin` double(15,3) DEFAULT NULL,
  `StockMax` double(15,3) DEFAULT NULL,
  `Faltante` double(15,3) DEFAULT NULL,
  `Dimensiones` varchar(50) DEFAULT NULL,
  `MensajeEmergente` varchar(50) DEFAULT NULL,
  `Observaciones` longtext,
  `Envase` varchar(1) DEFAULT NULL,
  `Ganancia_Vendedor` double(15,3) DEFAULT NULL,
  `UnidadesPorBulto` int(10) unsigned DEFAULT NULL,
  `Porcentaje` double(15,3) DEFAULT NULL,
  `idMoneda` varchar(3) DEFAULT NULL,
  `idDepositos` varchar(3) DEFAULT NULL,
  `CodigoConcepto` int(10) unsigned DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idArticulos`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5611 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`idArticulos`,`Codigo`,`CodigoNum`,`CodigoBarra`,`Descrip`,`idRubros`,`idSubRubros`,`Foto`,`idPorcentajeIva`,`idProveedor`,`idFabricantes`,`Pcosto`,`Pventa1`,`Pventa2`,`Pventa3`,`Pventa4`,`Pventa5`,`Pventa6`,`Ganancia`,`FechaAlta`,`FechaModificacion`,`Peso_u`,`Peso_t`,`Stock`,`StockMin`,`StockMax`,`Faltante`,`Dimensiones`,`MensajeEmergente`,`Observaciones`,`Envase`,`Ganancia_Vendedor`,`UnidadesPorBulto`,`Porcentaje`,`idMoneda`,`idDepositos`,`CodigoConcepto`,`TimeStamp`) VALUES 
 (777,'00007',7,NULL,'TUBO FLUORECENTE 110W  ORM0179','005','087',NULL,'2','','',25.000,33.750,37.500,31.250,33.750,25.575,NULL,NULL,'2010-11-20','2013-04-04',0.00,0.00,2.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-10-08 00:28:02'),
 (15,'00801',801,NULL,'TEJIDO 1/2 SOMRA NEGRO 80% 4,20M','001','009',NULL,'2','','',12.500,16.880,18.750,15.630,16.880,14.725,NULL,NULL,'2010-11-03','2012-11-15',0.00,0.00,2.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-10-08 00:28:02'),
 (830,'60415',60415,NULL,'ENGRAMPADORA USO INT/CAB INT','001','096',NULL,'2','','',69.300,93.560,103.950,86.630,93.560,61.690,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:09:12'),
 (294,'10233',10233,NULL,'TORN G2 EXA/ 5/16X 1','003','003',NULL,'2','','',0.210,0.283,0.315,0.325,0.325,0.325,NULL,NULL,'2010-11-11','2010-11-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (8,'00212',212,NULL,'MEMBRANA ETIQ/ROJA ','001','007',NULL,'2','','',158.510,213.990,237.770,198.140,213.990,177.630,NULL,NULL,'2010-11-02','2013-03-06',0.00,0.00,1.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-06 16:59:52'),
 (107,'17857',17857,NULL,'ARANDELAS PLANAS 7/16/1/2 X KG','003','038',NULL,'2','','',20.250,27.340,30.380,25.310,27.340,17.050,NULL,NULL,'2010-11-08','2012-04-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-04-01 18:59:31'),
 (16,'00242',242,NULL,'GUANTE MOTEADO','001','010',NULL,'2','','',4.400,5.940,6.600,5.500,5.940,5.657,NULL,NULL,'2010-11-03','2013-02-17',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-17 19:18:03'),
 (17,'00265',265,NULL,'GUANTE MOTEADO GRIS','001','010',NULL,'2','','',4.400,5.940,6.600,5.500,5.940,5.890,NULL,NULL,'2010-11-03','2012-07-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-06 15:33:45'),
 (18,'00213',213,NULL,'MEMBRANA ADHESIVA 10 CM','001','007',NULL,'2','','',4.300,5.810,6.450,5.380,5.810,5.270,NULL,NULL,'2010-11-04','2013-03-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-01 17:28:59'),
 (13,'07327',7327,NULL,'MASILLA SR-60 1K','002','008',NULL,'2','','',29.750,40.160,44.630,37.190,40.160,34.100,NULL,NULL,'2010-11-03','2013-01-22',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-22 20:18:32'),
 (19,'00214',214,NULL,'MEMBRANA ADHESIVA 15 CM','001','007',NULL,'2','','',7.000,9.450,10.500,8.750,9.450,7.130,NULL,NULL,'2010-11-04','2013-03-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-01 17:29:32'),
 (20,'00216',216,NULL,'MEMBRANA ADHESIVA 25CM','001','007',NULL,'2','','',11.000,14.850,16.500,13.750,14.850,11.873,NULL,NULL,'2010-11-04','2013-03-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-14 19:52:47'),
 (21,'00217',217,NULL,'MEMBRANA ADHESIVA 30CM','001','007',NULL,'2','','',14.000,18.900,21.000,17.500,18.900,14.260,NULL,NULL,'2010-11-04','2012-11-10',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-10 18:46:32'),
 (27,'04204',4204,NULL,'LAMPARAS CLARA 75','005','011',NULL,'2','','',1.260,1.701,1.890,1.953,1.953,1.953,NULL,NULL,'2010-11-04','2010-11-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (56,'8184',8184,NULL,'PORTALAMPARA GOLIAT PORCELANA','005','014',NULL,'2','','',18.400,24.840,27.600,23.000,24.840,15.376,NULL,NULL,'2010-11-06','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 09:58:40'),
 (47,'CAT0001',0,NULL,'CAJA MEDIDOR MONOF','005','015',NULL,'2','','',57.700,77.900,86.550,72.130,77.900,72.850,NULL,NULL,'2010-11-06','2012-06-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-13 15:50:30'),
 (73,'GEL0061',0,NULL,'LAMPARA PERFUME G.E','005','021',NULL,'2','','',109.000,147.150,163.500,136.250,147.150,126.713,NULL,NULL,'2010-11-06','2012-05-15',0.00,0.00,8.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-08-05 11:32:25'),
 (28,'04302',4302,NULL,'LAMPARA ANTIINSECTO 60','005','012',NULL,'2','','',2.690,3.631,4.035,4.170,4.170,4.170,NULL,NULL,'2010-11-04','2010-11-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (29,'32580',32580,NULL,'BARNIZ AEROSOL 440 CC','002','013',NULL,'2','','',9.220,12.447,13.830,14.291,14.291,14.291,NULL,NULL,'2010-11-04','2010-11-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (69,'RID0064',0,NULL,'CURVA BAKELITA 1','005','019',NULL,'2','','',3.800,5.130,5.700,4.750,5.130,3.410,NULL,NULL,'2010-11-06','2013-03-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-25 12:06:26'),
 (72,'SYL0060',0,NULL,'LAMP/B.CONS 65W SILVANIA','005','018',NULL,'2','','',47.350,63.922,71.025,73.392,73.392,73.392,NULL,NULL,'2010-11-06','2010-11-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (71,'KAL0066',0,NULL,'SOPORTE C/TOMA C/N KALOP','005','020',NULL,'2','','',5.000,6.750,7.500,6.250,6.750,6.433,NULL,NULL,'2010-11-06','2013-01-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-16 19:18:06'),
 (46,'ROS0008',0,NULL,'PORTALAMPARA AIREADO','005','014',NULL,'2','','',6.650,8.980,9.980,8.310,8.980,7.657,NULL,NULL,'2010-11-06','2013-01-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-01 21:14:23'),
 (57,'9026',9026,NULL,'CINTA V/TAPE 10M','005','016',NULL,'2','','',0.000,0.000,0.000,0.000,0.000,0.000,NULL,NULL,'2010-11-06','2013-03-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-02-19 02:48:22'),
 (5597,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1.000,1.000,1.000,1.000,1.000,1.000,NULL,NULL,NULL,NULL,0.00,0.00,1300.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-06 05:12:20'),
 (58,'9027',9027,NULL,'CINTA V/TAPE 20M','005','016',NULL,'2','','',8.600,11.610,12.900,10.750,11.610,9.502,NULL,NULL,'2010-11-06','2013-03-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-12 18:56:43'),
 (3447,'02868',2868,NULL,'LAMPARA GOTA ECO 28/42W','005','136',NULL,'2','','',6.000,8.100,9.000,7.500,8.100,7.595,NULL,NULL,'2011-11-15','2013-03-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-13 09:04:26'),
 (67,'ALI0025',0,NULL,'LAMPARA B.CONSUMO ESPIRAL 32W','005','018',NULL,'2','','',27.800,37.530,41.700,34.750,37.530,39.044,NULL,NULL,'2010-11-06','2012-04-29',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-04-29 17:50:25'),
 (68,'ALI0026',0,NULL,'LAMPARA B.CON/ESPIRAL 45W','005','018',NULL,'2','','',56.160,75.820,84.240,70.200,75.820,57.350,NULL,NULL,'2010-11-06','2012-05-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-05-14 18:29:21'),
 (75,'MUS0027',0,NULL,'CAPACITOR 6M/400','005','022',NULL,'2','','',4.500,6.075,6.750,6.975,6.975,6.975,NULL,NULL,'2010-11-06','2010-11-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (76,'MUS0028',0,NULL,'CAPACITOR 8MF/400','005','022',NULL,'2','','',5.000,6.750,7.500,7.750,7.750,7.750,NULL,NULL,'2010-11-06','2010-11-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (77,'ORM0029',0,NULL,'LAMPARAS SILICA 100W','005','023',NULL,'2','','',1.800,2.430,2.700,2.790,2.790,2.790,NULL,NULL,'2010-11-06','2010-11-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (78,'CAP0026',0,NULL,'ZAPATILLA MULTIPLE C/3M CABLE','005','024',NULL,'2','','',12.000,16.200,18.000,15.000,16.200,11.873,NULL,NULL,'2010-11-06','2012-12-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-15 18:13:07'),
 (79,'CAP0027',0,NULL,'ZAPATILLA MULTIPLE C/5 M CABLE','005','024',NULL,'2','','',15.300,20.660,22.950,19.130,20.660,15.500,NULL,NULL,'2010-11-06','2012-12-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-15 18:15:26'),
 (80,'CAP0028',0,NULL,'ZAPATILLA MULTIPLE C/10M CABLE','005','024',NULL,'2','','',16.000,21.600,24.000,24.800,24.800,24.800,NULL,NULL,'2010-11-06','2010-11-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-10-21 09:01:48'),
 (81,'JEL0320',0,NULL,'TAPA UNIVERSAL 20500','005','025',NULL,'2','','',1.710,2.310,2.570,2.140,2.310,2.201,NULL,NULL,'2010-11-06','2013-03-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-25 16:57:54'),
 (82,'JEL0020',0,NULL,'MODULO TOMA VERONA BCO 20067','005','025',NULL,'2','','',3.280,4.430,4.920,4.100,4.430,4.231,NULL,NULL,'2010-11-06','2013-02-22',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-22 19:38:04'),
 (83,'JEL0005',0,NULL,'LLAVE VERONA BCO 20051-0-10A','005','025',NULL,'2','','',3.560,4.810,5.340,4.450,4.810,4.014,NULL,NULL,'2010-11-06','2013-01-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-03 21:28:07'),
 (84,'JEL0432',0,NULL,'TAPA BASTIDOR 5X10 BCO 25098/2','005','025',NULL,'2','','',1.880,2.540,2.820,2.350,2.540,2.418,NULL,NULL,'2010-11-06','2013-02-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-16 10:18:48'),
 (85,'ROS0016',0,NULL,'RECEP /RECTO S/JUSTO ART 586','005','014',NULL,'2','','',11.900,16.070,17.850,14.880,16.070,13.175,NULL,NULL,'2010-11-06','2012-06-07',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-07 10:00:38'),
 (86,'7029',7029,NULL,'TONALBA 30C','001','026',NULL,'2','','',3.050,4.120,4.580,3.810,4.120,3.875,NULL,NULL,'2010-11-07','2012-12-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-21 09:41:52'),
 (87,'07030',7030,NULL,'TONALBA 120 C','001','026',NULL,'2','','',9.500,12.830,14.250,11.880,12.830,14.338,NULL,NULL,'2010-11-07','2013-01-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-15 09:01:27'),
 (88,'07031',7031,NULL,'PINCEL EL GALGO101/20','002','027',NULL,'2','','',6.500,9.685,9.685,7.529,7.529,7.529,NULL,NULL,'2010-11-07','2010-11-07',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-21 20:43:02'),
 (89,'304',304,NULL,'AGUARRAS SUELTO','001','028',NULL,'2','','',9.300,12.560,13.950,11.630,12.560,11.238,NULL,NULL,'2010-11-07','2013-05-07',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-07 08:52:13'),
 (90,'00305',305,NULL,'THINNER SUELTO 500','002','028',NULL,'2','','',10.000,13.500,15.000,12.500,13.500,12.400,NULL,NULL,'2010-11-07','2013-05-07',0.00,0.00,1.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-07 08:52:55'),
 (395,'EUR0017',0,NULL,'LINTERNA REC/WERKE 12L','005','080',NULL,'2','','',35.880,48.438,53.820,55.614,55.614,55.614,NULL,NULL,'2010-11-14','2010-11-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (93,'30850',30850,NULL,'PENETRI TRAD/303 440C','001','029',NULL,'2','','',47.000,63.450,70.500,58.750,63.450,55.645,NULL,NULL,'2010-11-08','2013-05-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-09 16:23:51'),
 (94,'32630',32630,NULL,'TERMIXAN BLOQUE KG','001','030',NULL,'2','','',84.000,113.400,126.000,105.000,113.400,85.250,NULL,NULL,'2010-11-08','2013-04-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-25 11:26:51'),
 (293,'10231',10231,NULL,'TORN G2 EXAG 5/16 X 3/4','003','003',NULL,'2','','',0.220,0.297,0.330,0.341,0.341,0.341,NULL,NULL,'2010-11-11','2010-11-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (97,'90000',90000,NULL,'TEFLON ALTA DENSIDAD 3/4 X 40','004','031',NULL,'2','','',9.490,12.812,14.235,14.710,14.710,14.710,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (99,'35206',35206,NULL,'MAZA FRANCESA 1K','001','032',NULL,'2','','',27.740,37.449,41.610,42.997,42.997,42.997,NULL,NULL,'2010-11-08','2011-08-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (100,'35207',35207,NULL,'SIERRA ACERO RAPIDO','001','033',NULL,'2','','',5.860,7.910,8.790,7.330,7.910,6.510,NULL,NULL,'2010-11-08','2013-05-03',0.00,0.00,7.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-03 17:57:57'),
 (1724,'81120',81120,NULL,'DESTAPA CAÑERIA 1/2 PENETRI','001','029',NULL,'2','','',11.100,14.990,16.650,13.880,14.990,12.787,NULL,NULL,'2011-03-11','2012-10-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-19 18:31:54'),
 (102,'35209',35209,NULL,'MANGUERA  CRISTAL 6X9','001','034',NULL,'2','','',0.700,0.945,1.050,1.085,1.085,1.085,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (103,'35210',35210,NULL,'LIJA RUBY','002','035',NULL,'2','','',1.150,1.552,1.725,1.782,1.782,1.782,NULL,NULL,'2010-11-08','2011-07-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (105,'87042',87042,NULL,'VERDE INGLES 4L RIOPINT','002','036',NULL,'2','','',69.790,94.216,104.685,108.174,108.174,108.174,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (106,'17578',17578,NULL,'TUERCAS W 7/16','003','037',NULL,'2','','',0.430,0.580,0.650,0.540,0.580,0.232,NULL,NULL,'2010-11-08','2013-03-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-24 10:16:35'),
 (108,'17827',17827,NULL,'VARILLA ROSCADA 7/16 X M','003','039',NULL,'2','','',5.640,7.614,8.460,8.742,8.742,8.742,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (1592,'07859.30',7859,NULL,'SILLA FIESTA BCA.REII. VOSS2000','007','154',NULL,'2','','',75.480,101.900,113.220,94.350,101.900,86.490,NULL,NULL,'2011-03-01','2013-03-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-05 19:25:39'),
 (126,'08914',8914,NULL,'GRAMPAS COAXIL  N 6 N','005','049',NULL,'2','','',0.100,0.135,0.150,0.155,0.155,0.155,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (111,'17577',17577,NULL,'TUERCAS 3/8 W','003','037',NULL,'2','','',0.280,0.380,0.420,0.350,0.380,0.139,NULL,NULL,'2010-11-08','2013-03-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-24 10:16:01'),
 (112,'31014',31014,NULL,'CABO P/ HACHA VISCAÑA','001','063',NULL,'2','','',18.000,24.300,27.000,22.500,24.300,18.600,NULL,NULL,'2010-11-08','2012-08-17',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-08-17 19:45:09'),
 (113,'60803',60803,NULL,'MECHA PPOSTE  7/16','001','042',NULL,'2','','',8.100,10.935,12.150,12.555,12.555,12.555,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (114,'30624',30624,NULL,'ENCHUFE ROSCA H 2','004','043',NULL,'2','','',5.130,6.926,7.695,7.952,7.952,7.952,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (115,'30625',30625,NULL,'ENCHUFE RESC/MACHO 2','004','043',NULL,'2','','',2.570,3.469,3.855,3.983,3.983,3.983,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (2104,'2060',2060,NULL,'ESTAÑO 33 % KGS','004','051',NULL,'2','','',130.000,175.500,195.000,162.500,175.500,155.000,NULL,NULL,'2011-04-21','2012-10-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-03 12:07:51'),
 (117,'10127',10127,NULL,'TORN C/REDONDA  1/2 X 90','003','045',NULL,'2','','',2.170,2.929,3.255,3.364,3.364,3.364,NULL,NULL,'2010-11-08','2010-11-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (128,'2223',2223,NULL,'ACEITERA  LISA PVC','001','051',NULL,'2','','',4.990,6.737,7.485,7.734,7.734,7.734,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (127,'19438',19438,NULL,'RUEDA FUND.Y GOMA 160 C/FRENO','001','050',NULL,'2','','',43.700,58.995,65.550,67.735,67.735,67.735,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (833,'60418',60418,NULL,'BROCHES BULITS6 ','001','096',NULL,'2','','',7.700,10.395,11.550,11.935,11.935,11.935,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (832,'60400',60400,NULL,'ENGRAMPADORA BULIT CAB PRO M','001','096',NULL,'2','','',86.900,117.315,130.350,134.695,134.695,134.695,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (125,'8913',8913,NULL,'LISTON ARMADO SICA 1X40 SIC0103','005','048',NULL,'2','','',41.400,55.890,62.100,51.750,55.890,33.635,NULL,NULL,'2010-11-09','2013-03-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-12 20:25:19'),
 (129,'2241',2241,NULL,'SAPITO PVC 1/2 Y 3/4','001','052',NULL,'2','','',1.700,2.295,2.550,2.635,2.635,2.635,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (130,'22701',22701,NULL,'ROCIADOR C/DEPOSITO MET','001','053',NULL,'1','','',44.500,60.080,66.750,55.630,60.080,44.175,NULL,NULL,'2010-11-09','2013-01-24',0.00,0.00,1.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-24 15:03:49'),
 (131,'2056',2056,NULL,'ESTAÑO 40% X KGS','001','054',NULL,'2','','',128.000,172.800,192.000,198.400,198.400,198.400,NULL,NULL,'2010-11-09','2011-08-17',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (132,'1130',1130,NULL,'AISLANTE 55X85 C/HOJA','001','055',NULL,'2','','',21.000,28.350,31.500,32.550,32.550,32.550,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (133,'1232',1232,NULL,'CAÑO COBRE X KG','001','056',NULL,'2','','',95.000,128.250,142.500,118.750,128.250,137.950,NULL,NULL,'2010-11-09','2013-02-28',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-28 17:36:10'),
 (134,'2232',2232,NULL,'LANZA RIEGO 1/2 Y 3/4','001','052',NULL,'2','','',1.750,2.362,2.625,2.712,2.712,2.712,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (135,'2451',2451,NULL,'TOMA GOMA  1/2 M ','001','057',NULL,'2','','',2.700,3.645,4.050,4.185,4.185,4.185,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (136,'4951-1',4951,NULL,'FALLEBAS ARRIMAR 18 MM','006','058',NULL,'2','','',9.200,12.420,13.800,14.260,14.260,14.260,NULL,NULL,'2010-11-09','2010-11-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (831,'60414',60414,NULL,'ENGRAMPADORA PROFE CAB PRO M/ BULIT','001','096',NULL,'2','','',158.000,213.300,237.000,197.500,213.300,111.910,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:57:32'),
 (829,'93053',93053,NULL,'PERBOND TRANS/310ML','001','095',NULL,'2','','',29.500,39.830,44.250,36.880,39.830,31.698,NULL,NULL,'2010-11-21','2013-01-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-19 17:47:55'),
 (819,'35001',35001,NULL,'ACEITE STIHL X 5L MOTOR','001','093',NULL,'2','','',265.000,357.750,397.500,331.250,357.750,294.500,NULL,NULL,'2010-11-21','2013-04-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-06 19:12:31'),
 (820,'35002',35002,NULL,'MOTOR 2 HP/1500 MOTORMECH BLIND','001','094',NULL,'2','','',1076.800,1453.680,1615.200,1669.040,1669.040,1669.040,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (828,'93052',93052,NULL,'PERBOND TRANS/ 125ML','001','095',NULL,'2','','',14.800,19.980,22.200,18.500,19.980,15.934,NULL,NULL,'2010-11-21','2013-01-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-19 17:17:32'),
 (827,'93051',93051,NULL,'PERBOND TRANS 50 CC','001','095',NULL,'2','','',8.000,10.800,12.000,10.000,10.800,11.331,NULL,NULL,'2010-11-21','2012-01-31',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-31 20:08:32'),
 (826,'93050',93050,NULL,'PERBOND TRANS/25 CC','001','095',NULL,'2','','',6.370,8.600,9.560,7.960,8.600,6.882,NULL,NULL,'2010-11-21','2013-01-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-19 17:36:53'),
 (856,'84000',84000,NULL,'RIOBRA EXT 4L RIOPINT','002','036',NULL,'2','','',35.780,48.303,53.670,55.459,55.459,55.459,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (834,'35005',35005,NULL,'MATE ALGARROBO','007','097',NULL,'2','','',8.500,11.480,12.750,10.630,11.480,10.602,NULL,NULL,'2010-11-21','2012-10-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-12 10:07:55'),
 (825,'93049',93049,NULL,'PERBOND 400 CC','001','095',NULL,'2','','',30.330,40.950,45.500,37.910,40.950,34.689,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:48:45'),
 (824,'93048',93048,NULL,'PERBOND 125 CC','001','095',NULL,'2','','',14.500,19.580,21.750,18.130,19.580,16.663,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:48:31'),
 (822,'93046',93046,NULL,'PERBOND 25 CC','001','095',NULL,'2','','',6.580,8.880,9.870,8.230,8.880,7.146,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:48:05'),
 (823,'93047',93047,NULL,'PERBOND 50 CC','001','095',NULL,'2','','',10.800,14.580,16.200,13.500,14.580,11.826,NULL,NULL,'2010-11-21','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 17:48:21'),
 (821,'35003',35003,NULL,'MOTOR BLIND/1.1/2/1500 MOTORMECH','001','094',NULL,'2','','',0.100,0.135,0.150,0.155,0.155,0.155,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,5.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2014-07-21 12:05:43'),
 (2530,'8590',8590,NULL,'ACEITE STIHL P/CADENA','001','093',NULL,'2','','',26.000,35.100,39.000,32.500,35.100,35.340,NULL,NULL,'2011-06-02','2012-07-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-24 10:15:56'),
 (817,'SIC0008',0,NULL,'LLAVE TERMICA SICA 1X5A','005','091',NULL,'2','','',8.900,12.015,13.350,13.795,13.795,13.795,NULL,NULL,'2010-11-21','2011-05-22',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (1488,'SAS0088',0,NULL,'BALASTRO 105 SASSIN','005','092',NULL,'2','','',60.000,81.000,90.000,75.000,81.000,61.411,NULL,NULL,'2011-02-05','2013-04-18',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-18 16:38:56'),
 (815,'HEL0016',0,NULL,'PRECINTOS /ALT-6 NAT-280M-HELLERMAN','005','089',NULL,'2','','',0.300,0.405,0.450,0.465,0.465,0.465,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (814,'BRO0002',0,NULL,'CONECTOR P/NEUTRO 16-95/4-35','005','051',NULL,'2','','',7.500,10.125,11.250,11.625,11.625,11.625,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (812,'YAR0029',0,NULL,'LAMP/DICROICA GU10 220/50 IMP','005','021',NULL,'2','','',3.880,5.238,5.820,6.014,6.014,6.014,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (813,'PHI0186',0,NULL,'TUBOS FLUORE/30 W PHILPS','005','087',NULL,'2','','',5.380,7.260,8.070,6.730,7.260,7.750,NULL,NULL,'2010-11-21','2012-04-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-04-05 15:53:53'),
 (810,'SIC0024',0,NULL,'LLAVE TERMICA SICA  2X50','005','091',NULL,'2','','',30.670,41.404,46.005,47.538,47.538,47.538,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (811,'SIC0019',0,NULL,'LLAVE TERMICA SICA  2X15A','005','091',NULL,'2','','',16.770,22.640,25.155,25.994,25.994,25.994,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (809,'SIC0023',0,NULL,'LLAVES TERMICA SICA 2X40','005','091',NULL,'2','','',22.480,30.348,33.720,34.844,34.844,34.844,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (808,'ABB0065',0,NULL,'CONTACTOR TRIP A30','005','090',NULL,'2','','',374.400,505.440,561.600,468.000,505.440,451.050,NULL,NULL,'2010-11-21','2012-03-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-03-11 16:20:10'),
 (807,'VIR0001',0,NULL,'FICHA P/PLANCHA VIR0001','005','083',NULL,'2','','',3.550,4.790,5.330,4.440,4.790,3.565,NULL,NULL,'2010-11-21','2013-01-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-09 11:49:40'),
 (399,'ORM0142',0,NULL,'LAMP/DULUX 36W 4P 830/840','005','081',NULL,'2','','',16.700,22.545,25.050,25.885,25.885,25.885,NULL,NULL,'2010-11-14','2011-11-29',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (398,'ALI0031',0,NULL,'LAMPARA B/C ESPIRAL COLOR 20W','005','018',NULL,'2','','',20.250,27.337,30.375,31.387,31.387,31.387,NULL,NULL,'2010-11-14','2010-11-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (397,'ALI0009',0,NULL,'LAMPARA B/CON 45W','005','021',NULL,'2','','',34.000,45.900,51.000,52.700,52.700,52.700,NULL,NULL,'2010-11-14','2011-09-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (180,'813231',813231,NULL,'MOTOGUADAÑA DAESEN 520','001','059',NULL,'1','','',1000.000,1350.000,1500.000,1250.000,1350.000,945.500,NULL,NULL,'2010-11-09','2012-09-07',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-09-07 09:50:19'),
 (396,'TEX0002',0,NULL,'VARIADOR LUZ P/ VERONA TEXALUX','005','025',NULL,'2','','',13.500,18.225,20.250,20.925,20.925,20.925,NULL,NULL,'2010-11-14','2012-01-09',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (394,'JEL0001',0,NULL,'BASTIDOR VERONA','005','025',NULL,'2','','',1.880,2.540,2.820,2.350,2.540,2.418,NULL,NULL,'2010-11-14','2013-02-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-16 10:18:37'),
 (2302,'HEO150',0,NULL,'MANIJA ALUMINO  MINIST/','006','146',NULL,'2','','',9.000,12.150,13.500,11.250,12.150,10.540,NULL,NULL,'2011-04-30','2012-10-26',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-26 21:00:24'),
 (1497,'PRO0002',0,NULL,'CURVA HIERRO 3/4','005','078',NULL,'2','','',2.280,3.080,3.420,2.850,3.080,2.945,NULL,NULL,'2011-02-05','2013-04-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-25 15:27:53'),
 (391,'60001',60001,NULL,'RESISTENSIA CALEFON ELEC','005','051',NULL,'2','','',23.000,31.050,34.500,28.750,31.050,31.000,NULL,NULL,'2010-11-14','2013-02-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-23 09:54:54'),
 (390,'60000',60000,NULL,'CALEFON ELECTRICO 20L PVC','005','051',NULL,'2','','',45.000,60.750,67.500,56.250,60.750,46.500,NULL,NULL,'2010-11-14','2012-10-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-12 16:13:56'),
 (389,'7486',7486,NULL,'CAÑO HIERRO 5/8 X 3M ACI0001','005','078',NULL,'2','','',12.240,16.520,18.360,15.300,16.520,15.500,NULL,NULL,'2010-11-14','2013-03-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-08 09:20:04'),
 (387,'09829',9829,NULL,'CABLE TPR 2X1.50 FONS/','005','077',NULL,'2','','',2.900,3.920,4.350,3.630,3.920,3.875,NULL,NULL,'2010-11-14','2013-04-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-03 09:09:13'),
 (388,'09830',9830,NULL,'CABLE TPR 2X2.5 FONS/','005','077',NULL,'2','','',4.590,6.200,6.890,5.740,6.200,6.091,NULL,NULL,'2010-11-14','2013-04-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-03 09:09:41'),
 (386,'9828',9828,NULL,'CABLE TPR 2X1 FONS/','005','077',NULL,'2','','',2.150,2.900,3.230,2.690,2.900,2.961,NULL,NULL,'2010-11-14','2013-04-03',0.00,0.00,16.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-03 09:08:48'),
 (806,'LOG0047',0,NULL,'PRECINTOS /BCO ALT7 5X378M','005','089',NULL,'2','','',0.190,0.256,0.285,0.294,0.294,0.294,NULL,NULL,'2010-11-21','2011-06-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (805,'LOG0045',0,NULL,'PRECINTOS /ALT-5 BCO-5X292M','005','089',NULL,'2','','',0.140,0.189,0.210,0.217,0.217,0.217,NULL,NULL,'2010-11-21','2011-06-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (803,'LOG0043',0,NULL,'PRECINTOS BCO ALT 3 5X189M','005','089',NULL,'2','','',0.060,0.081,0.090,0.093,0.093,0.093,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (804,'LOG0044',0,NULL,'PRECINTOS /BCO ALT4 5X245M','005','089',NULL,'2','','',0.090,0.121,0.135,0.139,0.139,0.139,NULL,NULL,'2010-11-21','2011-06-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (802,'LOG0041',0,NULL,'PRECINTOS BCO  3.5X148','005','089',NULL,'2','','',0.040,0.054,0.060,0.062,0.062,0.062,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (801,'LOG0040',0,NULL,'PRECINTOS BCO ALT 1-2,5X100M','005','089',NULL,'2','','',0.020,0.027,0.030,0.031,0.031,0.031,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (800,'00319',319,NULL,'TRABASIL GAS 15G','001','088',NULL,'2','','',15.000,20.250,22.500,23.250,23.250,23.250,NULL,NULL,'2010-11-21','2011-09-29',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (798,'317',317,NULL,'AEROSOL W-80 X 250 ML','001','013',NULL,'2','','',12.500,16.880,18.750,15.630,16.880,13.175,NULL,NULL,'2010-11-21','2012-12-27',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-27 08:58:54'),
 (799,'00318',318,NULL,'AEROSOL W-80 440 ML','001','013',NULL,'2','','',18.000,24.300,27.000,22.500,24.300,24.025,NULL,NULL,'2010-11-21','2012-11-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-14 12:03:41'),
 (796,'93087',93087,NULL,'PEGAMIL P/PVC 100CC','001','088',NULL,'2','','',5.100,6.885,7.650,7.905,7.905,7.905,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (797,'22000',22000,NULL,'SILICONA AEROSOL SILISUR','001','013',NULL,'2','','',15.950,21.530,23.930,19.940,21.530,20.538,NULL,NULL,'2010-11-21','2012-08-10',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-08-10 16:30:43'),
 (794,'93321',93321,NULL,'PEGAMIL CALZADO  3G','001','088',NULL,'2','','',3.440,4.644,5.160,5.332,5.332,5.332,NULL,NULL,'2010-11-21','2011-12-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (795,'93086',93086,NULL,'PEGAMIL P/PVC 50 CC','001','088',NULL,'2','','',3.620,4.887,5.430,5.611,5.611,5.611,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (347,'34100',34100,NULL,'CEMENTO FORTEX 1L','001','075',NULL,'2','','',32.000,43.200,48.000,40.000,43.200,37.200,NULL,NULL,'2010-11-13','2013-04-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-20 11:55:48'),
 (346,'34099',34099,NULL,'CEMENTO FORTEX 1/2L','001','075',NULL,'2','','',18.600,25.110,27.900,23.250,25.110,21.545,NULL,NULL,'2010-11-13','2013-03-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-06 18:52:35'),
 (349,'34102',34102,NULL,'CEMENTO FORTEX 50 CC','001','075',NULL,'2','','',4.800,6.480,7.200,6.000,6.480,6.510,NULL,NULL,'2010-11-13','2012-07-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-02 10:30:34'),
 (348,'34101',34101,NULL,'CEMENTO FORTEX 4L','001','075',NULL,'2','','',102.500,138.380,153.750,128.130,138.380,130.200,NULL,NULL,'2010-11-13','2012-07-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-02 10:33:27'),
 (343,'34096',34096,NULL,'CEMENTO FORTEX 1/4','001','075',NULL,'2','','',10.800,14.580,16.200,13.500,14.580,12.400,NULL,NULL,'2010-11-13','2013-04-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-03 10:18:04'),
 (342,'01016',1016,NULL,'DISCO  115X1X22 TIROLY','001','061',NULL,'2','','',7.900,10.670,11.850,9.880,10.670,9.470,NULL,NULL,'2010-11-12','2013-03-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-24 09:59:02'),
 (793,'93309',93309,NULL,'TRABASIL RA-3 50G','001','088',NULL,'2','','',86.500,116.780,129.750,108.130,116.780,108.701,NULL,NULL,'2010-11-21','2013-02-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-13 08:33:01'),
 (791,'93303',93303,NULL,'TRABASIL RA-3 6G','001','088',NULL,'2','','',12.600,17.010,18.900,15.750,17.010,16.663,NULL,NULL,'2010-11-21','2013-02-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-13 08:33:20'),
 (792,'93307',93307,NULL,'TRABASIL RA-3/15G','001','088',NULL,'2','','',26.530,35.820,39.800,33.160,35.820,33.325,NULL,NULL,'2010-11-21','2013-02-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-13 08:32:48'),
 (778,'00008',8,NULL,'LAMPARAS VELITA 25/40/60','005','021',NULL,'2','','',1.410,1.903,2.115,2.186,2.186,2.186,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (484,'EUR0015',0,NULL,'LINTERNA REC/ 7 LED WWERKE','005','080',NULL,'2','','',24.000,32.400,36.000,37.200,37.200,37.200,NULL,NULL,'2010-11-16','2010-11-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (776,'00006',6,NULL,'CABLE CANAL 20X20 C/A MAGI','005','086',NULL,'2','','',11.500,15.530,17.250,14.380,15.530,9.068,NULL,NULL,'2010-11-20','2013-03-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-03 10:29:40'),
 (771,'00001',1,NULL,'CABLE CANAL  14X7','005','086',NULL,'2','','',2.110,2.850,3.170,2.640,2.850,2.945,NULL,NULL,'2010-11-20','2012-05-29',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-05-29 08:58:47'),
 (772,'00002',2,NULL,'CABLE CANAL  14X7 C/A','005','086',NULL,'2','','',3.200,4.320,4.800,4.000,4.320,3.937,NULL,NULL,'2010-11-20','2012-10-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-11 17:18:53'),
 (3308,'04137.56',4138,NULL,'PISTOLA TR-17515- DE RIEGO 9F.','013','154',NULL,'2','','',17.000,22.950,25.500,21.250,22.950,16.508,NULL,NULL,'2011-10-27','2012-07-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-20 09:51:44'),
 (326,'01001',1001,NULL,'ESCOFINA PLENA 8  1/2 CAÑA','001','074',NULL,'2','','',17.000,22.950,25.500,26.350,26.350,26.350,NULL,NULL,'2010-11-12','2010-11-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (327,'01002',1002,NULL,'ESCOFINA RED PLENA 8','001','074',NULL,'2','','',12.000,16.200,18.000,18.600,18.600,18.600,NULL,NULL,'2010-11-12','2010-11-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (324,'1000',1000,NULL,'TUBO OXIGENO','001','006',NULL,'2','','',144.620,195.240,216.930,180.780,195.240,148.800,NULL,NULL,'2010-11-12','2013-04-24',0.00,0.00,6.500,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-24 17:27:16'),
 (475,'30010',30010,NULL,'ELECTRODO 2.5 CONARCO','001','002',NULL,'2','','',29.850,55.005,97.231,123.909,165.566,163.766,NULL,NULL,'2010-11-16','2013-04-30',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-19 15:08:13'),
 (323,'00020',20,NULL,'PALA ESCOCESA C/MAD. GHERARDI','001','154',NULL,'2','','',153.140,206.740,229.710,191.430,206.740,32.550,NULL,NULL,'2010-11-12','2012-01-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-24 20:20:36'),
 (476,'30011',30011,NULL,'ELECTRODO 3.25 CONARCO X KGS','001','002',NULL,'2','','',29.850,49.765,87.950,112.103,149.791,147.721,NULL,NULL,'2010-11-16','2013-04-30',0.00,0.00,4.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-19 15:08:13'),
 (769,'8880',8880,NULL,'CAJA P/C CANAL CHATA CAB0002','005','085',NULL,'2','','',3.100,4.190,4.650,3.880,4.190,3.674,NULL,NULL,'2010-11-20','2012-07-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-19 09:48:38'),
 (320,'00017',17,NULL,'CARBURO','001','006',NULL,'2','','',7.500,10.130,11.250,9.380,10.130,10.385,NULL,NULL,'2010-11-12','2013-01-03',0.00,0.00,10.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-03 16:10:29'),
 (319,'00016',16,NULL,'TEJIDO 1/2 X 1 EXAG','001','072',NULL,'2','','',9.340,12.609,14.010,14.477,14.477,14.477,NULL,NULL,'2010-11-12','2010-11-12',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (282,'20277',20277,NULL,'VALVULAS P/CANILLA 1/2','004','068',NULL,'2','','',1.000,1.350,1.500,1.250,1.350,1.209,NULL,NULL,'2010-11-10','2013-02-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-05 20:05:21'),
 (265,'05030',5030,NULL,'CABO C/ROSCA MADERA','001','063',NULL,'2','','',5.000,6.750,7.500,6.250,6.750,5.270,NULL,NULL,'2010-11-10','2012-07-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-03 15:29:26'),
 (267,'81103',81103,NULL,'PENETRI 10F440CM ART 318','001','029',NULL,'2','','',26.000,35.100,39.000,32.500,35.100,33.325,NULL,NULL,'2010-11-10','2013-02-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-14 11:41:07'),
 (268,'05031',5031,NULL,'CABO MADERA C/ROSCA 1,50','001','063',NULL,'2','','',4.500,6.080,6.750,5.630,6.080,6.975,NULL,NULL,'2010-11-10','2011-02-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-15 10:03:44'),
 (2030,'SIC0079',0,NULL,'PORTALAMPARA PORCELANA 5/8 E-40','005','014',NULL,'2','','',20.390,27.530,30.590,25.490,27.530,20.925,NULL,NULL,'2011-04-15','2013-04-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-25 15:30:17'),
 (270,'05033',5033,NULL,'ESCOBA PAJA 6H','007','062',NULL,'2','','',13.000,17.550,19.500,16.250,17.550,19.065,NULL,NULL,'2010-11-10','2012-03-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-03-23 11:26:36'),
 (271,'05034',5034,NULL,'ESCOBILLON ANDEN 60C','007','062',NULL,'2','','',29.320,39.580,43.980,36.650,39.580,38.750,NULL,NULL,'2010-11-10','2012-12-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-20 16:41:01'),
 (272,'05035',5035,NULL,'CABO ROSC/ P/CEPILLO ANDEN GSO 2045','001','063',NULL,'2','','',8.850,11.950,13.280,11.060,11.950,13.717,NULL,NULL,'2010-11-10','2011-04-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-15 10:03:56'),
 (354,'20711',20711,NULL,'OFF REPELENTE 223G/240 CC','007','076',NULL,'2','','',26.500,35.780,39.750,33.130,35.780,23.715,NULL,NULL,'2010-11-14','2012-12-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-11 17:13:30'),
 (773,'00003',3,NULL,'CABLE CANAL 10X20 C/A KALOP','005','086',NULL,'2','','',4.400,5.940,6.600,5.500,5.940,5.425,NULL,NULL,'2010-11-20','2013-01-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-04 11:02:46'),
 (276,'05039',5039,NULL,'MACHO URANGA 7/16 AC','001','065',NULL,'2','','',31.250,42.187,46.875,48.437,48.437,48.437,NULL,NULL,'2010-11-10','2010-11-10',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (278,'05041',5041,NULL,'PINTURA VIAL AMARILLO 4L','002','066',NULL,'2','','',114.800,154.980,172.200,177.940,177.940,177.940,NULL,NULL,'2010-11-10','2011-02-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (5086,'07933',7933,NULL,'1 1/2 MOD/COMB/JELUZ -JEL0236','005','025',NULL,'2','','',4.030,5.440,6.050,5.040,5.440,NULL,NULL,NULL,'2012-11-24','2012-11-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-24 20:33:38'),
 (280,'20275',20275,NULL,'CINTA ENMASCARAR 24X50 DA','002','067',NULL,'2','','',9.700,13.100,14.550,12.130,13.100,9.858,NULL,NULL,'2010-11-10','2013-03-18',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-18 11:52:04'),
 (1169,'PHI0135',0,NULL,'LAMPARAS TWISTER 23W PHIL/','005','018',NULL,'2','','',24.000,32.400,36.000,30.000,32.400,31.217,NULL,NULL,'2011-01-06','2013-04-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-05 16:24:45'),
 (768,'30613',30613,NULL,'LAMPGLOBO 24W B/CON ALO0052','005','021',NULL,'2','','',18.000,24.300,27.000,27.900,27.900,27.900,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (1168,'PHI0134',0,NULL,'LAMPARAS TWISTER 20W PHIL/','005','018',NULL,'2','','',22.000,29.700,33.000,27.500,29.700,29.450,NULL,NULL,'2011-01-06','2013-04-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-05 16:24:23'),
 (666,'YAR0036',0,NULL,'ZOCALO GU 10','005','084',NULL,'2','','',4.400,5.940,6.600,5.500,5.940,4.712,NULL,NULL,'2010-11-17','2012-10-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-08 11:22:05'),
 (291,'20286',20286,NULL,'PILAS GDE KODAX MAX','001','070',NULL,'2','','',7.000,9.450,10.500,8.750,9.450,2.945,NULL,NULL,'2010-11-11','2013-03-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-21 19:21:52'),
 (292,'20287',20287,NULL,'PILAS AA DURACEL','001','070',NULL,'2','','',3.000,4.050,4.500,3.750,4.050,3.797,NULL,NULL,'2010-11-11','2012-11-05',0.00,0.00,12.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-05 17:18:00'),
 (295,'17576',17576,NULL,'TUERCAS 5/16 W','003','005',NULL,'2','','',0.210,0.280,0.320,0.260,0.280,0.093,NULL,NULL,'2010-11-11','2013-03-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-24 10:15:17'),
 (296,'JEL0325',0,NULL,'BASE VERONA P/3 M','005','025',NULL,'2','','',5.500,7.430,8.250,6.880,7.430,5.549,NULL,NULL,'2010-11-11','2013-03-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-04 18:18:56'),
 (297,'JEL0326',0,NULL,'BASE VERONA 4/MOD','005','025',NULL,'2','','',3.800,5.130,5.700,5.890,5.890,5.890,NULL,NULL,'2010-11-11','2010-11-11',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (1170,'PHI0136',0,NULL,'LAMPARAS TWISTER 27W PHIL/','005','018',NULL,'2','','',36.000,48.600,54.000,45.000,48.600,43.400,NULL,NULL,'2011-01-06','2013-04-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-05 16:25:08'),
 (1477,'35137',35137,NULL,'LAMPARA HONGO 60 GE','005','021',NULL,'2','','',1.750,2.362,2.625,2.712,2.712,2.712,NULL,NULL,'2011-02-04','2011-02-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (742,'JEL0021',0,NULL,' TOMA P/AIRE 20A C/N VERONA 20059','005','025',NULL,'2','','',6.500,8.780,9.750,8.130,8.780,8.525,NULL,NULL,'2010-11-19','2013-04-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-04 16:05:45'),
 (303,'JEL0032',0,NULL,'MODULO VERONA TEL','005','025',NULL,'2','','',9.280,12.530,13.920,11.600,12.530,10.463,NULL,NULL,'2010-11-11','2013-02-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-19 20:08:11'),
 (779,'00009',9,NULL,'LAMP/ SPOT R50 40 MIG','005','021',NULL,'2','','',3.700,4.995,5.550,5.735,5.735,5.735,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (780,'00010',10,NULL,'LAMPARAS CLARA 25-40-60','005','021',NULL,'2','','',1.420,1.917,2.130,2.201,2.201,2.201,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (781,'00011',11,NULL,'LAMPARAS CLARA 75/100','005','021',NULL,'2','','',1.330,1.796,1.995,2.062,2.062,2.062,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (782,'00012',12,NULL,'LAMPARAS CLARA 200','005','021',NULL,'2','','',2.890,3.901,4.335,4.479,4.479,4.479,NULL,NULL,'2010-11-20','2010-11-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (783,'00013',13,NULL,'DIVISOR 2 SALIDAS','005','006',NULL,'2','','',3.500,4.730,5.250,4.380,4.730,2.790,NULL,NULL,'2010-11-20','2013-01-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-04 17:42:23'),
 (784,'00014',14,NULL,'DIVISOR 3 VIAS','005','006',NULL,'2','','',5.000,6.750,7.500,6.250,6.750,4.727,NULL,NULL,'2010-11-20','2013-01-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-04 17:42:43'),
 (438,'10283',10283,NULL,'TOR G2 7/16X 1','003','003',NULL,'2','','',0.490,0.661,0.735,0.759,0.759,0.759,NULL,NULL,'2010-11-15','2010-11-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (439,'10284',10284,NULL,'TORN G5 7/16 X 2','003','082',NULL,'2','','',0.910,1.228,1.365,1.411,1.411,1.411,NULL,NULL,'2010-11-15','2010-11-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (440,'17498',17498,NULL,'ARANDELAS GROWER 7/16','003','038',NULL,'2','','',0.060,0.081,0.090,0.093,0.093,0.093,NULL,NULL,'2010-11-15','2010-11-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (441,'KAL0022',0,NULL,'FICHA KALOP 10A','005','083',NULL,'2','','',7.410,10.000,11.120,9.260,10.000,8.680,NULL,NULL,'2010-11-15','2013-05-06',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-06 15:24:57'),
 (790,'93317',93317,NULL,'PEGAMIL VINILICO 25 CM','001','088',NULL,'2','','',7.330,9.900,11.000,9.160,9.900,8.215,NULL,NULL,'2010-11-21','2012-12-20',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-20 16:41:24'),
 (785,'JEL0045',0,NULL,'TAPA MODULO VERONA','005','025',NULL,'2','','',0.440,0.590,0.660,0.550,0.590,0.589,NULL,NULL,'2010-11-20','2013-02-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-23 16:49:58'),
 (786,'KAL0024',0,NULL,'FICHA H ALTO CONS/COMB','005','083',NULL,'2','','',11.900,16.070,17.850,14.880,16.070,12.757,NULL,NULL,'2010-11-20','2013-05-06',0.00,0.00,1.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-05-06 15:26:14'),
 (787,'FAM0003',0,NULL,'ZOCALOS JUEGO','005','084',NULL,'2','','',6.950,9.383,10.425,10.773,10.773,10.773,NULL,NULL,'2010-11-20','2011-08-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (788,'KAL0020',0,NULL,'FICHA M 3P KALOP','005','083',NULL,'2','','',5.400,7.290,8.100,6.750,7.290,6.045,NULL,NULL,'2010-11-20','2013-03-18',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-18 16:16:24'),
 (789,'KAL0021',0,NULL,'FICHA H 3P KALOP','005','083',NULL,'2','','',7.100,9.590,10.650,8.880,9.590,8.060,NULL,NULL,'2010-11-20','2013-02-27',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-27 18:29:39'),
 (835,'35006',35006,NULL,'MATE ENLOSADO 2 ASAS','007','097',NULL,'2','','',11.900,16.065,17.850,18.445,18.445,18.445,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (836,'35007',35007,NULL,'MATE ELOZADO 1 ASAS','007','097',NULL,'2','','',9.600,12.960,14.400,14.880,14.880,14.880,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (837,'35008',35008,NULL,'MATE PLAST','007','097',NULL,'2','','',3.600,4.860,5.400,5.580,5.580,5.580,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (838,'35009',35009,NULL,'MATE ACRILICO','007','097',NULL,'2','','',3.900,5.265,5.850,6.045,6.045,6.045,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (839,'35010',35010,NULL,'TERMO ACERO INOX','007','097',NULL,'2','','',83.000,112.050,124.500,128.650,128.650,128.650,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (840,'35011',35011,NULL,'TERMO ALFA LUMILAGRO','007','097',NULL,'2','','',32.000,43.200,48.000,40.000,43.200,39.602,NULL,NULL,'2010-11-21','2012-04-01',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-04-01 16:57:25'),
 (841,'35012',35012,NULL,'TERMO DELTA LUMILAGRO','007','097',NULL,'2','','',26.400,35.640,39.600,40.920,40.920,40.920,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (842,'35013',35013,NULL,'TERMO MEDITERRANEO LUMILAGRO','007','097',NULL,'2','','',25.500,34.425,38.250,39.525,39.525,39.525,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (843,'35014',35014,NULL,'TERMO JOVEN LUMILAGRO','007','097',NULL,'2','','',24.300,32.805,36.450,37.665,37.665,37.665,NULL,NULL,'2010-11-21','2010-11-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (844,'35015',35015,NULL,'LIMAS P/MOTOSIERRA','001','109',NULL,'2','','',14.800,19.980,22.200,18.500,19.980,13.392,NULL,NULL,'2010-11-22','2013-02-28',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-28 19:42:07'),
 (845,'35016',35016,NULL,'ART XX','001','001',NULL,'2','','',0.000,0.000,0.000,0.000,0.000,0.000,NULL,NULL,'2010-11-22',NULL,0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2011-11-30 19:52:31'),
 (846,'7707',7707,NULL,'SIERRA JUNIOR ECLISE','001','033',NULL,'2','','',2.250,3.040,3.380,2.810,3.040,2.062,NULL,NULL,'2010-11-23','2012-10-19',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-10-19 17:51:58'),
 (847,'36000',36000,NULL,'CINTA METRICA IMP 3M C/F','001','098',NULL,'2','','',24.000,32.400,36.000,30.000,32.400,10.695,NULL,NULL,'2010-11-23','2013-01-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-21 19:12:16'),
 (848,'36001',36001,NULL,'CINTA METRICA 5M C/F','001','098',NULL,'2','','',33.500,45.230,50.250,41.880,45.230,15.500,NULL,NULL,'2010-11-23','2013-01-21',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-21 19:13:02'),
 (849,'20921',20921,NULL,'DISCO ALETADO 115/40 RHEIN','001','099',NULL,'2','','',10.000,13.500,15.000,12.500,13.500,10.850,NULL,NULL,'2010-11-23','2012-07-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-05 18:34:39'),
 (850,'20922',20922,NULL,'DISCO ALETADO RHIN 115X80','001','099',NULL,'2','','',6.780,9.153,10.170,10.509,10.509,10.509,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (851,'SIC0009',0,NULL,'LLAVE TERMICA SICA 1X10A','005','091',NULL,'2','','',11.820,15.960,17.730,14.780,15.960,13.485,NULL,NULL,'2010-11-23','2012-12-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-13 19:54:54'),
 (852,'7900',7900,NULL,'RAID SIN OLOR','007','116',NULL,'2','','',14.000,18.900,21.000,17.500,18.900,16.740,NULL,NULL,'2010-11-23','2013-01-26',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-26 19:29:36'),
 (853,'81203',81203,NULL,'TARUGO N8 PY','001','100',NULL,'2','','',0.070,0.090,0.110,0.090,0.090,0.108,NULL,NULL,'2010-11-23','2012-12-18',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-12-18 10:34:10'),
 (854,'35258',35258,NULL,'MECHA EZETA 5,25','001','101',NULL,'2','','',6.470,8.735,9.705,10.028,10.028,10.028,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (1496,'PRO0001',0,NULL,'CURVA HIERRO 5/8','005','078',NULL,'2','','',2.000,2.700,3.000,2.500,2.700,2.573,NULL,NULL,'2011-02-05','2013-04-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-25 15:26:51'),
 (857,'84001',84001,NULL,'LATEX RIOBRA  EXT 10L RIOPINT','002','036',NULL,'2','','',84.000,113.400,126.000,130.200,130.200,130.200,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (858,'84002',84002,NULL,'RIOBRA 20L EXT RIOPINT','002','036',NULL,'2','','',165.060,222.831,247.590,255.843,255.843,255.843,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (859,'84003',84003,NULL,'RIOPINT MURO 4L','002','036',NULL,'2','','',39.350,53.123,59.025,60.992,60.992,60.992,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (860,'84004',84004,NULL,'RIOPINT MURO 10L','002','036',NULL,'2','','',92.000,124.200,138.000,142.600,142.600,142.600,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (861,'84005',84005,NULL,'RIOPINT MURO 20L','002','036',NULL,'2','','',176.000,237.600,264.000,272.800,272.800,272.800,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (862,'84050',84050,NULL,'ENDUIDO 1L RIOPINT','002','036',NULL,'2','','',7.600,10.260,11.400,11.780,11.780,11.780,NULL,NULL,'2010-11-23','2010-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (863,'7326',7326,NULL,'MASILLA SR-60 1/2','002','008',NULL,'2','','',15.500,20.930,23.250,19.380,20.930,20.692,NULL,NULL,'2010-11-24','2012-09-22',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-09-22 09:07:30'),
 (865,'90501',90501,NULL,'SOPAPA GOMA SUPER GIGANTE','004','051',NULL,'2','','',8.250,11.140,12.380,10.310,11.140,4.263,NULL,NULL,'2010-11-25','2012-05-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-05-16 15:45:23'),
 (866,'90502',90502,NULL,'MANGUERA 8MM 300L GOMA','001','034',NULL,'2','','',6.200,8.370,9.300,9.610,9.610,9.610,NULL,NULL,'2010-11-25','2010-11-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (867,'90503',90503,NULL,'AGROPOL NEGRO 2M','001','103',NULL,'2','','',3.860,5.210,5.790,4.830,5.210,5.270,NULL,NULL,'2010-11-25','2013-04-03',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-03 09:56:07'),
 (868,'90504',90504,NULL,'AGROPOL NEGRO 3MTS','001','103',NULL,'2','','',5.800,7.830,8.700,7.250,7.830,7.750,NULL,NULL,'2010-11-25','2013-04-08',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-08 15:29:24'),
 (869,'90505',90505,NULL,'AGROPOL NEGRO 4MTS.','001','103',NULL,'2','','',7.300,9.860,10.950,9.130,9.860,10.385,NULL,NULL,'2010-11-25','2012-11-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-05 15:49:26'),
 (870,'90506',90506,NULL,'AGROPOL NEGRO 6 MTS','001','103',NULL,'2','','',10.900,14.720,16.350,13.630,14.720,15.655,NULL,NULL,'2010-11-25','2012-11-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-05 15:50:22'),
 (1410,'090507',90507,NULL,'MANGUERA REF/ 1/2 TRIC','013','034',NULL,'2','','',2.410,3.253,3.615,3.735,3.735,3.735,NULL,NULL,'2011-01-28','2011-11-27',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (872,'90513',90513,NULL,'MANGUERA SUP.REF/ 13MM','001','034',NULL,'2','','',2.450,3.308,3.675,3.797,3.797,3.797,NULL,NULL,'2010-11-25','2011-01-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (873,'90514',90514,NULL,'MANGUERA SUP.REF/ 19MM','001','034',NULL,'2','','',7.280,9.830,10.920,9.100,9.830,7.595,NULL,NULL,'2010-11-25','2012-07-27',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-07-27 16:36:16'),
 (874,'90520',90520,NULL,'AGROPOL NEGRO 8M','001','103',NULL,'2','','',16.000,21.600,24.000,20.000,21.600,24.490,NULL,NULL,'2010-11-25','2012-11-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-05 15:50:42'),
 (875,'88000',88000,NULL,'CAÑO EST20X20 X MTS','009','104',NULL,'2','','',5.390,7.277,8.085,8.354,8.354,8.354,NULL,NULL,'2010-11-25','2010-11-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (879,'7329',7329,NULL,'MASILLA SR-60 K 3,500','002','008',NULL,'2','','',67.000,90.450,100.500,83.750,90.450,91.047,NULL,NULL,'2010-11-25','2013-01-24',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-24 17:14:39'),
 (880,'7328',7328,NULL,'MASILLA SR-60 2K','002','008',NULL,'2','','',45.000,60.750,67.500,56.250,60.750,58.435,NULL,NULL,'2010-11-25','2013-03-02',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-02 09:33:36'),
 (881,'7500',7500,NULL,'CAÑO CORRUGADO 5/8 NARANJA-PVC0001','005','105',NULL,'2','','',0.620,0.840,0.930,0.780,0.840,0.759,NULL,NULL,'2010-11-25','2013-03-30',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-30 09:50:44'),
 (882,'7501',7501,NULL,'CAÑO CORRUGADO 3/4 NARANJA PVC0002','005','105',NULL,'2','','',0.660,0.890,0.990,0.830,0.890,0.852,NULL,NULL,'2010-11-25','2013-03-30',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-30 09:49:10'),
 (883,'7502',7502,NULL,'CAÑO CORRUGADO 7/8 NARANJA-LAM0003','005','105',NULL,'2','','',0.990,1.340,1.490,1.240,1.340,1.286,NULL,NULL,'2010-11-25','2013-03-14',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-03-14 18:48:53'),
 (884,'7503',7503,NULL,'CAÑO CORRUGADO 1 NARANJA LAM0004','005','105',NULL,'2','','',1.220,1.650,1.830,1.530,1.650,1.596,NULL,NULL,'2010-11-25','2013-02-16',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-16 10:31:00'),
 (885,'JEL0012',0,NULL,'MODULO VERONA COMBINACION','005','025',NULL,'2','','',3.900,5.270,5.850,4.880,5.270,5.518,NULL,NULL,'2010-11-25','2012-08-25',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-08-25 11:12:44'),
 (886,'40000',40000,NULL,'AZADA CARPIR ES N0 C/CABO','001','106',NULL,'2','','',40.000,54.000,60.000,62.000,62.000,62.000,NULL,NULL,'2010-11-28','2010-11-28',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (887,'40001',40001,NULL,'AZADA CARPIE ES N 1 C/CABO','001','106',NULL,'2','','',40.900,55.215,61.350,63.395,63.395,63.395,NULL,NULL,'2010-11-28','2010-11-28',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (888,'40723',40723,NULL,'BISAGRA BCD 1.1/2- HE0002','006','107',NULL,'2','','',0.500,0.680,0.750,0.630,0.680,0.325,NULL,NULL,'2010-11-28','2013-01-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-05 20:16:11'),
 (889,'40724',40724,NULL,'BISAGRA BDA 2 5000/5 HE0003','006','107',NULL,'2','','',0.700,0.950,1.050,0.880,0.950,0.496,NULL,NULL,'2010-11-28','2013-01-05',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-01-05 20:18:04'),
 (891,'5076',5076,NULL,'MECHA WIDIA NEIKE 6M FE1003','001','170',NULL,'2','','',7.950,10.730,11.930,9.940,10.730,9.812,NULL,NULL,'2010-11-28','2013-04-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-04-23 15:25:10'),
 (892,'20654',20654,NULL,'DESTAPA CAÑERIA 1L AX6','001','029',NULL,'2','','',9.900,13.370,14.850,12.380,13.370,13.330,NULL,NULL,'2010-11-28','2013-02-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-13 11:28:38'),
 (893,'20655',20655,NULL,'TACHAS','001','051',NULL,'2','','',0.070,0.090,0.110,0.090,0.090,0.077,NULL,NULL,'2010-11-28','2012-08-04',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-08-04 09:34:09'),
 (894,'60641',60641,NULL,'CABO ESCOBILLON 130C/ROS','001','063',NULL,'2','','',4.300,5.810,6.450,5.380,5.810,3.348,NULL,NULL,'2010-11-28','2012-11-23',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-11-23 16:27:14'),
 (895,'60605',60605,NULL,'CABO P/LIMA 8/10/12','001','063',NULL,'2','','',2.500,3.380,3.750,3.130,3.380,1.999,NULL,NULL,'2010-11-28','2012-06-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-15 10:04:06'),
 (896,'60606',60606,NULL,'CABOS DE LIMA N 14','001','063',NULL,'2','','',2.800,3.780,4.200,3.500,3.780,2.558,NULL,NULL,'2010-11-28','2012-06-15',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-06-15 09:41:48'),
 (897,'60616',60616,NULL,'CABO RASTRILLO 1.50','001','063',NULL,'2','','',11.500,15.525,17.250,17.825,17.825,17.825,NULL,NULL,'2010-11-28','2010-11-28',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2012-01-21 19:02:31'),
 (898,'61027',61027,NULL,'CUCHARA ALBANIL ES N7','027','110',NULL,'2','','',23.000,31.050,34.500,28.750,31.050,19.406,NULL,NULL,'2010-11-28','2013-02-13',0.00,0.00,0.000,0.000,0.000,NULL,'','','',NULL,NULL,0,NULL,NULL,'',0,'2013-02-13 17:02:48'),
 (899,'61028',61028,NULL,'CUCHARA ALBANIL ES N 8','027','110',NULL,'2','','',19.000,25.650