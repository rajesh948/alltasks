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
-- Table structure for table `reference_master`
--

DROP TABLE IF EXISTS `reference_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_master` (
  `ref_id` int NOT NULL AUTO_INCREMENT,
  `ref_name` varchar(45) NOT NULL,
  `ref_contact` varchar(45) NOT NULL,
  `relation` varchar(45) DEFAULT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ref_id`),
  UNIQUE KEY `ref_id_UNIQUE` (`ref_id`),
  KEY `fk_reference_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_reference_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_master`
--

LOCK TABLES `reference_master` WRITE;
/*!40000 ALTER TABLE `reference_master` DISABLE KEYS */;
INSERT INTO `reference_master` VALUES (26,'ram','3456789098','bro',35,'2023-02-15 08:25:32'),(27,'SHYAM','3456789098','23TU',35,'2023-02-15 08:25:32'),(28,'krishna','7898978678','brother',37,'2023-02-15 08:37:45'),(29,'kirti','8978989897','friend',37,'2023-02-15 08:37:45'),(30,'sandhya','6789897897','sister',39,'2023-02-15 08:49:56'),(31,'sanjay','5678989789','friend',39,'2023-02-15 08:49:56'),(32,'suresh','7898978678','sir',46,'2023-02-15 11:11:25'),(33,'geeta','7896788990','maam',46,'2023-02-15 11:11:25'),(34,'suresh','7898978678','sir',47,'2023-02-15 11:11:33'),(35,'geeta','7896788990','maam',47,'2023-02-15 11:11:33'),(36,'suresh','7898978678','brother',49,'2023-02-15 11:39:13'),(37,'sandhya','6789897897','sister',49,'2023-02-15 11:39:13'),(38,'suresh','7898978678','brother',50,'2023-02-15 11:39:32'),(39,'sandhya','6789897897','sister',50,'2023-02-15 11:39:32'),(40,'suresh','7898978678','brother',51,'2023-02-15 11:40:07'),(41,'sandhya','6789897897','sister',51,'2023-02-15 11:40:07'),(42,'suresh','7898978678','brother',52,'2023-02-15 11:42:00'),(43,'sandhya','6789897897','sister',52,'2023-02-15 11:42:00'),(44,'ram','7898978678','brother',53,'2023-02-15 12:04:41'),(45,'sandhya','6789897897','sister',53,'2023-02-15 12:04:41'),(46,'ram','7898978678','brother',54,'2023-02-15 12:05:29'),(47,'sandhya','6789897897','sister',54,'2023-02-15 12:05:29'),(48,'ram','7898978678','brother',55,'2023-02-15 12:10:15'),(49,'sandhya','6789897897','sister',55,'2023-02-15 12:10:15'),(50,'majnubhai','8000090000','uncle',56,'2023-02-15 13:02:45'),(51,'shima','7689765678','teacher',56,'2023-02-15 13:02:45'),(52,'suresh','7898978678','uncle',57,'2023-02-16 03:19:07'),(53,'krishna','7878787878','sister',57,'2023-02-16 03:19:07'),(54,'suresh','7898978678','uncle',58,'2023-02-16 06:39:13'),(55,'krishna','7878787878','sister',58,'2023-02-16 06:39:13'),(56,'ram','3456789098','bro',59,'2023-02-16 07:14:27'),(57,'suresh','7898978678','brother',59,'2023-02-16 07:14:27'),(58,'ram','3456789098','bro',60,'2023-02-16 08:01:19'),(59,'suresh','7898978678','brother',60,'2023-02-16 08:01:19'),(60,'suresh','6789897897','bro',61,'2023-02-16 08:04:45'),(61,'suresh','434564789','uncle',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `reference_master` ENABLE KEYS */;
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
