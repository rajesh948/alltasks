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
-- Table structure for table `candidate_master`
--

DROP TABLE IF EXISTS `candidate_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_master` (
  `cnd_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `relation` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `dob` varchar(45) NOT NULL,
  PRIMARY KEY (`cnd_id`),
  UNIQUE KEY `cand_id_UNIQUE` (`cnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_master`
--

LOCK TABLES `candidate_master` WRITE;
/*!40000 ALTER TABLE `candidate_master` DISABLE KEYS */;
INSERT INTO `candidate_master` VALUES (35,'rajesh','parmar','softwaredevlop','hndtjuy','rajeshparmar123@gmail.com','morbi','male','Andaman and Nicobar','Unmarried','363641','2v3AW4FTYH','7687678998','2023-02-15 08:25:32','2023-02-14'),(36,'ramesh','dave','data analysis','jamnagar road','rameshdave123@gmail.com','jamnagar','male','Andaman and Nicobar','Unmarried','675678','jamnagar 2','8907889776','2023-02-15 08:30:30','2001-11-11'),(37,'ramesh','dave','data analysis','jamnagar road','rameshdave123@gmail.com','jamnagar','male','Andaman and Nicobar','Unmarried','675678','jamnagar 2','8907889776','2023-02-15 08:37:44','2001-11-11'),(38,'shital','shah','design','rajkot 3','rameshdave123@gmail.com','rajkot','female','Gujarat','Unmarried','789897','rajokot 4','8907545678','2023-02-15 08:43:30','2001-05-04'),(39,'shital','shah','design','rajkot 3','rameshdave123@gmail.com','rajkot','female','Gujarat','Unmarried','789897','rajokot 4','8907545678','2023-02-15 08:49:55','2001-05-04'),(40,'shital','shah','design','rajkot 3','rameshdave123@gmail.com','rajkot','female','Gujarat','Unmarried','789897','rajokot 4','8907545678','2023-02-15 08:52:32','2001-05-04'),(41,'shital','shah','design','rajkot 3','rameshdave123@gmail.com','rajkot','female','Gujarat','Unmarried','789897','rajokot 4','8907545678','2023-02-15 08:55:11','2001-05-04'),(42,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 09:01:36','2000-11-01'),(43,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 09:19:42','2000-11-01'),(44,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 09:22:02','2000-11-01'),(45,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 09:30:25','2000-11-01'),(46,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 11:11:25','2000-11-01'),(47,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 11:11:33','2000-11-01'),(48,'kinjal','das','softwaredevlop','surat reva plot','kinjaldas12@gmail.com','surat','male','Gujarat','Unmarried','456767','surat rg road','6789876789','2023-02-15 11:34:49','2000-11-01'),(49,'sanjay','das','softwaredevlop','surat adsd','sanjaydas12@gmail.com','surat','male','Gujarat','Married','356787','surat acdgr','6789876789','2023-02-15 11:39:13','2001-05-04'),(50,'sanjay','das','softwaredevlop','surat adsd','sanjaydas12@gmail.com','surat','male','Gujarat','Married','356787','surat acdgr','6789876789','2023-02-15 11:39:32','2001-05-04'),(51,'sanjay','das','softwaredevlop','surat adsd','sanjaydas12@gmail.com','surat','male','Gujarat','Married','356787','surat acdgr','6789876789','2023-02-15 11:40:07','2001-05-04'),(52,'sanjay','das','softwaredevlop','surat adsd','sanjaydas12@gmail.com','surat','male','Gujarat','Married','356787','surat acdgr','6789876789','2023-02-15 11:42:00','2001-05-04'),(53,'sanjay','parmar','softwaredevlop','efrbgt','sanjayparmar12@gmail.com','morbi','male','Gujarat','Unmarried','363641','beasrgv','7687678998','2023-02-15 12:04:41','2001-05-01'),(54,'sanjay','parmar','softwaredevlop','efrbgt','sanjayparmar12@gmail.com','morbi','male','Gujarat','Unmarried','363641','beasrgv','7687678998','2023-02-15 12:05:29','2001-05-01'),(55,'sanjay','parmar','softwaredevlop','efrbgt','sanjayparmar12@gmail.com','morbi','male','Gujarat','Unmarried','363641','beasrgv','7687678998','2023-02-15 12:10:15','2001-05-01'),(56,'priya','mehta','marketing','crazy plaza 2 vadodara','priyamehta15@gmail.com','vadodara','female','Gujarat','Married','787867','main street no 2 near shivam hospital','7896789786','2023-02-15 13:02:45','1999-03-12'),(57,'prachi','khajuriya','softwaredevloper','jammu','prachi12@gmail.com','jammu','female','Jammu and Kashmir','Unmarried','700087','kashmir','6789876789','2023-02-16 03:19:07','2001-11-09'),(58,'sarad','patel','softwaredevloper','junagadh main road','saradpatel12@gmail.com','junagadh','male','Gujarat','Married','706768','duog ef pmto m rg otmh','6789876789','2023-02-16 06:39:13','1997-11-09'),(59,'Harsh','Patel','softwaredevloper','dsgser','h@gmail.com','surat','male','Andaman and Nicobar','Married','363641','fdgsgsd','7687678998','2023-02-16 07:14:27','2023-02-04'),(60,'vivek','vanad','softwaredevloper','dsgser','h@gmail.com','surat','male','Gujarat','Married','363641','fdgsgsd','7687678998','2023-02-16 08:01:19','2023-02-04'),(61,'kinjal','dave','softwaredevloper','q23','kinjal2@gmail.com','surat','female','Gujarat','Married','356787','ertyui','7687678998','2023-02-16 08:04:45','2002-05-12');
/*!40000 ALTER TABLE `candidate_master` ENABLE KEYS */;
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
