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
-- Table structure for table `option_master`
--

DROP TABLE IF EXISTS `option_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_name` varchar(45) NOT NULL,
  `select_key` varchar(45) NOT NULL,
  `option_key` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_option_master_1_idx` (`select_key`),
  CONSTRAINT `fk_option_master_1` FOREIGN KEY (`select_key`) REFERENCES `select_master` (`select_key`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_master`
--

LOCK TABLES `option_master` WRITE;
/*!40000 ALTER TABLE `option_master` DISABLE KEYS */;
INSERT INTO `option_master` VALUES (1,'10th','coursekey','10th'),(2,'12th','coursekey','12th'),(3,'graduation','coursekey','graduation'),(4,'post graduation','coursekey','post graduation'),(5,'Married','relationkey','Married'),(6,'Unmarried','relationkey','Unmarried'),(7,'Andaman and Nicobar','statekey','an'),(8,'Andhra Pradesh','statekey','ap'),(9,'Assam','statekey','as'),(10,'Bihar','statekey','br'),(11,'Chandigarh','statekey','ch'),(12,'Chhattisgarh','statekey','ct'),(13,'Dadra and Nagar','statekey','dn'),(14,'Delhi','statekey','dl'),(15,'Goa','statekey','ga'),(16,'Gujarat','statekey','gj'),(17,'Haryana','statekey','hr'),(18,'Himachal Pradesh','statekey','hp'),(19,'Jammu and Kashmir','statekey','jk'),(20,'Jharkhand','statekey','jh'),(21,'Karnataka','statekey','ka'),(22,'kerala','statekey','kl'),(23,'Gujarati','languagekey','gujarati'),(24,'Hindi','languagekey','hindi'),(25,'English','languagekey','eng'),(26,'Spanish','languagekey','spanish'),(27,'PHP','technologykey','php'),(28,'Mysql','technologykey','mysql'),(29,'Laravel','technologykey','laravel'),(30,'Oracle','technologykey','oracle'),(31,'Ahmedabad','preflocationkey','ahmedabad'),(32,'Pune','preflocationkey','pune'),(33,'Delhi','preflocationkey','delhi'),(34,'Chennai','preflocationkey','chennai'),(35,'Rajkot','preflocationkey','rajkot'),(36,'Software Devlopment','departmentkey','softwaredevlopment'),(37,'Design','departmentkey','design'),(38,'Marketing','departmentkey','marketing'),(39,'Quality Analysis','departmentkey','qualityanalysis'),(40,'Data Engineer','departmentkey','dataeng');
/*!40000 ALTER TABLE `option_master` ENABLE KEYS */;
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
