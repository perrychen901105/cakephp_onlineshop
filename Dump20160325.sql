CREATE DATABASE  IF NOT EXISTS `onlineshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlineshop`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: onlineshop
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `order` int(11) DEFAULT '0',
  `parentid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'潮流女装',0,0),(2,'品牌男装',0,0),(5,'手机数码',0,0),(6,'品牌图书',0,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,1,1),(2,2,1),(3,3,4),(4,4,3),(5,5,6);
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_addresses`
--

DROP TABLE IF EXISTS `order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `full_address` varchar(200) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `receiver` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_addresses`
--

LOCK TABLES `order_addresses` WRITE;
/*!40000 ALTER TABLE `order_addresses` DISABLE KEYS */;
INSERT INTO `order_addresses` VALUES (1,93,'苏州市工业园区星湖街255号生物纳米园A1南座5楼','13962141961','Perry'),(2,93,'苏州市人民广场','13900005555','Paul Chen ');
/*!40000 ALTER TABLE `order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_infos`
--

DROP TABLE IF EXISTS `order_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_infos`
--

LOCK TABLES `order_infos` WRITE;
/*!40000 ALTER TABLE `order_infos` DISABLE KEYS */;
INSERT INTO `order_infos` VALUES (17,40,0,NULL,NULL,NULL),(19,42,0,NULL,NULL,NULL),(24,49,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_time` varchar(100) DEFAULT NULL,
  `order_desc` varchar(200) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (40,0,NULL,'1458637018',NULL,0,0),(41,0,NULL,'',NULL,0,NULL),(42,0,NULL,'1458698119',NULL,0,0),(43,0,NULL,'',NULL,0,NULL),(44,0,NULL,'',NULL,0,NULL),(45,0,NULL,'1458720820',NULL,0,0),(46,0,NULL,'',NULL,0,NULL),(49,93,NULL,'1458805800',NULL,6,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `specification` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `original_price` double DEFAULT '0',
  `discount_price` double DEFAULT '0',
  `deleted` int(11) DEFAULT NULL,
  `imgUrl` varchar(100) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(2,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(3,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(4,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(5,'本地图书','图书介绍',NULL,NULL,6,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
INSERT INTO `user_infos` VALUES (81,NULL,NULL,'fgghh',NULL),(82,NULL,'13333665555','ghhgbh','hgfgfh'),(83,NULL,'12333333','tyrggg','ffgjkjjh'),(84,NULL,'55355','frnh','ghj'),(85,NULL,'456888','dkjh','reghgg'),(86,NULL,'12333333','gffdtg','tyggfg'),(87,NULL,'54455','tyhg','trfhh'),(88,NULL,NULL,NULL,NULL),(89,NULL,NULL,NULL,NULL),(90,NULL,NULL,NULL,NULL),(91,NULL,NULL,NULL,NULL),(92,NULL,'13699998','dggg','tyfde'),(93,NULL,'13962141961','111111','Perrychen'),(94,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-25 17:40:14
