-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (x86_64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `fk_assignment_taskCode` (`taskCode`),
  CONSTRAINT `fk_assignment_taskCode` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_assignment_volunteerId` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,3,'2025-01-15 08:30:00',NULL),(2,1,'2025-02-07 09:15:00',NULL),(2,2,'2025-02-13 10:15:00','2025-02-27 20:45:22'),(3,1,'2025-01-07 08:30:00',NULL),(3,2,'2025-01-23 08:30:00','2025-03-04 21:24:42'),(4,1,'2025-02-17 10:20:00',NULL),(4,3,'2025-01-24 07:25:00','2025-02-27 21:10:46'),(5,3,'2025-02-14 07:45:00','2025-02-27 23:30:10');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(60) DEFAULT NULL,
  `itemValue` decimal(10,2) DEFAULT NULL,
  `quantityOnHand` int DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Canned Soup',0.75,800),(2,'Bottle Water',0.50,7500),(3,'Bandages',0.05,1000),(4,'Canned Fruits',1.50,200),(5,'Toliet Paper',0.35,600),(6,'Canned Beans',0.75,200),(7,'Sport Drinks',1.25,300),(8,'Sickness Medicine',2.50,400),(9,'Canned Fruits',1.50,200),(10,'Hand Sanitizer',0.99,350);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int DEFAULT NULL,
  `packageTypeId` int DEFAULT NULL,
  `packageCreateDate` datetime DEFAULT NULL,
  `packageWeight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_taskCode` (`taskCode`),
  KEY `fk_packageTypeId` (`packageTypeId`),
  CONSTRAINT `fk_packageTypeId` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`),
  CONSTRAINT `fk_taskCode` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-02-28 00:00:00',10.00),(2,2,2,'2025-02-28 00:00:00',25.00),(3,3,3,'2025-03-01 00:00:00',5.00),(4,4,2,'2025-03-01 00:00:00',25.00),(5,5,1,'2025-02-28 00:00:00',10.00),(6,6,2,'2025-02-28 00:00:00',25.00),(7,7,3,'2025-03-01 00:00:00',5.00),(8,3,2,'2025-03-01 00:00:00',25.00),(9,8,1,'2025-02-28 00:00:00',10.00),(10,10,2,'2025-02-28 00:00:00',25.00);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int DEFAULT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_package_contents_packageId` (`packageId`),
  CONSTRAINT `fk_package_contents_itemId` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_package_contents_packageId` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,3,10),(2,1,3),(2,2,4),(3,1,6),(3,2,5),(4,3,4),(5,4,5),(6,6,18),(7,7,2),(8,8,3),(9,9,4),(10,10,2);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'Basic Medical'),(2,'Child-Care'),(3,'Food');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(30) DEFAULT NULL,
  `packingListDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Basic Medical','First Aid Kit, Over counter Medicine'),(2,'Child-Care','Essential Child needs'),(3,'Food','Food items that last a long time');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int DEFAULT NULL,
  `taskStatusId` int DEFAULT NULL,
  `taskDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk_packingListId` (`packingListId`),
  KEY `fk_taskTypeId` (`taskTypeId`),
  KEY `fk_taskStatusId` (`taskStatusId`),
  CONSTRAINT `fk_packingListId` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk_taskStatusId` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk_taskTypeId` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,4,3,'Please make 300 medical kits every 2 weeks'),(2,2,2,2,'1500 child-care packages are need'),(3,3,3,1,'Prepare 2000 food packages'),(4,2,1,1,'Esstential Child-Care package kits are needed'),(5,1,1,2,'Please make 300 medical kits every 2 weeks'),(6,2,1,2,'1500 child-care packages are need'),(7,3,2,3,'Prepare 2000 food packages'),(8,2,2,3,'Esstential Child-Care package kits are needed'),(9,1,3,1,'Please make 300 medical kits every 2 weeks'),(10,2,4,1,'1500 child-care packages are need');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'Open'),(2,'Closed'),(3,'Ongoing');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'Recurring'),(2,'Mandatory'),(3,'Bi-Weekly'),(4,'Stable');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(30) DEFAULT NULL,
  `volunteerAddress` varchar(50) DEFAULT NULL,
  `volunteerTelephone` char(12) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Joshua Fan','626 First Ave','222-323-1111'),(2,'Ivan Keith','321 Second Ave','222-525-2222'),(3,'Kyle La','917 Third Ave','222-491-3323'),(4,'Will Kelley','713 Fourth Ave','222-641-4487'),(5,'Matthew Ho','153 Fifth Ave','222-782-5581'),(6,'Alex Xie','545 First Ave','333-232-5555'),(7,'Tyler Shang','123 Second Ave','333-252-4444'),(8,'Patty Wu','387 Third Ave','333-194-3333'),(9,'Jake Tran','372 Fourth Ave','333-146-2222'),(10,'Irene Park','328 Fifth Ave','333-287-1111');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-01 17:50:01
