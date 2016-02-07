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
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Audio & Home Entertainment'),(2,'Cameras & Optics'),(3,'Data Storage'),(4,'Fashion'),(5,'Home & Living'),(6,'Laptops & Computer Peripherals'),(7,'Mobile Phones & Accessories'),(8,'Fragrances, Beauty & Health'),(9,'Other');
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
  KEY `item_category_fk_idx` (`cat_id`),
  KEY `item_subcat_fk_idx` (`subcat_id`),
  CONSTRAINT `cat_fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subcat_fk` FOREIGN KEY (`subcat_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_subcategories`
--

LOCK TABLES `categories_subcategories` WRITE;
/*!40000 ALTER TABLE `categories_subcategories` DISABLE KEYS */;
INSERT INTO `categories_subcategories` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,5,16),(17,5,17),(18,5,18),(19,5,19),(20,6,20),(21,6,21),(22,6,22),(23,7,23),(24,7,24),(25,7,25),(26,7,26),(27,8,27),(28,8,28),(29,8,29),(30,8,30),(31,9,31),(32,9,32),(33,9,33),(34,9,34),(35,2,35),(36,6,36);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_images`
--

LOCK TABLES `item_images` WRITE;
/*!40000 ALTER TABLE `item_images` DISABLE KEYS */;
INSERT INTO `item_images` VALUES (1,2,'eclipse10.png'),(6,3,'eclipse10.png'),(7,10,'eclipse10.png'),(8,37,'eclipse10.png'),(9,38,'eclipse10.png'),(10,39,'eclipse10.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_sellers`
--

LOCK TABLES `item_sellers` WRITE;
/*!40000 ALTER TABLE `item_sellers` DISABLE KEYS */;
INSERT INTO `item_sellers` VALUES (1,3,1),(2,2,1),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,3),(8,8,4),(9,9,4),(10,10,2),(11,11,3),(14,35,4),(15,36,4),(16,37,4),(17,38,4),(18,39,4);
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
  `item_price` varchar(20) DEFAULT NULL,
  `item_adv` tinyint(4) DEFAULT NULL,
  `item_cat_id` int(11) DEFAULT NULL,
  `item_subcat_id` int(11) DEFAULT NULL,
  `item_discount` double DEFAULT NULL,
  `item_addfield1` varchar(50) DEFAULT NULL,
  `item_addfiled2` varchar(50) DEFAULT NULL,
  `item_isdeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`items_id`),
  KEY `item_category_fk_idx` (`item_cat_id`),
  KEY `item_subcategory_fk_idx` (`item_subcat_id`),
  CONSTRAINT `item_category_fk` FOREIGN KEY (`item_cat_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `item_subcategory_fk` FOREIGN KEY (`item_subcat_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'I102','Sony Bravia KLV','BRAND NEW! SONY 22\" KLV-22P402C FULL HD LED TV With SONY INDIA Warranty','959',1,1,1,NULL,NULL,NULL,0),(3,'I103','SONY 22\" KLV-22P402C','New LG 32\" LED HD 32LF515A TV USB Movie LG LED TV 1 Yr LG India Warranty','1000',1,1,1,NULL,'',NULL,0),(4,'I201','XBOX ONE 500GB','BRAND NEW SEALED XBOX ONE 500GB CONSOLE FIFA 16 BUNDLE OFFICIAL INDIAN STOCK','1250',1,1,2,NULL,NULL,NULL,0),(5,'I202','SONY PSP PlayStation','SONY PSP PlayStation Portable E1004 CB Black or white Gaming Console 1game free','1575',1,1,2,NULL,NULL,NULL,0),(6,'I301','Philips Volcano SPA7000B','Philips Volcano SPA7000B/94 USB/SD/FM/Bluetooth (5.1CH Speaker System)','420',1,1,3,NULL,NULL,NULL,0),(7,'I401','Portable Bluetooth MP3','New Portable Bluetooth MP3+FM+SD+Mini Stereo Rechargable Speaker Device - BE-13.','23',1,1,4,NULL,NULL,NULL,0),(8,'I501','Sony SLT-A58','Sony SLT-A58 18-135mm Lens','740',1,2,5,NULL,NULL,NULL,0),(9,'I601','Camera Video Tripod Stand','SIMPEX 222 CAMERA VIDEO TRIPOD STAND FOR SLR DSLR','15',1,2,6,NULL,NULL,NULL,0),(10,'I104','Micromax 20B2','Micromax 20B22HD 20\'\' LED Television','250',1,1,1,NULL,NULL,NULL,0),(11,'I1201','Men\'s Leather Jacker','MEN\'S LEATHER JACKET 100% PURE BLACK LEATHER JACKET #MJ06','110',1,4,12,NULL,NULL,NULL,0),(35,'123','Reebok Running Sport Shoes',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL),(36,'1256','Reebok Running Sport Shoes',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL),(37,'1258','Reebok Running Sport Shoes',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL),(38,'4568','Reebok Running Sport Shoes',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL),(39,'458','Reebok Running Sport Shoes',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
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
  `subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'LCD, LED & Televisions'),(2,'Gaming Consoles'),(3,'Home Theatre & Accessories'),(4,'Portable Audio & Video'),(5,'Digital Cameras'),(6,'Camera, Camcorder Accessories'),(7,'Film Cameras, SLRs'),(8,'Pen Drives'),(9,'Memory Cards'),(10,'Hard Drives'),(11,'Internal Hard Drives'),(12,'Clothing & Accessories'),(13,'Watches'),(14,'Shoes'),(15,'Jewellery & Precious Stones'),(16,'Kitchen & Dining'),(17,'Furniture'),(18,'Home Appliances'),(19,'Home Decor'),(20,'iPads & Tablets'),(21,'Wireless Networking'),(22,'PC Tools & Laptop Accessories'),(23,'Mobile Phones'),(24,'Mobile Accessories'),(25,'Cases, Pouches'),(26,'Bluetooth Devices'),(27,'Bath and Spa'),(28,'Perfumes'),(29,'Make Up'),(30,'Body & Skin Care'),(31,'Auto Accessories & Parts'),(32,'Books & Magazines'),(33,'Fitness & Sports'),(34,'Toys, Games & Baby'),(35,'SLR Camera Lenses'),(36,'Laptops');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'S101','Jane','Doe','jane.doe@gmail.com','janedoe',2),(2,'S102','Ezra','Carrel','ezra.carral@gmail.com','ezra',2),(3,'S103','Tom','Maines','tom.maines@gmail.com','tom',2),(4,'S104','Eddie','Bruton','eddie.bruton@gmail.com','eddie',2),(5,'S106','Anubhav Sharma',NULL,NULL,NULL,NULL);
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
/*!50001 VIEW `cat_subcat` AS select `c`.`category_id` AS `category_id`,`c`.`category_name` AS `category_name`,`s`.`subcategory_id` AS `subcategory_id`,`s`.`subcategory_name` AS `subcategory_name` from ((`categories` `c` join `subcategories` `s`) join `categories_subcategories` `cs`) where ((`cs`.`cat_id` = `c`.`category_id`) and (`cs`.`subcat_id` = `s`.`subcategory_id`)) */;
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

-- Dump completed on 2016-02-05  0:24:23
