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
-- Temporary view structure for view `cat_subcat`
--

DROP TABLE IF EXISTS `cat_subcat`;
/*!50001 DROP VIEW IF EXISTS `cat_subcat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cat_subcat` AS SELECT 
 1 AS `category_name`,
 1 AS `subcategory_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `id` char(7) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `sellerid` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `advitem` tinyint(4) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `addfield1` varchar(50) DEFAULT NULL,
  `addfiled2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'12','appleiphone',NULL,NULL,'123',12.02,1,'bdsj','njsdhb',NULL,NULL),(2,'23','nkjdsnkn',NULL,NULL,'23',20.22,0,'dbwhj','ndj',NULL,NULL),(3,'525','nfdkj',NULL,NULL,'12',2022,1,'dsbjkd','ndjsd',NULL,NULL),(5,'152','kumar',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'15232','hyearts',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'452','hearts',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'856','hea',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'951','lkjh',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'654','lkjhdg',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'258','qwer',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2542','qwert',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'222','olfmfmk',NULL,'Desert-lg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'14','habdj',NULL,'hearts1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'254','kkksdn',NULL,'out.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_categories`
--

DROP TABLE IF EXISTS `item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_categories`
--

LOCK TABLES `item_categories` WRITE;
/*!40000 ALTER TABLE `item_categories` DISABLE KEYS */;
INSERT INTO `item_categories` VALUES (1,'Audio & Home Entertainment'),(2,'Cameras & Optics'),(3,'Data Storage'),(4,'Fashion'),(5,'Home & Living'),(6,'Laptops & Computer Peripherals'),(7,'Mobile Phones & Accessories'),(8,'Fragrances, Beauty & Health'),(9,'Other');
/*!40000 ALTER TABLE `item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_options`
--

DROP TABLE IF EXISTS `item_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_cat` int(11) DEFAULT NULL,
  `item_subcat` int(11) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `item_category_fk_idx` (`item_cat`),
  KEY `item_subcat_fk_idx` (`item_subcat`),
  CONSTRAINT `item_cat_fk` FOREIGN KEY (`item_cat`) REFERENCES `item_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `item_subcat_fk` FOREIGN KEY (`item_subcat`) REFERENCES `item_subcategories` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_options`
--

LOCK TABLES `item_options` WRITE;
/*!40000 ALTER TABLE `item_options` DISABLE KEYS */;
INSERT INTO `item_options` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,5,16),(17,5,17),(18,5,18),(19,5,19),(20,6,20),(21,6,21),(22,6,22),(23,7,23),(24,7,24),(25,7,25),(26,7,26),(27,8,27),(28,8,28),(29,8,29),(30,8,30),(31,9,31),(32,9,32),(33,9,33),(34,9,34),(35,2,35),(36,6,36);
/*!40000 ALTER TABLE `item_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_seller`
--

DROP TABLE IF EXISTS `item_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_seller` (
  `itemid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`,`sellerid`),
  KEY `seller_idx` (`sellerid`),
  CONSTRAINT `item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seller` FOREIGN KEY (`sellerid`) REFERENCES `seller` (`sellerid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_seller`
--

LOCK TABLES `item_seller` WRITE;
/*!40000 ALTER TABLE `item_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_subcategories`
--

DROP TABLE IF EXISTS `item_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_subcategories` (
  `subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_subcategories`
--

LOCK TABLES `item_subcategories` WRITE;
/*!40000 ALTER TABLE `item_subcategories` DISABLE KEYS */;
INSERT INTO `item_subcategories` VALUES (1,'LCD, LED & Televisions'),(2,'Gaming Consoles'),(3,'Home Theatre & Accessories'),(4,'Portable Audio & Video'),(5,'Digital Cameras'),(6,'Camera, Camcorder Accessories'),(7,'Film Cameras, SLRs'),(8,'Pen Drives'),(9,'Memory Cards'),(10,'Hard Drives'),(11,'Internal Hard Drives'),(12,'Clothing & Accessories'),(13,'Watches'),(14,'Shoes'),(15,'Jewellery & Precious Stones'),(16,'Kitchen & Dining'),(17,'Furniture'),(18,'Home Appliances'),(19,'Home Decor'),(20,'iPads & Tablets'),(21,'Wireless Networking'),(22,'PC Tools & Laptop Accessories'),(23,'Mobile Phones'),(24,'Mobile Accessories'),(25,'Cases, Pouches'),(26,'Bluetooth Devices'),(27,'Bath and Spa'),(28,'Perfumes'),(29,'Make Up'),(30,'Body & Skin Care'),(31,'Auto Accessories & Parts'),(32,'Books & Magazines'),(33,'Fitness & Sports'),(34,'Toys, Games & Baby'),(35,'SLR Camera Lenses'),(36,'Laptops');
/*!40000 ALTER TABLE `item_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `sellerid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sellerid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'12','bdsjhbj','dshbfjb'),(2,'12123','sbjkfkjsbk','jdbjgsjdv'),(3,'12123','sbjkfkjsbk','d ksld sndlnl'),(4,'12','rahul','nsbksbkf'),(5,'13','rohit','dnsngslk'),(6,'15','vishal','fnkjnfjsnsf'),(7,'1256','Sanchit Pande','IIITB'),(8,'125','Sanchit Pande','IIITB'),(9,'123','Rahul Kumar','IIITB'),(10,'145','Rohit','IIITB'),(11,'','',''),(12,'','',''),(13,'a','a','');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
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
/*!50001 VIEW `cat_subcat` AS select `t2`.`category_name` AS `category_name`,`t3`.`subcategory_name` AS `subcategory_name` from ((`item_options` `t1` join `item_categories` `t2`) join `item_subcategories` `t3`) where ((`t1`.`item_cat` = `t2`.`category_id`) and (`t1`.`item_subcat` = `t3`.`subcategory_id`)) */;
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

-- Dump completed on 2016-01-28 14:46:49
