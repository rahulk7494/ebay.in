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
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_accounts`
--

LOCK TABLES `business_accounts` WRITE;
/*!40000 ALTER TABLE `business_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cat_subcat_brands`
--

LOCK TABLES `cat_subcat_brands` WRITE;
/*!40000 ALTER TABLE `cat_subcat_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_subcat_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cat_subcat_options`
--

LOCK TABLES `cat_subcat_options` WRITE;
/*!40000 ALTER TABLE `cat_subcat_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_subcat_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Audio & Home Entertainment'),(2,'Cameras & Optics'),(3,'Data Storage'),(4,'Fashion'),(5,'Home & Living'),(6,'Laptops & Computer Peripherals'),(7,'Mobile Phones & Accessories'),(8,'Fragrances, Beauty & Health'),(9,'Other');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories_subcategories`
--

LOCK TABLES `categories_subcategories` WRITE;
/*!40000 ALTER TABLE `categories_subcategories` DISABLE KEYS */;
INSERT INTO `categories_subcategories` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,5,16),(17,5,17),(18,5,18),(19,5,19),(20,6,20),(21,6,21),(22,6,22),(23,7,23),(24,7,24),(25,7,25),(26,7,26),(27,8,27),(28,8,28),(29,8,29),(30,8,30),(31,9,31),(32,9,32),(33,9,33),(34,9,34),(35,2,35),(36,6,36);
/*!40000 ALTER TABLE `categories_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_images`
--

LOCK TABLES `item_images` WRITE;
/*!40000 ALTER TABLE `item_images` DISABLE KEYS */;
INSERT INTO `item_images` VALUES (2,2,'eclipse10.png'),(4,4,'eclipse12.png'),(10,10,'eclipse23.png'),(19,49,'eclipse19.png'),(20,11,'eclipse20.png'),(21,50,'eclipse21.png'),(22,51,'eclipse22.png'),(23,3,'eclipse11.png'),(24,5,'eclipse26.png'),(26,52,'eclipse27.png'),(27,6,'eclipse13.png'),(28,7,'eclipse14.png'),(29,8,'eclipse15.png'),(30,9,'eclipse16.png'),(31,53,'eclipse31.png'),(32,55,'eclipse32.png');
/*!40000 ALTER TABLE `item_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_sellers`
--

LOCK TABLES `item_sellers` WRITE;
/*!40000 ALTER TABLE `item_sellers` DISABLE KEYS */;
INSERT INTO `item_sellers` VALUES (1,3,1),(2,2,1),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,3),(8,8,4),(9,9,4),(10,10,2),(11,11,3),(27,49,7),(28,50,7),(29,51,7),(30,49,7),(31,53,7),(32,55,7);
/*!40000 ALTER TABLE `item_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'I102','Sony Bravia KLV','BRAND NEW! SONY 22\" KLV-22P402C FULL HD LED TV With SONY INDIA Warranty',959,1,1,1,NULL,NULL,NULL,0),(3,'I103','SONY 22\" KLV-22P402C','New LG 32\" LED HD 32LF515A TV USB Movie LG LED TV 1 Yr LG India Warranty',1000,0,1,1,NULL,'',NULL,0),(4,'I201','XBOX ONE 500GB','BRAND NEW SEALED XBOX ONE 500GB CONSOLE FIFA 16 BUNDLE OFFICIAL INDIAN STOCK',1250,1,1,2,NULL,NULL,NULL,0),(5,'I202','SONY PSP PlayStation','SONY PSP PlayStation Portable E1004 CB Black or white Gaming Console 1game free',1575,1,1,2,NULL,NULL,NULL,0),(6,'I301','Philips Volcano SPA7000B','Philips Volcano SPA7000B/94 USB/SD/FM/Bluetooth (5.1CH Speaker System)',420,0,1,3,NULL,NULL,NULL,0),(7,'I401','Portable Bluetooth MP3','New Portable Bluetooth MP3+FM+SD+Mini Stereo Rechargable Speaker Device - BE-13.',23,0,1,4,NULL,NULL,NULL,0),(8,'I501','Sony SLT-A58','Sony SLT-A58 18-135mm Lens',740,0,2,5,NULL,NULL,NULL,0),(9,'I601','Camera Video Tripod Stand','SIMPEX 222 CAMERA VIDEO TRIPOD STAND FOR SLR DSLR',15,0,2,6,NULL,NULL,NULL,0),(10,'I104','Micromax 20B2','Micromax 20B22HD 20\'\' LED Television',250,1,1,1,NULL,NULL,NULL,0),(11,'I1201','Men\'s Leather Jacker','MEN\'S LEATHER JACKET 100% PURE BLACK LEATHER JACKET #MJ06',110,1,4,12,NULL,NULL,NULL,0),(49,'145','Edjoe Men\'s Shirt','Edjoe Men\'s Mauve Stripes Slim Fit Casual/Party Wear shirt, BLEDMS0033\r\nSize Available: S, M, L, Easy Return/Exchange',20,1,4,12,NULL,NULL,NULL,NULL),(50,'101','Reebok Shoes','Light Weight',89,1,4,14,NULL,NULL,NULL,NULL),(51,'201','Puma Shoes','Running Shoes',79,1,4,14,NULL,NULL,NULL,NULL),(52,'145','BABY POOL BATH ','INFLATABLE BABY POOL BATH WATER TUB FOR KIDS\r\nGeniue quality Fast Shipping Also On COD Available\r\n',25,1,9,34,NULL,NULL,NULL,NULL),(53,'212',' Apple Watch 42mm ','Deal 08: New Imported Apple Watch 42mm Space Gray Case Black Sport Band MJ3T2\r\n6 months International Warranty',300,1,4,13,NULL,NULL,NULL,NULL),(55,'455','Blackberry Z3','Blackberry Z3 - 8 GB - Black - Smartphone',300,0,7,23,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'Item with ID : I1204 is deleted'),(7,'Item with ID : I505 is deleted'),(8,'Item with ID : I205 is deleted'),(9,'Item with ID : I105 is deleted'),(10,'Item with ID : I105 is deleted'),(11,'Item with ID : 45 is deleted'),(12,'Item with ID : 89 is deleted');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `option_groups`
--

LOCK TABLES `option_groups` WRITE;
/*!40000 ALTER TABLE `option_groups` DISABLE KEYS */;
INSERT INTO `option_groups` VALUES (1,'color'),(2,'size');
/*!40000 ALTER TABLE `option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'red'),(2,1,'blue'),(3,1,'green'),(4,2,'S'),(5,2,'M'),(6,2,'L'),(7,2,'XL'),(8,2,'XXL');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'LCD, LED & Televisions'),(2,'Gaming Consoles'),(3,'Home Theatre & Accessories'),(4,'Portable Audio & Video'),(5,'Digital Cameras'),(6,'Camera, Camcorder Accessories'),(7,'Film Cameras, SLRs'),(8,'Pen Drives'),(9,'Memory Cards'),(10,'Hard Drives'),(11,'Internal Hard Drives'),(12,'Clothing & Accessories'),(13,'Watches'),(14,'Shoes'),(15,'Jewellery & Precious Stones'),(16,'Kitchen & Dining'),(17,'Furniture'),(18,'Home Appliances'),(19,'Home Decor'),(20,'iPads & Tablets'),(21,'Wireless Networking'),(22,'PC Tools & Laptop Accessories'),(23,'Mobile Phones'),(24,'Mobile Accessories'),(25,'Cases, Pouches'),(26,'Bluetooth Devices'),(27,'Bath and Spa'),(28,'Perfumes'),(29,'Make Up'),(30,'Body & Skin Care'),(31,'Auto Accessories & Parts'),(32,'Books & Magazines'),(33,'Fitness & Sports'),(34,'Toys, Games & Baby'),(35,'SLR Camera Lenses'),(36,'Laptops');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'S101','Jane','Doe','jane.doe@gmail.com','janedoe',2),(2,'S102','Ezra','Carrel','ezra.carral@gmail.com','ezra',2),(3,'S103','Tom','Maines','tom.maines@gmail.com','tom',2),(4,'S104','Eddie','Bruton','eddie.bruton@gmail.com','eddie',2),(5,'S106','Anubhav Sharma',NULL,NULL,NULL,NULL),(7,'s105','rohit',NULL,NULL,NULL,NULL),(8,'s106','anubhav',NULL,NULL,NULL,NULL),(9,'S108','sanjeev',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-09 19:03:32
