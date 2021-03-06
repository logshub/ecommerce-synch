-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 192.168.1.141    Database: testdatabase
-- ------------------------------------------------------
-- Server version	5.5.62-0+deb8u1

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
-- Table structure for table `newprefix_category`
--

DROP TABLE IF EXISTS `newprefix_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_root_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  KEY `level_depth` (`level_depth`),
  KEY `nright` (`nright`),
  KEY `activenleft` (`active`,`nleft`),
  KEY `activenright` (`active`,`nright`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_category`
--

LOCK TABLES `newprefix_category` WRITE;
/*!40000 ALTER TABLE `newprefix_category` DISABLE KEYS */;
INSERT INTO `newprefix_category` VALUES (1,0,1,0,1,20,1,'2019-04-19 11:38:47','2019-04-19 11:38:47',0,0),(2,1,1,1,2,19,1,'2019-04-19 11:38:48','2019-04-19 11:38:48',0,1),(3,2,1,2,3,8,1,'2019-04-19 11:40:30','2019-04-19 11:40:30',0,0),(4,3,1,3,4,5,1,'2019-04-19 11:40:32','2019-04-19 11:40:32',0,0),(5,3,1,3,6,7,1,'2019-04-19 11:40:33','2019-04-19 11:40:33',0,0),(6,2,1,2,9,16,1,'2019-04-19 11:40:34','2019-04-19 11:40:34',0,0),(7,6,1,3,10,11,1,'2019-04-19 11:40:35','2019-04-19 11:40:35',0,0),(8,6,1,3,12,15,1,'2019-04-19 11:40:35','2019-04-19 11:40:35',0,0),(9,2,1,2,17,18,1,'2019-04-19 11:40:37','2019-04-19 11:40:37',0,0),(10,8,1,4,13,14,1,'2019-04-19 11:13:29','2019-04-24 10:44:29',0,0);
/*!40000 ALTER TABLE `newprefix_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_category_lang`
--

DROP TABLE IF EXISTS `newprefix_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_category_lang`
--

LOCK TABLES `newprefix_category_lang` WRITE;
/*!40000 ALTER TABLE `newprefix_category_lang` DISABLE KEYS */;
INSERT INTO `newprefix_category_lang` VALUES (1,1,1,'Root','','root','','',''),(2,1,1,'Home','','home','','',''),(3,1,1,'Clothes','','clothes','','',''),(4,1,1,'Men','','men','','',''),(5,1,1,'Women','','women','','',''),(6,1,1,'Accessories','','accessories','','',''),(7,1,1,'Stationery','','stationery','','',''),(8,1,1,'Home Accessories','','home-accessories','','',''),(9,1,1,'Art','','art','','',''),(10,1,1,'Other','','other','','','');
/*!40000 ALTER TABLE `newprefix_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_category_product`
--

DROP TABLE IF EXISTS `newprefix_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_product` (`id_product`),
  KEY `id_category` (`id_category`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_category_product`
--

LOCK TABLES `newprefix_category_product` WRITE;
/*!40000 ALTER TABLE `newprefix_category_product` DISABLE KEYS */;
INSERT INTO `newprefix_category_product` VALUES (2,1,1),(2,2,2),(2,3,3),(2,4,4),(2,5,5),(2,6,6),(2,7,7),(2,8,8),(2,9,9),(2,10,10),(2,11,11),(2,12,12),(2,13,13),(2,14,14),(2,15,15),(2,16,16),(2,17,17),(2,18,18),(2,19,19),(3,1,1),(3,2,2),(4,1,1),(5,2,1),(6,7,1),(6,6,2),(6,8,3),(6,10,4),(6,9,5),(6,11,6),(6,15,7),(6,16,8),(6,17,9),(6,18,10),(6,19,11),(7,16,1),(7,17,2),(7,18,3),(8,6,1),(8,7,2),(8,8,3),(8,9,4),(8,10,5),(8,11,6),(8,15,7),(8,19,8),(9,3,1),(9,4,2),(9,5,3),(9,12,4),(9,13,5),(9,14,6),(9,15,7);
/*!40000 ALTER TABLE `newprefix_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_currency`
--

DROP TABLE IF EXISTS `newprefix_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_currency`
--

LOCK TABLES `newprefix_currency` WRITE;
/*!40000 ALTER TABLE `newprefix_currency` DISABLE KEYS */;
INSERT INTO `newprefix_currency` VALUES (1,'US Dollar','USD',1.000000,0,1);
/*!40000 ALTER TABLE `newprefix_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_currency_shop`
--

DROP TABLE IF EXISTS `newprefix_currency_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_currency_shop` (
  `id_currency` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_currency`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_currency_shop`
--

LOCK TABLES `newprefix_currency_shop` WRITE;
/*!40000 ALTER TABLE `newprefix_currency_shop` DISABLE KEYS */;
INSERT INTO `newprefix_currency_shop` VALUES (1,1,1.000000);
/*!40000 ALTER TABLE `newprefix_currency_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_image`
--

DROP TABLE IF EXISTS `newprefix_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `id_product_cover` (`id_product`,`cover`),
  UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  KEY `image_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_image`
--

LOCK TABLES `newprefix_image` WRITE;
/*!40000 ALTER TABLE `newprefix_image` DISABLE KEYS */;
INSERT INTO `newprefix_image` VALUES (1,1,1,1),(2,1,2,NULL),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,9,2,NULL),(11,10,1,1),(12,10,2,NULL),(13,11,1,1),(14,11,2,NULL),(15,12,1,1),(16,13,1,1),(17,14,1,1),(18,16,1,1),(19,17,1,1),(20,18,1,1),(21,2,1,1),(22,19,1,1),(23,15,1,1);
/*!40000 ALTER TABLE `newprefix_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_product`
--

DROP TABLE IF EXISTS `newprefix_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `low_stock_threshold` int(10) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(64) DEFAULT NULL,
  `supplier_reference` varchar(64) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `height` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `depth` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `additional_delivery_times` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301-product','302-product','301-category','302-category') NOT NULL DEFAULT '',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date DEFAULT NULL,
  `show_condition` tinyint(1) NOT NULL DEFAULT '0',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT '3',
  `state` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`,`id_product`),
  KEY `id_category_default` (`id_category_default`),
  KEY `indexed` (`indexed`),
  KEY `date_add` (`date_add`),
  KEY `state` (`state`,`date_upd`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_product`
--

LOCK TABLES `newprefix_product` WRITE;
/*!40000 ALTER TABLE `newprefix_product` DISABLE KEYS */;
INSERT INTO `newprefix_product` VALUES (1,0,1,4,1,1,0,0,'','','',0.000000,0,1,NULL,0,23.900000,0.000000,'',0.000000,0.00,'demo_1','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,1,'2019-04-19 11:40:37','2019-04-19 11:40:37',0,3,1),(2,0,1,5,1,1,0,0,'','','',0.000000,0,1,NULL,0,35.900000,0.000000,'',0.000000,0.00,'demo_3','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,9,'2019-04-19 11:40:38','2019-04-19 11:40:38',0,3,1),(3,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,29.000000,0.000000,'',0.000000,0.00,'demo_6','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,13,'2019-04-19 11:40:38','2019-04-19 11:40:38',0,3,1),(4,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,29.000000,0.000000,'',0.000000,0.00,'demo_5','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,16,'2019-04-19 11:40:39','2019-04-19 11:40:39',0,3,1),(5,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,29.000000,0.000000,'',0.000000,0.00,'demo_7','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,19,'2019-04-19 11:40:39','2019-04-19 11:40:39',0,3,1),(6,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,11.900000,0.000000,'',0.000000,0.00,'demo_11','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2019-04-19 11:40:39','2019-04-19 11:40:39',0,3,1),(7,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,11.900000,0.000000,'',0.000000,0.00,'demo_12','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2019-04-19 11:40:40','2019-04-19 11:40:40',0,3,1),(8,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,11.900000,0.000000,'',0.000000,0.00,'demo_13','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2019-04-19 11:40:40','2019-04-19 11:40:40',0,3,1),(9,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,18.900000,0.000000,'',0.000000,0.00,'demo_15','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,22,'2019-04-19 11:40:41','2019-04-19 11:40:41',0,3,1),(10,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,18.900000,0.000000,'',0.000000,0.00,'demo_16','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,24,'2019-04-19 11:40:41','2019-04-19 11:40:41',0,3,1),(11,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,18.900000,0.000000,'',0.000000,0.00,'demo_17','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,26,'2019-04-19 11:40:42','2019-04-19 11:40:42',0,3,1),(12,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,9.000000,0.000000,'',0.000000,0.00,'demo_18','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2019-04-19 11:40:43','2019-04-19 11:40:43',0,3,1),(13,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,9.000000,0.000000,'',0.000000,0.00,'demo_19','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2019-04-19 11:40:44','2019-04-19 11:40:44',0,3,1),(14,0,2,9,1,1,0,0,'','','',0.000000,0,1,NULL,0,9.000000,0.000000,'',0.000000,0.00,'demo_20','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2019-04-19 11:40:44','2019-04-19 11:40:44',0,3,1),(15,0,0,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,35.000000,0.000000,'',0.000000,0.00,'demo_21','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',1,0,0,0,'2019-04-19 11:40:45','2019-04-19 11:40:45',0,3,1),(16,0,2,7,1,1,0,0,'','','',0.000000,0,1,NULL,0,12.900000,0.000000,'',0.000000,0.00,'demo_8','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,28,'2019-04-19 11:40:45','2019-04-19 11:40:45',0,3,1),(17,0,2,7,1,1,0,0,'','','',0.000000,0,1,NULL,0,12.900000,0.000000,'',0.000000,0.00,'demo_9','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,32,'2019-04-19 11:40:46','2019-04-19 11:40:46',0,3,1),(18,0,2,7,1,1,0,0,'','','',0.000000,0,1,NULL,0,12.900000,0.000000,'',0.000000,0.00,'demo_10','','',0.000000,0.000000,0.000000,0.000000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,36,'2019-04-19 11:40:47','2019-04-19 11:40:47',0,3,1),(19,0,1,8,1,1,0,0,'','','',0.000000,0,1,NULL,0,13.900000,0.000000,'',0.000000,0.00,'demo_14','','',0.000000,0.000000,0.000000,0.000000,2,1,0,1,0,1,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2019-04-19 11:40:47','2019-04-24 10:50:29',0,3,1);
/*!40000 ALTER TABLE `newprefix_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newprefix_product_lang`
--

DROP TABLE IF EXISTS `newprefix_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newprefix_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  `delivery_in_stock` varchar(255) DEFAULT NULL,
  `delivery_out_stock` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newprefix_product_lang`
--

LOCK TABLES `newprefix_product_lang` WRITE;
/*!40000 ALTER TABLE `newprefix_product_lang` DISABLE KEYS */;
INSERT INTO `newprefix_product_lang` VALUES (1,1,1,'','','hummingbird-printed-t-shirt','','','','Hummingbird printed t-shirt','','','',''),(2,1,1,'','','brown-bear-printed-sweater','','','','Hummingbird printed sweater','','','',''),(3,1,1,'','','the-best-is-yet-to-come-framed-poster','','','','The best is yet to come\' Framed poster','','','',''),(4,1,1,'','','the-adventure-begins-framed-poster','','','','The adventure begins Framed poster','','','',''),(5,1,1,'','','today-is-a-good-day-framed-poster','','','','Today is a good day Framed poster','','','',''),(6,1,1,'','','mug-the-best-is-yet-to-come','','','','Mug The best is yet to come','','','',''),(7,1,1,'','','mug-the-adventure-begins','','','','Mug The adventure begins','','','',''),(8,1,1,'','','mug-today-is-a-good-day','','','','Mug Today is a good day','','','',''),(9,1,1,'','','mountain-fox-cushion','','','','Mountain fox cushion','','','',''),(10,1,1,'','','brown-bear-cushion','','','','Brown bear cushion','','','',''),(11,1,1,'','','hummingbird-cushion','','','','Hummingbird cushion','','','',''),(12,1,1,'','','mountain-fox-vector-graphics','','','','Mountain fox - Vector graphics','','','',''),(13,1,1,'','','brown-bear-vector-graphics','','','','Brown bear - Vector graphics','','','',''),(14,1,1,'','','hummingbird-vector-graphics','','','','Hummingbird - Vector graphics','','','',''),(15,1,1,'','','pack-mug-framed-poster','','','','Pack Mug + Framed poster','','','',''),(16,1,1,'','','mountain-fox-notebook','','','','Mountain fox notebook','','','',''),(17,1,1,'','','mountain-fox-notebook','','','','Brown bear notebook','','','',''),(19,1,1,'','','customizable-mug','','','','Customizable mug','','','','');
/*!40000 ALTER TABLE `newprefix_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category`
--

LOCK TABLES `oc_category` WRITE;
/*!40000 ALTER TABLE `oc_category` DISABLE KEYS */;
INSERT INTO `oc_category` VALUES (25,'',0,1,1,3,1,'2009-01-31 01:04:25','2011-05-30 12:14:55'),(27,'',20,0,0,2,1,'2009-01-31 01:55:34','2010-08-22 06:32:15'),(20,'catalog/demo/compaq_presario.jpg',0,1,1,1,1,'2009-01-05 21:49:43','2011-07-16 02:14:42'),(24,'',0,1,1,5,1,'2009-01-20 02:36:26','2011-05-30 12:15:18'),(18,'catalog/demo/hp_2.jpg',0,1,0,2,1,'2009-01-05 21:49:15','2011-05-30 12:13:55'),(17,'',0,1,1,4,1,'2009-01-03 21:08:57','2011-05-30 12:15:11'),(28,'',25,0,0,1,1,'2009-02-02 13:11:12','2010-08-22 06:32:46'),(26,'',20,0,0,1,1,'2009-01-31 01:55:14','2010-08-22 06:31:45'),(29,'',25,0,0,1,1,'2009-02-02 13:11:37','2010-08-22 06:32:39'),(30,'',25,0,0,1,1,'2009-02-02 13:11:59','2010-08-22 06:33:00'),(31,'',25,0,0,1,1,'2009-02-03 14:17:24','2010-08-22 06:33:06'),(32,'',25,0,0,1,1,'2009-02-03 14:17:34','2010-08-22 06:33:12'),(33,'',0,1,1,6,1,'2009-02-03 14:17:55','2011-05-30 12:15:25'),(34,'catalog/demo/ipod_touch_4.jpg',0,1,4,7,1,'2009-02-03 14:18:11','2011-05-30 12:15:31'),(35,'',28,0,0,0,1,'2010-09-17 10:06:48','2010-09-18 14:02:42'),(36,'',28,0,0,0,1,'2010-09-17 10:07:13','2010-09-18 14:02:55'),(37,'',34,0,0,0,1,'2010-09-18 14:03:39','2011-04-22 01:55:08'),(38,'',34,0,0,0,1,'2010-09-18 14:03:51','2010-09-18 14:03:51'),(39,'',34,0,0,0,1,'2010-09-18 14:04:17','2011-04-22 01:55:20'),(40,'',34,0,0,0,1,'2010-09-18 14:05:36','2010-09-18 14:05:36'),(41,'',34,0,0,0,1,'2010-09-18 14:05:49','2011-04-22 01:55:30'),(42,'',34,0,0,0,1,'2010-09-18 14:06:34','2010-11-07 20:31:04'),(43,'',34,0,0,0,1,'2010-09-18 14:06:49','2011-04-22 01:55:40'),(44,'',34,0,0,0,1,'2010-09-21 15:39:21','2010-11-07 20:30:55'),(45,'',18,0,0,0,1,'2010-09-24 18:29:16','2011-04-26 08:52:11'),(46,'',18,0,0,0,1,'2010-09-24 18:29:31','2011-04-26 08:52:23'),(47,'',34,0,0,0,1,'2010-11-07 11:13:16','2010-11-07 11:13:16'),(48,'',34,0,0,0,1,'2010-11-07 11:13:33','2010-11-07 11:13:33'),(49,'',34,0,0,0,1,'2010-11-07 11:14:04','2010-11-07 11:14:04'),(50,'',34,0,0,0,1,'2010-11-07 11:14:23','2011-04-22 01:16:01'),(51,'',34,0,0,0,1,'2010-11-07 11:14:38','2011-04-22 01:16:13'),(52,'',34,0,0,0,1,'2010-11-07 11:16:09','2011-04-22 01:54:57'),(53,'',34,0,0,0,1,'2010-11-07 11:28:53','2011-04-22 01:14:36'),(54,'',34,0,0,0,1,'2010-11-07 11:29:16','2011-04-22 01:16:50'),(55,'',34,0,0,0,1,'2010-11-08 10:31:32','2010-11-08 10:31:32'),(56,'',34,0,0,0,1,'2010-11-08 10:31:50','2011-04-22 01:16:37'),(57,'',0,1,1,3,1,'2011-04-26 08:53:16','2011-05-30 12:15:05'),(58,'',52,0,0,0,1,'2011-05-08 13:44:16','2011-05-08 13:44:16');
/*!40000 ALTER TABLE `oc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_description`
--

LOCK TABLES `oc_category_description` WRITE;
/*!40000 ALTER TABLE `oc_category_description` DISABLE KEYS */;
INSERT INTO `oc_category_description` VALUES (28,1,'Monitors','','','',''),(33,1,'Cameras','','','',''),(32,1,'Web Cameras','','','',''),(31,1,'Scanners','','','',''),(30,1,'Printers','','','',''),(29,1,'Mice and Trackballs','','','',''),(27,1,'Mac','','','',''),(26,1,'PC','','','',''),(17,1,'Software','','','',''),(25,1,'Components','','','',''),(24,1,'Phones &amp; PDAs','','','',''),(20,1,'Desktops','','','Example of category description',''),(35,1,'test 1','','','',''),(36,1,'test 2','','','',''),(37,1,'test 5','','','',''),(38,1,'test 4','','','',''),(39,1,'test 6','','','',''),(40,1,'test 7','','','',''),(41,1,'test 8','','','',''),(42,1,'test 9','','','',''),(43,1,'test 11','','','',''),(34,1,'MP3 Players','','','',''),(18,1,'Laptops &amp; Notebooks','','','',''),(44,1,'test 12','','','',''),(45,1,'Windows','','','',''),(46,1,'Macs','','','',''),(47,1,'test 15','','','',''),(48,1,'test 16','','','',''),(49,1,'test 17','','','',''),(50,1,'test 18','','','',''),(51,1,'test 19','','','',''),(52,1,'test 20','','','',''),(53,1,'test 21','','','',''),(54,1,'test 22','','','',''),(55,1,'test 23','','','',''),(56,1,'test 24','','','',''),(57,1,'Tablets','','','',''),(58,1,'test 25','','','','');
/*!40000 ALTER TABLE `oc_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product`
--

LOCK TABLES `oc_product` WRITE;
/*!40000 ALTER TABLE `oc_product` DISABLE KEYS */;
INSERT INTO `oc_product` VALUES (28,'Product 1','','','','','','','',939,7,'catalog/demo/htc_touch_hd_1.jpg',5,1,100.0000,200,9,'2009-02-03',146.40000000,2,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 16:06:50','2011-09-30 01:05:39'),(29,'Product 2','','','','','','','',999,6,'catalog/demo/palm_treo_pro_1.jpg',6,1,279.9900,0,9,'2009-02-03',133.00000000,2,0.00000000,0.00000000,0.00000000,3,1,1,0,1,0,'2009-02-03 16:42:17','2011-09-30 01:06:08'),(30,'Product 3','','','','','','','',7,6,'catalog/demo/canon_eos_5d_1.jpg',9,1,100.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 16:59:00','2011-09-30 01:05:23'),(31,'Product 4','','','','','','','',1000,6,'catalog/demo/nikon_d300_1.jpg',0,1,80.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,3,1,1,0,1,0,'2009-02-03 17:00:10','2011-09-30 01:06:00'),(32,'Product 5','','','','','','','',999,6,'catalog/demo/ipod_touch_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 17:07:26','2011-09-30 01:07:22'),(33,'Product 6','','','','','','','',1000,6,'catalog/demo/samsung_syncmaster_941bw.jpg',0,1,200.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,3,'2009-02-03 17:08:31','2011-09-30 01:06:29'),(34,'Product 7','','','','','','','',1000,6,'catalog/demo/ipod_shuffle_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 18:07:54','2011-09-30 01:07:17'),(35,'Product 8','','','','','','','',1000,5,'',0,0,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 18:08:31','2011-09-30 01:06:17'),(36,'Product 9','','','','','','','',994,6,'catalog/demo/ipod_nano_1.jpg',8,0,100.0000,100,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 18:09:19','2011-09-30 01:07:12'),(40,'product 11','','','','','','','',970,5,'catalog/demo/iphone_1.jpg',8,1,101.0000,0,9,'2009-02-03',10.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 21:07:12','2011-09-30 01:06:53'),(41,'Product 14','','','','','','','',977,5,'catalog/demo/imac_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,0,'2009-02-03 21:07:26','2011-09-30 01:06:44'),(42,'Product 15','','','','','','','',990,5,'catalog/demo/apple_cinema_30.jpg',8,1,100.0000,400,9,'2009-02-04',12.50000000,1,1.00000000,2.00000000,3.00000000,1,1,2,0,1,0,'2009-02-03 21:07:37','2011-09-30 00:46:19'),(43,'Product 16','','','','','','','',929,5,'catalog/demo/macbook_1.jpg',8,0,500.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,1,'2009-02-03 21:07:49','2011-09-30 01:05:46'),(44,'Product 17','','','','','','','',1000,5,'catalog/demo/macbook_air_1.jpg',8,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:00','2011-09-30 01:05:53'),(45,'Product 18','','','','','','','',998,5,'catalog/demo/macbook_pro_1.jpg',8,1,2000.0000,0,100,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:17','2011-09-15 22:22:01'),(46,'Product 19','','','','','','','',1000,5,'catalog/demo/sony_vaio_1.jpg',10,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-03 21:08:29','2011-09-30 01:06:39'),(47,'Product 21','','','','','','','',1000,5,'catalog/demo/hp_1.jpg',7,1,100.0000,400,9,'2009-02-03',1.00000000,1,0.00000000,0.00000000,0.00000000,1,0,1,0,1,0,'2009-02-03 21:08:40','2011-09-30 01:05:28'),(48,'product 20','test 1','','','','','','test 2',995,5,'catalog/demo/ipod_classic_1.jpg',8,1,100.0000,0,9,'2009-02-08',1.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,0,'2009-02-08 17:21:51','2011-09-30 01:07:06'),(49,'SAM1','','','','','','','',0,8,'catalog/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,1,1,0,'2011-04-26 08:57:34','2011-09-30 01:06:23');
/*!40000 ALTER TABLE `oc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_description`
--

LOCK TABLES `oc_product_description` WRITE;
/*!40000 ALTER TABLE `oc_product_description` DISABLE KEYS */;
INSERT INTO `oc_product_description` VALUES (35,1,'Product 8','','','','',''),(48,1,'iPod Classic','','','','',''),(40,1,'iPhone','','','','',''),(28,1,'HTC Touch HD','','','','',''),(44,1,'MacBook Air','','','','',''),(45,1,'MacBook Pro','','','','',''),(29,1,'Palm Treo Pro','','','','',''),(36,1,'iPod Nano','','','','',''),(46,1,'Sony VAIO','','','','',''),(47,1,'HP LP3065','','','','',''),(32,1,'iPod Touch','','','','',''),(41,1,'iMac','','','','',''),(33,1,'Samsung SyncMaster 941BW','','','','',''),(34,1,'iPod Shuffle','','','','',''),(43,1,'MacBook','','','','',''),(31,1,'Nikon D300','','','','',''),(49,1,'Samsung Galaxy Tab 10.1','','','','',''),(42,1,'Apple Cinema 30&quot;','','','','',''),(30,1,'Canon EOS 5D','','','','','');
/*!40000 ALTER TABLE `oc_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_category`
--

LOCK TABLES `oc_product_to_category` WRITE;
/*!40000 ALTER TABLE `oc_product_to_category` DISABLE KEYS */;
INSERT INTO `oc_product_to_category` VALUES (28,20),(28,24),(29,20),(29,24),(30,20),(30,33),(31,33),(32,34),(33,20),(33,28),(34,34),(35,20),(36,34),(40,20),(40,24),(41,27),(42,20),(42,28),(43,18),(43,20),(44,18),(44,20),(45,18),(46,18),(46,20),(47,18),(47,20),(48,20),(48,34),(49,57);
/*!40000 ALTER TABLE `oc_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_setting`
--

LOCK TABLES `oc_setting` WRITE;
/*!40000 ALTER TABLE `oc_setting` DISABLE KEYS */;
INSERT INTO `oc_setting` VALUES (1,0,'shipping','shipping_sort_order','3',0),(2,0,'sub_total','sub_total_sort_order','1',0),(3,0,'sub_total','sub_total_status','1',0),(4,0,'tax','tax_status','1',0),(5,0,'total','total_sort_order','9',0),(6,0,'total','total_status','1',0),(7,0,'tax','tax_sort_order','5',0),(8,0,'free_checkout','free_checkout_sort_order','1',0),(9,0,'cod','cod_sort_order','5',0),(10,0,'cod','cod_total','0.01',0),(11,0,'cod','cod_order_status_id','1',0),(12,0,'cod','cod_geo_zone_id','0',0),(13,0,'cod','cod_status','1',0),(14,0,'shipping','shipping_status','1',0),(15,0,'shipping','shipping_estimator','1',0),(27,0,'coupon','coupon_sort_order','4',0),(28,0,'coupon','coupon_status','1',0),(34,0,'flat','flat_sort_order','1',0),(35,0,'flat','flat_status','1',0),(36,0,'flat','flat_geo_zone_id','0',0),(37,0,'flat','flat_tax_class_id','9',0),(41,0,'flat','flat_cost','5.00',0),(42,0,'credit','credit_sort_order','7',0),(43,0,'credit','credit_status','1',0),(53,0,'reward','reward_sort_order','2',0),(54,0,'reward','reward_status','1',0),(146,0,'category','category_status','1',0),(158,0,'account','account_status','1',0),(159,0,'affiliate','affiliate_status','1',0),(267,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),(266,0,'config','config_shared','0',0),(265,0,'config','config_secure','0',0),(94,0,'voucher','voucher_sort_order','8',0),(95,0,'voucher','voucher_status','1',0),(261,0,'config','config_fraud_detection','0',0),(260,0,'config','config_mail_alert','',0),(103,0,'free_checkout','free_checkout_status','1',0),(104,0,'free_checkout','free_checkout_order_status_id','1',0),(258,0,'config','config_ftp_status','0',0),(257,0,'config','config_ftp_root','',0),(256,0,'config','config_ftp_password','',0),(255,0,'config','config_ftp_username','',0),(254,0,'config','config_ftp_port','21',0),(253,0,'config','config_ftp_hostname','',0),(252,0,'config','config_image_location_height','50',0),(251,0,'config','config_image_location_width','268',0),(250,0,'config','config_image_cart_height','47',0),(249,0,'config','config_image_cart_width','47',0),(248,0,'config','config_image_wishlist_height','47',0),(181,0,'config','config_meta_title','Your Store',0),(182,0,'config','config_meta_description','My Store',0),(183,0,'config','config_meta_keyword','',0),(184,0,'config','config_template','default',0),(185,0,'config','config_layout_id','4',0),(186,0,'config','config_country_id','222',0),(187,0,'config','config_zone_id','3563',0),(188,0,'config','config_language','en',0),(189,0,'config','config_admin_language','en',0),(190,0,'config','config_currency','USD',0),(191,0,'config','config_currency_auto','1',0),(192,0,'config','config_length_class_id','1',0),(193,0,'config','config_weight_class_id','1',0),(194,0,'config','config_product_count','1',0),(195,0,'config','config_product_limit','15',0),(196,0,'config','config_product_description_length','100',0),(197,0,'config','config_limit_admin','20',0),(198,0,'config','config_review_status','1',0),(199,0,'config','config_review_guest','1',0),(200,0,'config','config_review_mail','0',0),(201,0,'config','config_voucher_min','1',0),(202,0,'config','config_voucher_max','1000',0),(203,0,'config','config_tax','1',0),(204,0,'config','config_tax_default','shipping',0),(205,0,'config','config_tax_customer','shipping',0),(206,0,'config','config_customer_online','0',0),(207,0,'config','config_customer_group_id','1',0),(208,0,'config','config_customer_group_display','[\"1\"]',1),(209,0,'config','config_customer_price','0',0),(210,0,'config','config_account_id','3',0),(211,0,'config','config_account_mail','0',0),(212,0,'config','config_invoice_prefix','INV-2013-00',0),(293,0,'config','config_api_id','1',0),(214,0,'config','config_cart_weight','1',0),(215,0,'config','config_checkout_guest','1',0),(216,0,'config','config_checkout_id','5',0),(217,0,'config','config_order_status_id','1',0),(218,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1),(219,0,'config','config_complete_status','[\"5\",\"3\"]',1),(220,0,'config','config_order_mail','0',0),(221,0,'config','config_stock_display','0',0),(222,0,'config','config_stock_warning','0',0),(223,0,'config','config_stock_checkout','0',0),(224,0,'config','config_affiliate_approval','0',0),(225,0,'config','config_affiliate_auto','0',0),(226,0,'config','config_affiliate_commission','5',0),(227,0,'config','config_affiliate_id','4',0),(228,0,'config','config_affiliate_mail','0',0),(229,0,'config','config_return_id','0',0),(230,0,'config','config_return_status_id','2',0),(231,0,'config','config_logo','catalog/logo.png',0),(232,0,'config','config_icon','catalog/cart.png',0),(233,0,'config','config_image_category_width','80',0),(234,0,'config','config_image_category_height','80',0),(235,0,'config','config_image_thumb_width','228',0),(236,0,'config','config_image_thumb_height','228',0),(237,0,'config','config_image_popup_width','500',0),(238,0,'config','config_image_popup_height','500',0),(239,0,'config','config_image_product_width','228',0),(240,0,'config','config_image_product_height','228',0),(241,0,'config','config_image_additional_width','74',0),(242,0,'config','config_image_additional_height','74',0),(243,0,'config','config_image_related_width','80',0),(244,0,'config','config_image_related_height','80',0),(245,0,'config','config_image_compare_width','90',0),(246,0,'config','config_image_compare_height','90',0),(247,0,'config','config_image_wishlist_width','47',0),(180,0,'config','config_comment','',0),(179,0,'config','config_open','',0),(178,0,'config','config_image','',0),(177,0,'config','config_fax','',0),(176,0,'config','config_telephone','123456789',0),(290,0,'config','config_email','sdf@dfkijghsdfikghdlsghfdsfgf.com',0),(174,0,'config','config_geocode','',0),(172,0,'config','config_owner','Your Name',0),(173,0,'config','config_address','Address 1',0),(171,0,'config','config_name','Your Store',0),(268,0,'config','config_seo_url','0',0),(269,0,'config','config_file_max_size','300000',0),(270,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0),(271,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf',0),(272,0,'config','config_maintenance','0',0),(273,0,'config','config_password','1',0),(292,0,'config','config_encryption','huf879gIsLEGrwfW8g9HLsLenWNTYUpV9lGQxzEvkDzMmJFZJoAvMtw85dR0ZL512gSMpfs8QnYQD4z2mSPDQNUEeqSbdklJ7Fa8p3wuaLOajt9Gl3NuKpzx8bWNzlKn4obs5jv8JF5Y1vpIe20b9trhRzTka3RAdm7saCNshBqtTgq7tlqAP7K0ovVpeBhNXGH0OLKGC6NfNBTHTDgW2un5fDDvUBYh92Iwz7m4F1jFey9EufN1MKw9pF0E8qWgjMAHOLyEBsHmJdZoA32pa4hbsnLbxCjeYO78O8a6vG3RdnUWm4LBeAZWWwU2db7d8j6VbfhbEJYr1WRLjveq5D7LOSncHLCtla5kmp1GpHYxbCN5DG3JdgQ3clRBEtPQozV8P6Wui4mgr252xT02keqlmJGaKYOBOZw5Q0frFfUXUVgtaydl3CvCGZ4JUO7v1JsL9oyyPT0V5fLomjbXdA5v4g2xOEwKgz23dB77iETt2KuCKeYUcxHbOyqlQL5wNcGbU8LAL0ZjBRDyyikS568EnycsyFbEeh9wjZFsDrGamrcONAhUfZDmykDgJgtcLitNnzrGaPGss95AlMZLJGrskT8EFt3w259ysulUqt71U4wi58hWvpvwLSmZtWfKEaxG5KChXosad2qAKTzgwX2PP2txG8Igfr0GKXY1XbAcYet0YVkwIb41A9RARD8DW2NUsN6sOCYcIL1GYaDomrdubLVRSiXAYh3XEprYtHVfmm0V3KWqSZkMFrRpF5NYVirtcPma3VEZS4KaXb1X6z74S5dP5IvCv70obayZxHINZ9fAO3Ch1aKvkW5TC1WqX6hfEjZxXBVEmtRjmZ4ONvmfXGMAoBK0oZBIOUzgL73QpYQ2Wti7Lc5Hpu36SOZkvglRkYJIHF8VIz2jhexxQgAd7JdPM97kpU53XYNr0JXvYGROjewAA57aBTcqUwnp2z8xSCxterT7NYnqK8MD1zYunchYCYVoqAuiseWUBluA1gJftug1m3wfGArHl7YV',0),(275,0,'config','config_compression','0',0),(276,0,'config','config_error_display','1',0),(277,0,'config','config_error_log','1',0),(278,0,'config','config_error_filename','error.log',0),(279,0,'config','config_google_analytics','',0),(280,0,'config','config_mail_protocol','mail',0),(281,0,'config','config_mail_parameter','',0),(282,0,'config','config_mail_smtp_hostname','',0),(283,0,'config','config_mail_smtp_username','',0),(284,0,'config','config_mail_smtp_password','',0),(285,0,'config','config_mail_smtp_port','25',0),(286,0,'config','config_mail_smtp_timeout','5',0),(287,0,'config','config_captcha','basic_captcha',0),(288,0,'config','config_captcha_page','[\"review\",\"return\",\"contact\"]',1),(289,0,'config','config_login_attempts','5',0),(291,0,'config','config_url','http://opencart.local/',0);
/*!40000 ALTER TABLE `oc_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_categories`
--

DROP TABLE IF EXISTS `osc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_categories`
--

LOCK TABLES `osc_categories` WRITE;
/*!40000 ALTER TABLE `osc_categories` DISABLE KEYS */;
INSERT INTO `osc_categories` VALUES (1,'category_hardware.gif',0,1,'2019-04-12 08:25:49',NULL),(2,'category_software.gif',0,2,'2019-04-12 08:25:49',NULL),(3,'category_dvd_movies.gif',0,3,'2019-04-12 08:25:49',NULL),(4,'subcategory_graphic_cards.gif',1,0,'2019-04-12 08:25:49',NULL),(5,'subcategory_printers.gif',1,0,'2019-04-12 08:25:49',NULL),(6,'subcategory_monitors.gif',1,0,'2019-04-12 08:25:50',NULL),(7,'subcategory_speakers.gif',1,0,'2019-04-12 08:25:50',NULL),(8,'subcategory_keyboards.gif',1,0,'2019-04-12 08:25:50',NULL),(9,'subcategory_mice.gif',1,0,'2019-04-12 08:25:50',NULL),(10,'subcategory_action.gif',3,0,'2019-04-12 08:25:50',NULL),(11,'subcategory_science_fiction.gif',3,0,'2019-04-12 08:25:50',NULL),(12,'subcategory_comedy.gif',3,0,'2019-04-12 08:25:50',NULL),(13,'subcategory_cartoons.gif',3,0,'2019-04-12 08:25:50',NULL),(14,'subcategory_thriller.gif',3,0,'2019-04-12 08:25:50',NULL),(15,'subcategory_drama.gif',3,0,'2019-04-12 08:25:50',NULL),(16,'subcategory_memory.gif',1,0,'2019-04-12 08:25:51',NULL),(17,'subcategory_cdrom_drives.gif',1,0,'2019-04-12 08:25:51',NULL),(18,'subcategory_simulation.gif',2,0,'2019-04-12 08:25:51',NULL),(19,'subcategory_action_games.gif',2,0,'2019-04-12 08:25:51',NULL),(20,'subcategory_strategy.gif',2,0,'2019-04-12 08:25:51',NULL),(21,'category_gadgets.png',0,4,'2019-04-12 08:25:51',NULL);
/*!40000 ALTER TABLE `osc_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_categories_description`
--

DROP TABLE IF EXISTS `osc_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categories_description` text COLLATE utf8_unicode_ci,
  `categories_seo_description` text COLLATE utf8_unicode_ci,
  `categories_seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories_seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_categories_description`
--

LOCK TABLES `osc_categories_description` WRITE;
/*!40000 ALTER TABLE `osc_categories_description` DISABLE KEYS */;
INSERT INTO `osc_categories_description` VALUES (1,1,'Hardware',NULL,NULL,NULL,NULL),(2,1,'Software',NULL,NULL,NULL,NULL),(3,1,'DVD Movies',NULL,NULL,NULL,NULL),(4,1,'Graphics Cards',NULL,NULL,NULL,NULL),(5,1,'Printers',NULL,NULL,NULL,NULL),(6,1,'Monitors',NULL,NULL,NULL,NULL),(7,1,'Speakers',NULL,NULL,NULL,NULL),(8,1,'Keyboards',NULL,NULL,NULL,NULL),(9,1,'Mice',NULL,NULL,NULL,NULL),(10,1,'Action',NULL,NULL,NULL,NULL),(11,1,'Science Fiction',NULL,NULL,NULL,NULL),(12,1,'Comedy',NULL,NULL,NULL,NULL),(13,1,'Cartoons',NULL,NULL,NULL,NULL),(14,1,'Thriller',NULL,NULL,NULL,NULL),(15,1,'Drama',NULL,NULL,NULL,NULL),(16,1,'Memory',NULL,NULL,NULL,NULL),(17,1,'CDROM Drives',NULL,NULL,NULL,NULL),(18,1,'Simulation',NULL,NULL,NULL,NULL),(19,1,'Action',NULL,NULL,NULL,NULL),(20,1,'Strategy',NULL,NULL,NULL,NULL),(21,1,'Gadgets',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `osc_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_configuration`
--

DROP TABLE IF EXISTS `osc_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_value` text COLLATE utf8_unicode_ci NOT NULL,
  `configuration_description` text COLLATE utf8_unicode_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_configuration`
--

LOCK TABLES `osc_configuration` WRITE;
/*!40000 ALTER TABLE `osc_configuration` DISABLE KEYS */;
INSERT INTO `osc_configuration` VALUES (1,'Store Name','STORE_NAME','store','',1,1,NULL,'2019-04-12 08:25:53',NULL,NULL),(2,'Store Owner','STORE_OWNER','admin','',1,2,NULL,'2019-04-12 08:25:54',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','sdf@djfbhsdbvndfjskhkljdfghfkjdsg.com','',1,3,NULL,'2019-04-12 08:25:54',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','\"admin\" <sdf@djfbhsdbvndfjskhkljdfghfkjdsg.com>','',1,4,NULL,'2019-04-12 08:25:54',NULL,NULL),(5,'Country','STORE_COUNTRY','223','',1,6,NULL,'2019-04-12 08:25:54','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','18','',1,7,NULL,'2019-04-12 08:25:54','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','',1,10,NULL,'2019-04-12 08:25:54',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(8,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','',1,11,NULL,'2019-04-12 08:25:54',NULL,NULL),(9,'Use Search-Engine Safe URLs','SEARCH_ENGINE_FRIENDLY_URLS','false','',1,12,NULL,'2019-04-12 08:25:54',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Display Cart After Adding Product','DISPLAY_CART','true','',1,14,NULL,'2019-04-12 08:25:55',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(11,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','',1,15,NULL,'2019-04-12 08:25:55',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','',1,17,NULL,'2019-04-12 08:25:55',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(13,'Store Address','STORE_ADDRESS','Address Line 1\nAddress Line 2\nCountry\nPhone','',1,18,NULL,'2019-04-12 08:25:55',NULL,'tep_cfg_textarea('),(14,'Store Phone','STORE_PHONE','555-1234','',1,19,NULL,'2019-04-12 08:25:55',NULL,'tep_cfg_textarea('),(15,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','',1,20,NULL,'2019-04-12 08:25:56',NULL,NULL),(16,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','',1,21,NULL,'2019-04-12 08:25:56',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','',2,1,NULL,'2019-04-12 08:25:56',NULL,NULL),(18,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','',2,2,NULL,'2019-04-12 08:25:56',NULL,NULL),(19,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','',2,3,NULL,'2019-04-12 08:25:56',NULL,NULL),(20,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','',2,4,NULL,'2019-04-12 08:25:56',NULL,NULL),(21,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','',2,5,NULL,'2019-04-12 08:25:57',NULL,NULL),(22,'Company','ENTRY_COMPANY_MIN_LENGTH','2','',2,6,NULL,'2019-04-12 08:25:57',NULL,NULL),(23,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','',2,7,NULL,'2019-04-12 08:25:57',NULL,NULL),(24,'City','ENTRY_CITY_MIN_LENGTH','3','',2,8,NULL,'2019-04-12 08:25:57',NULL,NULL),(25,'State','ENTRY_STATE_MIN_LENGTH','2','',2,9,NULL,'2019-04-12 08:25:57',NULL,NULL),(26,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','',2,10,NULL,'2019-04-12 08:25:57',NULL,NULL),(27,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','',2,11,NULL,'2019-04-12 08:25:57',NULL,NULL),(28,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','',2,12,NULL,'2019-04-12 08:25:57',NULL,NULL),(29,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','',2,13,NULL,'2019-04-12 08:25:57',NULL,NULL),(30,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','',2,14,NULL,'2019-04-12 08:25:58',NULL,NULL),(31,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','',2,15,NULL,'2019-04-12 08:25:58',NULL,NULL),(32,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','',2,16,NULL,'2019-04-12 08:25:58',NULL,NULL),(33,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','',3,1,NULL,'2019-04-12 08:25:58',NULL,NULL),(34,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','',3,2,NULL,'2019-04-12 08:25:58',NULL,NULL),(35,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','',3,4,NULL,'2019-04-12 08:25:58',NULL,NULL),(36,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','',3,7,NULL,'2019-04-12 08:25:58',NULL,NULL),(37,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','',3,7,NULL,'2019-04-12 08:25:59',NULL,NULL),(38,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','',3,8,NULL,'2019-04-12 08:25:59',NULL,NULL),(39,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','',3,9,NULL,'2019-04-12 08:25:59',NULL,NULL),(40,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','',3,10,NULL,'2019-04-12 08:25:59',NULL,NULL),(41,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','',3,11,NULL,'2019-04-12 08:25:59',NULL,NULL),(42,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','',3,12,NULL,'2019-04-12 08:25:59',NULL,NULL),(43,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','',3,13,NULL,'2019-04-12 08:25:59',NULL,NULL),(44,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','',3,14,NULL,'2019-04-12 08:26:00',NULL,NULL),(45,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','',3,15,NULL,'2019-04-12 08:26:00',NULL,NULL),(46,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','',3,16,NULL,'2019-04-12 08:26:00',NULL,NULL),(47,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','',3,17,NULL,'2019-04-12 08:26:00',NULL,NULL),(48,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','',3,18,NULL,'2019-04-12 08:26:00',NULL,NULL),(49,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','',3,19,NULL,'2019-04-12 08:26:00',NULL,NULL),(50,'Small Image Width','SMALL_IMAGE_WIDTH','100','',4,1,NULL,'2019-04-12 08:26:00',NULL,NULL),(51,'Small Image Height','SMALL_IMAGE_HEIGHT','80','',4,2,NULL,'2019-04-12 08:26:00',NULL,NULL),(52,'Heading Image Width','HEADING_IMAGE_WIDTH','57','',4,3,NULL,'2019-04-12 08:26:00',NULL,NULL),(53,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','',4,4,NULL,'2019-04-12 08:26:01',NULL,NULL),(54,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','',4,5,NULL,'2019-04-12 08:26:01',NULL,NULL),(55,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','',4,6,NULL,'2019-04-12 08:26:01',NULL,NULL),(56,'Image Required','IMAGE_REQUIRED','true','',4,8,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(57,'Gender','ACCOUNT_GENDER','true','',5,1,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(58,'Date of Birth','ACCOUNT_DOB','true','',5,2,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(59,'Company','ACCOUNT_COMPANY','true','',5,3,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(60,'Suburb','ACCOUNT_SUBURB','true','',5,4,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(61,'State','ACCOUNT_STATE','true','',5,5,NULL,'2019-04-12 08:26:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Installed Modules','MODULE_PAYMENT_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(63,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(64,'Installed Modules','MODULE_SHIPPING_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(65,'Installed Modules','MODULE_ACTION_RECORDER_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(66,'Installed Modules','MODULE_SOCIAL_BOOKMARKS_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(67,'Installed Modules','MODULE_CONTENT_NAVBAR_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(68,'Installed Modules','MODULE_HEADER_TAGS_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(69,'Installed Modules','MODULE_ADMIN_DASHBOARD_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:02',NULL,NULL),(70,'Installed Modules','MODULE_BOXES_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(71,'Installed Modules','MODULE_CONTENT_INSTALLED','','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(72,'Installed Template Block Groups','TEMPLATE_BLOCK_GROUPS','boxes;header_tags','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(73,'Default Currency','DEFAULT_CURRENCY','USD','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(74,'Default Language','DEFAULT_LANGUAGE','en','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(75,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','',6,0,NULL,'2019-04-12 08:26:03',NULL,NULL),(76,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','',7,1,NULL,'2019-04-12 08:26:03','tep_get_country_name','tep_cfg_pull_down_country_list('),(77,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','',7,2,NULL,'2019-04-12 08:26:03',NULL,NULL),(78,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','',7,3,NULL,'2019-04-12 08:26:03',NULL,NULL),(79,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','',7,4,NULL,'2019-04-12 08:26:04',NULL,NULL),(80,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','',7,5,NULL,'2019-04-12 08:26:04',NULL,NULL),(81,'Allow Orders Not Matching Defined Shipping Zones ','SHIPPING_ALLOW_UNDEFINED_ZONES','False','',7,5,NULL,'2019-04-12 08:26:04',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(82,'Display Product Image (0=disable; 1=enable)','PRODUCT_LIST_IMAGE','1','',8,1,NULL,'2019-04-12 08:26:04',NULL,NULL),(83,'Display Product Manufacturer Name (0=disable; 1=enable)','PRODUCT_LIST_MANUFACTURER','0','',8,2,NULL,'2019-04-12 08:26:04',NULL,NULL),(84,'Display Product Model (0=disable; 1=enable)','PRODUCT_LIST_MODEL','0','',8,3,NULL,'2019-04-12 08:26:04',NULL,NULL),(85,'Display Product Name (0=disable; 1=enable)','PRODUCT_LIST_NAME','1','',8,4,NULL,'2019-04-12 08:26:04',NULL,NULL),(86,'Display Product Price (0=disable; 1=enable)','PRODUCT_LIST_PRICE','1','',8,5,NULL,'2019-04-12 08:26:04',NULL,NULL),(87,'Display Product Quantity (0=disable; 1=enable)','PRODUCT_LIST_QUANTITY','0','',8,6,NULL,'2019-04-12 08:26:04',NULL,NULL),(88,'Display Product Weight (0=disable; 1=enable)','PRODUCT_LIST_WEIGHT','0','',8,7,NULL,'2019-04-12 08:26:04',NULL,NULL),(89,'Display Buy Now column (0=disable; 1=enable)','PRODUCT_LIST_BUY_NOW','1','',8,8,NULL,'2019-04-12 08:26:05',NULL,NULL),(90,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','1','',8,9,NULL,'2019-04-12 08:26:05',NULL,NULL),(91,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','',8,10,NULL,'2019-04-12 08:26:05',NULL,NULL),(92,'Check stock level','STOCK_CHECK','true','',9,1,NULL,'2019-04-12 08:26:05',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(93,'Subtract stock','STOCK_LIMITED','true','',9,2,NULL,'2019-04-12 08:26:05',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(94,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','',9,3,NULL,'2019-04-12 08:26:05',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(95,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','',9,4,NULL,'2019-04-12 08:26:05',NULL,NULL),(96,'Stock Re-order level','STOCK_REORDER_LEVEL','5','',9,5,NULL,'2019-04-12 08:26:05',NULL,NULL),(97,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','',10,1,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(98,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','',10,2,NULL,'2019-04-12 08:26:06',NULL,NULL),(99,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','',10,3,NULL,'2019-04-12 08:26:06',NULL,NULL),(100,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','',10,4,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(101,'Store Database Queries','STORE_DB_TRANSACTIONS','false','',10,5,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(102,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','',12,1,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(103,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','',12,4,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(104,'Send E-Mails','SEND_EMAILS','true','',12,5,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(105,'Enable download','DOWNLOAD_ENABLED','false','',13,1,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(106,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','',13,2,NULL,'2019-04-12 08:26:06',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(107,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','',13,3,NULL,'2019-04-12 08:26:07',NULL,''),(108,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','',13,4,NULL,'2019-04-12 08:26:07',NULL,''),(109,'Enable GZip Compression','GZIP_COMPRESSION','false','',14,1,NULL,'2019-04-12 08:26:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(110,'Compression Level','GZIP_LEVEL','5','',14,2,NULL,'2019-04-12 08:26:07',NULL,NULL),(111,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','',15,3,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(112,'Check User Agent','SESSION_CHECK_USER_AGENT','False','',15,4,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(113,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','',15,5,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(114,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','',15,6,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(115,'Last Update Check Time','LAST_UPDATE_CHECK_TIME','','',6,0,NULL,'2019-04-12 08:26:08',NULL,NULL),(116,'Store Logo','STORE_LOGO','store_logo.png','',6,1000,NULL,'2019-04-12 08:26:08',NULL,NULL),(117,'Bootstrap Container','BOOTSTRAP_CONTAINER','container-fluid','',16,1,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'container-fluid\', \'container\'), '),(118,'Bootstrap Content','BOOTSTRAP_CONTENT','8','',16,2,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'8\', \'6\', \'4\'), '),(119,'Verify SSL Certificates','OSCOM_HTTP_VERIFY_SSL','True','',17,1,NULL,'2019-04-12 08:26:08',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(120,'Proxy','OSCOM_HTTP_PROXY','','',17,2,NULL,'2019-04-12 08:26:08',NULL,NULL);
/*!40000 ALTER TABLE `osc_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_products`
--

DROP TABLE IF EXISTS `osc_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  `products_gtin` char(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_products`
--

LOCK TABLES `osc_products` WRITE;
/*!40000 ALTER TABLE `osc_products` DISABLE KEYS */;
INSERT INTO `osc_products` VALUES (1,32,'MG200MMS','matrox/mg200mms.gif',299.9900,'2019-04-12 08:26:40',NULL,NULL,23.00,1,1,1,0,NULL),(2,32,'MG400-32MB','matrox/mg400-32mb.gif',499.9900,'2019-04-12 08:26:41',NULL,NULL,23.00,1,1,1,0,NULL),(3,2,'MSIMPRO','microsoft/msimpro.gif',49.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(4,13,'DVD-RPMK','dvd/replacement_killers.gif',42.0000,'2019-04-12 08:26:41',NULL,NULL,23.00,1,1,2,0,NULL),(5,17,'DVD-BLDRNDC','dvd/blade_runner.gif',35.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(6,10,'DVD-MATR','dvd/the_matrix.gif',39.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(7,10,'DVD-YGEM','dvd/youve_got_mail.gif',34.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(8,10,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(9,10,'DVD-UNSG','dvd/under_siege.gif',29.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(10,10,'DVD-UNSG2','dvd/under_siege2.gif',29.9900,'2019-04-12 08:26:41',NULL,NULL,7.00,1,1,3,0,NULL),(11,10,'DVD-FDBL','dvd/fire_down_below.gif',29.9900,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,3,0,NULL),(12,10,'DVD-DHWV','dvd/die_hard_3.gif',39.9900,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,4,0,NULL),(13,10,'DVD-LTWP','dvd/lethal_weapon.gif',34.9900,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,3,0,NULL),(14,10,'DVD-REDC','dvd/red_corner.gif',32.0000,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,3,0,NULL),(15,10,'DVD-FRAN','dvd/frantic.gif',35.0000,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,3,0,NULL),(16,10,'DVD-CUFI','dvd/courage_under_fire.gif',38.9900,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,4,0,NULL),(17,10,'DVD-SPEED','dvd/speed.gif',39.9900,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,4,0,NULL),(18,10,'DVD-SPEED2','dvd/speed_2.gif',42.0000,'2019-04-12 08:26:42',NULL,NULL,7.00,1,1,4,0,NULL),(19,10,'DVD-TSAB','dvd/theres_something_about_mary.gif',49.9900,'2019-04-12 08:26:43',NULL,NULL,7.00,1,1,4,0,NULL),(20,10,'DVD-BELOVED','dvd/beloved.gif',54.9900,'2019-04-12 08:26:43',NULL,NULL,7.00,1,1,3,0,NULL),(21,16,'PC-SWAT3','sierra/swat_3.gif',79.9900,'2019-04-12 08:26:43',NULL,NULL,7.00,1,1,7,0,NULL),(22,13,'PC-UNTM','gt_interactive/unreal_tournament.gif',89.9900,'2019-04-12 08:26:43',NULL,NULL,7.00,1,1,8,0,NULL),(23,16,'PC-TWOF','gt_interactive/wheel_of_time.gif',99.9900,'2019-04-12 08:26:43',NULL,NULL,10.00,1,1,8,0,NULL),(24,17,'PC-DISC','gt_interactive/disciples.gif',90.0000,'2019-04-12 08:26:43',NULL,NULL,8.00,1,1,8,0,NULL),(25,16,'MSINTKB','microsoft/intkeyboardps2.gif',69.9900,'2019-04-12 08:26:43',NULL,NULL,8.00,1,1,2,0,NULL),(26,10,'MSIMEXP','microsoft/imexplorer.gif',64.9500,'2019-04-12 08:26:43',NULL,NULL,8.00,1,1,2,0,NULL),(27,8,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.9900,'2019-04-12 08:26:43',NULL,NULL,45.00,1,1,9,0,NULL),(28,100,'GT-P1000','samsung/galaxy_tab.gif',749.9900,'2019-04-12 08:26:43',NULL,NULL,1.00,1,1,10,0,NULL);
/*!40000 ALTER TABLE `osc_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_products_description`
--

DROP TABLE IF EXISTS `osc_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `products_description` text COLLATE utf8_unicode_ci,
  `products_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  `products_seo_description` text COLLATE utf8_unicode_ci,
  `products_seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_products_description`
--

LOCK TABLES `osc_products_description` WRITE;
/*!40000 ALTER TABLE `osc_products_description` DISABLE KEYS */;
INSERT INTO `osc_products_description` VALUES (1,1,'Matrox G200 MMS','','www.matrox.com/mga/products/g200_mms/home.cfm',0,NULL,NULL,NULL),(2,1,'Matrox G400 32MB','','www.matrox.com/mga/products/mill_g400/home.htm',0,NULL,NULL,NULL),(3,1,'Microsoft IntelliMouse Pro','','www.microsoft.com/hardware/mouse/intellimouse.asp',0,NULL,NULL,NULL),(4,1,'The Replacement Killers','','www.replacement-killers.com',0,NULL,NULL,NULL),(5,1,'Blade Runner - Director\'s Cut','','www.bladerunner.com',0,NULL,NULL,NULL),(6,1,'The Matrix','','www.thematrix.com',0,NULL,NULL,NULL),(7,1,'You\'ve Got Mail','','www.youvegotmail.com',0,NULL,NULL,NULL),(8,1,'A Bug\'s Life','','www.abugslife.com',0,NULL,NULL,NULL),(9,1,'Under Siege','','',0,NULL,NULL,NULL),(10,1,'Under Siege 2 - Dark Territory','','',0,NULL,NULL,NULL),(11,1,'Fire Down Below','','',0,NULL,NULL,NULL),(12,1,'Die Hard With A Vengeance','','',0,NULL,NULL,NULL),(13,1,'Lethal Weapon','','',0,NULL,NULL,NULL),(14,1,'Red Corner','','',0,NULL,NULL,NULL),(15,1,'Frantic','','',0,NULL,NULL,NULL),(16,1,'Courage Under Fire','','',0,NULL,NULL,NULL),(17,1,'Speed','','',0,NULL,NULL,NULL),(18,1,'Speed 2: Cruise Control','','',0,NULL,NULL,NULL),(19,1,'There\'s Something About Mary','','',0,NULL,NULL,NULL),(20,1,'Beloved','','',0,NULL,NULL,NULL),(21,1,'SWAT 3: Close Quarters Battle','','www.swat3.com',0,NULL,NULL,NULL),(22,1,'Unreal Tournament','','www.unrealtournament.net',0,NULL,NULL,NULL),(23,1,'The Wheel Of Time','','www.wheeloftime.com',0,NULL,NULL,NULL),(24,1,'Disciples: Sacred Lands','','',0,NULL,NULL,NULL),(25,1,'Microsoft Internet Keyboard PS/2','','',0,NULL,NULL,NULL),(26,1,'Microsoft IntelliMouse Explorer','','www.microsoft.com/hardware/mouse/explorer.asp',0,NULL,NULL,NULL),(27,1,'Hewlett Packard LaserJet 1100Xi','','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0,NULL,NULL,NULL),(28,1,'Samsung Galaxy Tab','','http://galaxytab.samsungmobile.com',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `osc_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osc_products_to_categories`
--

DROP TABLE IF EXISTS `osc_products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osc_products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osc_products_to_categories`
--

LOCK TABLES `osc_products_to_categories` WRITE;
/*!40000 ALTER TABLE `osc_products_to_categories` DISABLE KEYS */;
INSERT INTO `osc_products_to_categories` VALUES (1,4),(2,4),(3,9),(4,10),(5,11),(6,10),(7,12),(8,13),(9,10),(10,10),(11,10),(12,10),(13,10),(14,15),(15,14),(16,15),(17,10),(18,10),(19,12),(20,15),(21,18),(22,19),(23,20),(24,20),(25,8),(26,9),(27,5),(28,21);
/*!40000 ALTER TABLE `osc_products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_channel`
--

DROP TABLE IF EXISTS `sylius_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_locale_id` int(11) NOT NULL,
  `base_currency_id` int(11) NOT NULL,
  `default_tax_zone_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `theme_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_calculation_strategy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipping_shipping_step_allowed` tinyint(1) NOT NULL,
  `skipping_payment_step_allowed` tinyint(1) NOT NULL,
  `account_verification_required` tinyint(1) NOT NULL,
  `shop_billing_data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_16C8119E77153098` (`code`),
  UNIQUE KEY `UNIQ_16C8119EB5282EDF` (`shop_billing_data_id`),
  KEY `IDX_16C8119E743BF776` (`default_locale_id`),
  KEY `IDX_16C8119E3101778E` (`base_currency_id`),
  KEY `IDX_16C8119EA978C17` (`default_tax_zone_id`),
  KEY `IDX_16C8119EE551C011` (`hostname`),
  CONSTRAINT `FK_16C8119E3101778E` FOREIGN KEY (`base_currency_id`) REFERENCES `sylius_currency` (`id`),
  CONSTRAINT `FK_16C8119E743BF776` FOREIGN KEY (`default_locale_id`) REFERENCES `sylius_locale` (`id`),
  CONSTRAINT `FK_16C8119EA978C17` FOREIGN KEY (`default_tax_zone_id`) REFERENCES `sylius_zone` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_16C8119EB5282EDF` FOREIGN KEY (`shop_billing_data_id`) REFERENCES `sylius_shop_billing_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel`
--

LOCK TABLES `sylius_channel` WRITE;
/*!40000 ALTER TABLE `sylius_channel` DISABLE KEYS */;
INSERT INTO `sylius_channel` VALUES (1,1,1,1,'US_WEB','US Web Store','LemonChiffon',NULL,1,'localhost','2019-04-19 22:45:05','2019-04-19 22:45:05',NULL,'order_items_based',NULL,0,0,1,NULL);
/*!40000 ALTER TABLE `sylius_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_channel_pricing`
--

DROP TABLE IF EXISTS `sylius_channel_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_channel_pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_variant_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `channel_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_channel_idx` (`product_variant_id`,`channel_code`),
  KEY `IDX_7801820CA80EF684` (`product_variant_id`),
  CONSTRAINT `FK_7801820CA80EF684` FOREIGN KEY (`product_variant_id`) REFERENCES `sylius_product_variant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_channel_pricing`
--

LOCK TABLES `sylius_channel_pricing` WRITE;
/*!40000 ALTER TABLE `sylius_channel_pricing` DISABLE KEYS */;
INSERT INTO `sylius_channel_pricing` VALUES (1,1,494,NULL,'US_WEB'),(2,2,192,NULL,'US_WEB'),(3,3,533,NULL,'US_WEB'),(4,4,272,NULL,'US_WEB'),(5,5,686,NULL,'US_WEB'),(6,6,430,NULL,'US_WEB'),(7,7,419,NULL,'US_WEB'),(8,8,733,NULL,'US_WEB'),(9,9,79,NULL,'US_WEB'),(10,10,729,NULL,'US_WEB'),(11,11,39,NULL,'US_WEB'),(12,12,74,NULL,'US_WEB'),(13,13,14,NULL,'US_WEB'),(14,14,365,NULL,'US_WEB'),(15,15,573,NULL,'US_WEB'),(16,16,378,NULL,'US_WEB'),(17,17,855,NULL,'US_WEB'),(18,18,965,NULL,'US_WEB'),(19,19,348,NULL,'US_WEB'),(20,20,295,NULL,'US_WEB'),(21,21,739,NULL,'US_WEB'),(22,22,663,NULL,'US_WEB'),(23,23,958,NULL,'US_WEB'),(24,24,877,NULL,'US_WEB'),(25,25,751,NULL,'US_WEB'),(26,26,753,NULL,'US_WEB'),(27,27,702,NULL,'US_WEB'),(28,28,1,NULL,'US_WEB'),(29,29,269,NULL,'US_WEB'),(30,30,953,NULL,'US_WEB'),(31,31,709,NULL,'US_WEB'),(32,32,444,NULL,'US_WEB'),(33,33,971,NULL,'US_WEB'),(34,34,645,NULL,'US_WEB'),(35,35,440,NULL,'US_WEB'),(36,36,938,NULL,'US_WEB'),(37,37,312,NULL,'US_WEB'),(38,38,573,NULL,'US_WEB'),(39,39,328,NULL,'US_WEB'),(40,40,1,NULL,'US_WEB'),(41,41,789,NULL,'US_WEB'),(42,42,916,NULL,'US_WEB'),(43,43,531,NULL,'US_WEB'),(44,44,74,NULL,'US_WEB'),(45,45,651,NULL,'US_WEB'),(46,46,563,NULL,'US_WEB'),(47,47,404,NULL,'US_WEB'),(48,48,337,NULL,'US_WEB'),(49,49,53,NULL,'US_WEB'),(50,50,586,NULL,'US_WEB'),(51,51,258,NULL,'US_WEB'),(52,52,892,NULL,'US_WEB'),(53,53,238,NULL,'US_WEB'),(54,54,497,NULL,'US_WEB'),(55,55,239,NULL,'US_WEB'),(56,56,100,NULL,'US_WEB'),(57,57,379,NULL,'US_WEB'),(58,58,879,NULL,'US_WEB'),(59,59,142,NULL,'US_WEB'),(60,60,645,NULL,'US_WEB'),(61,61,412,NULL,'US_WEB'),(62,62,138,NULL,'US_WEB'),(63,63,815,NULL,'US_WEB'),(64,64,819,NULL,'US_WEB'),(65,65,52,NULL,'US_WEB'),(66,66,448,NULL,'US_WEB'),(67,67,811,NULL,'US_WEB'),(68,68,800,NULL,'US_WEB'),(69,69,985,NULL,'US_WEB'),(70,70,440,NULL,'US_WEB'),(71,71,195,NULL,'US_WEB'),(72,72,860,NULL,'US_WEB'),(73,73,870,NULL,'US_WEB'),(74,74,222,NULL,'US_WEB'),(75,75,689,NULL,'US_WEB'),(76,76,191,NULL,'US_WEB'),(77,77,781,NULL,'US_WEB'),(78,78,102,NULL,'US_WEB'),(79,79,475,NULL,'US_WEB'),(80,80,800,NULL,'US_WEB'),(81,81,400,NULL,'US_WEB'),(82,82,995,NULL,'US_WEB'),(83,83,781,NULL,'US_WEB'),(84,84,351,NULL,'US_WEB'),(85,85,643,NULL,'US_WEB'),(86,86,777,NULL,'US_WEB'),(87,87,628,NULL,'US_WEB'),(88,88,360,NULL,'US_WEB'),(89,89,257,NULL,'US_WEB'),(90,90,883,NULL,'US_WEB'),(91,91,949,NULL,'US_WEB'),(92,92,452,NULL,'US_WEB'),(93,93,475,NULL,'US_WEB'),(94,94,296,NULL,'US_WEB'),(95,95,747,NULL,'US_WEB'),(96,96,355,NULL,'US_WEB'),(97,97,919,NULL,'US_WEB'),(98,98,767,NULL,'US_WEB'),(99,99,810,NULL,'US_WEB'),(100,100,272,NULL,'US_WEB'),(101,101,342,NULL,'US_WEB'),(102,102,410,NULL,'US_WEB'),(103,103,332,NULL,'US_WEB'),(104,104,745,NULL,'US_WEB'),(105,105,170,NULL,'US_WEB'),(106,106,215,NULL,'US_WEB'),(107,107,599,NULL,'US_WEB'),(108,108,294,NULL,'US_WEB'),(109,109,943,NULL,'US_WEB'),(110,110,258,NULL,'US_WEB'),(111,111,223,NULL,'US_WEB'),(112,112,125,NULL,'US_WEB'),(113,113,306,NULL,'US_WEB'),(114,114,53,NULL,'US_WEB'),(115,115,109,NULL,'US_WEB'),(116,116,194,NULL,'US_WEB'),(117,117,491,NULL,'US_WEB'),(118,118,541,NULL,'US_WEB'),(119,119,39,NULL,'US_WEB'),(120,120,248,NULL,'US_WEB'),(121,121,995,NULL,'US_WEB'),(122,122,559,NULL,'US_WEB'),(123,123,212,NULL,'US_WEB'),(124,124,326,NULL,'US_WEB'),(125,125,143,NULL,'US_WEB'),(126,126,269,NULL,'US_WEB'),(127,127,453,NULL,'US_WEB'),(128,128,133,NULL,'US_WEB'),(129,129,331,NULL,'US_WEB'),(130,130,67,NULL,'US_WEB'),(131,131,597,NULL,'US_WEB'),(132,132,269,NULL,'US_WEB'),(133,133,208,NULL,'US_WEB'),(134,134,552,NULL,'US_WEB'),(135,135,290,NULL,'US_WEB'),(136,136,993,NULL,'US_WEB'),(137,137,337,NULL,'US_WEB'),(138,138,880,NULL,'US_WEB'),(139,139,795,NULL,'US_WEB'),(140,140,120,NULL,'US_WEB'),(141,141,682,NULL,'US_WEB'),(142,142,841,NULL,'US_WEB'),(143,143,638,NULL,'US_WEB'),(144,144,139,NULL,'US_WEB'),(145,145,584,NULL,'US_WEB'),(146,146,960,NULL,'US_WEB'),(147,147,330,NULL,'US_WEB'),(148,148,726,NULL,'US_WEB'),(149,149,384,NULL,'US_WEB'),(150,150,604,NULL,'US_WEB'),(151,151,897,NULL,'US_WEB'),(152,152,143,NULL,'US_WEB'),(153,153,79,NULL,'US_WEB'),(154,154,44,NULL,'US_WEB'),(155,155,998,NULL,'US_WEB'),(156,156,438,NULL,'US_WEB'),(157,157,554,NULL,'US_WEB'),(158,158,380,NULL,'US_WEB'),(159,159,144,NULL,'US_WEB'),(160,160,857,NULL,'US_WEB'),(161,161,220,NULL,'US_WEB'),(162,162,478,NULL,'US_WEB'),(163,163,293,NULL,'US_WEB'),(164,164,235,NULL,'US_WEB'),(165,165,412,NULL,'US_WEB'),(166,166,319,NULL,'US_WEB'),(167,167,553,NULL,'US_WEB'),(168,168,992,NULL,'US_WEB'),(169,169,652,NULL,'US_WEB'),(170,170,402,NULL,'US_WEB'),(171,171,868,NULL,'US_WEB'),(172,172,969,NULL,'US_WEB'),(173,173,789,NULL,'US_WEB'),(174,174,518,NULL,'US_WEB'),(175,175,714,NULL,'US_WEB'),(176,176,948,NULL,'US_WEB'),(177,177,703,NULL,'US_WEB'),(178,178,457,NULL,'US_WEB'),(179,179,730,NULL,'US_WEB'),(180,180,919,NULL,'US_WEB'),(181,181,612,NULL,'US_WEB'),(182,182,777,NULL,'US_WEB'),(183,183,814,NULL,'US_WEB'),(184,184,135,NULL,'US_WEB'),(185,185,882,NULL,'US_WEB'),(186,186,206,NULL,'US_WEB'),(187,187,287,NULL,'US_WEB'),(188,188,114,NULL,'US_WEB'),(189,189,388,NULL,'US_WEB'),(190,190,941,NULL,'US_WEB'),(191,191,347,NULL,'US_WEB'),(192,192,921,NULL,'US_WEB'),(193,193,832,NULL,'US_WEB'),(194,194,444,NULL,'US_WEB'),(195,195,895,NULL,'US_WEB'),(196,196,60,NULL,'US_WEB'),(197,197,549,NULL,'US_WEB'),(198,198,295,NULL,'US_WEB'),(199,199,581,NULL,'US_WEB'),(200,200,470,NULL,'US_WEB'),(201,201,870,NULL,'US_WEB'),(202,202,579,NULL,'US_WEB'),(203,203,473,NULL,'US_WEB'),(204,204,380,NULL,'US_WEB'),(205,205,236,NULL,'US_WEB'),(206,206,772,NULL,'US_WEB'),(207,207,631,NULL,'US_WEB'),(208,208,370,NULL,'US_WEB'),(209,209,649,NULL,'US_WEB'),(210,210,650,NULL,'US_WEB'),(211,211,261,NULL,'US_WEB'),(212,212,180,NULL,'US_WEB'),(213,213,855,NULL,'US_WEB'),(214,214,775,NULL,'US_WEB'),(215,215,342,NULL,'US_WEB'),(216,216,268,NULL,'US_WEB'),(217,217,128,NULL,'US_WEB'),(218,218,8,NULL,'US_WEB'),(219,219,566,NULL,'US_WEB'),(220,220,110,NULL,'US_WEB'),(221,221,635,NULL,'US_WEB'),(222,222,464,NULL,'US_WEB'),(223,223,935,NULL,'US_WEB'),(224,224,154,NULL,'US_WEB'),(225,225,79,NULL,'US_WEB'),(226,226,532,NULL,'US_WEB'),(227,227,101,NULL,'US_WEB'),(228,228,441,NULL,'US_WEB'),(229,229,566,NULL,'US_WEB'),(230,230,737,NULL,'US_WEB'),(231,231,605,NULL,'US_WEB'),(232,232,33,NULL,'US_WEB'),(233,233,566,NULL,'US_WEB'),(234,234,806,NULL,'US_WEB'),(235,235,117,NULL,'US_WEB'),(236,236,545,NULL,'US_WEB'),(237,237,361,NULL,'US_WEB'),(238,238,412,NULL,'US_WEB'),(239,239,416,NULL,'US_WEB'),(240,240,926,NULL,'US_WEB'),(241,241,310,NULL,'US_WEB'),(242,242,713,NULL,'US_WEB'),(243,243,50,NULL,'US_WEB'),(244,244,419,NULL,'US_WEB'),(245,245,297,NULL,'US_WEB'),(246,246,97,NULL,'US_WEB'),(247,247,856,NULL,'US_WEB'),(248,248,458,NULL,'US_WEB'),(249,249,891,NULL,'US_WEB'),(250,250,432,NULL,'US_WEB'),(251,251,249,NULL,'US_WEB'),(252,252,135,NULL,'US_WEB'),(253,253,629,NULL,'US_WEB'),(254,254,299,NULL,'US_WEB'),(255,255,300,NULL,'US_WEB'),(256,256,929,NULL,'US_WEB'),(257,257,533,NULL,'US_WEB'),(258,258,686,NULL,'US_WEB'),(259,259,911,NULL,'US_WEB'),(260,260,631,NULL,'US_WEB'),(261,261,58,NULL,'US_WEB'),(262,262,128,NULL,'US_WEB'),(263,263,181,NULL,'US_WEB'),(264,264,389,NULL,'US_WEB'),(265,265,648,NULL,'US_WEB'),(266,266,935,NULL,'US_WEB'),(267,267,87,NULL,'US_WEB'),(268,268,436,NULL,'US_WEB'),(269,269,591,NULL,'US_WEB'),(270,270,301,NULL,'US_WEB'),(271,271,487,NULL,'US_WEB'),(272,272,387,NULL,'US_WEB'),(273,273,966,NULL,'US_WEB'),(274,274,312,NULL,'US_WEB'),(275,275,443,NULL,'US_WEB'),(276,276,576,NULL,'US_WEB'),(277,277,742,NULL,'US_WEB'),(278,278,176,NULL,'US_WEB'),(279,279,459,NULL,'US_WEB'),(280,280,55,NULL,'US_WEB'),(281,281,283,NULL,'US_WEB'),(282,282,212,NULL,'US_WEB'),(283,283,161,NULL,'US_WEB'),(284,284,125,NULL,'US_WEB'),(285,285,482,NULL,'US_WEB'),(286,286,543,NULL,'US_WEB'),(287,287,53,NULL,'US_WEB'),(288,288,330,NULL,'US_WEB'),(289,289,571,NULL,'US_WEB'),(290,290,666,NULL,'US_WEB'),(291,291,634,NULL,'US_WEB'),(292,292,292,NULL,'US_WEB'),(293,293,199,NULL,'US_WEB'),(294,294,361,NULL,'US_WEB'),(295,295,386,NULL,'US_WEB'),(296,296,643,NULL,'US_WEB'),(297,297,426,NULL,'US_WEB'),(298,298,237,NULL,'US_WEB'),(299,299,95,NULL,'US_WEB'),(300,300,999,NULL,'US_WEB'),(301,301,404,NULL,'US_WEB'),(302,302,238,NULL,'US_WEB'),(303,303,138,NULL,'US_WEB'),(304,304,204,NULL,'US_WEB'),(305,305,310,NULL,'US_WEB'),(306,306,907,NULL,'US_WEB'),(307,307,868,NULL,'US_WEB'),(308,308,693,NULL,'US_WEB'),(309,309,741,NULL,'US_WEB'),(310,310,921,NULL,'US_WEB'),(311,311,122,NULL,'US_WEB'),(312,312,779,NULL,'US_WEB'),(313,313,662,NULL,'US_WEB'),(314,314,755,NULL,'US_WEB'),(315,315,318,NULL,'US_WEB'),(316,316,33,NULL,'US_WEB'),(317,317,572,NULL,'US_WEB'),(318,318,215,NULL,'US_WEB'),(319,319,133,NULL,'US_WEB'),(320,320,790,NULL,'US_WEB'),(321,321,640,NULL,'US_WEB'),(322,322,129,NULL,'US_WEB'),(323,323,42,NULL,'US_WEB'),(324,324,47,NULL,'US_WEB'),(325,325,903,NULL,'US_WEB'),(326,326,834,NULL,'US_WEB'),(327,327,257,NULL,'US_WEB'),(328,328,481,NULL,'US_WEB'),(329,329,123,NULL,'US_WEB'),(330,330,277,NULL,'US_WEB');
/*!40000 ALTER TABLE `sylius_channel_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_currency`
--

DROP TABLE IF EXISTS `sylius_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_96EDD3D077153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_currency`
--

LOCK TABLES `sylius_currency` WRITE;
/*!40000 ALTER TABLE `sylius_currency` DISABLE KEYS */;
INSERT INTO `sylius_currency` VALUES (1,'USD','2019-04-19 22:45:05','2019-04-19 22:45:05'),(2,'PLN','2019-04-20 13:23:45','2019-04-20 13:23:45');
/*!40000 ALTER TABLE `sylius_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_product`
--

DROP TABLE IF EXISTS `sylius_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_taxon_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `variant_selection_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `average_rating` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_677B9B7477153098` (`code`),
  KEY `IDX_677B9B74731E505` (`main_taxon_id`),
  CONSTRAINT `FK_677B9B74731E505` FOREIGN KEY (`main_taxon_id`) REFERENCES `sylius_taxon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product`
--

LOCK TABLES `sylius_product` WRITE;
/*!40000 ALTER TABLE `sylius_product` DISABLE KEYS */;
INSERT INTO `sylius_product` VALUES (1,2,'d663d12b-0434-3f2c-996f-c1927142300c','2019-04-15 10:30:37','2019-04-19 22:45:06',1,'match',0),(2,2,'9a6b8ae1-8277-3c40-b288-3f333358b9d3','2019-04-14 01:06:28','2019-04-19 22:45:06',0,'match',0),(3,2,'8bf1c3a2-670c-3092-8bff-21df6f9a1380','2019-04-18 14:32:13','2019-04-19 22:45:06',1,'match',0),(4,2,'be88542c-83a6-3dcc-a691-36ab223c2533','2019-04-19 22:24:27','2019-04-19 22:45:06',1,'match',0),(5,2,'403285b1-2b10-3fe2-96c1-54ef54944266','2019-04-18 06:52:14','2019-04-19 22:45:13',1,'match',3),(6,2,'4351b6b2-89e9-3848-9701-2ba8fef3d7bb','2019-04-14 04:19:23','2019-04-19 22:45:11',1,'match',1),(7,2,'64efaaaf-f4e0-33bb-882e-c0c07169efba','2019-04-15 00:02:41','2019-04-19 22:45:06',1,'match',0),(8,2,'ef5e1018-eb4e-387d-909e-e38f59868b0f','2019-04-14 12:38:42','2019-04-19 22:45:14',1,'match',1),(9,2,'2914e613-e011-3411-bc7a-2c532d7655c3','2019-04-18 07:54:41','2019-04-19 22:45:06',1,'match',0),(10,2,'d523bf30-1e28-3c50-be82-2af926aac1aa','2019-04-13 02:04:25','2019-04-19 22:45:06',1,'match',0),(11,2,'5b39e4cc-13fa-3181-8686-024b24068e64','2019-04-14 06:16:04','2019-04-19 22:45:07',1,'match',0),(12,2,'469b4511-42e9-3307-9101-13c21e633859','2019-04-13 22:32:28','2019-04-19 22:45:07',1,'match',0),(13,2,'01b45827-1229-32c4-9d93-b4d4ba6aeda8','2019-04-18 06:49:25','2019-04-19 22:45:07',1,'match',0),(14,2,'51c32a89-f461-3255-89e2-7afac499263d','2019-04-17 10:32:07','2019-04-19 22:45:14',1,'match',5),(15,2,'a9fcedc4-8af1-32f6-8c7f-dd63fd8e27d2','2019-04-14 18:19:17','2019-04-19 22:45:12',1,'match',2),(16,3,'977eb274-e2cb-309f-80d3-a2a311517400','2019-04-17 08:59:27','2019-04-19 22:45:07',1,'choice',0),(17,3,'5b08eaab-72ba-35fe-9227-d03f2744e6ce','2019-04-14 22:18:02','2019-04-19 22:45:07',1,'choice',0),(18,3,'5d7cdc38-630d-357d-a6d4-66f81aa7adc0','2019-04-15 01:52:24','2019-04-19 22:45:07',1,'choice',0),(19,3,'777d6563-0968-337b-8c79-4dddbfe4fbb8','2019-04-14 13:18:02','2019-04-19 22:45:12',1,'choice',3),(20,3,'54b96799-c263-3607-a2b0-51ab76c41167','2019-04-18 15:14:49','2019-04-19 22:45:07',0,'choice',0),(21,3,'eef4cb74-0950-3dc1-81fd-edfd26f3d362','2019-04-16 19:18:34','2019-04-19 22:45:14',1,'choice',3),(22,3,'e8b57beb-ee95-3469-9109-fce4cf958e6b','2019-04-13 09:05:38','2019-04-19 22:45:07',1,'choice',0),(23,3,'17031905-dbb6-34ce-9e23-d03e1a62edc9','2019-04-18 20:02:32','2019-04-19 22:45:07',1,'choice',0),(24,3,'80eb6a50-50f9-3217-89c7-d6f107efb136','2019-04-13 06:33:08','2019-04-19 22:45:07',1,'choice',0),(25,3,'6b88d1da-3cf8-3066-baed-e8e8ea8c0c3d','2019-04-13 13:34:46','2019-04-19 22:45:13',1,'choice',2),(26,3,'f2c2401a-7e02-300b-a81b-25b52a768a7d','2019-04-13 23:48:46','2019-04-19 22:45:14',0,'choice',1),(27,3,'4c6e5bc0-98fc-3a77-9b2d-f86106c03411','2019-04-16 16:05:23','2019-04-19 22:45:08',1,'choice',0),(28,3,'3788d194-8869-3c48-aff8-a97e3a65aee8','2019-04-16 01:09:25','2019-04-19 22:45:08',1,'choice',0),(29,3,'37430294-798e-3d61-b139-85f2bb2fd29e','2019-04-19 16:14:52','2019-04-19 22:45:08',1,'choice',0),(30,3,'ce7174ec-b86d-362c-8844-289fd878dfe8','2019-04-15 20:43:51','2019-04-19 22:45:08',1,'choice',0),(31,4,'eecc7b33-709f-37f6-ada0-a0c7da7620df','2019-04-14 02:57:43','2019-04-19 22:45:08',1,'match',0),(32,4,'3a4e9a24-130d-36b0-b543-4f2d8ad9bfe2','2019-04-13 21:13:39','2019-04-19 22:45:08',1,'match',0),(33,4,'bb6fb435-a358-3687-92da-a7d1e72f81da','2019-04-18 17:36:14','2019-04-19 22:45:14',1,'match',3.5),(34,4,'f9c4b832-4df5-313d-b639-5d2891219443','2019-04-17 05:28:47','2019-04-19 22:45:13',1,'match',2.5),(35,4,'690f333d-3660-3ffc-8442-cd2a345ae7dc','2019-04-13 01:59:31','2019-04-19 22:45:08',1,'match',0),(36,4,'19fedfe4-48bf-33df-bcbe-c1eb7098f9e4','2019-04-13 14:09:43','2019-04-19 22:45:08',1,'match',0),(37,4,'6e00e25d-009b-3b3b-ad2b-a665bb67ae9a','2019-04-16 10:13:28','2019-04-19 22:45:12',1,'match',3),(38,4,'c4fedb3e-1154-3516-88c3-c5c1eed09ac8','2019-04-14 11:37:28','2019-04-19 22:45:08',1,'match',0),(39,4,'a0da86aa-7f14-3ade-b8eb-e3709489f2ca','2019-04-15 14:30:36','2019-04-19 22:45:08',1,'match',0),(40,4,'9ce68a4c-3bd1-3276-b34a-8b00edfec373','2019-04-15 23:05:24','2019-04-19 22:45:08',1,'match',0),(41,4,'9728a9eb-7d06-32bc-8f26-c95de137d06d','2019-04-13 09:41:30','2019-04-19 22:45:09',1,'match',0),(42,4,'70ae980f-d1d5-31f2-a775-839eb4236b7b','2019-04-19 01:52:23','2019-04-19 22:45:12',1,'match',1),(43,4,'c9c1cf69-a37e-3183-8c1e-140c9fe257c9','2019-04-15 22:44:48','2019-04-19 22:45:11',1,'match',1),(44,4,'5c2d2047-c76f-335c-8f24-d6f98c9a4b46','2019-04-13 22:58:33','2019-04-19 22:45:09',1,'match',0),(45,4,'86156e6b-1bee-3840-b2ad-65b48cb3642c','2019-04-15 16:01:22','2019-04-19 22:45:09',1,'match',0),(46,6,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff','2019-04-14 08:19:13','2019-04-19 22:45:09',0,'match',0),(47,7,'516904f0-f954-3b91-b8cb-bf8244c3379e','2019-04-16 22:18:54','2019-04-19 22:45:09',1,'match',0),(48,7,'4f644b6b-919a-3d76-8e87-a0c6bffc6391','2019-04-17 00:58:24','2019-04-19 22:45:10',1,'match',0),(49,7,'c3e7fdb8-9d30-3824-b739-d0032dd35765','2019-04-16 03:05:57','2019-04-19 22:45:13',1,'match',1),(50,6,'0631d920-9f3e-386b-a5be-db5bd2c403e5','2019-04-16 00:33:51','2019-04-19 22:45:10',1,'match',0),(51,7,'1911168f-969d-3026-a873-3e8b1e70a7a3','2019-04-15 19:59:59','2019-04-19 22:45:10',1,'match',0),(52,7,'2d0716b6-c904-3ecb-936d-e96dc4215bcf','2019-04-15 10:55:02','2019-04-19 22:45:10',1,'match',0),(53,6,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42','2019-04-14 16:40:59','2019-04-19 22:45:10',1,'match',0),(54,7,'fcadec2c-7021-3f55-b7e0-4b1b05bee317','2019-04-14 01:14:42','2019-04-19 22:45:10',1,'match',0),(55,7,'300c7249-6903-3d8f-a152-d8d517734134','2019-04-13 18:36:45','2019-04-19 22:45:10',1,'match',0),(56,7,'be69a367-3a91-36f2-a9e6-17594b2e1ce8','2019-04-14 09:44:38','2019-04-19 22:45:10',1,'match',0),(57,7,'04907766-0d1c-3ef3-b451-a1146b4edf1b','2019-04-17 15:51:29','2019-04-19 22:45:11',1,'match',0),(58,7,'0362b852-c0ca-3069-aae4-b7693d77bfce','2019-04-18 05:12:09','2019-04-19 22:45:11',1,'match',0),(59,6,'6211c8ca-c207-3720-8ca8-b6b856d82585','2019-04-16 19:02:30','2019-04-19 22:45:11',1,'match',0),(60,7,'2987a077-f6bd-3c6c-91d5-448700e56479','2019-04-16 12:52:05','2019-04-19 22:45:11',1,'match',0);
/*!40000 ALTER TABLE `sylius_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_product_image`
--

DROP TABLE IF EXISTS `sylius_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_88C64B2D7E3C61F9` (`owner_id`),
  CONSTRAINT `FK_88C64B2D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_image`
--

LOCK TABLES `sylius_product_image` WRITE;
/*!40000 ALTER TABLE `sylius_product_image` DISABLE KEYS */;
INSERT INTO `sylius_product_image` VALUES (1,1,'main','68/84/18416cefa41e702010dc9f9569be.jpeg'),(2,1,'thumbnail','f9/96/5bda770ff1c528600dd31e41fffb.jpeg'),(3,2,'main','71/fe/fff75a788f732ee8042a0ebb2f2a.jpeg'),(4,2,'thumbnail','51/8d/132234a8669cae769d8239d8f038.jpeg'),(5,3,'main','b6/7c/38ce489f6836d7489e12b93b3699.jpeg'),(6,3,'thumbnail','6d/1f/31fee67c9d4702c54075d65a4606.jpeg'),(7,4,'main','92/31/7850de48885627181ef75f4502cb.jpeg'),(8,4,'thumbnail','ef/ea/a7b159f02c3b6c12e48838ca8b7f.jpeg'),(9,5,'main','c9/7a/ed34a719d1c586ef3ef32e8065ae.jpeg'),(10,5,'thumbnail','95/3d/693ba2607087138eaabde2009ce3.jpeg'),(11,6,'main','62/b4/10b1991cb183bb95c0c9b1615d62.jpeg'),(12,6,'thumbnail','37/48/8dfb521e6d43eb8076ef91a2449f.jpeg'),(13,7,'main','f9/47/d680a3ed483e246849a40286a6c2.jpeg'),(14,7,'thumbnail','9c/b2/dae4dda8d3c64fe316d12880b04d.jpeg'),(15,8,'main','d6/e4/95a9abcacfe8f6c5779da95b4bd3.jpeg'),(16,8,'thumbnail','3f/76/c74bfefa7aa95ee6c2b9ac92df01.jpeg'),(17,9,'main','fa/49/5a9fc2dea02cfd7093b5c322c34c.jpeg'),(18,9,'thumbnail','f5/83/367e6094045bee121cdb7ebaf18a.jpeg'),(19,10,'main','a7/7a/2ae7ba6a21a0dfac11b40f27259f.jpeg'),(20,10,'thumbnail','57/02/4478d01e61ed12caf19a6686ddc4.jpeg'),(21,11,'main','a4/f1/be60693560379b8a49a3907c9379.jpeg'),(22,11,'thumbnail','9a/98/57d138f81c3fe08f1be044828c4a.jpeg'),(23,12,'main','3f/f0/03c49b66da1c7f34bd64ec718532.jpeg'),(24,12,'thumbnail','a3/38/5d40c09db8a6182570aae925694b.jpeg'),(25,13,'main','95/19/0737ab4433c9cef144d1c34771c8.jpeg'),(26,13,'thumbnail','48/52/f54dbd6ac6575d034b286e13d5cb.jpeg'),(27,14,'main','7c/58/ba03ace661b3c9a4ac7d204dbf16.jpeg'),(28,14,'thumbnail','34/f1/51a6ff88c7339f67c4740367b749.jpeg'),(29,15,'main','0c/e8/1290446a6e5c29eccfebe92e0ea9.jpeg'),(30,15,'thumbnail','9b/5d/0df4af9bfd389f361f988b654d2e.jpeg'),(31,16,'main','b9/c2/0c6b2bd956cc0ed3fcdcd37356a9.jpeg'),(32,16,'thumbnail','a6/77/086a1d92ff6362da8e22ce27c19f.jpeg'),(33,17,'main','f3/87/792a09d0afe582fbd698339d1381.jpeg'),(34,17,'thumbnail','94/50/bb81ddd81548e87ee4d47b48950d.jpeg'),(35,18,'main','57/13/35515d037fac1351737e909ca9ab.jpeg'),(36,18,'thumbnail','f8/0e/12e8a62bd15a1c49643e4ffee3a8.jpeg'),(37,19,'main','22/36/85cc3940e5383650560a0a7c977e.jpeg'),(38,19,'thumbnail','54/22/e2a9f8f4cb94aeb07c51479450e7.jpeg'),(39,20,'main','99/80/373a7f21c1ced93438f19ac0a544.jpeg'),(40,20,'thumbnail','34/53/24317f4743107037a7dec7a0f2c0.jpeg'),(41,21,'main','ce/b0/343c7d50a541453f05b983c94980.jpeg'),(42,21,'thumbnail','f8/7d/c1e4f584b214911a9fafe7ea6e21.jpeg'),(43,22,'main','04/71/38c68cfb406d49e5b8a9f3ddbbd9.jpeg'),(44,22,'thumbnail','8f/b7/371650b74f0a83d34b9699ef9e07.jpeg'),(45,23,'main','16/fe/faf84f7ae81244f15a4bfce9286a.jpeg'),(46,23,'thumbnail','56/69/840e0b908c85ca5cb7ae8761cdf4.jpeg'),(47,24,'main','24/25/5db9cba262a43f3fab73323bdeb6.jpeg'),(48,24,'thumbnail','6e/98/5b93569d92a3bfbf64ec9604ff8f.jpeg'),(49,25,'main','b2/e3/ac41f6f79155032b8067c7e5db96.jpeg'),(50,25,'thumbnail','a7/d0/820f996f23ae81776a73773e5fb3.jpeg'),(51,26,'main','b0/68/6513cb2be65aef174c8ba0197f2c.jpeg'),(52,26,'thumbnail','c5/ca/b77d1265f070bf9e18c1506bf71f.jpeg'),(53,27,'main','34/c5/02fa257cdb8fbef16c57c558505b.jpeg'),(54,27,'thumbnail','79/86/7d71727d559201cf2df464e2d5f0.jpeg'),(55,28,'main','39/87/8562ed73240b3e3ac8a803e1dff4.jpeg'),(56,28,'thumbnail','da/cf/fef842f815da7725a2bd03a4e789.jpeg'),(57,29,'main','fe/37/d9ffeedebc5f41efaa274b2b5791.jpeg'),(58,29,'thumbnail','22/c8/62bf25ea1392ed107f8ced165576.jpeg'),(59,30,'main','58/10/4d3f9626dbd982d9b7619457269f.jpeg'),(60,30,'thumbnail','11/13/92b9234eac535b34d89a15715823.jpeg'),(61,31,'main','0f/4f/3a27c52249649db5071884b65b90.jpeg'),(62,31,'thumbnail','15/f5/acb9c7704b0493fc318be033a9ec.jpeg'),(63,32,'main','92/d2/1eff17cc6abdffbd67746c632f84.jpeg'),(64,32,'thumbnail','a0/17/49a8a6e4bed43c763c5869081708.jpeg'),(65,33,'main','96/db/c42988b8fe04be566dcd01ebe695.jpeg'),(66,33,'thumbnail','19/5a/52e38b13ef80a8dfff5f681f1ec0.jpeg'),(67,34,'main','b2/f0/c7a5aa7bd78be9012cdff70f9a0f.jpeg'),(68,34,'thumbnail','49/79/ed8127995e8aed936b785bc3c32b.jpeg'),(69,35,'main','19/99/daa2c33d053ba5f7af76b8a2282f.jpeg'),(70,35,'thumbnail','df/b3/bf4ff7a7367f4c998ee09327bcca.jpeg'),(71,36,'main','41/c7/9d5358a1b528d8d10db7e527765b.jpeg'),(72,36,'thumbnail','e2/26/e08192a0b4b70f75d381a9beba94.jpeg'),(73,37,'main','af/4a/ceda7068c8cd4307c91b95d8b0f1.jpeg'),(74,37,'thumbnail','da/eb/00a3b4683678ee4207f9f79d378c.jpeg'),(75,38,'main','12/95/3a561fc0f793fde6a26eda6bd4d3.jpeg'),(76,38,'thumbnail','9c/53/15d2d4d269c48c12beae5000247c.jpeg'),(77,39,'main','62/ef/e20679b9777bdd5fb91815138166.jpeg'),(78,39,'thumbnail','64/50/1ee5c1f2e3fe17cf47c2aafe76e4.jpeg'),(79,40,'main','47/83/5a8ebb1d5eb6d42c51902b1de79c.jpeg'),(80,40,'thumbnail','53/74/09fb3beb0d580399dc7b02da74ef.jpeg'),(81,41,'main','37/b4/34069883da1ed48821bf67a05d02.jpeg'),(82,41,'thumbnail','24/de/9859b46b78392e6b8a39997b6436.jpeg'),(83,42,'main','37/2d/bd0e33f18b30a4bcbe2db79bb238.jpeg'),(84,42,'thumbnail','ae/1f/2b36913d28ebe9bd2c84c26dbdd1.jpeg'),(85,43,'main','9b/96/f4bf0c784a6c3907db9fd5c51052.jpeg'),(86,43,'thumbnail','f2/4e/4feecf52a0b92bb62ca9bdcf3004.jpeg'),(87,44,'main','9e/4e/e23ca54878affa3edaa4a83d72e3.jpeg'),(88,44,'thumbnail','b1/fc/011ed89778402c10772ec12cd1c2.jpeg'),(89,45,'main','14/b5/df8631f3b3da1c91ca997e250c19.jpeg'),(90,45,'thumbnail','7f/5e/f6b0ca268530a6a1e6869f1b16f1.jpeg'),(91,46,'main','5c/84/56ed8f06576cb71917ff047bd8d8.jpeg'),(92,46,'thumbnail','72/65/9929ba4f4f6db03113240b04c039.jpeg'),(93,47,'main','7b/4a/1345dfd1cb218cfa9d094c7bb496.jpeg'),(94,47,'thumbnail','aa/d1/cefe9990eac54d2aee116af1e23e.jpeg'),(95,48,'main','04/fc/55c2131bf52ea1df314ae296b1e4.jpeg'),(96,48,'thumbnail','27/8e/1196c1c642f137cebd6dd9af41cf.jpeg'),(97,49,'main','c7/84/e852e6bec89ace4c635dbf7cc177.jpeg'),(98,49,'thumbnail','0d/8f/a0e63067850aab79acd70575f2df.jpeg'),(99,50,'main','4c/a2/8dc85144af5195feb05d5fb3584d.jpeg'),(100,50,'thumbnail','67/ff/c15d2f1faa2d4a29663e9ac7303d.jpeg'),(101,51,'main','de/2f/871d4ecf959aaf629dd81efb75d0.jpeg'),(102,51,'thumbnail','62/cc/f289a302ecda74336623a932a9d4.jpeg'),(103,52,'main','a7/ac/b346421fab5f70b67b620f6d2fe1.jpeg'),(104,52,'thumbnail','a5/4b/2e76b5d988c251251e81db3f2f06.jpeg'),(105,53,'main','d6/a3/68c338244170a4ca1107fb888f06.jpeg'),(106,53,'thumbnail','5d/d7/a9db11dbbb3daf492babfd9c73d1.jpeg'),(107,54,'main','38/a5/66b946445d0bc543bf18dd315680.jpeg'),(108,54,'thumbnail','16/7f/2ee51a4aef22d908b2509ea669a6.jpeg'),(109,55,'main','a7/19/14410ffb4f26729626f523c996dd.jpeg'),(110,55,'thumbnail','ce/99/62194b9df33da624c3a6e6d44575.jpeg'),(111,56,'main','ae/74/44482f8b0c620d369603214405c4.jpeg'),(112,56,'thumbnail','3c/e3/a12786dc022e274fa452d3db6e0f.jpeg'),(113,57,'main','9e/bd/aee1179a0dd41da95b112b48249e.jpeg'),(114,57,'thumbnail','1b/de/1aa4f8791cf5b685e7d549aeee05.jpeg'),(115,58,'main','86/07/11165b9a07cccdbdd3bbcbee6317.jpeg'),(116,58,'thumbnail','a0/03/64c0be9be9436acfdbdb72977296.jpeg'),(117,59,'main','ff/79/db7da78be55f3e09b80938727ed9.jpeg'),(118,59,'thumbnail','6f/ba/547a6a4555108879cf59fce8908c.jpeg'),(119,60,'main','90/46/af0388a6ac82b2f2f0c00485ba1a.jpeg'),(120,60,'thumbnail','2a/7e/1a6b0b5a65ac1e45c288d1ded629.jpeg');
/*!40000 ALTER TABLE `sylius_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_product_translation`
--

DROP TABLE IF EXISTS `sylius_product_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8_unicode_ci,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_105A9084180C698989D9B62` (`locale`,`slug`),
  UNIQUE KEY `sylius_product_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_105A9082C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_105A9082C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_translation`
--

LOCK TABLES `sylius_product_translation` WRITE;
/*!40000 ALTER TABLE `sylius_product_translation` DISABLE KEYS */;
INSERT INTO `sylius_product_translation` VALUES (1,1,'Mug \"delectus\"','mug-delectus','',NULL,NULL,'Sit consequatur est cum distinctio voluptates. Maxime neque voluptates doloremque ducimus hic facilis quod. Ex quia et distinctio.','en_US'),(2,2,'Mug \"asperiores\"','mug-asperiores','',NULL,NULL,'Iusto itaque dolor quo id ut. Animi et explicabo dolores molestias. Quas iste perspiciatis facere. Corporis sunt assumenda atque perspiciatis.','en_US'),(3,3,'Mug \"officia\"','mug-officia','',NULL,NULL,'Eos quasi quod velit accusamus veritatis tempore. Sit enim in aut omnis sequi voluptates. Dignissimos harum omnis animi consequatur similique dolor dolor.','en_US'),(4,4,'Mug \"tempore\"','mug-tempore','',NULL,NULL,'Ipsam nulla aut praesentium dolorem quas necessitatibus. Aliquam quam sed exercitationem vel eveniet placeat. Sit dolore aut neque. Dolores veniam aut possimus in fuga enim harum.','en_US'),(5,5,'Mug \"impedit\"','mug-impedit','',NULL,NULL,'Libero doloremque qui soluta voluptate quia. Sed minima nemo iusto aperiam omnis. Dolorem eos voluptas id inventore. Est soluta maiores tenetur iste repellat illum.','en_US'),(6,6,'Mug \"ex\"','mug-ex','',NULL,NULL,'Dignissimos ut qui aperiam aut accusamus. Aperiam officiis beatae inventore aspernatur non. Ut illum expedita ut enim.','en_US'),(7,7,'Mug \"eum\"','mug-eum','',NULL,NULL,'Deserunt accusamus voluptates consequuntur sit ipsa. Est dolor sed consequuntur vero nihil voluptatem illo. Ut quae dolorum aliquid dolores.','en_US'),(8,8,'Mug \"animi\"','mug-animi','',NULL,NULL,'Molestiae ut assumenda vitae quibusdam illo ea quis. Cumque ut perspiciatis incidunt sunt voluptates.','en_US'),(9,9,'Mug \"veritatis\"','mug-veritatis','',NULL,NULL,'Nihil iste numquam dicta laboriosam repudiandae. Voluptas totam placeat animi sint voluptate autem ut. Modi odio in vel necessitatibus et ratione repellat.','en_US'),(10,10,'Mug \"ratione\"','mug-ratione','',NULL,NULL,'Dolores fugit in quia. Maxime qui asperiores voluptatum adipisci consectetur ratione.','en_US'),(11,11,'Mug \"eligendi\"','mug-eligendi','',NULL,NULL,'Dolores soluta est sint qui. Qui excepturi ullam beatae. Delectus rerum necessitatibus et ut. Necessitatibus voluptatem exercitationem voluptates autem quaerat ipsa commodi.','en_US'),(12,12,'Mug \"qui\"','mug-qui','',NULL,NULL,'Fugit ut repudiandae tempore enim quam. Rerum eos nihil modi ullam accusamus alias quasi. Enim veritatis maxime deleniti aliquid numquam. Tempora numquam et recusandae fugiat rerum.','en_US'),(13,13,'Mug \"laborum\"','mug-laborum','',NULL,NULL,'Eos dolores omnis iure rerum autem tempore. Similique voluptate voluptatem nesciunt. Occaecati minus corrupti id perspiciatis sequi sequi sit.','en_US'),(14,14,'Mug \"non\"','mug-non','',NULL,NULL,'Quod voluptate eaque in laboriosam amet. Autem qui iusto saepe saepe saepe omnis. Expedita nesciunt cupiditate ut iure rerum et corrupti in.','en_US'),(15,15,'Mug \"numquam\"','mug-numquam','',NULL,NULL,'In aspernatur eius soluta. Quia blanditiis ad voluptas saepe.','en_US'),(16,16,'Sticker \"aperiam\"','sticker-aperiam','',NULL,NULL,'Magni suscipit dolor et ea neque. Eos dolorem asperiores aut occaecati nulla aut. Mollitia rerum sequi sit provident reprehenderit officiis. Repellat quam ut debitis et laborum.','en_US'),(17,17,'Sticker \"aspernatur\"','sticker-aspernatur','',NULL,NULL,'Fugiat et et sunt id ab. Enim est doloremque ea corporis commodi illo. Voluptatum ut facilis exercitationem animi pariatur qui eos ex.','en_US'),(18,18,'Sticker \"eaque\"','sticker-eaque','',NULL,NULL,'Necessitatibus provident ea labore ut in. Nulla at eum praesentium ut rerum exercitationem architecto. Ea consectetur labore nemo omnis reprehenderit sunt quisquam quos. Aut porro animi inventore placeat illum id non.','en_US'),(19,19,'Sticker \"sapiente\"','sticker-sapiente','',NULL,NULL,'Quo quae quisquam blanditiis aliquid hic quos quasi quia. Deleniti hic a voluptatibus hic repellat illum omnis. Doloribus qui reprehenderit aliquid distinctio distinctio aspernatur. Quo officia voluptates omnis unde omnis.','en_US'),(20,20,'Sticker \"deleniti\"','sticker-deleniti','',NULL,NULL,'Cupiditate dolores aliquam quia ipsum. Ipsa corrupti qui quisquam id. Delectus nam autem libero architecto.','en_US'),(21,21,'Sticker \"doloribus\"','sticker-doloribus','',NULL,NULL,'Mollitia ut labore id est reiciendis. Placeat ex necessitatibus aperiam. Aut ea accusantium velit.','en_US'),(22,22,'Sticker \"corrupti\"','sticker-corrupti','',NULL,NULL,'Saepe voluptates qui et ut et nulla soluta. Cupiditate molestias nihil ut eaque. Tenetur voluptate voluptatem adipisci ea iusto nihil.','en_US'),(23,23,'Sticker \"aut\"','sticker-aut','',NULL,NULL,'Unde similique voluptatum nihil dignissimos impedit. Error error et quibusdam sunt qui atque sit. Asperiores doloremque et sit dicta non et. Aspernatur sunt ut repudiandae vel.','en_US'),(24,24,'Sticker \"tempore\"','sticker-tempore','',NULL,NULL,'Eum omnis iste alias ullam recusandae. Aut quod rerum reiciendis eum rerum repellendus consequatur.','en_US'),(25,25,'Sticker \"fuga\"','sticker-fuga','',NULL,NULL,'Explicabo consectetur vero quod eos quae sit accusamus. Vitae praesentium voluptatem sed rerum et et omnis. Esse dolores quos sit aut autem sequi.','en_US'),(26,26,'Sticker \"iste\"','sticker-iste','',NULL,NULL,'Ea qui tempore reprehenderit qui fugit nesciunt qui. Delectus sint ipsa perferendis asperiores aliquid similique praesentium. Eum est iure iure iste. Est eius quidem perspiciatis asperiores error deserunt veritatis. Dolorum provident dolorem maiores sunt laborum veniam.','en_US'),(27,27,'Sticker \"quaerat\"','sticker-quaerat','',NULL,NULL,'Et deserunt iste quia voluptatem tenetur qui. Ut dolorem facilis explicabo. Voluptatum harum qui recusandae dicta aliquid recusandae. Aut ea qui modi consectetur consequatur. Perspiciatis est ad labore possimus.','en_US'),(28,28,'Sticker \"explicabo\"','sticker-explicabo','',NULL,NULL,'Ipsam voluptas nisi nihil omnis iure excepturi et. Atque inventore nobis consequatur sit dolorem aut. Aut blanditiis odio quisquam aliquid doloremque quaerat explicabo.','en_US'),(29,29,'Sticker \"ut\"','sticker-ut','',NULL,NULL,'Eveniet molestias adipisci quis quibusdam aliquid magni et. Commodi minus ut rerum doloremque inventore. Totam porro assumenda ipsa perferendis quibusdam deserunt aut.','en_US'),(30,30,'Sticker \"ea\"','sticker-ea','',NULL,NULL,'Aut consectetur consectetur ipsum. Qui fugit qui aliquid vero vel numquam fugiat. Vero vitae dicta dicta id.','en_US'),(31,31,'Book \"dolor\" by Dr. Norwood Crist Sr.','book-dolor-by-dr-norwood-crist-sr','',NULL,NULL,'Expedita repudiandae ut at possimus. Suscipit unde eum repudiandae molestiae. Nemo dolorem nulla nihil est. Laborum recusandae nesciunt corporis dolores aut.','en_US'),(32,32,'Book \"consequatur\" by Durward Gibson','book-consequatur-by-durward-gibson','',NULL,NULL,'Atque aut et sit maiores dolores. Ullam ducimus voluptate consequatur quia consectetur alias. Itaque praesentium possimus velit tempora eveniet. Quasi molestiae unde adipisci.','en_US'),(33,33,'Book \"quo\" by Aidan Krajcik','book-quo-by-aidan-krajcik','',NULL,NULL,'Consequatur quia non animi fuga. Rerum et possimus deserunt ut possimus veritatis. Delectus odio doloribus deserunt voluptatum repellendus.','en_US'),(34,34,'Book \"delectus\" by Aurelie Conroy','book-delectus-by-aurelie-conroy','',NULL,NULL,'Nostrum maiores quasi nihil excepturi. Officia magnam repellat soluta id et. Dignissimos et pariatur assumenda sit expedita rerum sint. Possimus cupiditate quas perferendis. Possimus hic magni ut id reiciendis repudiandae eum amet.','en_US'),(35,35,'Book \"maxime\" by Dejon Bashirian','book-maxime-by-dejon-bashirian','',NULL,NULL,'At autem beatae nemo dolore. In esse suscipit illum nihil. Reiciendis et nihil accusamus.','en_US'),(36,36,'Book \"blanditiis\" by Kaleb Witting V','book-blanditiis-by-kaleb-witting-v','',NULL,NULL,'Quasi molestiae beatae neque asperiores similique. Aut asperiores cumque aut sit aperiam. Voluptatibus nemo quos deleniti soluta. Veniam magnam incidunt voluptatem et quos atque sed.','en_US'),(37,37,'Book \"aut\" by Alessandra Muller','book-aut-by-alessandra-muller','',NULL,NULL,'Qui placeat ut ducimus ipsam optio maiores. Fugiat possimus similique et nostrum enim ea quia. Corrupti officia voluptate ut tenetur. Autem ut quo ut dolorem.','en_US'),(38,38,'Book \"non\" by Kristofer Heidenreich','book-non-by-kristofer-heidenreich','',NULL,NULL,'Magnam ut et voluptatem ut. Recusandae deleniti accusantium sapiente nemo unde aliquid.','en_US'),(39,39,'Book \"in\" by Tracy Hirthe','book-in-by-tracy-hirthe','',NULL,NULL,'Ullam voluptate a sint. Esse nobis omnis accusantium ducimus sit quia. Sunt suscipit magni quaerat.','en_US'),(40,40,'Book \"dicta\" by Doris Morissette','book-dicta-by-doris-morissette','',NULL,NULL,'Amet ducimus ad possimus voluptatem unde amet. Dolorem autem voluptatem voluptatum aliquam et. Tempore blanditiis sed saepe quos numquam deleniti.','en_US'),(41,41,'Book \"sed\" by Jasen Brown','book-sed-by-jasen-brown','',NULL,NULL,'Id voluptas sit tenetur aperiam minus. Sit voluptates repellat consequuntur voluptatum. Dolorum quasi et quam alias quisquam assumenda. Delectus aut nobis provident optio ad soluta sit. Et doloribus sit culpa porro dolorum reiciendis quo.','en_US'),(42,42,'Book \"autem\" by Alexandra Reinger','book-autem-by-alexandra-reinger','',NULL,NULL,'Est rem quidem eveniet modi. Assumenda debitis dignissimos laboriosam dolor veniam. Cum dolorem animi tempora doloremque alias voluptas.','en_US'),(43,43,'Book \"ea\" by Tanner Hyatt II','book-ea-by-tanner-hyatt-ii','',NULL,NULL,'Eos magni qui esse veritatis ut quia quidem. Voluptatibus eum possimus sed repudiandae aut harum. Adipisci ea aut occaecati modi quo. Velit ipsam ut hic ea hic numquam dolores. Fugiat magni est velit esse hic.','en_US'),(44,44,'Book \"et\" by Miss Dasia Lang','book-et-by-miss-dasia-lang','',NULL,NULL,'Ducimus repellat doloremque omnis voluptatem atque. Expedita id quae maiores eaque tempora cumque totam.','en_US'),(45,45,'Book \"rerum\" by Khalid Lang','book-rerum-by-khalid-lang','',NULL,NULL,'Autem in veritatis asperiores rerum autem voluptas totam. Iure molestias qui ut ut. Facere temporibus est modi non.','en_US'),(46,46,'T-Shirt \"sed\"','t-shirt-sed','',NULL,NULL,'Dolor et error esse impedit vitae perspiciatis quod nam. Provident culpa quam id enim voluptatum. Vero hic id aut ratione eveniet dolore magnam.','en_US'),(47,47,'T-Shirt \"tenetur\"','t-shirt-tenetur','',NULL,NULL,'Ad officia eum et nesciunt quo. Ipsum error in praesentium natus praesentium. Ab quia eum et harum voluptatibus.','en_US'),(48,48,'T-Shirt \"ut\"','t-shirt-ut','',NULL,NULL,'Omnis quae voluptatem et non rerum maxime. Ut est est tempora ad. At magnam beatae quasi at. Et amet accusantium possimus est voluptatem commodi. Deserunt ipsam excepturi dignissimos vitae a quos temporibus.','en_US'),(49,49,'T-Shirt \"ipsum\"','t-shirt-ipsum','',NULL,NULL,'A fugit quod vero iure alias. Autem est harum non ratione aut autem eveniet. Consectetur fugiat et ut laudantium aut inventore. Accusantium error quia aut dolorem quasi. Accusamus quos ipsa et autem.','en_US'),(50,50,'T-Shirt \"autem\"','t-shirt-autem','',NULL,NULL,'Quas vero omnis rerum similique ipsam qui delectus labore. Natus ipsam voluptas explicabo dolor perferendis. Eveniet sit deserunt nulla nemo temporibus. Dicta et molestiae dolor et dolores est tempora.','en_US'),(51,51,'T-Shirt \"accusantium\"','t-shirt-accusantium','',NULL,NULL,'Recusandae distinctio necessitatibus voluptas veniam ut. Sapiente soluta voluptas fugit earum facilis accusamus cupiditate quae. Et maxime quia et occaecati ab praesentium est. Suscipit aut adipisci nemo.','en_US'),(52,52,'T-Shirt \"et\"','t-shirt-et','',NULL,NULL,'Molestiae voluptas et molestiae iste rerum deserunt. Fugiat tenetur voluptatum id ipsum aliquid aut. Dolores eligendi similique sunt molestiae recusandae velit iure. Qui sint exercitationem et.','en_US'),(53,53,'T-Shirt \"voluptatum\"','t-shirt-voluptatum','',NULL,NULL,'Rerum quaerat eligendi alias hic. Dolorem facilis placeat delectus fuga. Modi ad pariatur esse aut labore at.','en_US'),(54,54,'T-Shirt \"optio\"','t-shirt-optio','',NULL,NULL,'Quasi sunt a officia voluptas. Sint qui aliquid veritatis architecto voluptatem. Voluptatum ipsam qui molestias illum.','en_US'),(55,55,'T-Shirt \"quasi\"','t-shirt-quasi','',NULL,NULL,'Numquam minus voluptatem eum fugiat ut et non impedit. Velit eos dolor aut quaerat reiciendis. Et ut sequi consectetur nisi modi nemo illum. Ducimus enim vitae temporibus odio facilis iure.','en_US'),(56,56,'T-Shirt \"blanditiis\"','t-shirt-blanditiis','',NULL,NULL,'Enim necessitatibus quas nisi culpa eligendi est consequatur. Consequuntur rerum ut voluptas assumenda consectetur numquam rerum. Qui ullam distinctio possimus suscipit enim ut repellat. Asperiores aut fugit fuga eum vel.','en_US'),(57,57,'T-Shirt \"est\"','t-shirt-est','',NULL,NULL,'Expedita et et deleniti impedit sit temporibus. Quasi ducimus nihil et nisi et et.','en_US'),(58,58,'T-Shirt \"deleniti\"','t-shirt-deleniti','',NULL,NULL,'Rerum laboriosam eos libero exercitationem. Quaerat aut ab perferendis labore. Quisquam repudiandae laboriosam autem et. Voluptatem ut quo ex reprehenderit.','en_US'),(59,59,'T-Shirt \"rerum\"','t-shirt-rerum','',NULL,NULL,'Sunt est et et qui veritatis temporibus delectus. Tempora dolore ipsam ex commodi impedit maiores non. Quae aut nobis aperiam iste quia est.','en_US'),(60,60,'T-Shirt \"quia\"','t-shirt-quia','',NULL,NULL,'Necessitatibus rerum exercitationem asperiores laborum ducimus. Adipisci temporibus cumque nisi cumque laudantium incidunt. Fuga voluptas quas velit autem aliquid et aut.','en_US'),(61,13,'Kubek \"laborum\"','kubek-laborum','',NULL,NULL,NULL,'pl');
/*!40000 ALTER TABLE `sylius_product_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_product_variant`
--

DROP TABLE IF EXISTS `sylius_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_product_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `shipping_category_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `on_hold` int(11) NOT NULL,
  `on_hand` int(11) NOT NULL,
  `tracked` tinyint(1) NOT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `shipping_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A29B52377153098` (`code`),
  KEY `IDX_A29B5234584665A` (`product_id`),
  KEY `IDX_A29B5239DF894ED` (`tax_category_id`),
  KEY `IDX_A29B5239E2D1A41` (`shipping_category_id`),
  CONSTRAINT `FK_A29B5234584665A` FOREIGN KEY (`product_id`) REFERENCES `sylius_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A29B5239DF894ED` FOREIGN KEY (`tax_category_id`) REFERENCES `sylius_tax_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A29B5239E2D1A41` FOREIGN KEY (`shipping_category_id`) REFERENCES `sylius_shipping_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_product_variant`
--

LOCK TABLES `sylius_product_variant` WRITE;
/*!40000 ALTER TABLE `sylius_product_variant` DISABLE KEYS */;
INSERT INTO `sylius_product_variant` VALUES (1,1,NULL,NULL,'d663d12b-0434-3f2c-996f-c1927142300c-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,4,0,NULL,NULL,NULL,NULL,1),(2,1,NULL,NULL,'d663d12b-0434-3f2c-996f-c1927142300c-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,2,0,NULL,NULL,NULL,NULL,1),(3,1,NULL,NULL,'d663d12b-0434-3f2c-996f-c1927142300c-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,7,0,NULL,NULL,NULL,NULL,1),(4,2,NULL,NULL,'9a6b8ae1-8277-3c40-b288-3f333358b9d3-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(5,2,NULL,NULL,'9a6b8ae1-8277-3c40-b288-3f333358b9d3-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(6,2,NULL,NULL,'9a6b8ae1-8277-3c40-b288-3f333358b9d3-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,8,0,NULL,NULL,NULL,NULL,1),(7,3,NULL,NULL,'8bf1c3a2-670c-3092-8bff-21df6f9a1380-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,2,0,NULL,NULL,NULL,NULL,1),(8,3,NULL,NULL,'8bf1c3a2-670c-3092-8bff-21df6f9a1380-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(9,3,NULL,NULL,'8bf1c3a2-670c-3092-8bff-21df6f9a1380-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(10,4,NULL,NULL,'be88542c-83a6-3dcc-a691-36ab223c2533-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(11,4,NULL,NULL,'be88542c-83a6-3dcc-a691-36ab223c2533-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(12,4,NULL,NULL,'be88542c-83a6-3dcc-a691-36ab223c2533-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(13,5,NULL,NULL,'403285b1-2b10-3fe2-96c1-54ef54944266-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,8,0,NULL,NULL,NULL,NULL,1),(14,5,NULL,NULL,'403285b1-2b10-3fe2-96c1-54ef54944266-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,0,0,NULL,NULL,NULL,NULL,1),(15,5,NULL,NULL,'403285b1-2b10-3fe2-96c1-54ef54944266-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,2,0,NULL,NULL,NULL,NULL,1),(16,6,NULL,NULL,'4351b6b2-89e9-3848-9701-2ba8fef3d7bb-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(17,6,NULL,NULL,'4351b6b2-89e9-3848-9701-2ba8fef3d7bb-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(18,6,NULL,NULL,'4351b6b2-89e9-3848-9701-2ba8fef3d7bb-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,5,0,NULL,NULL,NULL,NULL,1),(19,7,NULL,NULL,'64efaaaf-f4e0-33bb-882e-c0c07169efba-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,8,0,NULL,NULL,NULL,NULL,1),(20,7,NULL,NULL,'64efaaaf-f4e0-33bb-882e-c0c07169efba-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(21,7,NULL,NULL,'64efaaaf-f4e0-33bb-882e-c0c07169efba-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(22,8,NULL,NULL,'ef5e1018-eb4e-387d-909e-e38f59868b0f-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(23,8,NULL,NULL,'ef5e1018-eb4e-387d-909e-e38f59868b0f-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,7,0,NULL,NULL,NULL,NULL,1),(24,8,NULL,NULL,'ef5e1018-eb4e-387d-909e-e38f59868b0f-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,5,0,NULL,NULL,NULL,NULL,1),(25,9,NULL,NULL,'2914e613-e011-3411-bc7a-2c532d7655c3-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(26,9,NULL,NULL,'2914e613-e011-3411-bc7a-2c532d7655c3-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(27,9,NULL,NULL,'2914e613-e011-3411-bc7a-2c532d7655c3-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(28,10,NULL,NULL,'d523bf30-1e28-3c50-be82-2af926aac1aa-variant-0','2019-04-19 22:45:06','2019-04-19 22:45:06',0,1,0,0,0,NULL,NULL,NULL,NULL,1),(29,10,NULL,NULL,'d523bf30-1e28-3c50-be82-2af926aac1aa-variant-1','2019-04-19 22:45:06','2019-04-19 22:45:06',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(30,10,NULL,NULL,'d523bf30-1e28-3c50-be82-2af926aac1aa-variant-2','2019-04-19 22:45:06','2019-04-19 22:45:06',2,1,0,6,0,NULL,NULL,NULL,NULL,1),(31,11,NULL,NULL,'5b39e4cc-13fa-3181-8686-024b24068e64-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,8,0,NULL,NULL,NULL,NULL,1),(32,11,NULL,NULL,'5b39e4cc-13fa-3181-8686-024b24068e64-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(33,11,NULL,NULL,'5b39e4cc-13fa-3181-8686-024b24068e64-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,9,0,NULL,NULL,NULL,NULL,1),(34,12,NULL,NULL,'469b4511-42e9-3307-9101-13c21e633859-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,2,0,NULL,NULL,NULL,NULL,1),(35,12,NULL,NULL,'469b4511-42e9-3307-9101-13c21e633859-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,7,0,NULL,NULL,NULL,NULL,1),(36,12,NULL,NULL,'469b4511-42e9-3307-9101-13c21e633859-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(37,13,NULL,NULL,'01b45827-1229-32c4-9d93-b4d4ba6aeda8-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(38,13,NULL,NULL,'01b45827-1229-32c4-9d93-b4d4ba6aeda8-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,0,0,NULL,NULL,NULL,NULL,1),(39,13,NULL,NULL,'01b45827-1229-32c4-9d93-b4d4ba6aeda8-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,8,0,NULL,NULL,NULL,NULL,1),(40,14,NULL,NULL,'51c32a89-f461-3255-89e2-7afac499263d-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(41,14,NULL,NULL,'51c32a89-f461-3255-89e2-7afac499263d-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,0,0,NULL,NULL,NULL,NULL,1),(42,14,NULL,NULL,'51c32a89-f461-3255-89e2-7afac499263d-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,2,0,NULL,NULL,NULL,NULL,1),(43,15,NULL,NULL,'a9fcedc4-8af1-32f6-8c7f-dd63fd8e27d2-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(44,15,NULL,NULL,'a9fcedc4-8af1-32f6-8c7f-dd63fd8e27d2-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(45,15,NULL,NULL,'a9fcedc4-8af1-32f6-8c7f-dd63fd8e27d2-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(46,16,NULL,NULL,'977eb274-e2cb-309f-80d3-a2a311517400-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(47,16,NULL,NULL,'977eb274-e2cb-309f-80d3-a2a311517400-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(48,16,NULL,NULL,'977eb274-e2cb-309f-80d3-a2a311517400-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,5,0,NULL,NULL,NULL,NULL,1),(49,17,NULL,NULL,'5b08eaab-72ba-35fe-9227-d03f2744e6ce-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(50,17,NULL,NULL,'5b08eaab-72ba-35fe-9227-d03f2744e6ce-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(51,17,NULL,NULL,'5b08eaab-72ba-35fe-9227-d03f2744e6ce-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(52,18,NULL,NULL,'5d7cdc38-630d-357d-a6d4-66f81aa7adc0-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,8,0,NULL,NULL,NULL,NULL,1),(53,18,NULL,NULL,'5d7cdc38-630d-357d-a6d4-66f81aa7adc0-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(54,18,NULL,NULL,'5d7cdc38-630d-357d-a6d4-66f81aa7adc0-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(55,19,NULL,NULL,'777d6563-0968-337b-8c79-4dddbfe4fbb8-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,2,0,NULL,NULL,NULL,NULL,1),(56,19,NULL,NULL,'777d6563-0968-337b-8c79-4dddbfe4fbb8-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(57,19,NULL,NULL,'777d6563-0968-337b-8c79-4dddbfe4fbb8-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,7,0,NULL,NULL,NULL,NULL,1),(58,20,NULL,NULL,'54b96799-c263-3607-a2b0-51ab76c41167-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(59,20,NULL,NULL,'54b96799-c263-3607-a2b0-51ab76c41167-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(60,20,NULL,NULL,'54b96799-c263-3607-a2b0-51ab76c41167-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,2,0,NULL,NULL,NULL,NULL,1),(61,21,NULL,NULL,'eef4cb74-0950-3dc1-81fd-edfd26f3d362-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(62,21,NULL,NULL,'eef4cb74-0950-3dc1-81fd-edfd26f3d362-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(63,21,NULL,NULL,'eef4cb74-0950-3dc1-81fd-edfd26f3d362-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,8,0,NULL,NULL,NULL,NULL,1),(64,22,NULL,NULL,'e8b57beb-ee95-3469-9109-fce4cf958e6b-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,3,0,NULL,NULL,NULL,NULL,1),(65,22,NULL,NULL,'e8b57beb-ee95-3469-9109-fce4cf958e6b-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(66,22,NULL,NULL,'e8b57beb-ee95-3469-9109-fce4cf958e6b-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(67,23,NULL,NULL,'17031905-dbb6-34ce-9e23-d03e1a62edc9-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(68,23,NULL,NULL,'17031905-dbb6-34ce-9e23-d03e1a62edc9-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(69,23,NULL,NULL,'17031905-dbb6-34ce-9e23-d03e1a62edc9-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,7,0,NULL,NULL,NULL,NULL,1),(70,24,NULL,NULL,'80eb6a50-50f9-3217-89c7-d6f107efb136-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(71,24,NULL,NULL,'80eb6a50-50f9-3217-89c7-d6f107efb136-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(72,24,NULL,NULL,'80eb6a50-50f9-3217-89c7-d6f107efb136-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,7,0,NULL,NULL,NULL,NULL,1),(73,25,NULL,NULL,'6b88d1da-3cf8-3066-baed-e8e8ea8c0c3d-variant-0','2019-04-19 22:45:07','2019-04-19 22:45:07',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(74,25,NULL,NULL,'6b88d1da-3cf8-3066-baed-e8e8ea8c0c3d-variant-1','2019-04-19 22:45:07','2019-04-19 22:45:07',1,1,0,6,0,NULL,NULL,NULL,NULL,1),(75,25,NULL,NULL,'6b88d1da-3cf8-3066-baed-e8e8ea8c0c3d-variant-2','2019-04-19 22:45:07','2019-04-19 22:45:07',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(76,26,NULL,NULL,'f2c2401a-7e02-300b-a81b-25b52a768a7d-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,8,0,NULL,NULL,NULL,NULL,1),(77,26,NULL,NULL,'f2c2401a-7e02-300b-a81b-25b52a768a7d-variant-1','2019-04-19 22:45:08','2019-04-19 22:45:08',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(78,26,NULL,NULL,'f2c2401a-7e02-300b-a81b-25b52a768a7d-variant-2','2019-04-19 22:45:08','2019-04-19 22:45:08',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(79,27,NULL,NULL,'4c6e5bc0-98fc-3a77-9b2d-f86106c03411-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,0,0,NULL,NULL,NULL,NULL,1),(80,27,NULL,NULL,'4c6e5bc0-98fc-3a77-9b2d-f86106c03411-variant-1','2019-04-19 22:45:08','2019-04-19 22:45:08',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(81,27,NULL,NULL,'4c6e5bc0-98fc-3a77-9b2d-f86106c03411-variant-2','2019-04-19 22:45:08','2019-04-19 22:45:08',2,1,0,9,0,NULL,NULL,NULL,NULL,1),(82,28,NULL,NULL,'3788d194-8869-3c48-aff8-a97e3a65aee8-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,0,0,NULL,NULL,NULL,NULL,1),(83,28,NULL,NULL,'3788d194-8869-3c48-aff8-a97e3a65aee8-variant-1','2019-04-19 22:45:08','2019-04-19 22:45:08',1,1,0,7,0,NULL,NULL,NULL,NULL,1),(84,28,NULL,NULL,'3788d194-8869-3c48-aff8-a97e3a65aee8-variant-2','2019-04-19 22:45:08','2019-04-19 22:45:08',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(85,29,NULL,NULL,'37430294-798e-3d61-b139-85f2bb2fd29e-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(86,29,NULL,NULL,'37430294-798e-3d61-b139-85f2bb2fd29e-variant-1','2019-04-19 22:45:08','2019-04-19 22:45:08',1,1,0,9,0,NULL,NULL,NULL,NULL,1),(87,29,NULL,NULL,'37430294-798e-3d61-b139-85f2bb2fd29e-variant-2','2019-04-19 22:45:08','2019-04-19 22:45:08',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(88,30,NULL,NULL,'ce7174ec-b86d-362c-8844-289fd878dfe8-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(89,30,NULL,NULL,'ce7174ec-b86d-362c-8844-289fd878dfe8-variant-1','2019-04-19 22:45:08','2019-04-19 22:45:08',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(90,30,NULL,NULL,'ce7174ec-b86d-362c-8844-289fd878dfe8-variant-2','2019-04-19 22:45:08','2019-04-19 22:45:08',2,1,0,6,0,NULL,NULL,NULL,NULL,1),(91,31,NULL,NULL,'eecc7b33-709f-37f6-ada0-a0c7da7620df-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(92,32,NULL,NULL,'3a4e9a24-130d-36b0-b543-4f2d8ad9bfe2-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(93,33,NULL,NULL,'bb6fb435-a358-3687-92da-a7d1e72f81da-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(94,34,NULL,NULL,'f9c4b832-4df5-313d-b639-5d2891219443-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,3,0,NULL,NULL,NULL,NULL,1),(95,35,NULL,NULL,'690f333d-3660-3ffc-8442-cd2a345ae7dc-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(96,36,NULL,NULL,'19fedfe4-48bf-33df-bcbe-c1eb7098f9e4-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,4,0,NULL,NULL,NULL,NULL,1),(97,37,NULL,NULL,'6e00e25d-009b-3b3b-ad2b-a665bb67ae9a-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(98,38,NULL,NULL,'c4fedb3e-1154-3516-88c3-c5c1eed09ac8-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,4,0,NULL,NULL,NULL,NULL,1),(99,39,NULL,NULL,'a0da86aa-7f14-3ade-b8eb-e3709489f2ca-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,2,0,NULL,NULL,NULL,NULL,1),(100,40,NULL,NULL,'9ce68a4c-3bd1-3276-b34a-8b00edfec373-variant-0','2019-04-19 22:45:08','2019-04-19 22:45:08',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(101,41,NULL,NULL,'9728a9eb-7d06-32bc-8f26-c95de137d06d-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(102,42,NULL,NULL,'70ae980f-d1d5-31f2-a775-839eb4236b7b-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,0,0,NULL,NULL,NULL,NULL,1),(103,43,NULL,NULL,'c9c1cf69-a37e-3183-8c1e-140c9fe257c9-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(104,44,NULL,NULL,'5c2d2047-c76f-335c-8f24-d6f98c9a4b46-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(105,45,NULL,NULL,'86156e6b-1bee-3840-b2ad-65b48cb3642c-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,4,0,NULL,NULL,NULL,NULL,1),(106,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(107,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-1','2019-04-19 22:45:09','2019-04-19 22:45:09',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(108,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-2','2019-04-19 22:45:09','2019-04-19 22:45:09',2,1,0,4,0,NULL,NULL,NULL,NULL,1),(109,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-3','2019-04-19 22:45:09','2019-04-19 22:45:09',3,1,0,3,0,NULL,NULL,NULL,NULL,1),(110,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-4','2019-04-19 22:45:09','2019-04-19 22:45:09',4,1,0,3,0,NULL,NULL,NULL,NULL,1),(111,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-5','2019-04-19 22:45:09','2019-04-19 22:45:09',5,1,0,5,0,NULL,NULL,NULL,NULL,1),(112,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-6','2019-04-19 22:45:09','2019-04-19 22:45:09',6,1,0,4,0,NULL,NULL,NULL,NULL,1),(113,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-7','2019-04-19 22:45:09','2019-04-19 22:45:09',7,1,0,2,0,NULL,NULL,NULL,NULL,1),(114,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-8','2019-04-19 22:45:09','2019-04-19 22:45:09',8,1,0,2,0,NULL,NULL,NULL,NULL,1),(115,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-9','2019-04-19 22:45:09','2019-04-19 22:45:09',9,1,0,2,0,NULL,NULL,NULL,NULL,1),(116,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-10','2019-04-19 22:45:09','2019-04-19 22:45:09',10,1,0,9,0,NULL,NULL,NULL,NULL,1),(117,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-11','2019-04-19 22:45:09','2019-04-19 22:45:09',11,1,0,8,0,NULL,NULL,NULL,NULL,1),(118,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-12','2019-04-19 22:45:09','2019-04-19 22:45:09',12,1,0,6,0,NULL,NULL,NULL,NULL,1),(119,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-13','2019-04-19 22:45:09','2019-04-19 22:45:09',13,1,0,7,0,NULL,NULL,NULL,NULL,1),(120,46,NULL,NULL,'84ed2b03-00c8-3d32-aa87-e9f08c3a44ff-variant-14','2019-04-19 22:45:09','2019-04-19 22:45:09',14,1,0,9,0,NULL,NULL,NULL,NULL,1),(121,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:09',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(122,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-1','2019-04-19 22:45:09','2019-04-19 22:45:09',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(123,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-2','2019-04-19 22:45:09','2019-04-19 22:45:09',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(124,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-3','2019-04-19 22:45:09','2019-04-19 22:45:09',3,1,0,4,0,NULL,NULL,NULL,NULL,1),(125,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-4','2019-04-19 22:45:09','2019-04-19 22:45:09',4,1,0,7,0,NULL,NULL,NULL,NULL,1),(126,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-5','2019-04-19 22:45:09','2019-04-19 22:45:09',5,1,0,4,0,NULL,NULL,NULL,NULL,1),(127,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-6','2019-04-19 22:45:09','2019-04-19 22:45:09',6,1,0,8,0,NULL,NULL,NULL,NULL,1),(128,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-7','2019-04-19 22:45:09','2019-04-19 22:45:09',7,1,0,7,0,NULL,NULL,NULL,NULL,1),(129,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-8','2019-04-19 22:45:09','2019-04-19 22:45:09',8,1,0,6,0,NULL,NULL,NULL,NULL,1),(130,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-9','2019-04-19 22:45:09','2019-04-19 22:45:09',9,1,0,7,0,NULL,NULL,NULL,NULL,1),(131,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-10','2019-04-19 22:45:09','2019-04-19 22:45:09',10,1,0,8,0,NULL,NULL,NULL,NULL,1),(132,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-11','2019-04-19 22:45:09','2019-04-19 22:45:09',11,1,0,0,0,NULL,NULL,NULL,NULL,1),(133,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-12','2019-04-19 22:45:09','2019-04-19 22:45:09',12,1,0,4,0,NULL,NULL,NULL,NULL,1),(134,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-13','2019-04-19 22:45:09','2019-04-19 22:45:09',13,1,0,0,0,NULL,NULL,NULL,NULL,1),(135,47,NULL,NULL,'516904f0-f954-3b91-b8cb-bf8244c3379e-variant-14','2019-04-19 22:45:09','2019-04-19 22:45:09',14,1,0,9,0,NULL,NULL,NULL,NULL,1),(136,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-0','2019-04-19 22:45:09','2019-04-19 22:45:10',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(137,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-1','2019-04-19 22:45:09','2019-04-19 22:45:10',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(138,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-2','2019-04-19 22:45:09','2019-04-19 22:45:10',2,1,0,1,0,NULL,NULL,NULL,NULL,1),(139,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-3','2019-04-19 22:45:09','2019-04-19 22:45:10',3,1,0,5,0,NULL,NULL,NULL,NULL,1),(140,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-4','2019-04-19 22:45:09','2019-04-19 22:45:10',4,1,0,5,0,NULL,NULL,NULL,NULL,1),(141,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-5','2019-04-19 22:45:09','2019-04-19 22:45:10',5,1,0,3,0,NULL,NULL,NULL,NULL,1),(142,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-6','2019-04-19 22:45:09','2019-04-19 22:45:10',6,1,0,3,0,NULL,NULL,NULL,NULL,1),(143,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-7','2019-04-19 22:45:09','2019-04-19 22:45:10',7,1,0,1,0,NULL,NULL,NULL,NULL,1),(144,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-8','2019-04-19 22:45:09','2019-04-19 22:45:10',8,1,0,7,0,NULL,NULL,NULL,NULL,1),(145,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-9','2019-04-19 22:45:09','2019-04-19 22:45:10',9,1,0,6,0,NULL,NULL,NULL,NULL,1),(146,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-10','2019-04-19 22:45:09','2019-04-19 22:45:10',10,1,0,2,0,NULL,NULL,NULL,NULL,1),(147,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-11','2019-04-19 22:45:09','2019-04-19 22:45:10',11,1,0,4,0,NULL,NULL,NULL,NULL,1),(148,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-12','2019-04-19 22:45:09','2019-04-19 22:45:10',12,1,0,1,0,NULL,NULL,NULL,NULL,1),(149,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-13','2019-04-19 22:45:09','2019-04-19 22:45:10',13,1,0,2,0,NULL,NULL,NULL,NULL,1),(150,48,NULL,NULL,'4f644b6b-919a-3d76-8e87-a0c6bffc6391-variant-14','2019-04-19 22:45:09','2019-04-19 22:45:10',14,1,0,6,0,NULL,NULL,NULL,NULL,1),(151,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(152,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(153,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,9,0,NULL,NULL,NULL,NULL,1),(154,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,6,0,NULL,NULL,NULL,NULL,1),(155,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,7,0,NULL,NULL,NULL,NULL,1),(156,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,7,0,NULL,NULL,NULL,NULL,1),(157,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,9,0,NULL,NULL,NULL,NULL,1),(158,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,1,0,NULL,NULL,NULL,NULL,1),(159,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,9,0,NULL,NULL,NULL,NULL,1),(160,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,2,0,NULL,NULL,NULL,NULL,1),(161,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,4,0,NULL,NULL,NULL,NULL,1),(162,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,8,0,NULL,NULL,NULL,NULL,1),(163,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,7,0,NULL,NULL,NULL,NULL,1),(164,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,9,0,NULL,NULL,NULL,NULL,1),(165,49,NULL,NULL,'c3e7fdb8-9d30-3824-b739-d0032dd35765-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,0,0,NULL,NULL,NULL,NULL,1),(166,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(167,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,6,0,NULL,NULL,NULL,NULL,1),(168,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,4,0,NULL,NULL,NULL,NULL,1),(169,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,9,0,NULL,NULL,NULL,NULL,1),(170,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,8,0,NULL,NULL,NULL,NULL,1),(171,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,6,0,NULL,NULL,NULL,NULL,1),(172,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,4,0,NULL,NULL,NULL,NULL,1),(173,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,5,0,NULL,NULL,NULL,NULL,1),(174,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,2,0,NULL,NULL,NULL,NULL,1),(175,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,7,0,NULL,NULL,NULL,NULL,1),(176,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,1,0,NULL,NULL,NULL,NULL,1),(177,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,8,0,NULL,NULL,NULL,NULL,1),(178,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,9,0,NULL,NULL,NULL,NULL,1),(179,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,0,0,NULL,NULL,NULL,NULL,1),(180,50,NULL,NULL,'0631d920-9f3e-386b-a5be-db5bd2c403e5-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,5,0,NULL,NULL,NULL,NULL,1),(181,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,6,0,NULL,NULL,NULL,NULL,1),(182,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,1,0,NULL,NULL,NULL,NULL,1),(183,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,3,0,NULL,NULL,NULL,NULL,1),(184,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,2,0,NULL,NULL,NULL,NULL,1),(185,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,4,0,NULL,NULL,NULL,NULL,1),(186,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,3,0,NULL,NULL,NULL,NULL,1),(187,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,6,0,NULL,NULL,NULL,NULL,1),(188,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,5,0,NULL,NULL,NULL,NULL,1),(189,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,5,0,NULL,NULL,NULL,NULL,1),(190,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,3,0,NULL,NULL,NULL,NULL,1),(191,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,0,0,NULL,NULL,NULL,NULL,1),(192,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,3,0,NULL,NULL,NULL,NULL,1),(193,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,3,0,NULL,NULL,NULL,NULL,1),(194,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,0,0,NULL,NULL,NULL,NULL,1),(195,51,NULL,NULL,'1911168f-969d-3026-a873-3e8b1e70a7a3-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,7,0,NULL,NULL,NULL,NULL,1),(196,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(197,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,2,0,NULL,NULL,NULL,NULL,1),(198,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,2,0,NULL,NULL,NULL,NULL,1),(199,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,1,0,NULL,NULL,NULL,NULL,1),(200,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,9,0,NULL,NULL,NULL,NULL,1),(201,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,5,0,NULL,NULL,NULL,NULL,1),(202,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,0,0,NULL,NULL,NULL,NULL,1),(203,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,6,0,NULL,NULL,NULL,NULL,1),(204,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,3,0,NULL,NULL,NULL,NULL,1),(205,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,3,0,NULL,NULL,NULL,NULL,1),(206,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,5,0,NULL,NULL,NULL,NULL,1),(207,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,7,0,NULL,NULL,NULL,NULL,1),(208,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,8,0,NULL,NULL,NULL,NULL,1),(209,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,5,0,NULL,NULL,NULL,NULL,1),(210,52,NULL,NULL,'2d0716b6-c904-3ecb-936d-e96dc4215bcf-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,4,0,NULL,NULL,NULL,NULL,1),(211,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,7,0,NULL,NULL,NULL,NULL,1),(212,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,5,0,NULL,NULL,NULL,NULL,1),(213,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,4,0,NULL,NULL,NULL,NULL,1),(214,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,1,0,NULL,NULL,NULL,NULL,1),(215,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,4,0,NULL,NULL,NULL,NULL,1),(216,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,3,0,NULL,NULL,NULL,NULL,1),(217,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,8,0,NULL,NULL,NULL,NULL,1),(218,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,5,0,NULL,NULL,NULL,NULL,1),(219,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,6,0,NULL,NULL,NULL,NULL,1),(220,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,6,0,NULL,NULL,NULL,NULL,1),(221,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,4,0,NULL,NULL,NULL,NULL,1),(222,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,7,0,NULL,NULL,NULL,NULL,1),(223,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,3,0,NULL,NULL,NULL,NULL,1),(224,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,4,0,NULL,NULL,NULL,NULL,1),(225,53,NULL,NULL,'8c51ecec-0dee-3b01-89b9-ca7c1fe37a42-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,8,0,NULL,NULL,NULL,NULL,1),(226,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,1,0,NULL,NULL,NULL,NULL,1),(227,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,6,0,NULL,NULL,NULL,NULL,1),(228,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,9,0,NULL,NULL,NULL,NULL,1),(229,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,0,0,NULL,NULL,NULL,NULL,1),(230,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,8,0,NULL,NULL,NULL,NULL,1),(231,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,5,0,NULL,NULL,NULL,NULL,1),(232,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,3,0,NULL,NULL,NULL,NULL,1),(233,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,8,0,NULL,NULL,NULL,NULL,1),(234,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,9,0,NULL,NULL,NULL,NULL,1),(235,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,1,0,NULL,NULL,NULL,NULL,1),(236,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,3,0,NULL,NULL,NULL,NULL,1),(237,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,7,0,NULL,NULL,NULL,NULL,1),(238,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,6,0,NULL,NULL,NULL,NULL,1),(239,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,0,0,NULL,NULL,NULL,NULL,1),(240,54,NULL,NULL,'fcadec2c-7021-3f55-b7e0-4b1b05bee317-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,8,0,NULL,NULL,NULL,NULL,1),(241,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,3,0,NULL,NULL,NULL,NULL,1),(242,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,3,0,NULL,NULL,NULL,NULL,1),(243,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,4,0,NULL,NULL,NULL,NULL,1),(244,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,6,0,NULL,NULL,NULL,NULL,1),(245,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,6,0,NULL,NULL,NULL,NULL,1),(246,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,7,0,NULL,NULL,NULL,NULL,1),(247,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,9,0,NULL,NULL,NULL,NULL,1),(248,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,2,0,NULL,NULL,NULL,NULL,1),(249,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,3,0,NULL,NULL,NULL,NULL,1),(250,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,0,0,NULL,NULL,NULL,NULL,1),(251,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,2,0,NULL,NULL,NULL,NULL,1),(252,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,9,0,NULL,NULL,NULL,NULL,1),(253,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,9,0,NULL,NULL,NULL,NULL,1),(254,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,6,0,NULL,NULL,NULL,NULL,1),(255,55,NULL,NULL,'300c7249-6903-3d8f-a152-d8d517734134-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,6,0,NULL,NULL,NULL,NULL,1),(256,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-0','2019-04-19 22:45:10','2019-04-19 22:45:10',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(257,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-1','2019-04-19 22:45:10','2019-04-19 22:45:10',1,1,0,0,0,NULL,NULL,NULL,NULL,1),(258,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-2','2019-04-19 22:45:10','2019-04-19 22:45:10',2,1,0,7,0,NULL,NULL,NULL,NULL,1),(259,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-3','2019-04-19 22:45:10','2019-04-19 22:45:10',3,1,0,3,0,NULL,NULL,NULL,NULL,1),(260,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-4','2019-04-19 22:45:10','2019-04-19 22:45:10',4,1,0,7,0,NULL,NULL,NULL,NULL,1),(261,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-5','2019-04-19 22:45:10','2019-04-19 22:45:10',5,1,0,6,0,NULL,NULL,NULL,NULL,1),(262,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-6','2019-04-19 22:45:10','2019-04-19 22:45:10',6,1,0,5,0,NULL,NULL,NULL,NULL,1),(263,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-7','2019-04-19 22:45:10','2019-04-19 22:45:10',7,1,0,6,0,NULL,NULL,NULL,NULL,1),(264,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-8','2019-04-19 22:45:10','2019-04-19 22:45:10',8,1,0,7,0,NULL,NULL,NULL,NULL,1),(265,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-9','2019-04-19 22:45:10','2019-04-19 22:45:10',9,1,0,8,0,NULL,NULL,NULL,NULL,1),(266,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-10','2019-04-19 22:45:10','2019-04-19 22:45:10',10,1,0,8,0,NULL,NULL,NULL,NULL,1),(267,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-11','2019-04-19 22:45:10','2019-04-19 22:45:10',11,1,0,5,0,NULL,NULL,NULL,NULL,1),(268,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-12','2019-04-19 22:45:10','2019-04-19 22:45:10',12,1,0,8,0,NULL,NULL,NULL,NULL,1),(269,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-13','2019-04-19 22:45:10','2019-04-19 22:45:10',13,1,0,8,0,NULL,NULL,NULL,NULL,1),(270,56,NULL,NULL,'be69a367-3a91-36f2-a9e6-17594b2e1ce8-variant-14','2019-04-19 22:45:10','2019-04-19 22:45:10',14,1,0,3,0,NULL,NULL,NULL,NULL,1),(271,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-0','2019-04-19 22:45:11','2019-04-19 22:45:11',0,1,0,0,0,NULL,NULL,NULL,NULL,1),(272,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-1','2019-04-19 22:45:11','2019-04-19 22:45:11',1,1,0,8,0,NULL,NULL,NULL,NULL,1),(273,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-2','2019-04-19 22:45:11','2019-04-19 22:45:11',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(274,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-3','2019-04-19 22:45:11','2019-04-19 22:45:11',3,1,0,6,0,NULL,NULL,NULL,NULL,1),(275,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-4','2019-04-19 22:45:11','2019-04-19 22:45:11',4,1,0,2,0,NULL,NULL,NULL,NULL,1),(276,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-5','2019-04-19 22:45:11','2019-04-19 22:45:11',5,1,0,5,0,NULL,NULL,NULL,NULL,1),(277,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-6','2019-04-19 22:45:11','2019-04-19 22:45:11',6,1,0,4,0,NULL,NULL,NULL,NULL,1),(278,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-7','2019-04-19 22:45:11','2019-04-19 22:45:11',7,1,0,1,0,NULL,NULL,NULL,NULL,1),(279,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-8','2019-04-19 22:45:11','2019-04-19 22:45:11',8,1,0,1,0,NULL,NULL,NULL,NULL,1),(280,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-9','2019-04-19 22:45:11','2019-04-19 22:45:11',9,1,0,9,0,NULL,NULL,NULL,NULL,1),(281,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-10','2019-04-19 22:45:11','2019-04-19 22:45:11',10,1,0,9,0,NULL,NULL,NULL,NULL,1),(282,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-11','2019-04-19 22:45:11','2019-04-19 22:45:11',11,1,0,2,0,NULL,NULL,NULL,NULL,1),(283,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-12','2019-04-19 22:45:11','2019-04-19 22:45:11',12,1,0,7,0,NULL,NULL,NULL,NULL,1),(284,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-13','2019-04-19 22:45:11','2019-04-19 22:45:11',13,1,0,2,0,NULL,NULL,NULL,NULL,1),(285,57,NULL,NULL,'04907766-0d1c-3ef3-b451-a1146b4edf1b-variant-14','2019-04-19 22:45:11','2019-04-19 22:45:11',14,1,0,6,0,NULL,NULL,NULL,NULL,1),(286,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-0','2019-04-19 22:45:11','2019-04-19 22:45:11',0,1,0,9,0,NULL,NULL,NULL,NULL,1),(287,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-1','2019-04-19 22:45:11','2019-04-19 22:45:11',1,1,0,6,0,NULL,NULL,NULL,NULL,1),(288,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-2','2019-04-19 22:45:11','2019-04-19 22:45:11',2,1,0,0,0,NULL,NULL,NULL,NULL,1),(289,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-3','2019-04-19 22:45:11','2019-04-19 22:45:11',3,1,0,8,0,NULL,NULL,NULL,NULL,1),(290,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-4','2019-04-19 22:45:11','2019-04-19 22:45:11',4,1,0,4,0,NULL,NULL,NULL,NULL,1),(291,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-5','2019-04-19 22:45:11','2019-04-19 22:45:11',5,1,0,2,0,NULL,NULL,NULL,NULL,1),(292,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-6','2019-04-19 22:45:11','2019-04-19 22:45:11',6,1,0,6,0,NULL,NULL,NULL,NULL,1),(293,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-7','2019-04-19 22:45:11','2019-04-19 22:45:11',7,1,0,2,0,NULL,NULL,NULL,NULL,1),(294,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-8','2019-04-19 22:45:11','2019-04-19 22:45:11',8,1,0,9,0,NULL,NULL,NULL,NULL,1),(295,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-9','2019-04-19 22:45:11','2019-04-19 22:45:11',9,1,0,9,0,NULL,NULL,NULL,NULL,1),(296,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-10','2019-04-19 22:45:11','2019-04-19 22:45:11',10,1,0,5,0,NULL,NULL,NULL,NULL,1),(297,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-11','2019-04-19 22:45:11','2019-04-19 22:45:11',11,1,0,1,0,NULL,NULL,NULL,NULL,1),(298,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-12','2019-04-19 22:45:11','2019-04-19 22:45:11',12,1,0,9,0,NULL,NULL,NULL,NULL,1),(299,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-13','2019-04-19 22:45:11','2019-04-19 22:45:11',13,1,0,7,0,NULL,NULL,NULL,NULL,1),(300,58,NULL,NULL,'0362b852-c0ca-3069-aae4-b7693d77bfce-variant-14','2019-04-19 22:45:11','2019-04-19 22:45:11',14,1,0,9,0,NULL,NULL,NULL,NULL,1),(301,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-0','2019-04-19 22:45:11','2019-04-19 22:45:11',0,1,0,5,0,NULL,NULL,NULL,NULL,1),(302,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-1','2019-04-19 22:45:11','2019-04-19 22:45:11',1,1,0,4,0,NULL,NULL,NULL,NULL,1),(303,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-2','2019-04-19 22:45:11','2019-04-19 22:45:11',2,1,0,2,0,NULL,NULL,NULL,NULL,1),(304,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-3','2019-04-19 22:45:11','2019-04-19 22:45:11',3,1,0,8,0,NULL,NULL,NULL,NULL,1),(305,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-4','2019-04-19 22:45:11','2019-04-19 22:45:11',4,1,0,4,0,NULL,NULL,NULL,NULL,1),(306,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-5','2019-04-19 22:45:11','2019-04-19 22:45:11',5,1,0,0,0,NULL,NULL,NULL,NULL,1),(307,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-6','2019-04-19 22:45:11','2019-04-19 22:45:11',6,1,0,2,0,NULL,NULL,NULL,NULL,1),(308,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-7','2019-04-19 22:45:11','2019-04-19 22:45:11',7,1,0,2,0,NULL,NULL,NULL,NULL,1),(309,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-8','2019-04-19 22:45:11','2019-04-19 22:45:11',8,1,0,1,0,NULL,NULL,NULL,NULL,1),(310,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-9','2019-04-19 22:45:11','2019-04-19 22:45:11',9,1,0,3,0,NULL,NULL,NULL,NULL,1),(311,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-10','2019-04-19 22:45:11','2019-04-19 22:45:11',10,1,0,8,0,NULL,NULL,NULL,NULL,1),(312,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-11','2019-04-19 22:45:11','2019-04-19 22:45:11',11,1,0,8,0,NULL,NULL,NULL,NULL,1),(313,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-12','2019-04-19 22:45:11','2019-04-19 22:45:11',12,1,0,2,0,NULL,NULL,NULL,NULL,1),(314,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-13','2019-04-19 22:45:11','2019-04-19 22:45:11',13,1,0,2,0,NULL,NULL,NULL,NULL,1),(315,59,NULL,NULL,'6211c8ca-c207-3720-8ca8-b6b856d82585-variant-14','2019-04-19 22:45:11','2019-04-19 22:45:11',14,1,0,6,0,NULL,NULL,NULL,NULL,1),(316,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-0','2019-04-19 22:45:11','2019-04-19 22:45:11',0,1,0,3,0,NULL,NULL,NULL,NULL,1),(317,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-1','2019-04-19 22:45:11','2019-04-19 22:45:11',1,1,0,5,0,NULL,NULL,NULL,NULL,1),(318,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-2','2019-04-19 22:45:11','2019-04-19 22:45:11',2,1,0,4,0,NULL,NULL,NULL,NULL,1),(319,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-3','2019-04-19 22:45:11','2019-04-19 22:45:11',3,1,0,1,0,NULL,NULL,NULL,NULL,1),(320,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-4','2019-04-19 22:45:11','2019-04-19 22:45:11',4,1,0,3,0,NULL,NULL,NULL,NULL,1),(321,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-5','2019-04-19 22:45:11','2019-04-19 22:45:11',5,1,0,0,0,NULL,NULL,NULL,NULL,1),(322,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-6','2019-04-19 22:45:11','2019-04-19 22:45:11',6,1,0,1,0,NULL,NULL,NULL,NULL,1),(323,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-7','2019-04-19 22:45:11','2019-04-19 22:45:11',7,1,0,4,0,NULL,NULL,NULL,NULL,1),(324,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-8','2019-04-19 22:45:11','2019-04-19 22:45:11',8,1,0,4,0,NULL,NULL,NULL,NULL,1),(325,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-9','2019-04-19 22:45:11','2019-04-19 22:45:11',9,1,0,9,0,NULL,NULL,NULL,NULL,1),(326,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-10','2019-04-19 22:45:11','2019-04-19 22:45:11',10,1,0,8,0,NULL,NULL,NULL,NULL,1),(327,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-11','2019-04-19 22:45:11','2019-04-19 22:45:11',11,1,0,2,0,NULL,NULL,NULL,NULL,1),(328,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-12','2019-04-19 22:45:11','2019-04-19 22:45:11',12,1,0,8,0,NULL,NULL,NULL,NULL,1),(329,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-13','2019-04-19 22:45:11','2019-04-19 22:45:11',13,1,0,8,0,NULL,NULL,NULL,NULL,1),(330,60,NULL,NULL,'2987a077-f6bd-3c6c-91d5-448700e56479-variant-14','2019-04-19 22:45:11','2019-04-19 22:45:11',14,1,0,1,0,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `sylius_product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_taxon`
--

DROP TABLE IF EXISTS `sylius_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tree_left` int(11) NOT NULL,
  `tree_right` int(11) NOT NULL,
  `tree_level` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CFD811CA77153098` (`code`),
  KEY `IDX_CFD811CAA977936C` (`tree_root`),
  KEY `IDX_CFD811CA727ACA70` (`parent_id`),
  CONSTRAINT `FK_CFD811CA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CFD811CAA977936C` FOREIGN KEY (`tree_root`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_taxon`
--

LOCK TABLES `sylius_taxon` WRITE;
/*!40000 ALTER TABLE `sylius_taxon` DISABLE KEYS */;
INSERT INTO `sylius_taxon` VALUES (1,1,NULL,'category',1,14,0,0,'2019-04-19 22:45:06','2019-04-19 22:45:06'),(2,1,1,'mugs',2,3,1,0,'2019-04-19 22:45:06','2019-04-19 22:45:06'),(3,1,1,'stickers',4,5,1,1,'2019-04-19 22:45:07','2019-04-19 22:45:07'),(4,1,1,'books',6,7,1,2,'2019-04-19 22:45:08','2019-04-19 22:45:08'),(5,1,1,'t_shirts',8,13,1,3,'2019-04-19 22:45:09','2019-04-19 22:45:09'),(6,1,5,'mens_t_shirts',9,10,2,0,'2019-04-19 22:45:09','2019-04-19 22:45:09'),(7,1,5,'womens_t_shirts',11,12,2,1,'2019-04-19 22:45:09','2019-04-19 22:45:09');
/*!40000 ALTER TABLE `sylius_taxon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sylius_taxon_translation`
--

DROP TABLE IF EXISTS `sylius_taxon_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sylius_taxon_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_uidx` (`locale`,`slug`),
  UNIQUE KEY `sylius_taxon_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_1487DFCF2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_1487DFCF2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `sylius_taxon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sylius_taxon_translation`
--

LOCK TABLES `sylius_taxon_translation` WRITE;
/*!40000 ALTER TABLE `sylius_taxon_translation` DISABLE KEYS */;
INSERT INTO `sylius_taxon_translation` VALUES (1,1,'Category','category','','en_US'),(2,2,'Mugs','mugs','','en_US'),(3,2,'Tasses','tasses','','fr_FR'),(4,3,'Stickers','stickers','','en_US'),(5,3,'Étiquettes','etiquettes','','fr_FR'),(6,4,'Books','books','','en_US'),(7,4,'Livres','livres','','fr_FR'),(8,5,'T-Shirts','t-shirts','','en_US'),(9,6,'Men','t-shirts/men','','en_US'),(10,6,'Hommes','t-shirts/hommes','','fr_FR'),(11,7,'Women','t-shirts/women','','en_US'),(12,7,'Hommes','t-shirts/femmes','','fr_FR');
/*!40000 ALTER TABLE `sylius_taxon_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://wordpress.local','yes'),(2,'home','http://wordpress.local','yes'),(3,'blogname','Wordpress Test Website','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','ksdjfb@kjbdfvgdkljsgds.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:1:{i:0;s:27:\"woocommerce/woocommerce.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','storefront','yes'),(41,'stylesheet','storefront','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','44719','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','0','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','page','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','28','yes'),(84,'page_on_front','27','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'wp_page_for_privacy_policy','3','yes'),(92,'show_comments_cookies_opt_in','1','yes'),(93,'initial_db_version','44719','yes'),(95,'fresh_site','0','yes'),(96,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(101,'sidebars_widgets','a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:8:\"header-1\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(102,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'nonce_key','o,+ITN^}/_7j,HkBeK`LO= sU9j]jTlk]$zPC0RMs19BR@BO!)r%7s96Xiq-(_{<','no'),(109,'nonce_salt','lqJvM}F4u9_L?JSVc~I> )O:PcpqYyM}CG##X0qNZuFyVZrZ%#tj*3SQRc*Eed/i','no'),(110,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(112,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(114,'theme_mods_twentynineteen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1552824011;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(116,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.1\";s:7:\"version\";s:5:\"5.1.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1556023921;s:15:\"version_checked\";s:5:\"5.1.1\";s:12:\"translations\";a:0:{}}','no'),(122,'auth_key','y4Lr_E.rLPtJoz(O}2~ByZn}Uv9zAiN7D!f0^w(I[ph;XhfeHb~XP_G<H!ciasS6','no'),(123,'auth_salt','.ZQ2c>+4hT|u| |B*e,}V9]:3`&mK>1!ypxh|Fq!zlq2t<}PycU|y;W&z #wq~:?','no'),(124,'logged_in_key','rqb`k$zd(|mQ42_C,#{.Y%LaA2y%w!UK]Zu9s>s_tFw=OW6Ha5B$ }4s4;AN3yOo','no'),(125,'logged_in_salt','mrrV,SEyj:i6*EgN1ixHXf-k!+NBEF4(TyjdN*{N3W&P{KAwP 6:+*}?tVFm4){J','no'),(131,'can_compress_scripts','1','no'),(146,'recently_activated','a:0:{}','yes'),(149,'woocommerce_store_address','New York','yes'),(150,'woocommerce_store_address_2','','yes'),(151,'woocommerce_store_city','New York','yes'),(152,'woocommerce_default_country','US:NY','yes'),(153,'woocommerce_store_postcode','123123','yes'),(154,'woocommerce_allowed_countries','all','yes'),(155,'woocommerce_all_except_countries','','yes'),(156,'woocommerce_specific_allowed_countries','','yes'),(157,'woocommerce_ship_to_countries','','yes'),(158,'woocommerce_specific_ship_to_countries','','yes'),(159,'woocommerce_default_customer_address','geolocation','yes'),(160,'woocommerce_calc_taxes','no','yes'),(161,'woocommerce_enable_coupons','yes','yes'),(162,'woocommerce_calc_discounts_sequentially','no','no'),(163,'woocommerce_currency','USD','yes'),(164,'woocommerce_currency_pos','left','yes'),(165,'woocommerce_price_thousand_sep',',','yes'),(166,'woocommerce_price_decimal_sep','.','yes'),(167,'woocommerce_price_num_decimals','2','yes'),(168,'woocommerce_shop_page_id','5','yes'),(169,'woocommerce_cart_redirect_after_add','no','yes'),(170,'woocommerce_enable_ajax_add_to_cart','yes','yes'),(171,'woocommerce_placeholder_image','','yes'),(172,'woocommerce_weight_unit','kg','yes'),(173,'woocommerce_dimension_unit','m','yes'),(174,'woocommerce_enable_reviews','yes','yes'),(175,'woocommerce_review_rating_verification_label','yes','no'),(176,'woocommerce_review_rating_verification_required','no','no'),(177,'woocommerce_enable_review_rating','yes','yes'),(178,'woocommerce_review_rating_required','yes','no'),(179,'woocommerce_manage_stock','yes','yes'),(180,'woocommerce_hold_stock_minutes','60','no'),(181,'woocommerce_notify_low_stock','yes','no'),(182,'woocommerce_notify_no_stock','yes','no'),(183,'woocommerce_stock_email_recipient','ksdjfb@kjbdfvgdkljsgds.com','no'),(184,'woocommerce_notify_low_stock_amount','2','no'),(185,'woocommerce_notify_no_stock_amount','0','yes'),(186,'woocommerce_hide_out_of_stock_items','no','yes'),(187,'woocommerce_stock_format','','yes'),(188,'woocommerce_file_download_method','force','no'),(189,'woocommerce_downloads_require_login','no','no'),(190,'woocommerce_downloads_grant_access_after_payment','yes','no'),(191,'woocommerce_prices_include_tax','no','yes'),(192,'woocommerce_tax_based_on','shipping','yes'),(193,'woocommerce_shipping_tax_class','inherit','yes'),(194,'woocommerce_tax_round_at_subtotal','no','yes'),(195,'woocommerce_tax_classes','Reduced rate\nZero rate','yes'),(196,'woocommerce_tax_display_shop','excl','yes'),(197,'woocommerce_tax_display_cart','excl','yes'),(198,'woocommerce_price_display_suffix','','yes'),(199,'woocommerce_tax_total_display','itemized','no'),(200,'woocommerce_enable_shipping_calc','yes','no'),(201,'woocommerce_shipping_cost_requires_address','no','yes'),(202,'woocommerce_ship_to_destination','billing','no'),(203,'woocommerce_shipping_debug_mode','no','yes'),(204,'woocommerce_enable_guest_checkout','yes','no'),(205,'woocommerce_enable_checkout_login_reminder','no','no'),(206,'woocommerce_enable_signup_and_login_from_checkout','no','no'),(207,'woocommerce_enable_myaccount_registration','no','no'),(208,'woocommerce_registration_generate_username','yes','no'),(209,'woocommerce_registration_generate_password','yes','no'),(210,'woocommerce_erasure_request_removes_order_data','no','no'),(211,'woocommerce_erasure_request_removes_download_data','no','no'),(212,'woocommerce_registration_privacy_policy_text','Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].','yes'),(213,'woocommerce_checkout_privacy_policy_text','Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].','yes'),(214,'woocommerce_delete_inactive_accounts','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','no'),(215,'woocommerce_trash_pending_orders','','no'),(216,'woocommerce_trash_failed_orders','','no'),(217,'woocommerce_trash_cancelled_orders','','no'),(218,'woocommerce_anonymize_completed_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','no'),(219,'woocommerce_email_from_name','Wordpress Test Website','no'),(220,'woocommerce_email_from_address','ksdjfb@kjbdfvgdkljsgds.com','no'),(221,'woocommerce_email_header_image','','no'),(222,'woocommerce_email_footer_text','{site_title}<br/>Built with <a href=\"https://woocommerce.com/\">WooCommerce</a>','no'),(223,'woocommerce_email_base_color','#96588a','no'),(224,'woocommerce_email_background_color','#f7f7f7','no'),(225,'woocommerce_email_body_background_color','#ffffff','no'),(226,'woocommerce_email_text_color','#3c3c3c','no'),(227,'woocommerce_cart_page_id','6','yes'),(228,'woocommerce_checkout_page_id','7','yes'),(229,'woocommerce_myaccount_page_id','8','yes'),(230,'woocommerce_terms_page_id','','no'),(231,'woocommerce_force_ssl_checkout','no','yes'),(232,'woocommerce_unforce_ssl_checkout','no','yes'),(233,'woocommerce_checkout_pay_endpoint','order-pay','yes'),(234,'woocommerce_checkout_order_received_endpoint','order-received','yes'),(235,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','yes'),(236,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','yes'),(237,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','yes'),(238,'woocommerce_myaccount_orders_endpoint','orders','yes'),(239,'woocommerce_myaccount_view_order_endpoint','view-order','yes'),(240,'woocommerce_myaccount_downloads_endpoint','downloads','yes'),(241,'woocommerce_myaccount_edit_account_endpoint','edit-account','yes'),(242,'woocommerce_myaccount_edit_address_endpoint','edit-address','yes'),(243,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','yes'),(244,'woocommerce_myaccount_lost_password_endpoint','lost-password','yes'),(245,'woocommerce_logout_endpoint','customer-logout','yes'),(246,'woocommerce_api_enabled','no','yes'),(247,'woocommerce_single_image_width','600','yes'),(248,'woocommerce_thumbnail_image_width','300','yes'),(249,'woocommerce_checkout_highlight_required_fields','yes','yes'),(250,'woocommerce_demo_store','no','no'),(251,'woocommerce_permalinks','a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}','yes'),(252,'current_theme_supports_woocommerce','yes','yes'),(253,'woocommerce_queue_flush_rewrite_rules','no','yes'),(254,'_transient_wc_attribute_taxonomies','a:0:{}','yes'),(256,'default_product_cat','15','yes'),(259,'woocommerce_version','3.5.6','yes'),(260,'woocommerce_db_version','3.5.6','yes'),(261,'woocommerce_admin_notices','a:1:{i:2;s:10:\"wootenberg\";}','yes'),(262,'_transient_woocommerce_webhook_ids','a:0:{}','yes'),(263,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(264,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(265,'widget_woocommerce_layered_nav','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(266,'widget_woocommerce_price_filter','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(267,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(268,'widget_woocommerce_product_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(269,'widget_woocommerce_product_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(270,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(271,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(272,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(273,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(274,'widget_woocommerce_rating_filter','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(277,'_transient_as_comment_count','O:8:\"stdClass\":7:{s:8:\"approved\";s:1:\"1\";s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}','yes'),(279,'woocommerce_meta_box_errors','a:0:{}','yes'),(285,'woocommerce_product_type','both','yes'),(286,'woocommerce_sell_in_person','1','yes'),(287,'woocommerce_allow_tracking','no','yes'),(289,'woocommerce_square_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','yes'),(290,'woocommerce_ppec_paypal_settings','a:2:{s:16:\"reroute_requests\";b:0;s:5:\"email\";b:0;}','yes'),(291,'woocommerce_stripe_settings','a:3:{s:7:\"enabled\";s:2:\"no\";s:14:\"create_account\";b:0;s:5:\"email\";b:0;}','yes'),(292,'woocommerce_cheque_settings','a:1:{s:7:\"enabled\";s:3:\"yes\";}','yes'),(293,'woocommerce_bacs_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','yes'),(294,'woocommerce_cod_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','yes'),(295,'_transient_shipping-transient-version','1552823939','yes'),(296,'woocommerce_flat_rate_1_settings','a:3:{s:5:\"title\";s:9:\"Flat rate\";s:10:\"tax_status\";s:7:\"taxable\";s:4:\"cost\";s:2:\"12\";}','yes'),(297,'woocommerce_flat_rate_2_settings','a:3:{s:5:\"title\";s:9:\"Flat rate\";s:10:\"tax_status\";s:7:\"taxable\";s:4:\"cost\";s:2:\"12\";}','yes'),(304,'current_theme','Storefront','yes'),(305,'theme_mods_storefront','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}','yes'),(306,'theme_switched','','yes'),(308,'storefront_nux_fresh_site','0','yes'),(309,'woocommerce_catalog_rows','4','yes'),(310,'woocommerce_catalog_columns','3','yes'),(311,'woocommerce_maybe_regenerate_images_hash','27acde77266b4d2a3491118955cb3f66','yes'),(312,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1556023924;s:7:\"checked\";a:4:{s:10:\"storefront\";s:5:\"2.4.5\";s:14:\"twentynineteen\";s:3:\"1.3\";s:15:\"twentyseventeen\";s:3:\"2.1\";s:13:\"twentysixteen\";s:3:\"1.9\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),(313,'_transient_product_query-transient-version','1556043544','yes'),(316,'storefront_nux_dismissed','1','yes'),(317,'storefront_nux_guided_tour','1','yes'),(324,'product_cat_children','a:0:{}','yes'),(327,'_transient_product-transient-version','1556043521','yes'),(332,'_transient_timeout_external_ip_address_192.168.1.1','1556373426','no'),(333,'_transient_external_ip_address_192.168.1.1','91.189.219.135','no'),(337,'_transient_timeout_wc_product_loop308c1552824189','1558360627','no'),(338,'_transient_wc_product_loop308c1552824189','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:40;i:1;i:39;i:2;i:38;i:3;i:37;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(339,'_transient_timeout_wc_product_loopa5b41552824189','1558360628','no'),(340,'_transient_wc_product_loopa5b41552824189','O:8:\"stdClass\":5:{s:3:\"ids\";a:2:{i:0;i:34;i:1;i:32;}s:5:\"total\";i:2;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(341,'_transient_timeout_wc_product_loop1a121552824189','1558360628','no'),(342,'_transient_wc_product_loop1a121552824189','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:29;i:1;i:30;i:2;i:31;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(345,'_transient_timeout_wc_product_loop621e1552824189','1558360629','no'),(346,'_transient_wc_product_loop621e1552824189','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:34;i:1;i:31;i:2;i:30;i:3;i:29;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(347,'_transient_timeout_wc_product_loop73ac1552824189','1558360629','no'),(348,'_transient_wc_product_loop73ac1552824189','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:38;i:1;i:34;i:2;i:33;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(354,'_transient_timeout_external_ip_address_192.168.1.141','1556373439','no'),(355,'_transient_external_ip_address_192.168.1.141','91.189.219.135','no'),(362,'_site_transient_timeout_browser_dc1626103c560e84ff87ed0be16a2039','1556374467','no'),(363,'_site_transient_browser_dc1626103c560e84ff87ed0be16a2039','a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"56.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(364,'_site_transient_timeout_php_check_6ddc0e66885714d69e39e2a35795e548','1556374468','no'),(365,'_site_transient_php_check_6ddc0e66885714d69e39e2a35795e548','a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:5:\"5.2.4\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),(456,'_transient_timeout_wc_product_loop308c1555774866','1558379549','no'),(457,'_transient_wc_product_loop308c1555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:40;i:1;i:39;i:2;i:38;i:3;i:37;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(458,'_transient_timeout_wc_product_loopa5b41555774866','1558379550','no'),(459,'_transient_wc_product_loopa5b41555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:2:{i:0;i:34;i:1;i:32;}s:5:\"total\";i:2;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(460,'_transient_timeout_wc_product_loop1a121555774866','1558379550','no'),(461,'_transient_wc_product_loop1a121555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:29;i:1;i:30;i:2;i:31;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(464,'_transient_timeout_wc_product_loop621e1555774866','1558379551','no'),(465,'_transient_wc_product_loop621e1555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:34;i:1;i:31;i:2;i:30;i:3;i:29;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(466,'_transient_timeout_wc_product_loop73ac1555774866','1558379551','no'),(467,'_transient_wc_product_loop73ac1555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:38;i:1;i:34;i:2;i:33;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(470,'_transient_timeout_wc_product_loop8d511555774866','1558379566','no'),(471,'_transient_wc_product_loop8d511555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:2:{i:0;i:34;i:1;i:32;}s:5:\"total\";i:2;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:2;s:12:\"current_page\";i:1;}','no'),(472,'_transient_timeout_wc_product_loopa47f1555774866','1558379567','no'),(473,'_transient_wc_product_loopa47f1555774866','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:33;i:1;i:34;i:2;i:38;i:3;i:29;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(480,'_site_transient_timeout_theme_roots','1556025723','no'),(481,'_site_transient_theme_roots','a:4:{s:10:\"storefront\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),(487,'_transient_timeout_wc_report_sales_by_date','1556129752','no'),(488,'_transient_wc_report_sales_by_date','a:16:{s:32:\"f6c45cf31702f2fb2b81f6a6db4cbe79\";a:0:{}s:32:\"52ed168f96b6cd67a9d4929490c9831e\";a:0:{}s:32:\"295ed324c7b4019f02f66da8f4415a4d\";a:0:{}s:32:\"a1b73ba98afc545b7391a7c1e843c35a\";N;s:32:\"a64d8541b05d661687ec1126d947919b\";a:0:{}s:32:\"967ff0b92163e84b8ea5cba2cc4ca8f5\";a:0:{}s:32:\"bab2089640d79eb55a6ba1497d0be358\";a:0:{}s:32:\"b5a22c1192b820bb88631610354f9d43\";a:0:{}s:32:\"64c58d81321dea7cbd372ce5b2a41d91\";a:0:{}s:32:\"e5663004a3e3b0701d86728094c54108\";a:0:{}s:32:\"42d3bf0872e348659bcc93b2b69383ad\";a:0:{}s:32:\"f3636db1016585d711a7f49ca9b8ce67\";N;s:32:\"d544de1edfdfad12c7bd998c701c0951\";a:0:{}s:32:\"77faf18c543b262faf46d8ae5c19a426\";a:0:{}s:32:\"ac4c1bae9c7295ecbee5b843ec04a2ed\";a:0:{}s:32:\"161abdcc48462eeca6f7fe2a626beb21\";a:0:{}}','no'),(489,'_transient_timeout_wc_admin_report','1556110331','no'),(490,'_transient_wc_admin_report','a:1:{s:32:\"b25e7113c9f9b2dd90185f6a3eb6f314\";a:0:{}}','no'),(491,'_site_transient_timeout_community-events-2c8826d5d44014f3d257734977965683','1556067133','no'),(492,'_site_transient_community-events-2c8826d5d44014f3d257734977965683','a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}s:6:\"events\";a:1:{i:0;a:7:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:16:\"WordCamp Košice\";s:3:\"url\";s:33:\"https://2019.kosice.wordcamp.org/\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2019-05-11 00:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:17:\"Košice, Slovakia\";s:7:\"country\";s:2:\"SK\";s:8:\"latitude\";d:48.731622100000003;s:9:\"longitude\";d:21.244336400000002;}}}}','no'),(493,'_transient_timeout_feed_9bbd59226dc36b9b26cd43f15694c5c3','1556067133','no'),(495,'_transient_timeout_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3','1556067134','no'),(496,'_transient_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3','1556023934','no'),(497,'_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9','1556067135','no'),(499,'_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1556067135','no'),(500,'_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1556023935','no'),(501,'_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b','1556067136','no'),(502,'_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b','<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2019/04/wordpress-5-2-beta-3/\'>WordPress 5.2 Beta 3</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wptavern.com/celebrate-earth-day-by-learning-about-environmentally-friendly-web-development-on-wordpress-tv\'>WPTavern: Celebrate Earth Day by Learning about Environmentally Friendly Web Development on WordPress.tv</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/amp-plugin-for-wordpress-1-1-adds-experimental-pwa-plugin-integration-pre-release-of-amp-stories-editor-available-in-1-2-alpha\'>WPTavern: AMP Plugin for WordPress 1.1 Adds Experimental PWA Plugin Integration, Pre-release of AMP Stories Editor Available in 1.2-alpha</a></li><li><a class=\'rsswidget\' href=\'https://poststatus.com/an-interview-with-rich-tabor/\'>Post Status: “Become the best version of yourself.” An Interview with Rich Tabor</a></li></ul></div>','no'),(603,'_transient_timeout_wc_product_loop308c1556035338','1558635340','no'),(604,'_transient_wc_product_loop308c1556035338','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:40;i:1;i:39;i:2;i:38;i:3;i:37;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(605,'_transient_timeout_wc_product_loopa5b41556035338','1558635340','no'),(606,'_transient_wc_product_loopa5b41556035338','O:8:\"stdClass\":5:{s:3:\"ids\";a:2:{i:0;i:34;i:1;i:32;}s:5:\"total\";i:2;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(607,'_transient_timeout_wc_product_loop1a121556035338','1558635340','no'),(608,'_transient_wc_product_loop1a121556035338','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:29;i:1;i:30;i:2;i:31;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(611,'_transient_timeout_wc_product_loop621e1556035338','1558635341','no'),(612,'_transient_wc_product_loop621e1556035338','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:34;i:1;i:31;i:2;i:30;i:3;i:29;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(613,'_transient_timeout_wc_product_loop73ac1556035338','1558635341','no'),(614,'_transient_wc_product_loop73ac1556035338','O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:38;i:1;i:34;i:2;i:33;i:3;i:32;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}','no'),(622,'_transient_wc_count_comments','O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(9,11,'_wp_attached_file','2019/03/beanie.jpg'),(10,11,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:18:\"2019/03/beanie.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"beanie-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"beanie-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"beanie-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(11,11,'_starter_content_theme','storefront'),(13,12,'_wp_attached_file','2019/03/belt.jpg'),(14,12,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:16:\"2019/03/belt.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"belt-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"belt-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"belt-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(15,12,'_starter_content_theme','storefront'),(17,13,'_wp_attached_file','2019/03/cap.jpg'),(18,13,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:15:\"2019/03/cap.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"cap-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"cap-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:15:\"cap-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(19,13,'_starter_content_theme','storefront'),(21,14,'_wp_attached_file','2019/03/hoodie-with-logo.jpg'),(22,14,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:28:\"2019/03/hoodie-with-logo.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"hoodie-with-logo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"hoodie-with-logo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:28:\"hoodie-with-logo-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(23,14,'_starter_content_theme','storefront'),(25,15,'_wp_attached_file','2019/03/hoodie-with-pocket.jpg'),(26,15,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:30:\"2019/03/hoodie-with-pocket.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"hoodie-with-pocket-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"hoodie-with-pocket-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"hoodie-with-pocket-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(27,15,'_starter_content_theme','storefront'),(29,16,'_wp_attached_file','2019/03/hoodie-with-zipper.jpg'),(30,16,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:30:\"2019/03/hoodie-with-zipper.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"hoodie-with-zipper-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"hoodie-with-zipper-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"hoodie-with-zipper-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(31,16,'_starter_content_theme','storefront'),(33,17,'_wp_attached_file','2019/03/hoodie.jpg'),(34,17,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:18:\"2019/03/hoodie.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"hoodie-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"hoodie-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"hoodie-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(35,17,'_starter_content_theme','storefront'),(37,18,'_wp_attached_file','2019/03/long-sleeve-tee.jpg'),(38,18,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:27:\"2019/03/long-sleeve-tee.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"long-sleeve-tee-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"long-sleeve-tee-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:27:\"long-sleeve-tee-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(39,18,'_starter_content_theme','storefront'),(41,19,'_wp_attached_file','2019/03/polo.jpg'),(42,19,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:800;s:4:\"file\";s:16:\"2019/03/polo.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"polo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"polo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"polo-768x767.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:767;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(43,19,'_starter_content_theme','storefront'),(45,20,'_wp_attached_file','2019/03/sunglasses.jpg'),(46,20,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:22:\"2019/03/sunglasses.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"sunglasses-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"sunglasses-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"sunglasses-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(47,20,'_starter_content_theme','storefront'),(49,21,'_wp_attached_file','2019/03/tshirt.jpg'),(50,21,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:18:\"2019/03/tshirt.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"tshirt-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"tshirt-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"tshirt-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(51,21,'_starter_content_theme','storefront'),(53,22,'_wp_attached_file','2019/03/vneck-tee.jpg'),(54,22,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:800;s:4:\"file\";s:21:\"2019/03/vneck-tee.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"vneck-tee-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"vneck-tee-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"vneck-tee-768x767.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:767;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(55,22,'_starter_content_theme','storefront'),(57,23,'_wp_attached_file','2019/03/hero.jpg'),(58,23,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:3795;s:6:\"height\";i:2355;s:4:\"file\";s:16:\"2019/03/hero.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"hero-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"hero-300x186.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:186;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"hero-768x477.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:477;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"hero-1024x635.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:635;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(59,23,'_starter_content_theme','storefront'),(61,24,'_wp_attached_file','2019/03/accessories.jpg'),(62,24,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:23:\"2019/03/accessories.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"accessories-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"accessories-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"accessories-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(63,24,'_starter_content_theme','storefront'),(65,25,'_wp_attached_file','2019/03/tshirts.jpg'),(66,25,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:801;s:6:\"height\";i:801;s:4:\"file\";s:19:\"2019/03/tshirts.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"tshirts-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"tshirts-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"tshirts-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(67,25,'_starter_content_theme','storefront'),(69,26,'_wp_attached_file','2019/03/hoodies.jpg'),(70,26,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:19:\"2019/03/hoodies.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"hoodies-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"hoodies-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"hoodies-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(71,26,'_starter_content_theme','storefront'),(73,27,'_thumbnail_id','23'),(74,27,'_wp_page_template','template-homepage.php'),(76,27,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(78,28,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(79,29,'_thumbnail_id','11'),(81,29,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(82,30,'_thumbnail_id','12'),(84,30,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(85,31,'_thumbnail_id','13'),(87,31,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(88,32,'_thumbnail_id','20'),(90,32,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(91,33,'_thumbnail_id','14'),(93,33,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(94,34,'_thumbnail_id','15'),(96,34,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(97,35,'_thumbnail_id','16'),(99,35,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(100,36,'_thumbnail_id','17'),(102,36,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(103,37,'_thumbnail_id','18'),(105,37,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(106,38,'_thumbnail_id','19'),(108,38,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(109,39,'_thumbnail_id','21'),(111,39,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(112,40,'_thumbnail_id','22'),(114,40,'_customize_changeset_uuid','d0f12677-f3e8-4e98-a16a-647fc838a68d'),(115,29,'_wc_review_count','0'),(116,29,'_wc_rating_count','a:0:{}'),(117,29,'_wc_average_rating','0'),(118,29,'_sku',''),(119,29,'_regular_price','20'),(120,29,'_sale_price','18'),(121,29,'_sale_price_dates_from',''),(122,29,'_sale_price_dates_to',''),(123,29,'total_sales','0'),(124,29,'_tax_status','taxable'),(125,29,'_tax_class',''),(126,29,'_manage_stock','no'),(127,29,'_backorders','no'),(128,29,'_low_stock_amount',''),(129,29,'_sold_individually','no'),(130,29,'_weight',''),(131,29,'_length',''),(132,29,'_width',''),(133,29,'_height',''),(134,29,'_upsell_ids','a:0:{}'),(135,29,'_crosssell_ids','a:0:{}'),(136,29,'_purchase_note',''),(137,29,'_default_attributes','a:0:{}'),(138,29,'_virtual','no'),(139,29,'_downloadable','no'),(140,29,'_product_image_gallery',''),(141,29,'_download_limit','-1'),(142,29,'_download_expiry','-1'),(143,29,'_stock',NULL),(144,29,'_stock_status','instock'),(145,29,'_product_version','3.5.6'),(146,29,'_price','18'),(147,30,'_wc_review_count','0'),(148,30,'_wc_rating_count','a:0:{}'),(149,30,'_wc_average_rating','0'),(150,30,'_sku',''),(151,30,'_regular_price','65'),(152,30,'_sale_price','55'),(153,30,'_sale_price_dates_from',''),(154,30,'_sale_price_dates_to',''),(155,30,'total_sales','0'),(156,30,'_tax_status','taxable'),(157,30,'_tax_class',''),(158,30,'_manage_stock','no'),(159,30,'_backorders','no'),(160,30,'_low_stock_amount',''),(161,30,'_sold_individually','no'),(162,30,'_weight',''),(163,30,'_length',''),(164,30,'_width',''),(165,30,'_height',''),(166,30,'_upsell_ids','a:0:{}'),(167,30,'_crosssell_ids','a:0:{}'),(168,30,'_purchase_note',''),(169,30,'_default_attributes','a:0:{}'),(170,30,'_virtual','no'),(171,30,'_downloadable','no'),(172,30,'_product_image_gallery',''),(173,30,'_download_limit','-1'),(174,30,'_download_expiry','-1'),(175,30,'_stock',NULL),(176,30,'_stock_status','instock'),(177,30,'_product_version','3.5.6'),(178,30,'_price','55'),(179,31,'_wc_review_count','0'),(180,31,'_wc_rating_count','a:0:{}'),(181,31,'_wc_average_rating','0'),(182,31,'_sku',''),(183,31,'_regular_price','18'),(184,31,'_sale_price','16'),(185,31,'_sale_price_dates_from',''),(186,31,'_sale_price_dates_to',''),(187,31,'total_sales','0'),(188,31,'_tax_status','taxable'),(189,31,'_tax_class',''),(190,31,'_manage_stock','no'),(191,31,'_backorders','no'),(192,31,'_low_stock_amount',''),(193,31,'_sold_individually','no'),(194,31,'_weight',''),(195,31,'_length',''),(196,31,'_width',''),(197,31,'_height',''),(198,31,'_upsell_ids','a:0:{}'),(199,31,'_crosssell_ids','a:0:{}'),(200,31,'_purchase_note',''),(201,31,'_default_attributes','a:0:{}'),(202,31,'_virtual','no'),(203,31,'_downloadable','no'),(204,31,'_product_image_gallery',''),(205,31,'_download_limit','-1'),(206,31,'_download_expiry','-1'),(207,31,'_stock',NULL),(208,31,'_stock_status','instock'),(209,31,'_product_version','3.5.6'),(210,31,'_price','16'),(211,32,'_wc_review_count','0'),(212,32,'_wc_rating_count','a:0:{}'),(213,32,'_wc_average_rating','0'),(214,32,'_sku',''),(215,32,'_regular_price','90'),(216,32,'_sale_price',''),(217,32,'_sale_price_dates_from',''),(218,32,'_sale_price_dates_to',''),(219,32,'total_sales','0'),(220,32,'_tax_status','taxable'),(221,32,'_tax_class',''),(222,32,'_manage_stock','no'),(223,32,'_backorders','no'),(224,32,'_low_stock_amount',''),(225,32,'_sold_individually','no'),(226,32,'_weight',''),(227,32,'_length',''),(228,32,'_width',''),(229,32,'_height',''),(230,32,'_upsell_ids','a:0:{}'),(231,32,'_crosssell_ids','a:0:{}'),(232,32,'_purchase_note',''),(233,32,'_default_attributes','a:0:{}'),(234,32,'_virtual','no'),(235,32,'_downloadable','no'),(236,32,'_product_image_gallery',''),(237,32,'_download_limit','-1'),(238,32,'_download_expiry','-1'),(239,32,'_stock',NULL),(240,32,'_stock_status','instock'),(241,32,'_product_version','3.5.6'),(242,32,'_price','90'),(243,33,'_wc_review_count','0'),(244,33,'_wc_rating_count','a:0:{}'),(245,33,'_wc_average_rating','0'),(246,33,'_sku',''),(247,33,'_regular_price','45'),(248,33,'_sale_price',''),(249,33,'_sale_price_dates_from',''),(250,33,'_sale_price_dates_to',''),(251,33,'total_sales','0'),(252,33,'_tax_status','taxable'),(253,33,'_tax_class',''),(254,33,'_manage_stock','no'),(255,33,'_backorders','no'),(256,33,'_low_stock_amount',''),(257,33,'_sold_individually','no'),(258,33,'_weight',''),(259,33,'_length',''),(260,33,'_width',''),(261,33,'_height',''),(262,33,'_upsell_ids','a:0:{}'),(263,33,'_crosssell_ids','a:0:{}'),(264,33,'_purchase_note',''),(265,33,'_default_attributes','a:0:{}'),(266,33,'_virtual','no'),(267,33,'_downloadable','no'),(268,33,'_product_image_gallery',''),(269,33,'_download_limit','-1'),(270,33,'_download_expiry','-1'),(271,33,'_stock',NULL),(272,33,'_stock_status','instock'),(273,33,'_product_version','3.5.6'),(274,33,'_price','45'),(275,34,'_wc_review_count','0'),(276,34,'_wc_rating_count','a:0:{}'),(277,34,'_wc_average_rating','0'),(278,34,'_sku',''),(279,34,'_regular_price','45'),(280,34,'_sale_price','35'),(281,34,'_sale_price_dates_from',''),(282,34,'_sale_price_dates_to',''),(283,34,'total_sales','0'),(284,34,'_tax_status','taxable'),(285,34,'_tax_class',''),(286,34,'_manage_stock','no'),(287,34,'_backorders','no'),(288,34,'_low_stock_amount',''),(289,34,'_sold_individually','no'),(290,34,'_weight',''),(291,34,'_length',''),(292,34,'_width',''),(293,34,'_height',''),(294,34,'_upsell_ids','a:0:{}'),(295,34,'_crosssell_ids','a:0:{}'),(296,34,'_purchase_note',''),(297,34,'_default_attributes','a:0:{}'),(298,34,'_virtual','no'),(299,34,'_downloadable','no'),(300,34,'_product_image_gallery',''),(301,34,'_download_limit','-1'),(302,34,'_download_expiry','-1'),(303,34,'_stock',NULL),(304,34,'_stock_status','instock'),(305,34,'_product_version','3.5.6'),(306,34,'_price','35'),(307,35,'_wc_review_count','0'),(308,35,'_wc_rating_count','a:0:{}'),(309,35,'_wc_average_rating','0'),(310,36,'_wc_review_count','0'),(311,36,'_wc_rating_count','a:0:{}'),(312,36,'_wc_average_rating','0'),(313,37,'_wc_review_count','0'),(314,37,'_wc_rating_count','a:0:{}'),(315,37,'_wc_average_rating','0'),(316,38,'_wc_review_count','0'),(317,38,'_wc_rating_count','a:0:{}'),(318,38,'_wc_average_rating','0'),(319,38,'_sku','SKU-POLO'),(320,38,'_regular_price','20'),(321,38,'_sale_price',''),(322,38,'_sale_price_dates_from',''),(323,38,'_sale_price_dates_to',''),(324,38,'total_sales','0'),(325,38,'_tax_status','taxable'),(326,38,'_tax_class',''),(327,38,'_manage_stock','no'),(328,38,'_backorders','no'),(329,38,'_low_stock_amount',''),(330,38,'_sold_individually','no'),(331,38,'_weight',''),(332,38,'_length',''),(333,38,'_width',''),(334,38,'_height',''),(335,38,'_upsell_ids','a:0:{}'),(336,38,'_crosssell_ids','a:0:{}'),(337,38,'_purchase_note',''),(338,38,'_default_attributes','a:0:{}'),(339,38,'_virtual','no'),(340,38,'_downloadable','no'),(341,38,'_product_image_gallery',''),(342,38,'_download_limit','-1'),(343,38,'_download_expiry','-1'),(344,38,'_stock',NULL),(345,38,'_stock_status','instock'),(347,38,'_product_version','3.5.6'),(349,38,'_price','20'),(350,39,'_wc_review_count','0'),(351,39,'_wc_rating_count','a:0:{}'),(352,39,'_wc_average_rating','0'),(353,40,'_wc_review_count','0'),(354,40,'_wc_rating_count','a:0:{}'),(355,40,'_wc_average_rating','0'),(356,38,'_edit_lock','1555775715:1'),(357,38,'_edit_last','1'),(358,36,'_edit_lock','1555774666:1'),(359,45,'_wc_review_count','0'),(360,45,'_wc_rating_count','a:0:{}'),(361,45,'_wc_average_rating','0'),(362,45,'_edit_last','1'),(363,45,'_edit_lock','1556023993:1'),(364,45,'_sku',''),(365,45,'_regular_price',''),(366,45,'_sale_price',''),(367,45,'_sale_price_dates_from',''),(368,45,'_sale_price_dates_to',''),(369,45,'total_sales','0'),(370,45,'_tax_status','taxable'),(371,45,'_tax_class',''),(372,45,'_manage_stock','no'),(373,45,'_backorders','no'),(374,45,'_low_stock_amount',''),(375,45,'_sold_individually','no'),(376,45,'_weight',''),(377,45,'_length',''),(378,45,'_width',''),(379,45,'_height',''),(380,45,'_upsell_ids','a:0:{}'),(381,45,'_crosssell_ids','a:0:{}'),(382,45,'_purchase_note',''),(383,45,'_default_attributes','a:0:{}'),(384,45,'_virtual','no'),(385,45,'_downloadable','no'),(386,45,'_product_image_gallery',''),(387,45,'_download_limit','-1'),(388,45,'_download_expiry','-1'),(389,45,'_stock',NULL),(390,45,'_stock_status','instock'),(391,45,'_product_version','3.5.6'),(392,45,'_price',''),(393,45,'_wp_trash_meta_status','publish'),(394,45,'_wp_trash_meta_time','1556024953'),(395,45,'_wp_desired_post_slug','test-product-wtf'),(396,47,'_wc_review_count','0'),(397,47,'_wc_rating_count','a:0:{}'),(398,47,'_wc_average_rating','0'),(399,47,'_edit_last','1'),(400,47,'_edit_lock','1556031708:1'),(401,47,'_sku',''),(402,47,'_regular_price',''),(403,47,'_sale_price',''),(404,47,'_sale_price_dates_from',''),(405,47,'_sale_price_dates_to',''),(406,47,'total_sales','0'),(407,47,'_tax_status','taxable'),(408,47,'_tax_class',''),(409,47,'_manage_stock','no'),(410,47,'_backorders','no'),(411,47,'_low_stock_amount',''),(412,47,'_sold_individually','no'),(413,47,'_weight',''),(414,47,'_length',''),(415,47,'_width',''),(416,47,'_height',''),(417,47,'_upsell_ids','a:0:{}'),(418,47,'_crosssell_ids','a:0:{}'),(419,47,'_purchase_note',''),(420,47,'_default_attributes','a:0:{}'),(421,47,'_virtual','no'),(422,47,'_downloadable','no'),(423,47,'_product_image_gallery',''),(424,47,'_download_limit','-1'),(425,47,'_download_expiry','-1'),(426,47,'_stock',NULL),(427,47,'_stock_status','instock'),(428,47,'_product_version','3.5.6'),(429,47,'_price',''),(430,47,'_wp_trash_meta_status','publish'),(431,47,'_wp_trash_meta_time','1556031851'),(432,47,'_wp_desired_post_slug','test-another-wtf'),(433,48,'_wc_review_count','0'),(434,48,'_wc_rating_count','a:0:{}'),(435,48,'_wc_average_rating','0'),(436,48,'_edit_last','1'),(437,48,'_edit_lock','1556031914:1'),(438,48,'_sku',''),(439,48,'_regular_price',''),(440,48,'_sale_price',''),(441,48,'_sale_price_dates_from',''),(442,48,'_sale_price_dates_to',''),(443,48,'total_sales','0'),(444,48,'_tax_status','taxable'),(445,48,'_tax_class',''),(446,48,'_manage_stock','no'),(447,48,'_backorders','no'),(448,48,'_low_stock_amount',''),(449,48,'_sold_individually','no'),(450,48,'_weight',''),(451,48,'_length',''),(452,48,'_width',''),(453,48,'_height',''),(454,48,'_upsell_ids','a:0:{}'),(455,48,'_crosssell_ids','a:0:{}'),(456,48,'_purchase_note',''),(457,48,'_default_attributes','a:0:{}'),(458,48,'_virtual','no'),(459,48,'_downloadable','no'),(460,48,'_product_image_gallery',''),(461,48,'_download_limit','-1'),(462,48,'_download_expiry','-1'),(463,48,'_stock',NULL),(464,48,'_stock_status','instock'),(465,48,'_product_version','3.5.6'),(466,48,'_price',''),(467,48,'_wp_trash_meta_status','publish'),(468,48,'_wp_trash_meta_time','1556032057'),(469,48,'_wp_desired_post_slug','test-another-2-product'),(470,49,'_wc_review_count','0'),(471,49,'_wc_rating_count','a:0:{}'),(472,49,'_wc_average_rating','0'),(473,49,'_edit_last','1'),(474,49,'_sku',''),(475,49,'_regular_price',''),(476,49,'_sale_price',''),(477,49,'_sale_price_dates_from',''),(478,49,'_sale_price_dates_to',''),(479,49,'total_sales','0'),(480,49,'_tax_status','taxable'),(481,49,'_tax_class',''),(482,49,'_manage_stock','no'),(483,49,'_backorders','no'),(484,49,'_low_stock_amount',''),(485,49,'_sold_individually','no'),(486,49,'_weight',''),(487,49,'_length',''),(488,49,'_width',''),(489,49,'_height',''),(490,49,'_upsell_ids','a:0:{}'),(491,49,'_crosssell_ids','a:0:{}'),(492,49,'_purchase_note',''),(493,49,'_default_attributes','a:0:{}'),(494,49,'_virtual','no'),(495,49,'_downloadable','no'),(496,49,'_product_image_gallery',''),(497,49,'_download_limit','-1'),(498,49,'_download_expiry','-1'),(499,49,'_stock',NULL),(500,49,'_stock_status','instock'),(501,49,'_product_version','3.5.6'),(502,49,'_price',''),(503,49,'_edit_lock','1556033658:1'),(504,49,'_wp_trash_meta_status','publish'),(505,49,'_wp_trash_meta_time','1556033802'),(506,49,'_wp_desired_post_slug','test-this-wtf'),(507,50,'_wc_review_count','0'),(508,50,'_wc_rating_count','a:0:{}'),(509,50,'_wc_average_rating','0'),(510,50,'_edit_last','1'),(511,50,'_sku',''),(512,50,'_regular_price',''),(513,50,'_sale_price',''),(514,50,'_sale_price_dates_from',''),(515,50,'_sale_price_dates_to',''),(516,50,'total_sales','0'),(517,50,'_tax_status','taxable'),(518,50,'_tax_class',''),(519,50,'_manage_stock','no'),(520,50,'_backorders','no'),(521,50,'_low_stock_amount',''),(522,50,'_sold_individually','no'),(523,50,'_weight',''),(524,50,'_length',''),(525,50,'_width',''),(526,50,'_height',''),(527,50,'_upsell_ids','a:0:{}'),(528,50,'_crosssell_ids','a:0:{}'),(529,50,'_purchase_note',''),(530,50,'_default_attributes','a:0:{}'),(531,50,'_virtual','no'),(532,50,'_downloadable','no'),(533,50,'_product_image_gallery',''),(534,50,'_download_limit','-1'),(535,50,'_download_expiry','-1'),(536,50,'_stock',NULL),(537,50,'_stock_status','instock'),(538,50,'_product_version','3.5.6'),(539,50,'_price',''),(540,50,'_edit_lock','1556034356:1'),(541,50,'_wp_trash_meta_status','publish'),(542,50,'_wp_trash_meta_time','1556034499'),(543,50,'_wp_desired_post_slug','test-wtf'),(544,51,'_wc_review_count','0'),(545,51,'_wc_rating_count','a:0:{}'),(546,51,'_wc_average_rating','0'),(547,51,'_edit_last','1'),(548,51,'_edit_lock','1556034593:1'),(549,51,'_sku',''),(550,51,'_regular_price',''),(551,51,'_sale_price',''),(552,51,'_sale_price_dates_from',''),(553,51,'_sale_price_dates_to',''),(554,51,'total_sales','0'),(555,51,'_tax_status','taxable'),(556,51,'_tax_class',''),(557,51,'_manage_stock','no'),(558,51,'_backorders','no'),(559,51,'_low_stock_amount',''),(560,51,'_sold_individually','no'),(561,51,'_weight',''),(562,51,'_length',''),(563,51,'_width',''),(564,51,'_height',''),(565,51,'_upsell_ids','a:0:{}'),(566,51,'_crosssell_ids','a:0:{}'),(567,51,'_purchase_note',''),(568,51,'_default_attributes','a:0:{}'),(569,51,'_virtual','no'),(570,51,'_downloadable','no'),(571,51,'_product_image_gallery',''),(572,51,'_download_limit','-1'),(573,51,'_download_expiry','-1'),(574,51,'_stock',NULL),(575,51,'_stock_status','instock'),(576,51,'_product_version','3.5.6'),(577,51,'_price',''),(578,51,'_wp_trash_meta_status','publish'),(579,51,'_wp_trash_meta_time','1556034737'),(580,51,'_wp_desired_post_slug','test-wtf2'),(581,52,'_wc_review_count','0'),(582,52,'_wc_rating_count','a:0:{}'),(583,52,'_wc_average_rating','0'),(584,52,'_edit_last','1'),(585,52,'_sku',''),(586,52,'_regular_price',''),(587,52,'_sale_price',''),(588,52,'_sale_price_dates_from',''),(589,52,'_sale_price_dates_to',''),(590,52,'total_sales','0'),(591,52,'_tax_status','taxable'),(592,52,'_tax_class',''),(593,52,'_manage_stock','no'),(594,52,'_backorders','no'),(595,52,'_low_stock_amount',''),(596,52,'_sold_individually','no'),(597,52,'_weight',''),(598,52,'_length',''),(599,52,'_width',''),(600,52,'_height',''),(601,52,'_upsell_ids','a:0:{}'),(602,52,'_crosssell_ids','a:0:{}'),(603,52,'_purchase_note',''),(604,52,'_default_attributes','a:0:{}'),(605,52,'_virtual','no'),(606,52,'_downloadable','no'),(607,52,'_product_image_gallery',''),(608,52,'_download_limit','-1'),(609,52,'_download_expiry','-1'),(610,52,'_stock',NULL),(611,52,'_stock_status','instock'),(612,52,'_product_version','3.5.6'),(613,52,'_price',''),(614,52,'_edit_lock','1556034678:1'),(615,52,'_wp_trash_meta_status','publish'),(616,52,'_wp_trash_meta_time','1556034822'),(617,52,'_wp_desired_post_slug','test-wtf3'),(618,53,'_wc_review_count','0'),(619,53,'_wc_rating_count','a:0:{}'),(620,53,'_wc_average_rating','0'),(621,53,'_edit_last','1'),(622,53,'_edit_lock','1556034755:1'),(623,53,'_sku',''),(624,53,'_regular_price',''),(625,53,'_sale_price',''),(626,53,'_sale_price_dates_from',''),(627,53,'_sale_price_dates_to',''),(628,53,'total_sales','0'),(629,53,'_tax_status','taxable'),(630,53,'_tax_class',''),(631,53,'_manage_stock','no'),(632,53,'_backorders','no'),(633,53,'_low_stock_amount',''),(634,53,'_sold_individually','no'),(635,53,'_weight',''),(636,53,'_length',''),(637,53,'_width',''),(638,53,'_height',''),(639,53,'_upsell_ids','a:0:{}'),(640,53,'_crosssell_ids','a:0:{}'),(641,53,'_purchase_note',''),(642,53,'_default_attributes','a:0:{}'),(643,53,'_virtual','no'),(644,53,'_downloadable','no'),(645,53,'_product_image_gallery',''),(646,53,'_download_limit','-1'),(647,53,'_download_expiry','-1'),(648,53,'_stock',NULL),(649,53,'_stock_status','instock'),(650,53,'_product_version','3.5.6'),(651,53,'_price',''),(652,53,'_wp_trash_meta_status','publish'),(653,53,'_wp_trash_meta_time','1556034899'),(654,53,'_wp_desired_post_slug','test-wtf4'),(655,54,'_wc_review_count','0'),(656,54,'_wc_rating_count','a:0:{}'),(657,54,'_wc_average_rating','0'),(658,54,'_edit_last','1'),(659,54,'_edit_lock','1556035194:1'),(660,54,'_sku',''),(661,54,'_regular_price',''),(662,54,'_sale_price',''),(663,54,'_sale_price_dates_from',''),(664,54,'_sale_price_dates_to',''),(665,54,'total_sales','0'),(666,54,'_tax_status','taxable'),(667,54,'_tax_class',''),(668,54,'_manage_stock','no'),(669,54,'_backorders','no'),(670,54,'_low_stock_amount',''),(671,54,'_sold_individually','no'),(672,54,'_weight',''),(673,54,'_length',''),(674,54,'_width',''),(675,54,'_height',''),(676,54,'_upsell_ids','a:0:{}'),(677,54,'_crosssell_ids','a:0:{}'),(678,54,'_purchase_note',''),(679,54,'_default_attributes','a:0:{}'),(680,54,'_virtual','no'),(681,54,'_downloadable','no'),(682,54,'_product_image_gallery',''),(683,54,'_download_limit','-1'),(684,54,'_download_expiry','-1'),(685,54,'_stock',NULL),(686,54,'_stock_status','instock'),(687,54,'_product_version','3.5.6'),(688,54,'_price',''),(689,54,'_wp_trash_meta_status','publish'),(690,54,'_wp_trash_meta_time','1556035336'),(691,54,'_wp_desired_post_slug','test-wtf'),(692,55,'_wc_review_count','0'),(693,55,'_wc_rating_count','a:0:{}'),(694,55,'_wc_average_rating','0'),(695,55,'_edit_last','1'),(696,55,'_edit_lock','1556043400:1'),(697,55,'_sku',''),(698,55,'_regular_price',''),(699,55,'_sale_price',''),(700,55,'_sale_price_dates_from',''),(701,55,'_sale_price_dates_to',''),(702,55,'total_sales','0'),(703,55,'_tax_status','taxable'),(704,55,'_tax_class',''),(705,55,'_manage_stock','no'),(706,55,'_backorders','no'),(707,55,'_low_stock_amount',''),(708,55,'_sold_individually','no'),(709,55,'_weight',''),(710,55,'_length',''),(711,55,'_width',''),(712,55,'_height',''),(713,55,'_upsell_ids','a:0:{}'),(714,55,'_crosssell_ids','a:0:{}'),(715,55,'_purchase_note',''),(716,55,'_default_attributes','a:0:{}'),(717,55,'_virtual','no'),(718,55,'_downloadable','no'),(719,55,'_product_image_gallery',''),(720,55,'_download_limit','-1'),(721,55,'_download_expiry','-1'),(722,55,'_stock',NULL),(723,55,'_stock_status','instock'),(724,55,'_product_version','3.5.6'),(725,55,'_price',''),(726,55,'_wp_trash_meta_status','publish'),(727,55,'_wp_trash_meta_time','1556043543'),(728,55,'_wp_desired_post_slug','test-wtf');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2019-03-17 11:55:44','2019-03-17 11:55:44','','Hello world!','','publish','open','open','','hello-world','','','2019-03-17 11:55:44','2019-03-17 11:55:44','',0,'http://wordpress.local/?p=1',0,'post','',1),(2,1,'2019-03-17 11:55:44','2019-03-17 11:55:44','','Sample Page','','publish','closed','open','','sample-page','','','2019-03-17 11:55:44','2019-03-17 11:55:44','',0,'http://wordpress.local/?page_id=2',0,'page','',0),(3,1,'2019-03-17 11:55:44','2019-03-17 11:55:44','','Privacy Policy','','draft','closed','open','','privacy-policy','','','2019-03-17 11:55:44','2019-03-17 11:55:44','',0,'http://wordpress.local/?page_id=3',0,'page','',0),(5,1,'2019-03-17 11:57:49','2019-03-17 11:57:49','','Shop','','publish','closed','closed','','shop','','','2019-03-17 11:57:49','2019-03-17 11:57:49','',0,'http://wordpress.local/shop/',0,'page','',0),(6,1,'2019-03-17 11:57:50','2019-03-17 11:57:50','','Cart','','publish','closed','closed','','cart','','','2019-03-17 11:57:50','2019-03-17 11:57:50','',0,'http://wordpress.local/cart/',0,'page','',0),(7,1,'2019-03-17 11:57:50','2019-03-17 11:57:50','','Checkout','','publish','closed','closed','','checkout','','','2019-03-17 11:57:50','2019-03-17 11:57:50','',0,'http://wordpress.local/checkout/',0,'page','',0),(8,1,'2019-03-17 11:57:50','2019-03-17 11:57:50','','My account','','publish','closed','closed','','my-account','','','2019-03-17 11:57:50','2019-03-17 11:57:50','',0,'http://wordpress.local/my-account/',0,'page','',0),(11,1,'2019-03-17 12:02:22','2019-03-17 12:02:22','','Beanie','','inherit','open','closed','','beanie-image','','','2019-03-17 12:02:22','2019-03-17 12:02:22','',0,'http://wordpress.local/wp-content/uploads/2019/03/beanie.jpg',0,'attachment','image/jpeg',0),(12,1,'2019-03-17 12:02:23','2019-03-17 12:02:23','','Belt','','inherit','open','closed','','belt-image','','','2019-03-17 12:02:23','2019-03-17 12:02:23','',0,'http://wordpress.local/wp-content/uploads/2019/03/belt.jpg',0,'attachment','image/jpeg',0),(13,1,'2019-03-17 12:02:23','2019-03-17 12:02:23','','Cap','','inherit','open','closed','','cap-image','','','2019-03-17 12:02:23','2019-03-17 12:02:23','',0,'http://wordpress.local/wp-content/uploads/2019/03/cap.jpg',0,'attachment','image/jpeg',0),(14,1,'2019-03-17 12:02:23','2019-03-17 12:02:23','','Hoodie with Logo','','inherit','open','closed','','hoodie-with-logo-image','','','2019-03-17 12:02:23','2019-03-17 12:02:23','',0,'http://wordpress.local/wp-content/uploads/2019/03/hoodie-with-logo.jpg',0,'attachment','image/jpeg',0),(15,1,'2019-03-17 12:02:24','2019-03-17 12:02:24','','Hoodie with Pocket','','inherit','open','closed','','hoodie-with-pocket-image','','','2019-03-17 12:02:24','2019-03-17 12:02:24','',0,'http://wordpress.local/wp-content/uploads/2019/03/hoodie-with-pocket.jpg',0,'attachment','image/jpeg',0),(16,1,'2019-03-17 12:02:24','2019-03-17 12:02:24','','Hoodie with Zipper','','inherit','open','closed','','hoodie-with-zipper-image','','','2019-03-17 12:02:24','2019-03-17 12:02:24','',0,'http://wordpress.local/wp-content/uploads/2019/03/hoodie-with-zipper.jpg',0,'attachment','image/jpeg',0),(17,1,'2019-03-17 12:02:24','2019-03-17 12:02:24','','Hoodie','','inherit','open','closed','','hoodie-image','','','2019-03-17 12:02:24','2019-03-17 12:02:24','',0,'http://wordpress.local/wp-content/uploads/2019/03/hoodie.jpg',0,'attachment','image/jpeg',0),(18,1,'2019-03-17 12:02:25','2019-03-17 12:02:25','','Long Sleeve Tee','','inherit','open','closed','','long-sleeve-tee-image','','','2019-03-17 12:02:25','2019-03-17 12:02:25','',0,'http://wordpress.local/wp-content/uploads/2019/03/long-sleeve-tee.jpg',0,'attachment','image/jpeg',0),(19,1,'2019-03-17 12:02:25','2019-03-17 12:02:25','','Polo','','inherit','open','closed','','polo-image','','','2019-03-17 12:02:25','2019-03-17 12:02:25','',0,'http://wordpress.local/wp-content/uploads/2019/03/polo.jpg',0,'attachment','image/jpeg',0),(20,1,'2019-03-17 12:02:26','2019-03-17 12:02:26','','Sunglasses','','inherit','open','closed','','sunglasses-image','','','2019-03-17 12:02:26','2019-03-17 12:02:26','',0,'http://wordpress.local/wp-content/uploads/2019/03/sunglasses.jpg',0,'attachment','image/jpeg',0),(21,1,'2019-03-17 12:02:26','2019-03-17 12:02:26','','Tshirt','','inherit','open','closed','','tshirt-image','','','2019-03-17 12:02:26','2019-03-17 12:02:26','',0,'http://wordpress.local/wp-content/uploads/2019/03/tshirt.jpg',0,'attachment','image/jpeg',0),(22,1,'2019-03-17 12:02:27','2019-03-17 12:02:27','','Vneck Tshirt','','inherit','open','closed','','vneck-tee-image','','','2019-03-17 12:02:27','2019-03-17 12:02:27','',0,'http://wordpress.local/wp-content/uploads/2019/03/vneck-tee.jpg',0,'attachment','image/jpeg',0),(23,1,'2019-03-17 12:02:27','2019-03-17 12:02:27','','Hero','','inherit','open','closed','','hero-image','','','2019-03-17 12:02:27','2019-03-17 12:02:27','',0,'http://wordpress.local/wp-content/uploads/2019/03/hero.jpg',0,'attachment','image/jpeg',0),(24,1,'2019-03-17 12:02:28','2019-03-17 12:02:28','','Accessories','','inherit','open','closed','','accessories-image','','','2019-03-17 12:02:28','2019-03-17 12:02:28','',0,'http://wordpress.local/wp-content/uploads/2019/03/accessories.jpg',0,'attachment','image/jpeg',0),(25,1,'2019-03-17 12:02:28','2019-03-17 12:02:28','','T-shirts','','inherit','open','closed','','tshirts-image','','','2019-03-17 12:02:28','2019-03-17 12:02:28','',0,'http://wordpress.local/wp-content/uploads/2019/03/tshirts.jpg',0,'attachment','image/jpeg',0),(26,1,'2019-03-17 12:02:29','2019-03-17 12:02:29','','Hoodies','','inherit','open','closed','','hoodies-image','','','2019-03-17 12:02:29','2019-03-17 12:02:29','',0,'http://wordpress.local/wp-content/uploads/2019/03/hoodies.jpg',0,'attachment','image/jpeg',0),(27,1,'2019-03-17 12:02:29','2019-03-17 12:02:29','','Welcome','','publish','closed','closed','','welcome','','','2019-03-17 12:02:29','2019-03-17 12:02:29','',0,'http://wordpress.local/?page_id=27',0,'page','',0),(28,1,'2019-03-17 12:02:31','2019-03-17 12:02:31','','Blog','','publish','closed','closed','','blog','','','2019-03-17 12:02:31','2019-03-17 12:02:31','',0,'http://wordpress.local/?page_id=28',0,'page','',0),(29,1,'2019-03-17 12:02:32','2019-03-17 12:02:32','','Beanie','','publish','open','closed','','beanie','','','2019-03-17 12:02:34','2019-03-17 12:02:34','',0,'http://wordpress.local/?p=29',0,'product','',0),(30,1,'2019-03-17 12:02:35','2019-03-17 12:02:35','','Belt','','publish','open','closed','','belt','','','2019-03-17 12:02:37','2019-03-17 12:02:37','',0,'http://wordpress.local/?p=30',0,'product','',0),(31,1,'2019-03-17 12:02:38','2019-03-17 12:02:38','','Cap','','publish','open','closed','','cap','','','2019-03-17 12:02:39','2019-03-17 12:02:39','',0,'http://wordpress.local/?p=31',0,'product','',0),(32,1,'2019-03-17 12:02:40','2019-03-17 12:02:40','','Sunglasses','','publish','open','closed','','sunglasses','','','2019-03-17 12:02:42','2019-03-17 12:02:42','',0,'http://wordpress.local/?p=32',0,'product','',0),(33,1,'2019-03-17 12:02:45','2019-03-17 12:02:45','','Hoodie with Logo','','publish','open','closed','','hoodie-with-logo','','','2019-03-17 12:02:46','2019-03-17 12:02:46','',0,'http://wordpress.local/?p=33',0,'product','',0),(34,1,'2019-03-17 12:02:47','2019-03-17 12:02:47','','Hoodie with Pocket','','publish','open','closed','','hoodie-with-pocket','','','2019-03-17 12:02:48','2019-03-17 12:02:48','',0,'http://wordpress.local/?p=34',0,'product','',0),(35,1,'2019-03-17 12:02:50','2019-03-17 12:02:50','','Hoodie with Zipper','','publish','open','closed','','hoodie-with-zipper','','','2019-03-17 12:02:51','2019-03-17 12:02:51','',0,'http://wordpress.local/?p=35',0,'product','',0),(36,1,'2019-03-17 12:02:52','2019-03-17 12:02:52','','Hoodie','','publish','open','closed','','hoodie','','','2019-03-17 12:02:53','2019-03-17 12:02:53','',0,'http://wordpress.local/?p=36',0,'product','',0),(37,1,'2019-03-17 12:02:55','2019-03-17 12:02:55','','Long Sleeve Tee','','publish','open','closed','','long-sleeve-tee','','','2019-03-17 12:02:57','2019-03-17 12:02:57','',0,'http://wordpress.local/?p=37',0,'product','',0),(38,1,'2019-03-17 12:02:58','2019-03-17 12:02:58','','Polo','','publish','open','closed','','polo','','','2019-04-20 15:41:06','2019-04-20 15:41:06','',0,'http://wordpress.local/?p=38',0,'product','',0),(39,1,'2019-03-17 12:03:01','2019-03-17 12:03:01','','Tshirt','','publish','open','closed','','tshirt','','','2019-03-17 12:03:02','2019-03-17 12:03:02','',0,'http://wordpress.local/?p=39',0,'product','',0),(40,1,'2019-03-17 12:03:03','2019-03-17 12:03:03','','Vneck Tshirt','','publish','open','closed','','vneck-tee','','','2019-03-17 12:03:04','2019-03-17 12:03:04','',0,'http://wordpress.local/?p=40',0,'product','',0),(42,1,'2019-03-17 12:02:29','2019-03-17 12:02:29','','Welcome','','inherit','closed','closed','','27-revision-v1','','','2019-03-17 12:02:29','2019-03-17 12:02:29','',27,'http://wordpress.local/2019/03/17/27-revision-v1/',0,'revision','',0),(43,1,'2019-03-17 12:02:31','2019-03-17 12:02:31','','Blog','','inherit','closed','closed','','28-revision-v1','','','2019-03-17 12:02:31','2019-03-17 12:02:31','',28,'http://wordpress.local/2019/03/17/28-revision-v1/',0,'revision','',0),(44,1,'2019-04-20 14:14:30','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2019-04-20 14:14:30','0000-00-00 00:00:00','',0,'http://wordpress.local/?p=44',0,'post','',0),(45,1,'2019-04-23 12:53:06','2019-04-23 12:53:06','','Test Product WTF','','trash','open','closed','','test-product-wtf__trashed','','','2019-04-23 13:09:14','2019-04-23 13:09:14','',0,'http://wordpress.local/?post_type=product&#038;p=45',0,'product','',0),(46,1,'2019-04-23 13:09:15','2019-04-23 13:09:15','','Test Product WTF','<p><br data-mce-bogus=\"1\"></p>','inherit','closed','closed','','45-autosave-v1','','','2019-04-23 13:09:15','2019-04-23 13:09:15','',45,'http://wordpress.local/2019/04/23/45-autosave-v1/',0,'revision','',0),(47,1,'2019-04-23 15:02:22','2019-04-23 15:02:22','','Test Another WTF','','trash','open','closed','','test-another-wtf__trashed','','','2019-04-23 15:04:11','2019-04-23 15:04:11','',0,'http://wordpress.local/?post_type=product&#038;p=47',0,'product','',0),(48,1,'2019-04-23 15:06:59','2019-04-23 15:06:59','','Test another 2 product','','trash','open','closed','','test-another-2-product__trashed','','','2019-04-23 15:07:37','2019-04-23 15:07:37','',0,'http://wordpress.local/?post_type=product&#038;p=48',0,'product','',0),(49,1,'2019-04-23 15:30:14','2019-04-23 15:30:14','','Test this WTF','','trash','open','closed','','test-this-wtf__trashed','','','2019-04-23 15:36:42','2019-04-23 15:36:42','',0,'http://wordpress.local/?post_type=product&#038;p=49',0,'product','',0),(50,1,'2019-04-23 15:47:47','2019-04-23 15:47:47','','Test wtf','','trash','open','closed','','test-wtf__trashed','','','2019-04-23 15:48:19','2019-04-23 15:48:19','',0,'http://wordpress.local/?post_type=product&#038;p=50',0,'product','',0),(51,1,'2019-04-23 15:51:44','2019-04-23 15:51:44','','Test wtf2','','trash','open','closed','','test-wtf2__trashed','','','2019-04-23 15:52:17','2019-04-23 15:52:17','',0,'http://wordpress.local/?post_type=product&#038;p=51',0,'product','',0),(52,1,'2019-04-23 15:53:19','2019-04-23 15:53:19','','Test wtf3','','trash','open','closed','','test-wtf3__trashed','','','2019-04-23 15:53:42','2019-04-23 15:53:42','',0,'http://wordpress.local/?post_type=product&#038;p=52',0,'product','',0),(53,1,'2019-04-23 15:54:45','2019-04-23 15:54:45','','Test wtf4','','trash','open','closed','','test-wtf4__trashed','','','2019-04-23 15:54:59','2019-04-23 15:54:59','',0,'http://wordpress.local/?post_type=product&#038;p=53',0,'product','',0),(54,1,'2019-04-23 16:01:47','2019-04-23 16:01:47','','Test WTF','','trash','open','closed','','test-wtf__trashed-2','','','2019-04-23 16:02:17','2019-04-23 16:02:17','',0,'http://wordpress.local/?post_type=product&#038;p=54',0,'product','',0),(55,1,'2019-04-23 18:18:35','2019-04-23 18:18:35','','Test WTF :)','','trash','open','closed','','test-wtf__trashed-3','','','2019-04-23 18:19:03','2019-04-23 18:19:03','',0,'http://wordpress.local/?post_type=product&#038;p=55',0,'product','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(29,2,0),(29,16,0),(30,2,0),(30,16,0),(31,2,0),(31,16,0),(32,2,0),(32,8,0),(32,16,0),(33,2,0),(33,17,0),(34,2,0),(34,8,0),(34,17,0),(35,17,0),(36,17,0),(37,18,0),(38,2,0),(38,16,0),(38,18,0),(39,18,0),(40,18,0),(45,2,0),(45,18,0),(47,2,0),(47,15,0),(48,2,0),(48,15,0),(49,2,0),(49,15,0),(50,2,0),(50,15,0),(51,2,0),(51,18,0),(52,2,0),(52,15,0),(53,2,0),(53,17,0),(54,2,0),(54,17,0),(55,2,0),(55,17,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'product_type','',0,7),(3,3,'product_type','',0,0),(4,4,'product_type','',0,0),(5,5,'product_type','',0,0),(6,6,'product_visibility','',0,0),(7,7,'product_visibility','',0,0),(8,8,'product_visibility','',0,2),(9,9,'product_visibility','',0,0),(10,10,'product_visibility','',0,0),(11,11,'product_visibility','',0,0),(12,12,'product_visibility','',0,0),(13,13,'product_visibility','',0,0),(14,14,'product_visibility','',0,0),(15,15,'product_cat','',0,0),(16,16,'product_cat','A short category description',0,5),(17,17,'product_cat','A short category description',0,4),(18,18,'product_cat','A short category description',0,4);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'simple','simple',0),(3,'grouped','grouped',0),(4,'variable','variable',0),(5,'external','external',0),(6,'exclude-from-search','exclude-from-search',0),(7,'exclude-from-catalog','exclude-from-catalog',0),(8,'featured','featured',0),(9,'outofstock','outofstock',0),(10,'rated-1','rated-1',0),(11,'rated-2','rated-2',0),(12,'rated-3','rated-3',0),(13,'rated-4','rated-4',0),(14,'rated-5','rated-5',0),(15,'Uncategorized','uncategorized',0),(16,'Accessories','accessories',0),(17,'Hoodies','hoodies',0),(18,'Tshirts','tshirts',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-27 14:03:30


-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: 192.168.1.141    Database: magento19_tmp
-- ------------------------------------------------------
-- Server version	5.5.62-0+deb8u1

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
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,0,'2013-01-14 10:12:53','2013-01-14 10:12:53','1',0,0,28),(2,3,3,1,'2013-01-14 10:12:53','2013-05-15 22:43:57','1/2',1,1,27),(4,3,3,2,'2013-01-25 10:43:31','2013-05-15 22:50:23','1/2/4',2,2,4),(5,3,3,2,'2013-01-25 10:44:47','2013-05-08 05:20:07','1/2/5',3,2,5),(6,3,3,2,'2013-01-25 10:47:41','2013-12-25 12:28:34','1/2/6',4,2,4),(7,3,3,2,'2013-01-25 10:49:05','2013-05-08 05:26:34','1/2/7',5,2,4),(8,3,3,2,'2013-01-25 10:49:50','2013-05-15 22:49:33','1/2/8',6,2,4),(9,3,3,2,'2013-01-25 10:50:47','2013-05-10 17:17:59','1/2/9',7,2,0),(10,3,3,4,'2013-01-25 10:56:08','2014-03-07 15:01:55','1/2/4/10',1,3,0),(11,3,3,4,'2013-01-25 10:57:32','2014-11-22 23:50:26','1/2/4/11',2,3,0),(12,3,3,4,'2013-01-25 10:58:32','2013-05-06 04:11:20','1/2/4/12',3,3,0),(13,3,3,4,'2013-01-25 10:59:21','2013-03-05 04:45:24','1/2/4/13',4,3,0),(14,3,3,5,'2013-01-25 11:01:03','2013-05-06 04:12:42','1/2/5/14',1,3,0),(15,3,3,5,'2013-01-25 11:01:28','2014-11-23 00:08:20','1/2/5/15',2,3,0),(16,3,3,5,'2013-01-25 11:03:19','2013-04-16 08:52:47','1/2/5/16',3,3,0),(17,3,3,5,'2013-01-25 11:03:48','2013-03-05 07:15:31','1/2/5/17',4,3,0),(18,3,3,6,'2013-01-25 11:04:27','2013-03-05 07:16:27','1/2/6/18',1,3,0),(19,3,3,6,'2013-01-25 11:05:03','2013-03-05 07:16:42','1/2/6/19',2,3,0),(20,3,3,6,'2013-01-25 11:06:05','2013-05-08 05:21:45','1/2/6/20',3,3,0),(21,3,3,6,'2013-01-25 11:07:12','2013-03-05 07:17:10','1/2/6/21',4,3,0),(22,3,3,7,'2013-01-25 11:07:52','2013-05-16 20:06:14','1/2/7/22',1,3,0),(23,3,3,7,'2013-01-25 11:08:31','2013-03-05 07:17:38','1/2/7/23',2,3,0),(24,3,3,7,'2013-01-25 11:08:54','2013-03-08 19:27:16','1/2/7/24',3,3,0),(25,3,3,7,'2013-01-25 11:10:06','2013-03-29 22:54:12','1/2/7/25',4,3,0),(26,3,3,8,'2013-01-25 11:10:39','2013-05-06 04:17:00','1/2/8/26',1,3,0),(27,3,3,8,'2013-01-25 11:11:07','2013-05-06 04:17:12','1/2/8/27',2,3,0),(28,3,3,8,'2013-01-25 11:11:31','2013-05-06 04:17:24','1/2/8/28',3,3,0),(29,3,3,8,'2013-01-25 11:12:07','2013-05-06 04:17:34','1/2/8/29',4,3,0),(40,3,3,5,'2013-11-04 03:18:58','2014-11-21 02:27:50','1/2/5/40',5,3,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (3,3,42,0,2,1),(5,3,42,1,2,1),(13,3,42,0,4,1),(19,3,42,0,5,1),(25,3,42,0,6,1),(31,3,42,0,7,1),(37,3,42,0,8,1),(43,3,42,0,9,1),(49,3,42,0,10,1),(55,3,42,0,11,1),(61,3,42,0,12,1),(67,3,42,0,13,1),(73,3,42,0,14,1),(79,3,42,0,15,1),(85,3,42,0,16,1),(91,3,42,0,17,1),(97,3,42,0,18,1),(103,3,42,0,19,1),(109,3,42,0,20,1),(115,3,42,0,21,1),(121,3,42,0,22,1),(127,3,42,0,23,1),(133,3,42,0,24,1),(139,3,42,0,25,1),(145,3,42,0,26,1),(151,3,42,0,27,1),(157,3,42,0,28,1),(163,3,42,0,29,1),(324,3,42,0,40,1);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_VCHR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,3,41,0,1,'Root Catalog'),(2,3,41,1,1,'Root Catalog'),(4,3,41,0,2,'Default Category'),(5,3,41,1,2,'Default Category'),(16,3,41,0,4,'Women'),(24,3,41,0,5,'Men'),(32,3,41,0,6,'Accessories'),(40,3,41,0,7,'Home & Decor'),(48,3,41,0,8,'Sale'),(56,3,41,0,9,'VIP'),(64,3,41,0,10,'New Arrivals'),(72,3,41,0,11,'Tops & Blouses'),(80,3,41,0,12,'Pants & Denim'),(88,3,41,0,13,'Dresses & Skirts'),(96,3,41,0,14,'New Arrivals'),(104,3,41,0,15,'Shirts'),(112,3,41,0,16,'Tees, Knits and Polos'),(120,3,41,0,17,'Pants & Denim'),(128,3,41,0,18,'Eyewear'),(136,3,41,0,19,'Jewelry'),(144,3,41,0,20,'Shoes'),(152,3,41,0,21,'Bags & Luggage'),(160,3,41,0,22,'Books & Music'),(168,3,41,0,23,'Bed & Bath'),(176,3,41,0,24,'Electronics'),(184,3,41,0,25,'Decorative Accents'),(192,3,41,0,26,'Women'),(200,3,41,0,27,'Men'),(208,3,41,0,28,'Accessories'),(216,3,41,0,29,'Home & Decor'),(449,3,133,0,11,NULL),(452,3,133,0,12,NULL),(455,3,133,0,13,NULL),(737,3,41,0,40,'Blazers');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (4,284,1),(8,284,1),(10,285,1),(10,286,1),(10,287,1),(10,294,1),(10,295,1),(10,296,1),(11,282,200),(11,283,190),(11,284,180),(11,285,170),(11,286,160),(11,287,150),(11,288,140),(11,289,130),(11,290,120),(11,291,110),(11,292,100),(11,293,90),(11,294,80),(11,295,70),(11,296,60),(13,297,1),(13,298,1),(13,299,1),(13,300,1),(14,240,1),(14,241,1),(14,242,1),(14,258,1),(14,259,1),(14,260,1),(15,231,120),(15,232,110),(15,233,100),(15,234,90),(15,235,80),(15,236,70),(15,237,60),(15,238,50),(15,239,40),(16,249,1),(16,250,1),(16,251,1),(16,252,1),(16,253,1),(16,254,1),(16,255,1),(16,256,1),(16,257,1),(16,258,1),(16,259,1),(16,260,1),(16,261,1),(16,262,1),(16,263,1),(17,267,1),(17,268,1),(17,269,1),(17,270,1),(17,271,1),(17,272,1),(17,273,1),(17,274,1),(17,275,1),(17,276,1),(17,277,1),(17,278,1),(17,279,1),(17,280,1),(17,281,1),(27,237,1),(27,238,1),(27,239,1),(40,240,0),(40,241,0),(40,242,0),(40,243,0),(40,244,0),(40,245,0),(40,246,0),(40,247,0),(40,248,0);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `FK_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=906 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (231,4,13,'simple','msj000',0,0,'2013-03-05 05:48:12','2013-03-05 08:27:15'),(232,4,13,'simple','msj001',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(233,4,13,'simple','msj002',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(234,4,13,'simple','msj003',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(235,4,13,'simple','msj004',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(236,4,13,'simple','msj005',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(237,4,13,'simple','msj006',0,0,'2013-03-05 05:48:13','2014-03-08 06:36:36'),(238,4,13,'simple','msj007',0,0,'2013-03-05 05:48:13','2014-03-08 06:38:22'),(239,4,13,'simple','msj008',0,0,'2013-03-05 05:48:13','2014-03-08 06:39:03'),(240,4,13,'simple','msj009',0,0,'2013-03-05 05:48:13','2014-03-08 06:42:59'),(241,4,13,'simple','msj010',0,0,'2013-03-05 05:48:13','2014-03-08 06:43:22'),(242,4,13,'simple','msj011',0,0,'2013-03-05 05:48:13','2014-03-08 06:43:53'),(243,4,13,'simple','msj012',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(244,4,13,'simple','msj013',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(245,4,13,'simple','msj014',0,0,'2013-03-05 05:48:13','2013-03-05 08:27:15'),(246,4,13,'simple','msj015',0,0,'2013-03-05 05:48:13','2014-03-08 06:47:56'),(247,4,13,'simple','msj016',0,0,'2013-03-05 05:48:13','2014-03-08 06:48:20'),(248,4,13,'simple','msj017',0,0,'2013-03-05 05:48:13','2014-03-08 06:48:41'),(249,4,13,'simple','mtk000',0,0,'2013-03-05 05:48:13','2014-03-08 06:58:09'),(250,4,13,'simple','mtk001',0,0,'2013-03-05 05:48:13','2014-03-08 06:59:32'),(251,4,13,'simple','mtk002',0,0,'2013-03-05 05:48:13','2014-03-08 07:04:27'),(252,4,13,'simple','mtk003',0,0,'2013-03-05 05:48:13','2014-03-08 07:05:29'),(253,4,13,'simple','mtk004',0,0,'2013-03-05 05:48:13','2014-03-08 07:09:39'),(254,4,13,'simple','mtk005',0,0,'2013-03-05 05:48:13','2014-03-08 07:10:02'),(255,4,13,'simple','mtk006',0,0,'2013-03-05 05:48:13','2014-03-08 07:17:54'),(256,4,13,'simple','mtk007',0,0,'2013-03-05 05:48:13','2014-03-08 07:18:15'),(257,4,13,'simple','mtk008',0,0,'2013-03-05 05:48:13','2014-03-08 07:18:39'),(258,4,13,'simple','mtk009',0,0,'2013-03-05 05:48:13','2014-03-08 07:22:10'),(259,4,13,'simple','mtk010',0,0,'2013-03-05 05:48:13','2014-03-08 07:22:33'),(260,4,13,'simple','mtk011',0,0,'2013-03-05 05:48:13','2014-03-08 07:22:59'),(261,4,13,'simple','mtk012',0,0,'2013-03-05 05:48:13','2014-03-08 07:29:36'),(262,4,13,'simple','mtk013',0,0,'2013-03-05 05:48:13','2014-03-08 07:29:12'),(263,4,13,'simple','mtk014',0,0,'2013-03-05 05:48:13','2014-03-08 07:28:42'),(267,4,13,'simple','mpd003',0,0,'2013-03-05 05:48:14','2014-03-08 07:38:23'),(268,4,13,'simple','mpd004',0,0,'2013-03-05 05:48:14','2014-03-08 07:40:15'),(269,4,13,'simple','mpd005',0,0,'2013-03-05 05:48:14','2014-03-08 07:41:01'),(270,4,13,'simple','mpd006',0,0,'2013-03-05 05:48:14','2013-03-11 05:19:24'),(271,4,13,'simple','mpd007',0,0,'2013-03-05 05:48:14','2013-03-11 05:19:55'),(272,4,13,'simple','mpd008',0,0,'2013-03-05 05:48:14','2013-03-11 05:20:15'),(273,4,13,'simple','mpd009',0,0,'2013-03-05 05:48:14','2013-03-11 05:20:35'),(274,4,13,'simple','mpd010',0,0,'2013-03-05 05:48:14','2013-03-11 05:22:36'),(275,4,13,'simple','mpd011',0,0,'2013-03-05 05:48:14','2013-03-11 05:23:23'),(276,4,13,'simple','mpd012',0,0,'2013-03-05 05:48:14','2014-03-08 07:58:12'),(277,4,13,'simple','mpd013',0,0,'2013-03-05 05:48:14','2014-03-08 07:58:35'),(278,4,13,'simple','mpd014',0,0,'2013-03-05 05:48:14','2014-03-08 07:58:57'),(279,4,13,'simple','mpd015',0,0,'2013-03-05 05:48:14','2014-03-08 07:59:18'),(280,4,13,'simple','mpd016',0,0,'2013-03-05 05:48:14','2014-03-08 07:59:41'),(281,4,13,'simple','mpd017',0,0,'2013-03-05 05:48:14','2014-03-08 08:00:04'),(282,4,13,'simple','wbk000',0,0,'2013-03-05 05:48:14','2014-03-07 15:25:34'),(283,4,13,'simple','wbk001',0,0,'2013-03-05 05:48:14','2014-03-07 15:26:42'),(284,4,13,'simple','wbk002L',0,0,'2013-03-05 05:48:14','2013-05-10 21:17:59'),(285,4,13,'simple','wbk003',0,0,'2013-03-05 05:48:14','2014-03-08 08:05:08'),(286,4,13,'simple','wbk004',0,0,'2013-03-05 05:48:14','2014-03-08 08:05:35'),(287,4,13,'simple','wbk005',0,0,'2013-03-05 05:48:14','2014-03-08 08:06:01'),(288,4,13,'simple','wbk006',0,0,'2013-03-05 05:48:14','2014-03-08 08:57:21'),(289,4,13,'simple','wbk007',0,0,'2013-03-05 05:48:14','2014-03-08 08:57:33'),(290,4,13,'simple','wbk008',0,0,'2013-03-05 05:48:14','2014-03-08 08:57:43'),(291,4,13,'simple','wbk009',0,0,'2013-03-05 05:48:14','2014-03-08 08:11:19'),(292,4,13,'simple','wbk010',0,0,'2013-03-05 05:48:14','2014-03-08 08:11:44'),(293,4,13,'simple','wbk011',0,0,'2013-03-05 05:48:14','2014-03-08 08:12:03'),(294,4,13,'simple','wbk012',0,0,'2013-03-05 05:48:14','2014-03-08 08:21:33'),(295,4,13,'simple','wbk013',0,0,'2013-03-05 05:48:14','2014-03-08 08:17:50'),(296,4,13,'simple','wbk014',0,0,'2013-03-05 05:48:14','2014-03-08 08:18:12'),(297,4,13,'simple','wsd000',0,0,'2013-03-05 05:48:15','2014-03-08 08:24:58'),(298,4,13,'simple','wsd001',0,0,'2013-03-05 05:48:15','2014-03-08 08:25:20'),(299,4,13,'simple','wsd002',0,0,'2013-03-05 05:48:15','2014-03-08 08:26:15'),(300,4,13,'simple','wsd003',0,0,'2013-03-05 05:48:15','2014-03-08 08:26:35');
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10564 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1790,4,75,0,231,190.0000),(1795,4,75,0,232,190.0000),(1800,4,75,0,233,190.0000),(1805,4,75,0,234,175.0000),(1810,4,75,0,235,175.0000),(1815,4,75,0,236,175.0000),(1820,4,75,0,237,160.0000),(1825,4,75,0,238,160.0000),(1830,4,75,0,239,160.0000),(1835,4,75,0,240,510.0000),(1840,4,75,0,241,510.0000),(1845,4,75,0,242,510.0000),(1850,4,75,0,243,455.0000),(1855,4,75,0,244,455.0000),(1860,4,75,0,245,455.0000),(1865,4,75,0,246,490.0000),(1870,4,75,0,247,490.0000),(1875,4,75,0,248,490.0000),(1880,4,75,0,249,75.0000),(1885,4,75,0,250,75.0000),(1890,4,75,0,251,75.0000),(1895,4,75,0,252,75.0000),(1900,4,75,0,253,75.0000),(1905,4,75,0,254,75.0000),(1910,4,75,0,255,210.0000),(1915,4,75,0,256,210.0000),(1920,4,75,0,257,210.0000),(1925,4,75,0,258,240.0000),(1930,4,75,0,259,240.0000),(1935,4,75,0,260,240.0000),(1940,4,75,0,261,125.0000),(1945,4,75,0,262,125.0000),(1950,4,75,0,263,125.0000),(1970,4,75,0,267,140.0000),(1975,4,75,0,268,140.0000),(1980,4,75,0,269,140.0000),(1985,4,75,0,270,140.0000),(1990,4,75,0,271,140.0000),(1995,4,75,0,272,140.0000),(2000,4,75,0,273,140.0000),(2005,4,75,0,274,140.0000),(2010,4,75,0,275,140.0000),(2015,4,75,0,276,195.0000),(2020,4,75,0,277,195.0000),(2025,4,75,0,278,195.0000),(2030,4,75,0,279,195.0000),(2035,4,75,0,280,195.0000),(2040,4,75,0,281,195.0000),(2045,4,75,0,282,150.0000),(2050,4,75,0,283,150.0000),(2055,4,75,0,284,150.0000),(2060,4,75,0,285,60.0000),(2065,4,75,0,286,60.0000),(2070,4,75,0,287,60.0000),(2075,4,75,0,288,275.0000),(2080,4,75,0,289,275.0000),(2085,4,75,0,290,275.0000),(2090,4,75,0,291,185.0000),(2095,4,75,0,292,185.0000),(2100,4,75,0,293,185.0000),(2105,4,75,0,294,210.0000),(2110,4,75,0,295,210.0000),(2115,4,75,0,296,210.0000),(2120,4,75,0,297,185.0000),(2125,4,75,0,298,185.0000),(2130,4,75,0,299,185.0000),(2135,4,75,0,300,185.0000);
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21408 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (4068,4,96,0,231,1),(4085,4,96,0,232,1),(4102,4,96,0,233,1),(4119,4,96,0,234,1),(4136,4,96,0,235,1),(4153,4,96,0,236,1),(4170,4,96,0,237,1),(4187,4,96,0,238,1),(4204,4,96,0,239,1),(4221,4,96,0,240,1),(4238,4,96,0,241,1),(4255,4,96,0,242,1),(4272,4,96,0,243,1),(4289,4,96,0,244,1),(4306,4,96,0,245,1),(4323,4,96,0,246,1),(4340,4,96,0,247,1),(4357,4,96,0,248,1),(4374,4,96,0,249,1),(4391,4,96,0,250,1),(4408,4,96,0,251,1),(4425,4,96,0,252,1),(4442,4,96,0,253,1),(4459,4,96,0,254,1),(4476,4,96,0,255,1),(4493,4,96,0,256,1),(4510,4,96,0,257,1),(4527,4,96,0,258,1),(4544,4,96,0,259,1),(4561,4,96,0,260,1),(4578,4,96,0,261,1),(4595,4,96,0,262,1),(4612,4,96,0,263,1),(4680,4,96,0,267,1),(4697,4,96,0,268,1),(4714,4,96,0,269,1),(4731,4,96,0,270,1),(4748,4,96,0,271,1),(4765,4,96,0,272,1),(4782,4,96,0,273,1),(4799,4,96,0,274,1),(4816,4,96,0,275,1),(4833,4,96,0,276,1),(4850,4,96,0,277,1),(4867,4,96,0,278,1),(4884,4,96,0,279,1),(4901,4,96,0,280,1),(4918,4,96,0,281,1),(4935,4,96,0,282,1),(4952,4,96,0,283,1),(4969,4,96,0,284,1),(4986,4,96,0,285,1),(5003,4,96,0,286,1),(5020,4,96,0,287,1),(5037,4,96,0,288,1),(5054,4,96,0,289,1),(5071,4,96,0,290,1),(5088,4,96,0,291,1),(5105,4,96,0,292,1),(5122,4,96,0,293,1),(5139,4,96,0,294,1),(5156,4,96,0,295,1),(5173,4,96,0,296,1),(5190,4,96,0,297,1),(5207,4,96,0,298,1),(5224,4,96,0,299,1),(5241,4,96,0,300,1),
(14068,4,102,0,231,2),(14085,4,102,0,232,2),(14102,4,102,0,233,2),(14119,4,102,0,234,2),(14136,4,102,0,235,2),(14153,4,102,0,236,2),(14170,4,102,0,237,2),(14187,4,102,0,238,2),(14204,4,102,0,239,2),(14221,4,102,0,240,2),(14238,4,102,0,241,2),(14255,4,102,0,242,2),(14272,4,102,0,243,2),(14289,4,102,0,244,2),(14306,4,102,0,245,2),(14323,4,102,0,246,2),(14340,4,102,0,247,2),(14357,4,102,0,248,2),(14374,4,102,0,249,2),(14391,4,102,0,250,2),(14408,4,102,0,251,2),(14425,4,102,0,252,2),(14442,4,102,0,253,2),(14459,4,102,0,254,2),(14476,4,102,0,255,2),(14493,4,102,0,256,2),(14510,4,102,0,257,2),(14527,4,102,0,258,2),(14544,4,102,0,259,2),(14561,4,102,0,260,2),(14578,4,102,0,261,2),(14595,4,102,0,262,2),(14612,4,102,0,263,2),(14680,4,102,0,267,2),(14697,4,102,0,268,2),(14714,4,102,0,269,2),(14731,4,102,0,270,2),(14748,4,102,0,271,2),(14765,4,102,0,272,2),(14782,4,102,0,273,2),(14799,4,102,0,274,2),(14816,4,102,0,275,2),(14833,4,102,0,276,2),(14850,4,102,0,277,2),(14867,4,102,0,278,2),(14884,4,102,0,279,2),(14901,4,102,0,280,2),(14918,4,102,0,281,2),(14935,4,102,0,282,2),(14952,4,102,0,283,2),(14969,4,102,0,284,2),(14986,4,102,0,285,2),(15003,4,102,0,286,2),(15020,4,102,0,287,2),(15037,4,102,0,288,2),(15054,4,102,0,289,2),(15071,4,102,0,290,2),(15088,4,102,0,291,2),(15105,4,102,0,292,2),(15122,4,102,0,293,2),(15139,4,102,0,294,2),(15156,4,102,0,295,2),(15173,4,102,0,296,2),(15190,4,102,0,297,2),(15207,4,102,0,298,2),(15224,4,102,0,299,2),(15241,4,102,0,300,2);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40496 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (7602,4,71,0,231,'French Cuff Cotton Twill Oxford'),(7610,4,87,0,231,'/m/s/msj000t_1.jpg'),(7620,4,71,0,232,'French Cuff Cotton Twill Oxford'),(7628,4,87,0,232,'/m/s/msj000t_1.jpg'),(7638,4,71,0,233,'French Cuff Cotton Twill Oxford'),(7646,4,87,0,233,'/m/s/msj000t_1.jpg'),(7656,4,71,0,234,'Slim fit Dobby Oxford Shirt'),(7664,4,87,0,234,'/m/s/msj003t_1.jpg'),(7674,4,71,0,235,'Slim fit Dobby Oxford Shirt'),(7682,4,87,0,235,'/m/s/msj003t_1.jpg'),(7692,4,71,0,236,'Slim fit Dobby Oxford Shirt'),(7700,4,87,0,236,'/m/s/msj003t_1.jpg'),(7710,4,71,0,237,'Plaid Cotton Shirt'),(7718,4,87,0,237,'/m/s/msj006t_1.jpg'),(7728,4,71,0,238,'Plaid Cotton Shirt'),(7736,4,87,0,238,'/m/s/msj006t_2.jpg'),(7746,4,71,0,239,'Plaid Cotton Shirt'),(7754,4,87,0,239,'/m/s/msj006t_3.jpg'),(7764,4,71,0,240,'Sullivan Sport Coat'),(7772,4,87,0,240,'/m/s/msj009t_1.jpg'),(7782,4,71,0,241,'Sullivan Sport Coat'),(7790,4,87,0,241,'/m/s/msj009t_2.jpg'),(7800,4,71,0,242,'Sullivan Sport Coat'),(7808,4,87,0,242,'/m/s/msj009t_3.jpg'),(7818,4,71,0,243,'Linen Blazer'),(7826,4,87,0,243,'/m/s/msj012t_1.jpg'),(7836,4,71,0,244,'Linen Blazer'),(7844,4,87,0,244,'/m/s/msj012t_1.jpg'),(7854,4,71,0,245,'Linen Blazer'),(7862,4,87,0,245,'/m/s/msj012t_1.jpg'),(7872,4,71,0,246,'Stretch Cotton Blazer'),(7880,4,87,0,246,'/m/s/msj015t_2.jpg'),(7890,4,71,0,247,'Stretch Cotton Blazer'),(7898,4,87,0,247,'/m/s/msj015t_3.jpg'),(7908,4,71,0,248,'Stretch Cotton Blazer'),(7916,4,87,0,248,'/m/s/msj015t_4.jpg'),(7926,4,71,0,249,'Chelsea Tee'),(7934,4,87,0,249,'/m/t/mtk000t_3.jpg'),(7944,4,71,0,250,'Chelsea Tee'),(7952,4,87,0,250,'/m/t/mtk000t_4.jpg'),(7962,4,71,0,251,'Chelsea Tee'),(7970,4,87,0,251,'/m/t/mtk002t_3.jpg'),(7980,4,71,0,252,'Chelsea Tee'),(7988,4,87,0,252,'/m/t/mtk002t_4.jpg'),(7998,4,71,0,253,'Chelsea Tee'),(8006,4,87,0,253,'/m/t/mtk004t_3.jpg'),(8016,4,71,0,254,'Chelsea Tee'),(8024,4,87,0,254,'/m/t/mtk004t_4.jpg'),(8034,4,71,0,255,'Merino V-neck Pullover Sweater'),(8042,4,87,0,255,'/m/t/mtk006t_1.jpg'),(8052,4,71,0,256,'Merino V-neck Pullover Sweater'),(8060,4,87,0,256,'/m/t/mtk006t_2.jpg'),(8070,4,71,0,257,'Merino V-neck Pullover Sweater'),(8078,4,87,0,257,'/m/t/mtk006t_3.jpg'),(8088,4,71,0,258,'Lexington Cardigan Sweater'),(8096,4,87,0,258,'/m/t/mtk009t_1.jpg'),(8106,4,71,0,259,'Lexington Cardigan Sweater'),(8114,4,87,0,259,'/m/t/mtk009t_2.jpg'),(8124,4,71,0,260,'Lexington Cardigan Sweater'),(8132,4,87,0,260,'/m/t/mtk009t_3.jpg'),(8142,4,71,0,261,'Core Striped Sport Shirt'),(8150,4,87,0,261,'/m/t/mtk012t_3.jpg'),(8160,4,71,0,262,'Core Striped Sport Shirt'),(8168,4,87,0,262,'/m/t/mtk012t_2.jpg'),(8178,4,71,0,263,'Core Striped Sport Shirt'),(8186,4,87,0,263,'/m/t/mtk012t_1.jpg'),(8250,4,71,0,267,'Bowery Chino Pants'),(8258,4,87,0,267,'/m/p/mpd003t_2.jpg'),(8268,4,71,0,268,'Bowery Chino Pants'),(8276,4,87,0,268,'/m/p/mpd003t_3.jpg'),(8286,4,71,0,269,'Bowery Chino Pants'),(8294,4,87,0,269,'/m/p/mpd003t_4.jpg'),(8304,4,71,0,270,'The Essential Boot Cut Jean'),(8312,4,87,0,270,'/m/p/mpd006t_1.jpg'),(8322,4,71,0,271,'The Essential Boot Cut Jean'),(8330,4,87,0,271,'/m/p/mpd006t_1.jpg'),(8340,4,71,0,272,'The Essential Boot Cut Jean'),(8348,4,87,0,272,'/m/p/mpd006t_1.jpg'),(8358,4,71,0,273,'The Essential Boot Cut Jean'),(8366,4,87,0,273,'/m/p/mpd006t_1.jpg'),(8376,4,71,0,274,'The Essential Boot Cut Jean'),(8384,4,87,0,274,'/m/p/mpd006t_1.jpg'),(8394,4,71,0,275,'The Essential Boot Cut Jean'),(8402,4,87,0,275,'/m/p/mpd006t_1.jpg'),(8412,4,71,0,276,'Flat Front  Trouser'),(8420,4,87,0,276,'/m/p/mpd012t_1.jpg'),(8430,4,71,0,277,'Flat Front  Trouser'),(8438,4,87,0,277,'/m/p/mpd012t_2.jpg'),(8448,4,71,0,278,'Flat Front  Trouser'),(8456,4,87,0,278,'/m/p/mpd012t_3.jpg'),(8466,4,71,0,279,'Flat Front  Trouser'),(8474,4,87,0,279,'/m/p/mpd012t_4.jpg'),(8484,4,71,0,280,'Flat Front  Trouser'),(8492,4,87,0,280,'/m/p/mpd012t_5.jpg'),(8502,4,71,0,281,'Flat Front  Trouser'),(8510,4,87,0,281,'/m/p/mpd012t_6.jpg'),(8520,4,71,0,282,'NoLIta Cami'),(8528,4,87,0,282,'/w/b/wbk000t_2.jpg'),(8538,4,71,0,283,'NoLIta Cami'),(8546,4,87,0,283,'/w/b/wbk000t_3.jpg'),(8556,4,71,0,284,'Black NoLIta Cami'),(8564,4,87,0,284,'/w/b/wbk002t.jpg'),(8574,4,71,0,285,'Tori Tank'),(8582,4,87,0,285,'/w/b/wbk003t_1.jpg'),(8592,4,71,0,286,'Tori Tank'),(8600,4,87,0,286,'/w/b/wbk003t_2.jpg'),(8610,4,71,0,287,'Tori Tank'),(8618,4,87,0,287,'/w/b/wbk003t_3.jpg'),(8628,4,71,0,288,'Delancy Cardigan Sweater'),(8636,4,87,0,288,'/w/b/wbk006t_1.jpg'),(8646,4,71,0,289,'Delancy Cardigan Sweater'),(8654,4,87,0,289,'/w/b/wbk006t_1.jpg'),(8664,4,71,0,290,'Delancy Cardigan Sweater'),(8672,4,87,0,290,'/w/b/wbk006t_1.jpg'),(8682,4,71,0,291,'Ludlow Oxford Top'),(8690,4,87,0,291,'/w/b/wbk009t_2.jpg'),(8700,4,71,0,292,'Ludlow Oxford Top'),(8708,4,87,0,292,'/w/b/wbk009t_3.jpg'),(8718,4,71,0,293,'Ludlow Oxford Top'),(8726,4,87,0,293,'/w/b/wbk009t_4.jpg'),(8736,4,71,0,294,'Elizabeth Knit Top'),(8744,4,87,0,294,'/w/b/wbk012t_2.jpg'),(8754,4,71,0,295,'Elizabeth Knit Top'),(8762,4,87,0,295,'/w/b/wbk012t_3.jpg'),(8772,4,71,0,296,'Elizabeth Knit Top'),(8780,4,87,0,296,'/w/b/wbk012t_4.jpg'),(8790,4,71,0,297,'Essex Pencil Skirt'),(8798,4,87,0,297,'/w/s/wsd000t_1.jpg'),(8808,4,71,0,298,'Essex Pencil Skirt'),(8816,4,87,0,298,'/w/s/wsd000t_2.jpg'),(8826,4,71,0,299,'Essex Pencil Skirt'),(8834,4,87,0,299,'/w/s/wsd000t_3.jpg'),(8844,4,71,0,300,'Essex Pencil Skirt'),(8852,4,87,0,300,'/w/s/wsd000t_4.jpg');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `UNQ_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=1518 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (9,'default',0,'currency/options/base','USD');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `IDX_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (41,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(42,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'eav/entity_attribute_source_boolean',1,0,NULL,0,NULL),(71,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(75,4,'price',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(87,4,'thumbnail',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(96,4,'status',NULL,NULL,'int',NULL,NULL,'select','Status',NULL,'catalog/product_status',1,0,NULL,0,NULL),(133,3,'thumbnail',NULL,'catalog/category_attribute_backend_image','varchar',NULL,NULL,'image','Thumbnail Image',NULL,NULL,0,0,NULL,0,NULL),(102, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'catalog/product_visibility', '1', '0', '4', '0', NULL);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','customer/customer','customer/attribute','customer/entity',NULL,NULL,1,'default',1,'eav/entity_increment_numeric',0,8,'0','customer/eav_attribute','customer/attribute_collection'),(2,'customer_address','customer/address','customer/attribute','customer/address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer/eav_attribute','customer/address_attribute_collection'),(3,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog/eav_attribute','catalog/category_attribute_collection'),(4,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog/eav_attribute','catalog/product_attribute_collection'),(5,'order','sales/order',NULL,'sales/order',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(6,'invoice','sales/order_invoice',NULL,'sales/invoice',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(7,'creditmemo','sales/order_creditmemo',NULL,'sales/creditmemo',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(8,'shipment','sales/order_shipment',NULL,'sales/shipment',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-04 16:27:58