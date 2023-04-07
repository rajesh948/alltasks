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
-- Table structure for table `experience_master`
--

DROP TABLE IF EXISTS `experience_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_master` (
  `exp_id` int NOT NULL AUTO_INCREMENT,
  `com_name` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `cnd_id` int NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_id`),
  KEY `fk_experience_master_1_idx` (`cnd_id`),
  CONSTRAINT `fk_experience_master_1` FOREIGN KEY (`cnd_id`) REFERENCES `candidate_master` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_master`
--

LOCK TABLES `experience_master` WRITE;
/*!40000 ALTER TABLE `experience_master` DISABLE KEYS */;
INSERT INTO `experience_master` VALUES (21,'acb pvt ltd','jr softwaredeveloper','2023-02-13','2023-02-08',35,'2023-02-15 08:25:32'),(22,'acb pvt ltd','jr softwaredeveloper','2022-05-13','2023-01-11',37,'2023-02-15 08:37:45'),(23,'crazy pvt ltd','jr design','2017-05-13','2016-05-12',39,'2023-02-15 08:49:55'),(24,'crazy pvt ltd','jr softwaredeveloper','2017-04-07','2020-04-07',43,'2023-02-15 09:19:42'),(25,'crazy pvt ltd','jr softwaredeveloper','2017-04-07','2020-04-07',46,'2023-02-15 11:11:25'),(26,'crazy pvt ltd','jr softwaredeveloper','2017-04-07','2020-04-07',47,'2023-02-15 11:11:33'),(27,'acb pvt ltd','jr softwaredeveloper','2023-02-09','2023-02-17',49,'2023-02-15 11:39:13'),(28,'crazy pvt ltd','sr softwaredeveloper','2023-02-07','2023-02-16',49,'2023-02-15 11:39:13'),(29,'acb pvt ltd','jr softwaredeveloper','2023-02-09','2023-02-17',50,'2023-02-15 11:39:32'),(30,'crazy pvt ltd','sr softwaredeveloper','2023-02-07','2023-02-16',50,'2023-02-15 11:39:32'),(31,'acb pvt ltd','jr softwaredeveloper','2023-02-09','2023-02-17',51,'2023-02-15 11:40:07'),(32,'crazy pvt ltd','sr softwaredeveloper','2023-02-07','2023-02-16',51,'2023-02-15 11:40:07'),(33,'acb pvt ltd','jr softwaredeveloper','2023-02-09','2023-02-17',52,'2023-02-15 11:42:00'),(34,'crazy pvt ltd','sr softwaredeveloper','2023-02-07','2023-02-16',52,'2023-02-15 11:42:00'),(35,'acb pvt ltd','developer','2022-02-10','2022-12-29',53,'2023-02-15 12:04:41'),(36,'acb pvt ltd','developer','2022-02-10','2022-12-29',54,'2023-02-15 12:05:29'),(37,'acb pvt ltd','developer','2022-02-10','2022-12-29',55,'2023-02-15 12:10:15'),(38,'infomaniya pvt ltd','SEO','2019-05-12','2021-06-23',56,'2023-02-15 13:02:45'),(39,'acb pvt ltd','software devloper','2018-06-12','2019-07-12',57,'2023-02-16 03:19:07'),(40,'infomaniya pvt ltd','jr softwaredeveloper','2019-08-25','2021-09-12',57,'2023-02-16 03:19:07'),(41,'acb pvt ltd','software devloper','2018-06-12','2019-07-12',58,'2023-02-16 06:39:13'),(42,'infomaniya pvt ltd','jr softwaredeveloper','2020-02-17','2022-05-15',58,'2023-02-16 06:39:13'),(43,'crazy pvt ltd','developer','2023-02-10','2023-02-15',59,'2023-02-16 07:14:27'),(44,'crazy pvt ltd','developer','2023-02-10','2023-02-15',60,'2023-02-16 08:01:19'),(45,'crazy pvt ltd','developer','2020-03-12','2021-06-12',61,'2023-02-16 08:04:45');
/*!40000 ALTER TABLE `experience_master` ENABLE KEYS */;
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
