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
-- Create schema grupored
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Dragon'),(2,'Fantasma'),(3,'Demonio'),(4,'Pez'),(5,'Humano'),(6,'Bestia'),(7,'Ave'),(8,'Otros');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

LOCK TABLES `elemento` WRITE;
/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
INSERT INTO `elemento` VALUES (1,'fuego'),(2,'tierra'),(3,'agua'),(4,'viento'),(5,'void');
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementodeclase`
--

DROP TABLE IF EXISTS `elementodeclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementodeclase` (
  `idElemento` int NOT NULL,
  `idClase` int NOT NULL,
  `porcDano` int NOT NULL,
  PRIMARY KEY (`idElemento`,`idClase`),
  KEY `fk_elemento_has_clase_clase1_idx` (`idClase`),
  KEY `fk_elemento_has_clase_elemento1_idx` (`idElemento`),
  CONSTRAINT `fk_elemento_has_clase_clase1` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`),
  CONSTRAINT `fk_elemento_has_clase_elemento1` FOREIGN KEY (`idElemento`) REFERENCES `elemento` (`idElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementodeclase`
--

LOCK TABLES `elementodeclase` WRITE;
/*!40000 ALTER TABLE `elementodeclase` DISABLE KEYS */;
INSERT INTO `elementodeclase` VALUES (1,1,45),(1,2,12),(1,3,304),(1,4,25),(1,5,100),(1,6,598),(1,7,78),(1,8,60),(2,1,145),(2,2,240),(2,3,194),(2,4,48),(2,5,174),(2,6,457),(2,7,498),(2,8,100),(3,1,84),(3,2,45),(3,3,24),(3,4,67),(3,5,19),(3,6,545),(3,7,25),(3,8,48),(4,1,94),(4,2,97),(4,3,58),(4,4,90),(4,5,100),(4,6,10),(4,7,78),(4,8,548),(5,1,159),(5,2,58),(5,3,378),(5,4,184),(5,5,487),(5,6,54),(5,7,345),(5,8,412);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemigo`
--

LOCK TABLES `enemigo` WRITE;
/*!40000 ALTER TABLE `enemigo` DISABLE KEYS */;
INSERT INTO `enemigo` VALUES (1,'Atrix',20,12,41.7,'M',1,1),(5,'Buyua',78,15,78.9,'M',3,1),(6,'Majio',49,15,15.4,'-',4,3),(9,'Helid',84,20,45.8,'M',2,2),(10,'Nobe',12,40,1.1,'F',1,1),(11,'Ruizo',80,45,1.1,'M',1,1),(12,'Wolphi',64,47,1.1,'M',1,6),(13,'Lurap',14,60,1.1,'-',1,3),(14,'Kuref',72,29,1.1,'F',1,2);
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
  `idElemento` int NOT NULL,
  `idHechizoBase` int DEFAULT NULL,
  PRIMARY KEY (`idHechizo`),
  KEY `fk_hechizo_elemento1_idx` (`idElemento`),
  KEY `fk_hechizo_hechizo1_idx` (`idHechizoBase`),
  CONSTRAINT `fk_hechizo_elemento1` FOREIGN KEY (`idElemento`) REFERENCES `elemento` (`idElemento`),
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
  KEY `fk_heroes_heroes_idx` (`idPareja`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroe`
--

LOCK TABLES `heroe` WRITE;
/*!40000 ALTER TABLE `heroe` DISABLE KEYS */;
INSERT INTO `heroe` VALUES (1,2,'Erdeeeee',9,'F','claseprimera',8,14),(2,1,'Robinn',10,'M','x',14,42),(3,NULL,'Mold',16,'F','clasetercera',18,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objeto`
--

LOCK TABLES `objeto` WRITE;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
INSERT INTO `objeto` VALUES (1,'Pala','Permite hacer hueco para atacar a un rival por sorpresa',1.5),(2,'Pico',' Permite obtener materia prima de la naturaleza',2.8),(3,'Espada','Ataca a los enemigos, baja los ps de estos',5),(4,'Hacha','Peleas y defensa. Quita la mitad de vida a los enemigos de la clase Dragón',1.2),(5,'Hi','destruccion',8.9),(6,'Hola','KAJSJA',4.1);
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

-- Dump completed on 2022-11-09 14:37:58
