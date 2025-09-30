-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: caja
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cat_aplicacion`
--

DROP TABLE IF EXISTS `cat_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_aplicacion` (
  `id_aplicacion` int NOT NULL,
  `descripcion` varchar(15) NOT NULL,
  PRIMARY KEY (`id_aplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_aplicacion`
--

LOCK TABLES `cat_aplicacion` WRITE;
/*!40000 ALTER TABLE `cat_aplicacion` DISABLE KEYS */;
INSERT INTO `cat_aplicacion` VALUES (1,'Monto'),(2,'Porcentaje');
/*!40000 ALTER TABLE `cat_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_precios`
--

DROP TABLE IF EXISTS `cat_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_precios` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `descripcion_precio` varchar(20) NOT NULL,
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_precios`
--

LOCK TABLES `cat_precios` WRITE;
/*!40000 ALTER TABLE `cat_precios` DISABLE KEYS */;
INSERT INTO `cat_precios` VALUES (1,'Precio público'),(2,'Precio 2'),(3,'Precio 3'),(4,'Precio 4'),(5,'Precio 5'),(6,'Precio 6'),(7,'Precio 7'),(8,'Precio 8'),(9,'Precio 9'),(10,'Precio mínimo'),(11,'Costo Promedio'),(12,'Ultimo costo');
/*!40000 ALTER TABLE `cat_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(3) DEFAULT NULL,
  `descripcion_departamento` varchar(30) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `idx_departamento` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'01','CHILES');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarios` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_tienda` int NOT NULL,
  `id_producto` int NOT NULL,
  `stock` decimal(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id_inventario`),
  UNIQUE KEY `idx_tienda_producto` (`id_tienda`,`id_producto`),
  KEY `fk_inv_producto` (`id_producto`),
  CONSTRAINT `fk_inv_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_inv_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES (36,1,4,1.000),(40,1,1,23.000),(41,1,5,1.000);
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(6) DEFAULT NULL,
  `descripcion_linea` varchar(30) NOT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id_linea`),
  UNIQUE KEY `idx_linea` (`clave`),
  KEY `fk_dpto` (`id_departamento`),
  CONSTRAINT `fk_dpto` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (6,'1.1','desc',1),(7,'1.2','CHILES',1);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `referencia` varchar(50) DEFAULT NULL,
  `id_tipo_movimiento` int NOT NULL,
  `numero` int NOT NULL,
  `cantidad` decimal(10,3) DEFAULT NULL,
  `id_producto` int NOT NULL,
  `costo_unidad` decimal(10,3) DEFAULT NULL,
  `costo_total` decimal(10,3) DEFAULT NULL,
  `fecha_movimiento` date DEFAULT NULL,
  `id_tienda` int NOT NULL,
  `id_tienda_dest` int DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_tipo_movimiento` (`id_tipo_movimiento`),
  KEY `fk_mov_tienda` (`id_tienda`),
  KEY `fk_mov_producto` (`id_producto`),
  CONSTRAINT `fk_mov_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_mov_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`),
  CONSTRAINT `fk_tipo_movimiento` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipo_movimiento` (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `politicas`
--

DROP TABLE IF EXISTS `politicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `politicas` (
  `id_politica` int NOT NULL AUTO_INCREMENT,
  `descripcion_politica` varchar(100) NOT NULL,
  `id_tienda` int NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `id_tipo` int NOT NULL,
  `afectar_sobre` int DEFAULT NULL,
  `id_aplicacion` int NOT NULL,
  `valor` decimal(10,3) NOT NULL,
  `volumen_minimo` decimal(10,3) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_clasificacion` int DEFAULT NULL,
  `id_linea` int DEFAULT NULL,
  `id_departamento` int DEFAULT NULL,
  `horario1_inicio` time DEFAULT NULL,
  `horario1_fin` time DEFAULT NULL,
  `horario2_inicio` time DEFAULT NULL,
  `horario2_fin` time DEFAULT NULL,
  `vigencia_inicio` date DEFAULT NULL,
  `vigencia_fin` date DEFAULT NULL,
  `producto_desde` int DEFAULT NULL,
  `producto_hasta` int DEFAULT NULL,
  PRIMARY KEY (`id_politica`),
  KEY `fk_tipo_politica` (`id_tipo`),
  KEY `fk_aplicacion` (`id_aplicacion`),
  KEY `fk_pol_tienda` (`id_tienda`),
  CONSTRAINT `fk_aplicacion` FOREIGN KEY (`id_aplicacion`) REFERENCES `cat_aplicacion` (`id_aplicacion`),
  CONSTRAINT `fk_pol_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`),
  CONSTRAINT `fk_tipo_politica` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_politica` (`id_tipo_politica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `politicas`
--

LOCK TABLES `politicas` WRITE;
/*!40000 ALTER TABLE `politicas` DISABLE KEYS */;
INSERT INTO `politicas` VALUES (2,'Politica de prueba',1,1,1,NULL,1,2.500,5.000,NULL,NULL,NULL,NULL,'09:00:00','18:00:00','09:00:00','18:00:00','2025-09-15','2025-12-24',1,1),(3,'Politica para chiles',1,1,1,2,1,2.500,35.000,NULL,NULL,NULL,NULL,'11:00:00','19:00:00','18:00:00','19:00:00','2025-09-10','2026-04-01',1,1);
/*!40000 ALTER TABLE `politicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios` (
  `id_producto` int NOT NULL,
  `id_precio` int NOT NULL,
  `precio` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES (1,1,220.000),(1,2,200.000),(4,1,258.000),(4,2,220.000),(4,3,220.000),(4,4,195.000),(4,5,395.000),(5,1,220.000),(5,2,200.000),(5,12,456.500);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `clave` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `clave_alterna` varchar(50) DEFAULT NULL,
  `unidad_entrada` varchar(3) NOT NULL,
  `editar_precio` tinyint(1) NOT NULL DEFAULT '0',
  `id_linea` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `idx_clave_producto` (`clave`),
  KEY `fk_linea` (`id_linea`),
  CONSTRAINT `fk_linea` FOREIGN KEY (`id_linea`) REFERENCES `lineas` (`id_linea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'0001','GUAJILLO',NULL,'KG',1,7),(4,'0004','MULATO','000014','KG',1,7),(5,'0005','PASILLA',NULL,'KG',1,7);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion_rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Cajero');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `id_tienda` int NOT NULL AUTO_INCREMENT,
  `descripcion_tienda` varchar(50) NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_precio_omision` int NOT NULL,
  PRIMARY KEY (`id_tienda`),
  KEY `fk_precio` (`id_precio_omision`),
  CONSTRAINT `fk_precio` FOREIGN KEY (`id_precio_omision`) REFERENCES `cat_precios` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'El Gallito','Av. Felipe Angeles','5584228337',1),(2,'La Chiquita','Tahuac','5584228338',12);
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_movimiento`
--

DROP TABLE IF EXISTS `tipo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` int NOT NULL AUTO_INCREMENT,
  `descripcion_movimiento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_movimiento`
--

LOCK TABLES `tipo_movimiento` WRITE;
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
INSERT INTO `tipo_movimiento` VALUES (1,'Compras'),(2,'Devol. de venta'),(5,'Inventario inicial'),(6,'Ventas'),(8,'Pérdidas'),(10,'Cancel. de venta');
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_politica`
--

DROP TABLE IF EXISTS `tipo_politica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_politica` (
  `id_tipo_politica` int NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_politica` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_politica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_politica`
--

LOCK TABLES `tipo_politica` WRITE;
/*!40000 ALTER TABLE `tipo_politica` DISABLE KEYS */;
INSERT INTO `tipo_politica` VALUES (1,'Sustitutiva'),(2,'Acomulativa');
/*!40000 ALTER TABLE `tipo_politica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `id_tienda` int DEFAULT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `alias` (`alias`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_rol` (`id_rol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Piter','Pedro Gomez','12345',1,2),(3,'Tony','Antonio Marquez','12345',1,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'caja'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 22:18:41
