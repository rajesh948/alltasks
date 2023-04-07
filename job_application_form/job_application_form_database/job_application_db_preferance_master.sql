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
-- Table structure for table `preferance_master`
--

DROP TABLE IF EXISTS `preferance_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferance_master` (
  `sal_id` int NOT NULL AUTO_INCREMENT,
  `location_prf` varchar(45) NOT NULL,
  `current_ctc` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `notice_period` varchar(45) NOT NULL,
  `expected_ctc` varchar(45) NOT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sal_id`),
  UNIQUE KEY `sal_id_UNIQUE` (`sal_id`),
  KEY `fk_salary_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_salary_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferance_master`
--

LOCK TABLES `preferance_master` WRITE;
/*!40000 ALTER TABLE `preferance_master` DISABLE KEYS */;
INSERT INTO `preferance_master` VALUES (14,'Pune,Chennai,Ahmedabad','4.5LPA','Quality Analysis','2 month','6 LPA',35,'2023-02-15 08:25:32'),(15,'Ahmedabad,Delhi,Chennai','5 LPA','Quality Analysis','3 month','7 LPA',37,'2023-02-15 08:37:45'),(16,'Pune,Ahmedabad,Rajkot','5 LPA','Design','5 month','8 LPA',39,'2023-02-15 08:49:56'),(17,'Ahmedabad,Chennai,Delhi','4.5LPA','Software Devlopment','5 month','7 LPA',46,'2023-02-15 11:11:25'),(18,'Ahmedabad,Chennai,Delhi','4.5LPA','Software Devlopment','5 month','7 LPA',47,'2023-02-15 11:11:33'),(19,'Ahmedabad,Delhi,Pune','5 LPA','Software Devlopment','5 month','6 LPA',49,'2023-02-15 11:39:13'),(20,'Ahmedabad,Delhi,Pune','5 LPA','Software Devlopment','5 month','6 LPA',50,'2023-02-15 11:39:32'),(21,'Ahmedabad,Delhi,Pune','5 LPA','Software Devlopment','5 month','6 LPA',51,'2023-02-15 11:40:07'),(22,'Ahmedabad,Delhi,Pune','5 LPA','Software Devlopment','5 month','6 LPA',52,'2023-02-15 11:42:00'),(23,'Ahmedabad,Delhi,Chennai','4.5LPA','Software Devlopment','2 month','8 LPA',53,'2023-02-15 12:04:41'),(24,'Ahmedabad,Delhi,Chennai','4.5LPA','Software Devlopment','2 month','8 LPA',54,'2023-02-15 12:05:29'),(25,'Ahmedabad,Delhi,Chennai','4.5LPA','Software Devlopment','2 month','8 LPA',55,'2023-02-15 12:10:15'),(26,'Delhi,Pune,Chennai','8 LPA','Marketing','3 month','12 LPA',56,'2023-02-15 13:02:45'),(27,'Ahmedabad,Chennai,Delhi','5 LPA','Software Devlopment','2 month','12 LPA',57,'2023-02-16 03:19:07'),(28,'Pune,Delhi,Rajkot','5 LPA','Design','2 month','12 LPA',58,'2023-02-16 06:39:13'),(29,'Ahmedabad,Pune,Delhi','4.5LPA','Software Devlopment','2 month','6 LPA',59,'2023-02-16 07:14:27'),(30,'Ahmedabad,Pune,Delhi','4.5LPA','Software Devlopment','2 month','6 LPA',60,'2023-02-16 08:01:19'),(31,'Ahmedabad,Chennai,Delhi','4.5LPA','Quality Analysis','3 month','12 LPA',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `preferance_master` ENABLE KEYS */;
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
