CREATE DATABASE  IF NOT EXISTS `job_application_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `job_application_db`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: job_application_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `technology_master`
--

DROP TABLE IF EXISTS `technology_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_master` (
  `tac_id` int NOT NULL AUTO_INCREMENT,
  `technology` varchar(45) NOT NULL,
  `level` varchar(45) NOT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tac_id`),
  UNIQUE KEY `tac_id_UNIQUE` (`tac_id`),
  KEY `fk_technology_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_technology_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_master`
--

LOCK TABLES `technology_master` WRITE;
/*!40000 ALTER TABLE `technology_master` DISABLE KEYS */;
INSERT INTO `technology_master` VALUES (34,'PHP','beginer',35,'2023-02-15 08:25:32'),(35,'Mysql','mideater',35,'2023-02-15 08:25:32'),(36,'Laravel','expert',35,'2023-02-15 08:25:32'),(37,'Oracle','expert',35,'2023-02-15 08:25:32'),(38,'PHP','beginer',37,'2023-02-15 08:37:45'),(39,'Mysql','mideater',37,'2023-02-15 08:37:45'),(40,'Laravel','mideater',37,'2023-02-15 08:37:45'),(41,'Oracle','expert',37,'2023-02-15 08:37:45'),(42,'PHP','expert',39,'2023-02-15 08:49:55'),(43,'Mysql','expert',39,'2023-02-15 08:49:55'),(44,'Laravel','beginer',39,'2023-02-15 08:49:55'),(45,'Oracle','expert',39,'2023-02-15 08:49:55'),(46,'PHP','beginer',43,'2023-02-15 09:19:42'),(47,'Mysql','mideater',43,'2023-02-15 09:19:42'),(48,'Laravel','expert',43,'2023-02-15 09:19:42'),(49,'Oracle','expert',43,'2023-02-15 09:19:42'),(50,'PHP','beginer',46,'2023-02-15 11:11:25'),(51,'Mysql','mideater',46,'2023-02-15 11:11:25'),(52,'Laravel','expert',46,'2023-02-15 11:11:25'),(53,'Oracle','expert',46,'2023-02-15 11:11:25'),(54,'PHP','beginer',47,'2023-02-15 11:11:33'),(55,'Mysql','mideater',47,'2023-02-15 11:11:33'),(56,'Laravel','expert',47,'2023-02-15 11:11:33'),(57,'Oracle','expert',47,'2023-02-15 11:11:33'),(58,'PHP','beginer',49,'2023-02-15 11:39:13'),(59,'Mysql','mideater',49,'2023-02-15 11:39:13'),(60,'Laravel','expert',49,'2023-02-15 11:39:13'),(61,'Oracle','mideater',49,'2023-02-15 11:39:13'),(62,'PHP','beginer',50,'2023-02-15 11:39:32'),(63,'Mysql','mideater',50,'2023-02-15 11:39:32'),(64,'Laravel','expert',50,'2023-02-15 11:39:32'),(65,'Oracle','mideater',50,'2023-02-15 11:39:32'),(66,'PHP','beginer',51,'2023-02-15 11:40:07'),(67,'Mysql','mideater',51,'2023-02-15 11:40:07'),(68,'Laravel','expert',51,'2023-02-15 11:40:07'),(69,'Oracle','mideater',51,'2023-02-15 11:40:07'),(70,'PHP','beginer',52,'2023-02-15 11:42:00'),(71,'Mysql','mideater',52,'2023-02-15 11:42:00'),(72,'Laravel','expert',52,'2023-02-15 11:42:00'),(73,'Oracle','mideater',52,'2023-02-15 11:42:00'),(74,'PHP','beginer',53,'2023-02-15 12:04:41'),(75,'Mysql','mideater',53,'2023-02-15 12:04:41'),(76,'Laravel','mideater',53,'2023-02-15 12:04:41'),(77,'Oracle','expert',53,'2023-02-15 12:04:41'),(78,'PHP','beginer',54,'2023-02-15 12:05:29'),(79,'Mysql','mideater',54,'2023-02-15 12:05:29'),(80,'Laravel','mideater',54,'2023-02-15 12:05:29'),(81,'Oracle','expert',54,'2023-02-15 12:05:29'),(82,'PHP','beginer',55,'2023-02-15 12:10:15'),(83,'Mysql','mideater',55,'2023-02-15 12:10:15'),(84,'Laravel','mideater',55,'2023-02-15 12:10:15'),(85,'Oracle','expert',55,'2023-02-15 12:10:15'),(86,'PHP','mideater',56,'2023-02-15 13:02:45'),(87,'Mysql','expert',56,'2023-02-15 13:02:45'),(88,'PHP','beginer',57,'2023-02-16 03:19:07'),(89,'Mysql','mideater',57,'2023-02-16 03:19:07'),(90,'Laravel','beginer',57,'2023-02-16 03:19:07'),(91,'PHP','beginer',58,'2023-02-16 06:39:13'),(92,'Mysql','mideater',58,'2023-02-16 06:39:13'),(93,'Laravel','mideater',58,'2023-02-16 06:39:13'),(94,'Oracle','mideater',58,'2023-02-16 06:39:13'),(95,'PHP','beginer',59,'2023-02-16 07:14:27'),(96,'Laravel','undefined',59,'2023-02-16 07:14:27'),(97,'PHP','undefined',60,'2023-02-16 08:01:19'),(98,'Laravel','undefined',60,'2023-02-16 08:01:19'),(99,'PHP','beginer',61,'2023-02-16 08:04:45'),(100,'Oracle','expert',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `technology_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 14:37:04
