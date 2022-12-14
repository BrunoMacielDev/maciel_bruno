-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: alpha-silicon-01
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `idcurso` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Introduccion a la programacion','Bases en logica, diagramas de flujo, etc.','1'),(2,'Programacion Fullstack','JS, Databases, NodeJS, React','1'),(3,'Especialidad en Frontend','React','1'),(4,'Especialidad en Backend','NodeJS','1'),(5,'Especialidad en Data Analytics','','1'),(6,'Especialidad en DERs','Diagramas de entidad-relacion','0');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `idmateria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `objetivo` text,
  `plan_estudio` text,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idmateria`),
  UNIQUE KEY `idmateria` (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Logica','Bases en logica necesaria para programacion','1.Diagramas de Flujo; 2.PSeINT; 3.Resolucion de Problematicas generales','1'),(2,'Programacion Web Basica','Bases en HTML, CSS y JS','1.HTML; 2.CSS; 3.JS','1'),(3,'Ingles','Bases en el idioma Ingles','1.Present; 2.Past; 3.Future','1'),(4,'MySQL','Bases en bases de datos relacionales MySQL','1.Introduccion; 2.Sintaxis; 3.Querys; 4.DERs; 5.Relaciones','1'),(5,'NodeJS','Base en backend NodeJS','1.Introduccion; 2.JSON; 3.npm y configuracion; 4.express; 5.autenticacion','1'),(6,'Calculo I','Bases en calculo para Data Science','1.Derivadas; 2.Aplicacion de derivadas; 3.Integrales; 4.Aplicacion de integrales; 5.EDOs','0');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `idpersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dni` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `idpersona_UNIQUE` (`idpersona`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Antonia','Lopez','42133221','F','2001-11-02','1'),(2,'Gabriela','Gutierres','32337879','F','1998-02-03','1'),(3,'Juan Gabriel','Rosas','32245566','M','1988-02-03','1'),(4,'Roberto','Carlos','31998876','M','1986-02-03','1'),(5,'Julian','Alcaraz','29654876','M','1978-12-05','1'),(6,'Florecia','Gimenez','43454612','F','2002-07-12','1'),(7,'Juana','Richmond','46454612','F','2007-07-12','1'),(8,'Ramona','Gimenez','41287346','F','2001-11-27','1'),(9,'Andres','Kuhn','31454612','M','1985-07-12','1');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `idsede` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` text,
  `localidad` varchar(50) DEFAULT NULL,
  `cod_postal` varchar(10) DEFAULT NULL,
  `telcontacto1` varchar(15) DEFAULT NULL,
  `telcontacto2` varchar(15) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idsede`),
  UNIQUE KEY `idsede` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES (1,'Sede Posadas','San Lorenzo 2023','Posadas','3300','+54 376 4281042','','1'),(2,'Sede Obera','Av. Jose Ingenieros y Larrea','Obera','3360','+54 375 5828591','','1'),(3,'Sede El Soberbio','Av. Rivadavia 836','El Soberbio','3364','+54 375 5514923','','1'),(4,'Sede 25 de Mayo','Av. San Martin 858','25 de Mayo','3363','+54 375 5423315','','1'),(5,'Sede Apostoles','Av. 9 de Julio','Apostoles','3350','+54 375 8452318','','1'),(6,'Sede Virasoro','Av. Lavalle 2100','Gdor. Virasoro','3342','+54 375 6466390','+54 375 6512399','0'),(7,'Calculo',NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario` (`idusuario`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'brunocf','brunocf@gmail.com','12345bm','1'),(2,'jorge12','jorgelin@gmail.com','54321chorch','1'),(3,'aspermaster33','paulirycs@gmail.com','asper33master','1'),(4,'sendokbrn','eladio@gmail.com','sen2kbrn','1'),(5,'hugobss','bsshugo@gmail.com','asicomohugo3','1'),(6,'panchomo56','panchomosquera56@gmail.com','56pancho','0');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 10:50:47
