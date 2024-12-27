-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: carvent
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `cantidad_de_vehículos_en_inventario`
--

DROP TABLE IF EXISTS `cantidad_de_vehículos_en_inventario`;
/*!50001 DROP VIEW IF EXISTS `cantidad_de_vehículos_en_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cantidad_de_vehículos_en_inventario` AS SELECT 
 1 AS `total_vehiculos_inventario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `direccion` (`direccion`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','juan@email.com','555-0101','Calle 1 #123'),(2,'María','González','maria@email.com','555-0102','Calle 2 #234'),(3,'Carlos','López','carlos@email.com','555-0103','Calle 3 #345'),(4,'Ana','Martínez','ana@email.com','555-0104','Calle 4 #456'),(5,'Pedro','Sánchez','pedro@email.com','555-0105','Calle 5 #567');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `comentario` text,
  `fecha_comentario` datetime DEFAULT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,1,'Excelente vehículo, muy satisfecho','2024-01-20 11:00:00'),(2,2,2,'Buena relación calidad-precio','2024-01-21 12:00:00'),(3,3,3,'Increíble rendimiento','2024-01-22 13:00:00'),(4,4,4,'Muy cómodo para la familia','2024-01-23 14:00:00'),(5,5,5,'Servicio de primera','2024-01-24 15:00:00');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2024-01-01',20000.00),(2,2,2,'2024-01-02',18000.00),(3,3,3,'2024-01-03',40000.00),(4,4,4,'2024-01-04',15000.00),(5,5,5,'2024-01-05',19000.00);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `costo_de_mantenimiento_por_vehículo`
--

DROP TABLE IF EXISTS `costo_de_mantenimiento_por_vehículo`;
/*!50001 DROP VIEW IF EXISTS `costo_de_mantenimiento_por_vehículo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `costo_de_mantenimiento_por_vehículo` AS SELECT 
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `costo_total_mantenimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `venta_id` (`venta_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,'Roberto','García','Vendedor','555-0201'),(2,2,'Laura','Rodríguez','Vendedor','555-0202'),(3,3,'Miguel','Torres','Gerente','555-0203'),(4,4,'Carmen','Flores','Vendedor','555-0204'),(5,5,'David','Ruiz','Vendedor','555-0205');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_mantenimiento`
--

DROP TABLE IF EXISTS `historial_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_mantenimiento` (
  `mantenimiento_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `fecha_mantenimiento` datetime DEFAULT NULL,
  `descripcion` text,
  `costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`mantenimiento_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `historial_mantenimiento_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_mantenimiento`
--

LOCK TABLES `historial_mantenimiento` WRITE;
/*!40000 ALTER TABLE `historial_mantenimiento` DISABLE KEYS */;
INSERT INTO `historial_mantenimiento` VALUES (1,1,'2024-01-25 09:00:00','Cambio de aceite',50.00),(2,2,'2024-01-26 10:00:00','Rotación de neumáticos',30.00),(3,3,'2024-01-27 11:00:00','Revisión general',100.00),(4,4,'2024-01-28 12:00:00','Cambio de filtros',45.00),(5,5,'2024-01-29 13:00:00','Alineación y balanceo',80.00);
/*!40000 ALTER TABLE `historial_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `inventario_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`inventario_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,2,'2024-01-01 08:00:00'),(2,2,3,'2024-01-02 08:30:00'),(3,3,1,'2024-01-03 09:00:00'),(4,4,4,'2024-01-04 09:30:00'),(5,5,2,'2024-01-05 10:00:00');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos` (
  `modelo_id` int NOT NULL AUTO_INCREMENT,
  `nombre_modelo` varchar(50) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`modelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos`
--

LOCK TABLES `modelos` WRITE;
/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
INSERT INTO `modelos` VALUES (1,'Sedán','Vehículo de 4 puertas familiar'),(2,'SUV','Vehículo deportivo utilitario'),(3,'Coupé','Vehículo deportivo de 2 puertas'),(4,'Hatchback','Vehículo compacto con puerta trasera'),(5,'Pickup','Vehículo con área de carga descubierta');
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `número_de_clientes_nuevos`
--

DROP TABLE IF EXISTS `número_de_clientes_nuevos`;
/*!50001 DROP VIEW IF EXISTS `número_de_clientes_nuevos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `número_de_clientes_nuevos` AS SELECT 
 1 AS `clientes_nuevos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `número_de_comentarios_por_vehículo`
--

DROP TABLE IF EXISTS `número_de_comentarios_por_vehículo`;
/*!50001 DROP VIEW IF EXISTS `número_de_comentarios_por_vehículo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `número_de_comentarios_por_vehículo` AS SELECT 
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `total_comentarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `opciones_vehiculo`
--

DROP TABLE IF EXISTS `opciones_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones_vehiculo` (
  `opcion_id` int NOT NULL AUTO_INCREMENT,
  `nombre_opcion` varchar(50) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`opcion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones_vehiculo`
--

LOCK TABLES `opciones_vehiculo` WRITE;
/*!40000 ALTER TABLE `opciones_vehiculo` DISABLE KEYS */;
INSERT INTO `opciones_vehiculo` VALUES (1,'GPS','Sistema de navegación satelital'),(2,'Sunroof','Techo solar eléctrico'),(3,'Leather','Asientos de cuero'),(4,'Camera','Cámara de reversa'),(5,'Bluetooth','Conectividad inalámbrica');
/*!40000 ALTER TABLE `opciones_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `venta_id` (`venta_id`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,24500.00,'2024-01-15 10:30:00','Tarjeta de crédito'),(2,2,21500.00,'2024-01-16 12:00:00','Efectivo'),(3,3,44000.00,'2024-01-17 14:45:00','Transferencia'),(4,4,17500.00,'2024-01-18 17:15:00','Tarjeta de débito'),(5,5,22500.00,'2024-01-19 10:00:00','Efectivo');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'AutoParts Inc','Juan Proveedor','Av. Industrial 123'),(2,'CarSupply SA','María Distribuidora','Calle Comercio 456'),(3,'Repuestos Express','Carlos Vendedor','Av. Principal 789'),(4,'Global Auto Parts','Ana Gerente','Blvd. Central 012'),(5,'Mayorista Autos','Pedro Director','Calle Mayor 345');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuestos`
--

DROP TABLE IF EXISTS `repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos` (
  `repuesto_id` int NOT NULL AUTO_INCREMENT,
  `nombre_repuesto` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `proveedor_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`repuesto_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `repuestos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos`
--

LOCK TABLES `repuestos` WRITE;
/*!40000 ALTER TABLE `repuestos` DISABLE KEYS */;
INSERT INTO `repuestos` VALUES (1,'Filtro de aceite','Filtro de alta calidad',1,50,10.00),(2,'Pastillas de freno','Juego de pastillas',2,30,45.00),(3,'Batería','Batería de 12V',3,20,100.00),(4,'Amortiguadores','Par de amortiguadores',4,15,150.00),(5,'Bujías','Set de bujías',5,100,8.00);
/*!40000 ALTER TABLE `repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `servicio_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `fecha_servicio` datetime DEFAULT NULL,
  `descripcion` text,
  `costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`servicio_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,1,'2024-02-01 09:00:00','Mantenimiento preventivo',200.00),(2,2,'2024-02-02 10:00:00','Cambio de frenos',300.00),(3,3,'2024-02-03 11:00:00','Diagnóstico general',150.00),(4,4,'2024-02-04 12:00:00','Cambio de aceite',80.00),(5,5,'2024-02-05 13:00:00','Afinación mayor',400.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_de_pagos_realizados`
--

DROP TABLE IF EXISTS `total_de_pagos_realizados`;
/*!50001 DROP VIEW IF EXISTS `total_de_pagos_realizados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_de_pagos_realizados` AS SELECT 
 1 AS `total_pagos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `valor_promedio_por_cliente`
--

DROP TABLE IF EXISTS `valor_promedio_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `valor_promedio_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valor_promedio_por_cliente` AS SELECT 
 1 AS `valor_promedio_por_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `vehiculo_id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `año` year DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `kilometraje` int DEFAULT NULL,
  PRIMARY KEY (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'Toyota','Corolla',2020,25000.00,'Rojo',15000),(2,'Honda','Civic',2019,22000.00,'Azul',20000),(3,'Ford','Mustang',2021,45000.00,'Negro',5000),(4,'Chevrolet','Cruze',2018,18000.00,'Blanco',35000),(5,'Nissan','Sentra',2020,23000.00,'Gris',12000);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos_opciones`
--

DROP TABLE IF EXISTS `vehiculos_opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos_opciones` (
  `vehiculo_id` int NOT NULL,
  `opcion_id` int NOT NULL,
  PRIMARY KEY (`vehiculo_id`,`opcion_id`),
  KEY `opcion_id` (`opcion_id`),
  CONSTRAINT `vehiculos_opciones_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`),
  CONSTRAINT `vehiculos_opciones_ibfk_2` FOREIGN KEY (`opcion_id`) REFERENCES `opciones_vehiculo` (`opcion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos_opciones`
--

LOCK TABLES `vehiculos_opciones` WRITE;
/*!40000 ALTER TABLE `vehiculos_opciones` DISABLE KEYS */;
INSERT INTO `vehiculos_opciones` VALUES (1,1),(1,2),(2,3),(3,4),(4,5);
/*!40000 ALTER TABLE `vehiculos_opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vehículos_más_vendidos`
--

DROP TABLE IF EXISTS `vehículos_más_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vehículos_más_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehículos_más_vendidos` AS SELECT 
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `vehiculo_id` int DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,'2024-01-15 10:00:00',24500.00),(2,2,2,'2024-01-16 11:30:00',21500.00),(3,3,3,'2024-01-17 14:15:00',44000.00),(4,4,4,'2024-01-18 16:45:00',17500.00),(5,5,5,'2024-01-19 09:30:00',22500.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_de_vehículos`
--

DROP TABLE IF EXISTS `ventas_de_vehículos`;
/*!50001 DROP VIEW IF EXISTS `ventas_de_vehículos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_de_vehículos` AS SELECT 
 1 AS `año`,
 1 AS `mes`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_por_empleado`
--

DROP TABLE IF EXISTS `ventas_por_empleado`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_empleado` AS SELECT 
 1 AS `empleado_id`,
 1 AS `empleado`,
 1 AS `ventas_realizadas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_por_marca_o_modelo`
--

DROP TABLE IF EXISTS `ventas_por_marca_o_modelo`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_marca_o_modelo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_marca_o_modelo` AS SELECT 
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'carvent'
--

--
-- Dumping routines for database 'carvent'
--

--
-- Final view structure for view `cantidad_de_vehículos_en_inventario`
--

/*!50001 DROP VIEW IF EXISTS `cantidad_de_vehículos_en_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cantidad_de_vehículos_en_inventario` AS select sum(`inventario`.`cantidad`) AS `total_vehiculos_inventario` from `inventario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `costo_de_mantenimiento_por_vehículo`
--

/*!50001 DROP VIEW IF EXISTS `costo_de_mantenimiento_por_vehículo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `costo_de_mantenimiento_por_vehículo` AS select `v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,sum(`hm`.`costo`) AS `costo_total_mantenimiento` from (`historial_mantenimiento` `hm` join `vehiculos` `v` on((`hm`.`vehiculo_id` = `v`.`vehiculo_id`))) group by `v`.`marca`,`v`.`modelo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `número_de_clientes_nuevos`
--

/*!50001 DROP VIEW IF EXISTS `número_de_clientes_nuevos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `número_de_clientes_nuevos` AS select count(distinct `ventas`.`cliente_id`) AS `clientes_nuevos` from `ventas` where (`ventas`.`fecha_venta` between '2024-01-01' and '2024-12-31') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `número_de_comentarios_por_vehículo`
--

/*!50001 DROP VIEW IF EXISTS `número_de_comentarios_por_vehículo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `número_de_comentarios_por_vehículo` AS select `v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,count(`c`.`comentario_id`) AS `total_comentarios` from (`comentarios` `c` join `vehiculos` `v` on((`c`.`vehiculo_id` = `v`.`vehiculo_id`))) group by `v`.`marca`,`v`.`modelo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_de_pagos_realizados`
--

/*!50001 DROP VIEW IF EXISTS `total_de_pagos_realizados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_de_pagos_realizados` AS select sum(`pagos`.`monto`) AS `total_pagos` from `pagos` where (`pagos`.`fecha_pago` between '2024-01-01' and '2024-12-31') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `valor_promedio_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `valor_promedio_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valor_promedio_por_cliente` AS select avg(`ventas`.`precio_venta`) AS `valor_promedio_por_cliente` from `ventas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehículos_más_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vehículos_más_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehículos_más_vendidos` AS select `v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,count(`vt`.`venta_id`) AS `total_ventas` from (`ventas` `vt` join `vehiculos` `v` on((`vt`.`vehiculo_id` = `v`.`vehiculo_id`))) group by `v`.`marca`,`v`.`modelo` order by `total_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_de_vehículos`
--

/*!50001 DROP VIEW IF EXISTS `ventas_de_vehículos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_de_vehículos` AS select year(`ventas`.`fecha_venta`) AS `año`,month(`ventas`.`fecha_venta`) AS `mes`,count(`ventas`.`venta_id`) AS `total_ventas` from `ventas` group by `año`,`mes` order by `año` desc,`mes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_empleado`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_empleado` AS select `e`.`empleado_id` AS `empleado_id`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `empleado`,count(`v`.`venta_id`) AS `ventas_realizadas` from (`empleados` `e` left join `ventas` `v` on((`e`.`venta_id` = `v`.`venta_id`))) group by `e`.`empleado_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_marca_o_modelo`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_marca_o_modelo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_marca_o_modelo` AS select `v`.`marca` AS `marca`,`v`.`modelo` AS `modelo`,count(`vt`.`venta_id`) AS `total_ventas` from (`ventas` `vt` join `vehiculos` `v` on((`vt`.`vehiculo_id` = `v`.`vehiculo_id`))) group by `v`.`marca`,`v`.`modelo` order by `total_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-23 15:17:54

