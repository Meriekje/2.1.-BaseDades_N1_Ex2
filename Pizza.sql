-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Classical'),(2,'Special'),(3,'Pizza of the Day');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `town` varchar(50) NOT NULL,
  `id_town` int DEFAULT NULL,
  `province` varchar(50) NOT NULL,
  `id_province` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `clients_ibfk_2` (`id_province`),
  KEY `fk_location_client` (`id_town`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_town`) REFERENCES `locations` (`id_town`),
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id_province`) REFERENCES `provinces` (`id_province`),
  CONSTRAINT `fk_location_client` FOREIGN KEY (`id_town`) REFERENCES `locations` (`id_town`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Meritxell','Ara Franco','c/Mallorca, 20','8029','Barcelona',1,'Barcelona',1,'123456789'),(2,'Ana','Benet Struch','c/Joan Maragall, 56','17004','Girona',2,'Girona',2,'987654321'),(3,'Meritxell','Ara Franco','c/Mallorca, 20','43205','Reus',3,'Tarragona',4,'963852741');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_deliveryman` int NOT NULL,
  `delivery_datetime` datetime NOT NULL,
  `delivery_status` enum('pending','delivered','failed') DEFAULT 'pending',
  PRIMARY KEY (`id_delivery`),
  KEY `id_order` (`id_order`),
  KEY `id_deliveryman` (`id_deliveryman`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`id_deliveryman`) REFERENCES `employees` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,2,'2025-03-25 12:30:00','delivered'),(2,3,4,'2025-03-25 12:30:00','delivered');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `type_employee` enum('cook','deliveryman') NOT NULL,
  `id_shop` int DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `employees_ibfk_1` (`id_shop`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Carlos','Gomez','EMP001','654321987','cook',1),(2,'Laura','Fernandez','EMP002','678123456','deliveryman',2),(3,'Jordi','Martinez','EMP003','612345678','cook',1),(4,'Marta','Lopez','EMP004','690123456','deliveryman',3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id_town` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_province` int DEFAULT NULL,
  PRIMARY KEY (`id_town`),
  KEY `fk_location_province` (`id_province`),
  CONSTRAINT `fk_location_province` FOREIGN KEY (`id_province`) REFERENCES `provinces` (`id_province`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Lleida',1),(2,'Vielha',1),(3,'Girona',2),(4,'Figueres',2),(5,'Barcelona',3),(6,'Tarragona',4),(7,'Reus',4),(8,'Sant Cugat',3);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `order_type` enum('distribution','collection') NOT NULL,
  `total_products` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `id_client` int DEFAULT NULL,
  `id_shop` int DEFAULT NULL,
  `id_employee` int DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_client` (`id_client`),
  KEY `id_shop` (`id_shop`),
  KEY `id_deliveryman` (`id_employee`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-03-18 12:30:00','distribution',3,35.50,1,1,2),(2,'2024-03-18 13:00:00','collection',2,25.00,1,1,NULL),(3,'2024-03-18 14:15:00','distribution',4,50.75,1,1,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `id_pizza` int NOT NULL AUTO_INCREMENT,
  `id_category` int DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  PRIMARY KEY (`id_pizza`),
  KEY `id_category` (`id_category`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `pizzas_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  CONSTRAINT `pizzas_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES (1,1,1),(2,1,5);
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_orders` (
  `id_products_orders` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_products_orders`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `product_orders_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `product_orders_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (1,1,1,1),(2,1,3,2),(3,2,5,1),(4,2,4,1),(5,3,2,2),(6,3,6,2);
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_category` int DEFAULT NULL,
  `type` enum('pizza','hamburger','drink') NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_product_category` (`id_category`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Hawaïana','an Italian can die because of your poor choices, but be my guest',NULL,14.50,2,'pizza'),(2,'Chicken','chicken burger',NULL,13.00,NULL,'hamburger'),(3,'Coke','coke',NULL,2.50,NULL,'drink'),(4,'Water','still water',NULL,4.00,NULL,'drink'),(5,'Margarita','the most basic pizza ever',NULL,10.75,2,'pizza'),(6,'Veggie','hamburguer',NULL,12.50,NULL,'hamburger'),(7,'Pepperoni','pizza with pepperoni',NULL,15.00,1,'pizza'),(8,'Four Cheese','pizza with cheese',NULL,17.50,1,'pizza'),(9,'Vegetarian','pizza for vegetarians',NULL,16.00,1,'pizza'),(10,'BBQ Chicken','pizza for meat lovers',NULL,18.00,3,'pizza');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id_province` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Lleida'),(2,'Girona'),(3,'Barcelona'),(4,'Tarragona');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id_shop` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `id_town` int NOT NULL,
  `id_province` int NOT NULL,
  `town` varchar(100) NOT NULL,
  `province` varchar(300) NOT NULL,
  PRIMARY KEY (`id_shop`),
  KEY `id_province` (`id_province`),
  KEY `fk_location_shop` (`id_town`),
  CONSTRAINT `fk_location_shop` FOREIGN KEY (`id_town`) REFERENCES `locations` (`id_town`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'c/456, 97','17005',3,2,'Girona','Girona'),(2,'c/123, 25','43201',7,4,'Reus','Tarragona'),(3,'c/321, 68','8174',8,3,'Sant Cugat','Barcelona'),(4,'c/456, 97','8001',5,3,'Barcelona','Barcelona');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 23:27:02
