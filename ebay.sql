CREATE DATABASE  IF NOT EXISTS `ebay` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ebay`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebay
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acknowledgement`
--

DROP TABLE IF EXISTS `acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledgement` (
  `ack_id` int(11) NOT NULL AUTO_INCREMENT,
  `ack` varchar(100) NOT NULL,
  `ack_topic` varchar(30) NOT NULL,
  PRIMARY KEY (`ack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledgement`
--

LOCK TABLES `acknowledgement` WRITE;
/*!40000 ALTER TABLE `acknowledgement` DISABLE KEYS */;
INSERT INTO `acknowledgement` VALUES (1,'RApS.in','RApS project'),(2,'Vijaya Porwal','Flow of project');
/*!40000 ALTER TABLE `acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_accounts`
--

DROP TABLE IF EXISTS `business_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_accounts` (
  `bsn_acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `bsn_acc_user_id` int(11) DEFAULT NULL,
  `bsn_acc_name` varchar(50) DEFAULT NULL,
  `bsn_acc_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bsn_acc_id`),
  KEY `bsn_acc_user_fk_idx` (`bsn_acc_user_id`),
  CONSTRAINT `bsn_acc_user_fk` FOREIGN KEY (`bsn_acc_user_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_accounts`
--

LOCK TABLES `business_accounts` WRITE;
/*!40000 ALTER TABLE `business_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `carts_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_user_id` int(11) DEFAULT NULL,
  `cart_item_id` int(11) DEFAULT NULL,
  `cart_coupon_id` int(11) DEFAULT NULL,
  `cart_quantity` int(11) DEFAULT NULL,
  `cart_price` float DEFAULT NULL,
  PRIMARY KEY (`carts_id`),
  KEY `cart_user_fk_idx` (`cart_user_id`),
  KEY `cart_item_fk_idx` (`cart_item_id`),
  KEY `cart_cpn_fk_idx` (`cart_coupon_id`),
  CONSTRAINT `cart_cpn_fk` FOREIGN KEY (`cart_coupon_id`) REFERENCES `coupons` (`coupons_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_item_fk` FOREIGN KEY (`cart_item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_user_fk` FOREIGN KEY (`cart_user_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cat_subcat`
--

DROP TABLE IF EXISTS `cat_subcat`;
/*!50001 DROP VIEW IF EXISTS `cat_subcat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cat_subcat` AS SELECT 
 1 AS `category_id`,
 1 AS `category_name`,
 1 AS `subcategory_id`,
 1 AS `subcategory_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cat_subcat_brands`
--

DROP TABLE IF EXISTS `cat_subcat_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_subcat_brands` (
  `cat_subcat_brands_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_subcat_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_subcat_brands_id`),
  KEY `brand_fk_idx` (`brand_id`),
  KEY `cat_subcat_brand_fk_idx` (`cat_subcat_id`),
  CONSTRAINT `brand_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cat_subcat_brand_fk` FOREIGN KEY (`cat_subcat_id`) REFERENCES `categories_subcategories` (`cat_subcat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_subcat_brands`
--

LOCK TABLES `cat_subcat_brands` WRITE;
/*!40000 ALTER TABLE `cat_subcat_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_subcat_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_subcat_options`
--

DROP TABLE IF EXISTS `cat_subcat_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_subcat_options` (
  `cat_subcat_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_subcat_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_subcat_options_id`),
  KEY `option_fk_idx` (`option_id`),
  KEY `cat_subcat_option_fk_idx` (`cat_subcat_id`),
  CONSTRAINT `cat_subcat_option_fk` FOREIGN KEY (`cat_subcat_id`) REFERENCES `categories_subcategories` (`cat_subcat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `option_fk` FOREIGN KEY (`option_id`) REFERENCES `options` (`options_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_subcat_options`
--

LOCK TABLES `cat_subcat_options` WRITE;
/*!40000 ALTER TABLE `cat_subcat_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_subcat_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Audio , Home Entertainment'),(2,'Cameras , Optics'),(3,'Data Storage'),(4,'Fashion'),(5,'Home , Living'),(6,'Laptops , Computer Peripherals'),(7,'Mobile Phones , Accessories'),(8,'Fragrances , Beauty , Health'),(9,'Other'),(10,'Stationaries');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_subcategories`
--

DROP TABLE IF EXISTS `categories_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_subcategories` (
  `cat_subcat_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_subcat_id`),
  KEY `cat_fk_idx` (`cat_id`),
  KEY `subcat_fk_idx` (`subcat_id`),
  CONSTRAINT `cat_fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subcat_fk` FOREIGN KEY (`subcat_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_subcategories`
--

LOCK TABLES `categories_subcategories` WRITE;
/*!40000 ALTER TABLE `categories_subcategories` DISABLE KEYS */;
INSERT INTO `categories_subcategories` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,5,16),(17,5,17),(18,5,18),(19,5,19),(20,6,20),(21,6,21),(22,6,22),(23,7,23),(24,7,24),(25,7,25),(26,7,26),(27,8,27),(28,8,28),(29,8,29),(30,8,30),(31,9,31),(32,9,32),(33,9,33),(34,9,34),(35,2,35),(36,6,36),(37,9,-1),(38,10,-1),(39,10,41);
/*!40000 ALTER TABLE `categories_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `coupons_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpn_code` varchar(15) DEFAULT NULL,
  `cpn_amount` float DEFAULT NULL,
  `cpn_validity` date DEFAULT NULL,
  PRIMARY KEY (`coupons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `item_advertisement`
--

DROP TABLE IF EXISTS `item_advertisement`;
/*!50001 DROP VIEW IF EXISTS `item_advertisement`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `item_advertisement` AS SELECT 
 1 AS `item_id`,
 1 AS `item_name`,
 1 AS `item_price`,
 1 AS `item_image`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_images`
--

DROP TABLE IF EXISTS `item_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_images` (
  `item_images_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_images_id`),
  KEY `image_item_fk_idx` (`item_id`),
  CONSTRAINT `image_item_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_images`
--

LOCK TABLES `item_images` WRITE;
/*!40000 ALTER TABLE `item_images` DISABLE KEYS */;
INSERT INTO `item_images` VALUES (2,2,'eclipse10.png'),(4,4,'eclipse12.png'),(10,10,'eclipse23.png'),(19,49,'eclipse19.png'),(20,11,'eclipse20.png'),(21,50,'eclipse21.png'),(22,51,'eclipse22.png'),(23,3,'eclipse11.png'),(24,5,'eclipse26.png'),(26,52,'eclipse27.png'),(27,6,'eclipse13.png'),(28,7,'eclipse14.png'),(29,8,'eclipse15.png'),(30,9,'eclipse16.png'),(31,53,'eclipse31.png'),(32,55,'eclipse32.png'),(33,56,'eclipse33.png'),(34,57,'eclipse34.png'),(37,60,'eclipse35.png'),(38,61,'eclipse38.png');
/*!40000 ALTER TABLE `item_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_sellers`
--

DROP TABLE IF EXISTS `item_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_sellers` (
  `item_seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_seller_id`),
  KEY `item_fk_idx` (`item_id`),
  KEY `seller_fk_idx` (`seller_id`),
  CONSTRAINT `item_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seller_fk` FOREIGN KEY (`seller_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_sellers`
--

LOCK TABLES `item_sellers` WRITE;
/*!40000 ALTER TABLE `item_sellers` DISABLE KEYS */;
INSERT INTO `item_sellers` VALUES (1,3,1),(2,2,1),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,3),(8,8,4),(9,9,4),(10,10,2),(11,11,3),(27,49,7),(28,50,7),(29,51,7),(30,49,7),(31,53,7),(32,55,7),(33,56,7),(37,60,4),(38,61,18);
/*!40000 ALTER TABLE `item_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `items_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` char(7) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_desc` varchar(500) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `item_adv` tinyint(4) DEFAULT NULL,
  `item_cat_id` int(11) DEFAULT NULL,
  `item_subcat_id` int(11) DEFAULT NULL,
  `item_discount` double DEFAULT NULL,
  `item_addfield1` varchar(50) DEFAULT NULL,
  `item_addfiled2` varchar(50) DEFAULT NULL,
  `item_isdeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`items_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `item_category_fk_idx` (`item_cat_id`),
  KEY `item_subcategory_fk_idx` (`item_subcat_id`),
  CONSTRAINT `item_category_fk` FOREIGN KEY (`item_cat_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `item_subcategory_fk` FOREIGN KEY (`item_subcat_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'I102','Sony Bravia KLV','BRAND NEW! SONY 22\" KLV-22P402C FULL HD LED TV With SONY INDIA Warranty',959,1,1,1,NULL,NULL,NULL,0),(3,'I103','SONY 22\" KLV-22P402C','New LG 32\" LED HD 32LF515A TV USB Movie LG LED TV 1 Yr LG India Warranty',1000,0,1,1,NULL,'',NULL,0),(4,'I201','XBOX ONE 500GB','BRAND NEW SEALED XBOX ONE 500GB CONSOLE FIFA 16 BUNDLE OFFICIAL INDIAN STOCK',1250,1,1,2,NULL,NULL,NULL,0),(5,'I202','SONY PSP PlayStation','SONY PSP PlayStation Portable E1004 CB Black or white Gaming Console 1game free',1575,1,1,2,NULL,NULL,NULL,0),(6,'I301','Philips Volcano SPA7000B','Philips Volcano SPA7000B/94 USB/SD/FM/Bluetooth (5.1CH Speaker System)',420,0,1,3,NULL,NULL,NULL,0),(7,'I401','Portable Bluetooth MP3','New Portable Bluetooth MP3+FM+SD+Mini Stereo Rechargable Speaker Device - BE-13.',23,0,1,4,NULL,NULL,NULL,0),(8,'I501','Sony SLT-A58','Sony SLT-A58 18-135mm Lens',740,0,2,0,NULL,NULL,NULL,0),(9,'I601','Camera Video Tripod Stand','SIMPEX 222 CAMERA VIDEO TRIPOD STAND FOR SLR DSLR',15,0,2,6,NULL,NULL,NULL,0),(10,'I104','Micromax 20B2','Micromax 20B22HD 20\'\' LED Television',250,1,1,1,NULL,NULL,NULL,0),(11,'I1201','Men\'s Leather Jacker','MEN\'S LEATHER JACKET 100% PURE BLACK LEATHER JACKET #MJ06',110,1,4,12,NULL,NULL,NULL,0),(49,'145','Edjoe Men\'s Shirt','Edjoe Men\'s Mauve Stripes Slim Fit Casual/Party Wear shirt, BLEDMS0033\r\nSize Available: S, M, L, Easy Return/Exchange',20,1,4,12,NULL,NULL,NULL,NULL),(50,'101','Reebok Shoes','Light Weight',89,1,4,14,NULL,NULL,NULL,NULL),(51,'201','Puma Shoes','Running Shoes',79,1,4,14,NULL,NULL,NULL,NULL),(52,'146','BABY POOL BATH ','INFLATABLE BABY POOL BATH WATER TUB FOR KIDS\r\nGeniue quality Fast Shipping Also On COD Available\r\n',25,1,9,34,NULL,NULL,NULL,NULL),(53,'212',' Apple Watch 42mm ','Deal 08: New Imported Apple Watch 42mm Space Gray Case Black Sport Band MJ3T2\r\n6 months International Warranty',300,1,4,13,NULL,NULL,NULL,NULL),(55,'455','Blackberry Z3','Blackberry Z3 - 8 GB - Black - Smartphone',300,0,7,23,NULL,NULL,NULL,NULL),(56,'1056','Pen drive','sdbsdkbjkgjk',84655,0,3,10,NULL,NULL,NULL,NULL),(57,'1235','nskjbfjk','ndnjknd',512,0,2,35,NULL,NULL,NULL,NULL),(60,'11152','hdshkfh','kjdsklfjflks',125,0,3,10,NULL,NULL,NULL,NULL),(61,'22','rahiul','sss',22,0,9,34,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `logs_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`logs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'Item with ID : I1204 is deleted'),(7,'Item with ID : I505 is deleted'),(8,'Item with ID : I205 is deleted'),(9,'Item with ID : I105 is deleted'),(10,'Item with ID : I105 is deleted'),(11,'Item with ID : 45 is deleted'),(12,'Item with ID : 89 is deleted'),(13,'Item with ID : 56 is added'),(14,'Item with ID : 58 is added'),(15,'Category with ID : 10 is deleted'),(16,'Category with ID : 10 is deleted'),(17,'Category with ID : 10 is deleted'),(18,'Item with ID : I10 is deleted'),(19,'Category with ID : 10 is deleted'),(20,'Category with ID : 10 is edited successfully'),(21,'Subcategory jsdbkbkdskjgwith ID40  is added successfully'),(22,'User with ID : S107 is registered'),(23,'User with ID : s109 is registered'),(24,'User with ID : s109 is registered'),(25,'User with ID : S111 is registered'),(26,'User with ID : S114 is registered'),(27,'User with ID : s1115 is registered'),(28,'User with ID : s115 is registered'),(29,'Item with ID : 59 is added'),(30,'Item with ID : 110 is deleted'),(31,'User with ID : s116 is registered'),(32,'Item with ID : 60 is added'),(33,'SubCategory with ID : 40 is Edited'),(34,'User with ID : s222 is registered'),(35,'Category with ID : 11 is Added'),(36,'Category with ID : 11 is Deleted'),(37,'Subcategory jwelwith ID : 41  is Added'),(38,'SubCategory with ID : 41 is Deleted'),(39,'Item with ID : 61 is added'),(40,'Category with ID : 11 is Added'),(41,'Category with ID : 12 is Added'),(42,'Category with ID : 13 is Added'),(43,'Category with ID : 10 is Added'),(44,'Subcategory Sharmawith ID : 41  is Added'),(45,'Category with ID : 10 is Deleted'),(46,'SubCategory with ID : 41 is Deleted'),(47,'Category with ID : 10 is Added'),(48,'Subcategory Bookswith ID : 41  is Added');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_groups`
--

DROP TABLE IF EXISTS `option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_groups` (
  `option_groups_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`option_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_groups`
--

LOCK TABLES `option_groups` WRITE;
/*!40000 ALTER TABLE `option_groups` DISABLE KEYS */;
INSERT INTO `option_groups` VALUES (1,'color'),(2,'size');
/*!40000 ALTER TABLE `option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `options_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_id` int(11) DEFAULT NULL,
  `option_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`options_id`),
  KEY `option_group_fk_idx` (`option_group_id`),
  CONSTRAINT `option_group_fk` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`option_groups_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'red'),(2,1,'blue'),(3,1,'green'),(4,2,'S'),(5,2,'M'),(6,2,'L'),(7,2,'XL'),(8,2,'XXL');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_order_id` int(11) DEFAULT NULL,
  `detail_item_id` int(11) DEFAULT NULL,
  `detail_quantity` int(11) DEFAULT NULL,
  `detail_price` float DEFAULT NULL,
  `detail_cancelled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`order_details_id`),
  KEY `detail_order_fk_idx` (`detail_order_id`),
  KEY `detail_item_fk_idx` (`detail_item_id`),
  CONSTRAINT `detail_item_fk` FOREIGN KEY (`detail_item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_order_fk` FOREIGN KEY (`detail_order_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_user_id` int(11) DEFAULT NULL,
  `order_user_addr_id` int(11) DEFAULT NULL,
  `order_amount` float DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_shipped` varchar(45) DEFAULT NULL,
  `order_tracking_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `user_fk_idx` (`order_user_id`),
  KEY `order_user_fk_idx` (`order_user_id`),
  KEY `order_user_addr_fk_idx` (`order_user_addr_id`),
  CONSTRAINT `order_user_addr_fk` FOREIGN KEY (`order_user_addr_id`) REFERENCES `user_addresses` (`user_addr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_user_fk` FOREIGN KEY (`order_user_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref`
--

DROP TABLE IF EXISTS `ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(100) NOT NULL,
  `ref_topic` varchar(30) NOT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref`
--

LOCK TABLES `ref` WRITE;
/*!40000 ALTER TABLE `ref` DISABLE KEYS */;
INSERT INTO `ref` VALUES (1,'raps.in','ebay Project'),(2,'http://stackoverflow.com/questions/12674064/how-to-save-a-bufferedimage-as-a-file','Image Store & Retrieval'),(3,'http://www.java4s.com/ajax/ajax-onchange-fetch-the-data-from-the-database/','Dynamic fetch from database');
/*!40000 ALTER TABLE `ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `stocks_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_item_id` int(11) DEFAULT NULL,
  `cat_subcat_options_id` int(11) DEFAULT NULL,
  `cat_subcat_brands_id` int(11) DEFAULT NULL,
  `stock_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`stocks_id`),
  KEY `stock_cat_subcat_options_fk_idx` (`cat_subcat_options_id`),
  KEY `stock_cat_subcat_brands_fk_idx` (`cat_subcat_brands_id`),
  KEY `stock_item_fk_idx` (`stock_item_id`),
  CONSTRAINT `stock_cat_subcat_brands_fk` FOREIGN KEY (`cat_subcat_brands_id`) REFERENCES `cat_subcat_brands` (`cat_subcat_brands_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_cat_subcat_options_fk` FOREIGN KEY (`cat_subcat_options_id`) REFERENCES `cat_subcat_options` (`cat_subcat_options_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_item_fk` FOREIGN KEY (`stock_item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (-1,NULL),(0,'Extra'),(1,'LCD, LED & Televisions'),(2,'Gaming Consoles'),(3,'Home Theatre & Accessories'),(4,'Portable Audio & Video'),(6,'Camera, Camcorder Accessories'),(7,'Film Cameras, SLRs'),(8,'Pen Drives'),(9,'Memory Cards'),(10,'Hard Drives'),(11,'Internal Hard Drives'),(12,'Clothing & Accessories'),(13,'Watches'),(14,'Shoes'),(15,'Jewellery & Precious Stones'),(16,'Kitchen & Dining'),(17,'Furniture'),(18,'Home Appliances'),(19,'Home Decor'),(20,'iPads & Tablets'),(21,'Wireless Networking'),(22,'PC Tools & Laptop Accessories'),(23,'Mobile Phones'),(24,'Mobile Accessories'),(25,'Cases, Pouches'),(26,'Bluetooth Devices'),(27,'Bath and Spa'),(28,'Perfumes'),(29,'Make Up'),(30,'Body & Skin Care'),(31,'Auto Accessories & Parts'),(32,'Books & Magazines'),(33,'Fitness & Sports'),(34,'Toys, Games & Baby'),(35,'SLR Camera Lenses'),(36,'Laptops'),(39,'Othersss'),(40,'hello'),(41,'Books');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `user_addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_addr1` varchar(45) DEFAULT NULL,
  `user_addr2` varchar(45) DEFAULT NULL,
  `user_city` varchar(45) DEFAULT NULL,
  `user_state` varchar(45) DEFAULT NULL,
  `user_pin` int(11) DEFAULT NULL,
  `user_country` varchar(45) DEFAULT NULL,
  `user_phone` char(10) DEFAULT NULL,
  `user_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_addr_id`),
  KEY `user_fk_idx` (`user_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_fname` varchar(20) NOT NULL,
  `user_lname` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'S101','Jane','Doe','jane.doe@gmail.com','janedoe',2),(2,'S102','Ezra','Carrel','ezra.carral@gmail.com','ezra',2),(3,'S103','Tom','Maines','tom.maines@gmail.com','tom',2),(4,'S104','Eddie','Bruton','eddie.bruton@gmail.com','eddie',2),(5,'S106','Anubhav Sharma',NULL,NULL,NULL,NULL),(7,'s105','rohit',NULL,NULL,NULL,NULL),(8,'s106','anubhav',NULL,NULL,NULL,NULL),(9,'S108','sanjeev',NULL,NULL,NULL,NULL),(10,'S107','Sanchit Pande',NULL,NULL,NULL,NULL),(11,'s109','Aditya Tiwari',NULL,NULL,NULL,NULL),(12,'s109','Aditya Tiwari',NULL,NULL,NULL,NULL),(13,'S111','dskjfdjk',NULL,NULL,NULL,NULL),(14,'S114','bsdjkjsdnk',NULL,NULL,NULL,NULL),(15,'s1115','fdfkfdkjk',NULL,NULL,NULL,NULL),(16,'s115','sdbjjsk',NULL,NULL,NULL,NULL),(17,'s116','Rahul Kumar',NULL,NULL,NULL,NULL),(18,'s222','Test',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cat_subcat`
--

/*!50001 DROP VIEW IF EXISTS `cat_subcat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cat_subcat` AS select `c`.`category_id` AS `category_id`,`c`.`category_name` AS `category_name`,`s`.`subcategory_id` AS `subcategory_id`,`s`.`subcategory_name` AS `subcategory_name` from ((`categories` `c` join `subcategories` `s`) join `categories_subcategories` `cs`) where ((`cs`.`cat_id` = `c`.`category_id`) and (`cs`.`subcat_id` = `s`.`subcategory_id`)) order by `c`.`category_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_advertisement`
--

/*!50001 DROP VIEW IF EXISTS `item_advertisement`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_advertisement` AS select `i`.`item_id` AS `item_id`,`i`.`item_name` AS `item_name`,`i`.`item_price` AS `item_price`,`ii`.`item_image` AS `item_image` from (`items` `i` join `item_images` `ii`) where ((`i`.`items_id` = `ii`.`item_id`) and (`i`.`item_adv` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-10 19:06:28
