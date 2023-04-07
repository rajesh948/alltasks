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
-- Table structure for table `education_master`
--

DROP TABLE IF EXISTS `education_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_master` (
  `edu_id` int NOT NULL AUTO_INCREMENT,
  `course` varchar(45) NOT NULL,
  `board` varchar(45) NOT NULL,
  `passingyear` varchar(45) NOT NULL,
  `percentage` varchar(45) NOT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edu_id`),
  UNIQUE KEY `acd_id_UNIQUE` (`edu_id`),
  KEY `fk_academic_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_academic_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_master`
--

LOCK TABLES `education_master` WRITE;
/*!40000 ALTER TABLE `education_master` DISABLE KEYS */;
INSERT INTO `education_master` VALUES (21,'10th','sebc','2018','90',35,'2023-02-15 08:25:32'),(22,'10th','sebc','2018','98',37,'2023-02-15 08:37:45'),(23,'10th','sebc','2015','80',39,'2023-02-15 08:49:55'),(24,'10th','sebc','2015','88',43,'2023-02-15 09:19:42'),(25,'10th','sebc','2015','88',46,'2023-02-15 11:11:25'),(26,'10th','sebc','2015','88',47,'2023-02-15 11:11:33'),(27,'10th','sebc','2018','88',49,'2023-02-15 11:39:13'),(28,'12th','sebc','2020','90',49,'2023-02-15 11:39:13'),(29,'10th','sebc','2018','88',50,'2023-02-15 11:39:32'),(30,'12th','sebc','2020','90',50,'2023-02-15 11:39:32'),(31,'10th','sebc','2018','88',51,'2023-02-15 11:40:07'),(32,'12th','sebc','2020','90',51,'2023-02-15 11:40:07'),(33,'10th','sebc','2018','88',52,'2023-02-15 11:42:00'),(34,'12th','sebc','2020','90',52,'2023-02-15 11:42:00'),(35,'10th','sebc','2018','88',53,'2023-02-15 12:04:41'),(36,'10th','sebc','2018','88',54,'2023-02-15 12:05:29'),(37,'10th','sebc','2018','88',55,'2023-02-15 12:10:15'),(38,'10th','sbsc','2016','87',56,'2023-02-15 13:02:45'),(39,'12th','sbsc','2018','89',56,'2023-02-15 13:02:45'),(40,'10th','sbsc','2018','78',57,'2023-02-16 03:19:07'),(41,'12th','sbsc','2020','88',57,'2023-02-16 03:19:07'),(42,'graduation','gtu','2023','90',57,'2023-02-16 03:19:07'),(43,'10th','sbsc','2015','78',58,'2023-02-16 06:39:13'),(44,'12th','sbsc','2017','89',58,'2023-02-16 06:39:13'),(45,'graduation','gtu','2021','90',58,'2023-02-16 06:39:13'),(46,'10th','sebc','2018','88',59,'2023-02-16 07:14:27'),(47,'10th','sebc','2018','88',60,'2023-02-16 08:01:19'),(48,'10th','sbsc','2018','87',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `education_master` ENABLE KEYS */;
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
