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
-- Table structure for table `language_master`
--

DROP TABLE IF EXISTS `language_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_master` (
  `lang_id` int NOT NULL AUTO_INCREMENT,
  `lang_known` varchar(45) NOT NULL,
  `lang_read` varchar(45) NOT NULL,
  `lang_write` varchar(45) NOT NULL,
  `lang_speak` varchar(45) NOT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `lang_id_UNIQUE` (`lang_id`),
  KEY `fk_language_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_language_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_master`
--

LOCK TABLES `language_master` WRITE;
/*!40000 ALTER TABLE `language_master` DISABLE KEYS */;
INSERT INTO `language_master` VALUES (56,'Gujarati','yes','no','no',35,'2023-02-15 08:25:32'),(57,'Hindi','no','yes','no',35,'2023-02-15 08:25:32'),(58,'English','no','no','yes',35,'2023-02-15 08:25:32'),(59,'Spanish','no','no','yes',35,'2023-02-15 08:25:32'),(60,'Gujarati','yes','yes','yes',37,'2023-02-15 08:37:45'),(61,'Hindi','yes','yes','yes',37,'2023-02-15 08:37:45'),(62,'English','yes','no','no',37,'2023-02-15 08:37:45'),(63,'Spanish','yes','no','no',37,'2023-02-15 08:37:45'),(64,'Gujarati','yes','yes','yes',39,'2023-02-15 08:49:55'),(65,'Hindi','yes','yes','yes',39,'2023-02-15 08:49:55'),(66,'English','yes','yes','no',39,'2023-02-15 08:49:55'),(67,'Spanish','yes','no','no',39,'2023-02-15 08:49:55'),(68,'Gujarati','yes','yes','no',43,'2023-02-15 09:19:42'),(69,'Hindi','no','yes','no',43,'2023-02-15 09:19:42'),(70,'English','no','yes','yes',43,'2023-02-15 09:19:42'),(71,'Gujarati','yes','yes','no',46,'2023-02-15 11:11:25'),(72,'Hindi','no','yes','no',46,'2023-02-15 11:11:25'),(73,'English','no','yes','yes',46,'2023-02-15 11:11:25'),(74,'Gujarati','yes','yes','no',47,'2023-02-15 11:11:33'),(75,'Hindi','no','yes','no',47,'2023-02-15 11:11:33'),(76,'English','no','yes','yes',47,'2023-02-15 11:11:33'),(77,'Gujarati','yes','yes','yes',49,'2023-02-15 11:39:13'),(78,'Hindi','yes','yes','yes',49,'2023-02-15 11:39:13'),(79,'English','no','yes','no',49,'2023-02-15 11:39:13'),(80,'Spanish','yes','no','no',49,'2023-02-15 11:39:13'),(81,'Gujarati','yes','yes','yes',50,'2023-02-15 11:39:32'),(82,'Hindi','yes','yes','yes',50,'2023-02-15 11:39:32'),(83,'English','no','yes','no',50,'2023-02-15 11:39:32'),(84,'Spanish','yes','no','no',50,'2023-02-15 11:39:32'),(85,'Gujarati','yes','yes','yes',51,'2023-02-15 11:40:07'),(86,'Hindi','yes','yes','yes',51,'2023-02-15 11:40:07'),(87,'English','no','yes','no',51,'2023-02-15 11:40:07'),(88,'Spanish','yes','no','no',51,'2023-02-15 11:40:07'),(89,'Gujarati','yes','yes','yes',52,'2023-02-15 11:42:00'),(90,'Hindi','yes','yes','yes',52,'2023-02-15 11:42:00'),(91,'English','no','yes','no',52,'2023-02-15 11:42:00'),(92,'Spanish','yes','no','no',52,'2023-02-15 11:42:00'),(93,'Gujarati','yes','no','no',53,'2023-02-15 12:04:41'),(94,'Hindi','yes','yes','yes',53,'2023-02-15 12:04:41'),(95,'English','yes','yes','no',53,'2023-02-15 12:04:41'),(96,'Spanish','yes','no','no',53,'2023-02-15 12:04:41'),(97,'Gujarati','yes','no','no',54,'2023-02-15 12:05:29'),(98,'Hindi','yes','yes','yes',54,'2023-02-15 12:05:29'),(99,'English','yes','yes','no',54,'2023-02-15 12:05:29'),(100,'Spanish','yes','no','no',54,'2023-02-15 12:05:29'),(101,'Gujarati','yes','no','no',55,'2023-02-15 12:10:15'),(102,'Hindi','yes','yes','yes',55,'2023-02-15 12:10:15'),(103,'English','yes','yes','no',55,'2023-02-15 12:10:15'),(104,'Spanish','yes','no','no',55,'2023-02-15 12:10:15'),(105,'Gujarati','yes','no','no',56,'2023-02-15 13:02:45'),(106,'Hindi','no','yes','yes',56,'2023-02-15 13:02:45'),(107,'Gujarati','no','no','yes',57,'2023-02-16 03:19:07'),(108,'Hindi','yes','yes','yes',57,'2023-02-16 03:19:07'),(109,'English','yes','yes','yes',57,'2023-02-16 03:19:07'),(110,'Gujarati','no','no','yes',58,'2023-02-16 06:39:13'),(111,'Hindi','no','yes','yes',58,'2023-02-16 06:39:13'),(112,'English','yes','yes','yes',58,'2023-02-16 06:39:13'),(113,'Gujarati','yes','yes','yes',59,'2023-02-16 07:14:27'),(114,'Gujarati','yes','yes','yes',60,'2023-02-16 08:01:19'),(115,'Gujarati','yes','yes','no',61,'2023-02-16 08:04:45'),(116,'Hindi','yes','yes','yes',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `language_master` ENABLE KEYS */;
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
