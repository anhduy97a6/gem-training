-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: db_demo_gem
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `attributes_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attributes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'role_gem'),(2,'regional'),(3,'serve_industries'),(6,'primary_benefits'),(7,'tech_stack'),(9,'status'),(11,'owner'),(12,'duration_development'),(19,'Conmercialized status'),(20,'test');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes_value`
--

DROP TABLE IF EXISTS `attributes_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes_value` (
  `attributes_value_id` int NOT NULL AUTO_INCREMENT,
  `attributes_id` int DEFAULT NULL,
  `solution_id` int DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attributes_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes_value`
--

LOCK TABLES `attributes_value` WRITE;
/*!40000 ALTER TABLE `attributes_value` DISABLE KEYS */;
INSERT INTO `attributes_value` VALUES (1,1,1,'Partial'),(2,2,1,'Singapore'),(3,3,1,'Insurance'),(6,6,1,'Payment_model'),(7,7,1,'Java ESB'),(9,9,1,'đã xong'),(11,11,1,'HoangNT'),(13,12,1,' http://'),(14,1,2,'Entires'),(15,2,2,'Denmark'),(16,3,2,'Enviroment'),(18,6,2,NULL),(19,7,2,'Java Spring'),(20,9,2,'1/2'),(21,11,2,'HuyNS'),(22,12,2,'http:/ confluences'),(34,19,1,NULL),(35,19,2,NULL),(36,20,1,NULL),(37,20,2,NULL);
/*!40000 ALTER TABLE `attributes_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_employee`
--

DROP TABLE IF EXISTS `dbo_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_employee`
--

LOCK TABLES `dbo_employee` WRITE;
/*!40000 ALTER TABLE `dbo_employee` DISABLE KEYS */;
INSERT INTO `dbo_employee` VALUES (1,'Đặng Ngọc Duy','duydn@gmail.com','duydn'),(2,'Phạm Quang Đạt ','danpq@gemvietnam.com','datpq'),(3,'Phạm Văn Trung','trungpv@gemvietnam.com','trungpv'),(4,'Nguyễn Văn Linh','linhnv@gemvietnam.com','linhnv'),(5,'Nguyễn Anh Khang','khangna@gemvietnam.com','khangna'),(6,'Nguyễn Anh Bình','binhna@gemvietnam.com','binhna'),(7,'Hoàng Trọng Bình','binhht@gemvietnam.com','binhht'),(10,'Đặng Văn Đức ','ducdv@gemvietnam.com','ducdv'),(11,'Lê Đình Long','longld@gemvietnam.com','longld'),(13,'Vũ Đức Trung','trungvd@gemvietnam.com','trungvd'),(17,'Nguyễn Đức Tiến','tiennd@gemvietnam.com','tiennd');
/*!40000 ALTER TABLE `dbo_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_employee_solution`
--

DROP TABLE IF EXISTS `dbo_employee_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_employee_solution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `solution_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_employee_solution`
--

LOCK TABLES `dbo_employee_solution` WRITE;
/*!40000 ALTER TABLE `dbo_employee_solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo_employee_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_solution`
--

DROP TABLE IF EXISTS `dbo_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_solution` (
  `solution_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`solution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_solution`
--

LOCK TABLES `dbo_solution` WRITE;
/*!40000 ALTER TABLE `dbo_solution` DISABLE KEYS */;
INSERT INTO `dbo_solution` VALUES (1,'KPMG AIA Payment Portal'),(2,'KICK ENGLISH');
/*!40000 ALTER TABLE `dbo_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-28 17:52:22
