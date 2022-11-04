-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: grupored
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Create schema hr
--
DROP DATABASE IF EXISTS `grupored`;
CREATE DATABASE  IF NOT EXISTS `grupored`;
USE `grupored`;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `idClase` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idClase`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'clase1');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elemento`
--

DROP TABLE IF EXISTS `elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elemento` (
  `idElemento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(7) NOT NULL,
  PRIMARY KEY (`idElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

LOCK TABLES `elemento` WRITE;
/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementodeclase`
--

DROP TABLE IF EXISTS `elementodeclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementodeclase` (
  `elemento_idElemento` int NOT NULL,
  `clase_idClase` int NOT NULL,
  `porcDano` int NOT NULL,
  PRIMARY KEY (`elemento_idElemento`,`clase_idClase`),
  KEY `fk_elemento_has_clase_clase1_idx` (`clase_idClase`),
  KEY `fk_elemento_has_clase_elemento1_idx` (`elemento_idElemento`),
  CONSTRAINT `fk_elemento_has_clase_clase1` FOREIGN KEY (`clase_idClase`) REFERENCES `clase` (`idClase`),
  CONSTRAINT `fk_elemento_has_clase_elemento1` FOREIGN KEY (`elemento_idElemento`) REFERENCES `elemento` (`idElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementodeclase`
--

LOCK TABLES `elementodeclase` WRITE;
/*!40000 ALTER TABLE `elementodeclase` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementodeclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemigo`
--

DROP TABLE IF EXISTS `enemigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemigo` (
  `idEnemigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `ataque` int NOT NULL,
  `experiencia` int NOT NULL,
  `probObjeto` float NOT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `idObjeto` int NOT NULL,
  `idClase` int NOT NULL,
  PRIMARY KEY (`idEnemigo`),
  KEY `fk_enemigo_objeto1_idx` (`idObjeto`),
  KEY `fk_enemigo_clase1_idx` (`idClase`),
  CONSTRAINT `fk_enemigo_clase1` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`),
  CONSTRAINT `fk_enemigo_objeto1` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemigo`
--

LOCK TABLES `enemigo` WRITE;
/*!40000 ALTER TABLE `enemigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `enemigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hechizo`
--

DROP TABLE IF EXISTS `hechizo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hechizo` (
  `idHechizo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `potencia` int NOT NULL,
  `precision` int NOT NULL,
  `aprendizaje` int NOT NULL,
  `elemento_idElemento` int NOT NULL,
  `idHechizoBase` int DEFAULT NULL,
  PRIMARY KEY (`idHechizo`),
  KEY `fk_hechizo_elemento1_idx` (`elemento_idElemento`),
  KEY `fk_hechizo_hechizo1_idx` (`idHechizoBase`),
  CONSTRAINT `fk_hechizo_elemento1` FOREIGN KEY (`elemento_idElemento`) REFERENCES `elemento` (`idElemento`),
  CONSTRAINT `fk_hechizo_hechizo1` FOREIGN KEY (`idHechizoBase`) REFERENCES `hechizo` (`idHechizo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hechizo`
--

LOCK TABLES `hechizo` WRITE;
/*!40000 ALTER TABLE `hechizo` DISABLE KEYS */;
/*!40000 ALTER TABLE `hechizo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroe`
--

DROP TABLE IF EXISTS `heroe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroe` (
  `idHeroe` int NOT NULL AUTO_INCREMENT,
  `idPareja` int DEFAULT NULL,
  `nombre` varchar(10) NOT NULL,
  `edad` int NOT NULL,
  `genero` varchar(1) NOT NULL,
  `clase` varchar(50) NOT NULL,
  `nivelInicial` int NOT NULL,
  `ataque` int NOT NULL,
  PRIMARY KEY (`idHeroe`),
  KEY `fk_heroes_heroes_idx` (`idPareja`),
  CONSTRAINT `fk_heroes_heroes` FOREIGN KEY (`idPareja`) REFERENCES `heroe` (`idHeroe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroe`
--

LOCK TABLES `heroe` WRITE;
/*!40000 ALTER TABLE `heroe` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invetariodeheroe`
--

DROP TABLE IF EXISTS `invetariodeheroe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invetariodeheroe` (
  `idHeroeObjeto` int NOT NULL AUTO_INCREMENT,
  `idObjeto` int NOT NULL,
  `idHeroes` int NOT NULL,
  PRIMARY KEY (`idHeroeObjeto`),
  KEY `fk_heroes_has_objetos_objetos1_idx` (`idObjeto`),
  KEY `fk_heroes_has_objetos_heroes1_idx` (`idHeroes`),
  CONSTRAINT `fk_heroes_has_objetos_heroes1` FOREIGN KEY (`idHeroes`) REFERENCES `heroe` (`idHeroe`),
  CONSTRAINT `fk_heroes_has_objetos_objetos1` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invetariodeheroe`
--

LOCK TABLES `invetariodeheroe` WRITE;
/*!40000 ALTER TABLE `invetariodeheroe` DISABLE KEYS */;
/*!40000 ALTER TABLE `invetariodeheroe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objeto`
--

DROP TABLE IF EXISTS `objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto` (
  `idObjeto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `efectoUso` varchar(200) NOT NULL,
  `peso` float NOT NULL,
  PRIMARY KEY (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objeto`
--

LOCK TABLES `objeto` WRITE;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `objeto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03 22:34:31
