-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: brightsparkdb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `category_table`
--

DROP TABLE IF EXISTS `category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_table` (
  `CategoryID` varchar(10) NOT NULL,
  `CategoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_table`
--

LOCK TABLES `category_table` WRITE;
/*!40000 ALTER TABLE `category_table` DISABLE KEYS */;
INSERT INTO `category_table` VALUES ('CT001','Television'),('CT002','Tablet'),('CT003','Laptop'),('CT004','AirPods'),('CT005','Keyboard');
/*!40000 ALTER TABLE `category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_table`
--

DROP TABLE IF EXISTS `inventory_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_table` (
  `InventoryID` varchar(10) NOT NULL,
  `Quantity_Sold` int DEFAULT NULL,
  `Quantity_on_Order` int DEFAULT NULL,
  `Current_Stock_Levels` int DEFAULT NULL,
  `ProductID(FK)` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`InventoryID`),
  KEY `proID_idx` (`ProductID(FK)`),
  CONSTRAINT `proID` FOREIGN KEY (`ProductID(FK)`) REFERENCES `product_table` (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_table`
--

LOCK TABLES `inventory_table` WRITE;
/*!40000 ALTER TABLE `inventory_table` DISABLE KEYS */;
INSERT INTO `inventory_table` VALUES ('INV001',10,5,20,'P001'),('INV002',6,5,5,'P002'),('INV003',4,9,4,'P003'),('INV004',9,10,5,'P004'),('INV005',13,15,6,'P005');
/*!40000 ALTER TABLE `inventory_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_table` (
  `Product ID` varchar(10) NOT NULL,
  `Product Name` varchar(45) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `SupplierID(FK)` varchar(10) DEFAULT NULL,
  `CategoryID(FK)` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Product ID`),
  KEY `SupID_idx` (`SupplierID(FK)`),
  KEY `catID_idx` (`CategoryID(FK)`),
  CONSTRAINT `catID` FOREIGN KEY (`CategoryID(FK)`) REFERENCES `category_table` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supID` FOREIGN KEY (`SupplierID(FK)`) REFERENCES `supplier_table` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES ('P001','Samsung 55\" Smart TV','4K UHD LED TV',1299.00,'S001','CT001'),('P002','Apple iPad Pro 11\"','256GB Storage, WiFi, M5 Chip',1949.00,'S002','CT002'),('P003','Lenovo Chromebook 500e 11.6\"','4GB Ram, 64GB eMMC, 2in1 Flip Laptop',1586.00,'S003','CT003'),('P004','Apple AirPod Pro 3','True Wireless In-Ear with Magsafe Charging Case',439.00,'S004','CT004'),('P005','Razer Huntsman Gaming Keyboard','Mini 60%, RGB',157.00,'S005','CT005'),('P006','Duplicate Product Test',NULL,19.99,NULL,NULL),('P998','TestProduct','Test description',12.99,'S001','CT001'),('P999','TestProduct','Test description',12.99,'S001','CT001');
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_table`
--

DROP TABLE IF EXISTS `sales_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_table` (
  `Sales Transaction ID` varchar(10) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Total Sales Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Sales Transaction ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_table`
--

LOCK TABLES `sales_table` WRITE;
/*!40000 ALTER TABLE `sales_table` DISABLE KEYS */;
INSERT INTO `sales_table` VALUES ('STX1001','2025-09-20','11:00:00',2598.00),('STX1002','2025-09-22','15:30:00',1299.00),('STX1003','2025-09-21','10:30:00',3898.00),('STX1004','2025-09-24','11:15:00',1949.00),('STX1005','2025-09-26','14:40:00',5847.00),('STX1006','2025-09-26','15:45:00',586.00),('STX1007','2025-09-27','10:15:00',1172.00),('STX1008','2025-09-21','12:30:00',439.00),('STX1009','2025-09-28','04:45:00',439.00),('STX1010','2025-09-23','10:15:00',157.00),('STX1011','2025-09-24','11:30:00',314.00),('STX1012','2025-09-24','12:14:00',132.00),('STX1013','2025-09-25','09:30:00',414.00);
/*!40000 ALTER TABLE `sales_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_relationship_table`
--

DROP TABLE IF EXISTS `sold_relationship_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_relationship_table` (
  `ProductID(FK)` varchar(10) NOT NULL,
  `Sales_TransactionID(FK)` varchar(10) NOT NULL,
  `Quantities` int DEFAULT NULL,
  PRIMARY KEY (`ProductID(FK)`,`Sales_TransactionID(FK)`),
  KEY `stID_idx` (`Sales_TransactionID(FK)`),
  CONSTRAINT `stID` FOREIGN KEY (`Sales_TransactionID(FK)`) REFERENCES `sales_table` (`Sales Transaction ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_relationship_table`
--

LOCK TABLES `sold_relationship_table` WRITE;
/*!40000 ALTER TABLE `sold_relationship_table` DISABLE KEYS */;
INSERT INTO `sold_relationship_table` VALUES ('P001','STX1001',2),('P001','STX1002',1),('P002','STX1003',2),('P002','STX1004',1),('P002','STX1005',3),('P003','STX1006',1),('P003','STX1007',2),('P004','STX1008',1),('P004','STX1009',1),('P005','STX1010',1),('P005','STX1011',2);
/*!40000 ALTER TABLE `sold_relationship_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_table`
--

DROP TABLE IF EXISTS `supplier_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_table` (
  `SupplierID` varchar(10) NOT NULL,
  `Supplier_Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_table`
--

LOCK TABLES `supplier_table` WRITE;
/*!40000 ALTER TABLE `supplier_table` DISABLE KEYS */;
INSERT INTO `supplier_table` VALUES ('S001','Tech Source Ltd','45 Queen St, Auckland','09-445-6789'),('S002','Circuit World Ltd','144 King Street, Hamilton','07-839-1101'),('S003','Plasma City Ltd','67 Nexus Road, Tauranga','07-281-6767'),('S004','Solder City Ltd','389 Great South Highway, Christchurch','09-427-332'),('S005','Cavern Keyboards Ltd','247 Koromiko St, Rotorua','07-3492-150');
/*!40000 ALTER TABLE `supplier_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-01 14:15:19
