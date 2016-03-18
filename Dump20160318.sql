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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'潮流女装',0,0),(2,'品牌男装',0,0),(5,'手机数码',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,1,1),(2,2,1),(3,3,4),(4,4,3);
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
  `order_addresscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_addresses`
--

LOCK TABLES `order_addresses` WRITE;
/*!40000 ALTER TABLE `order_addresses` DISABLE KEYS */;
INSERT INTO `order_addresses` VALUES (1,93,'苏州市','13962141961',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_infos`
--

LOCK TABLES `order_infos` WRITE;
/*!40000 ALTER TABLE `order_infos` DISABLE KEYS */;
INSERT INTO `order_infos` VALUES (1,16,1,'妖精的尾巴',12,NULL),(2,29,1,NULL,NULL,NULL),(3,29,2,NULL,NULL,NULL),(4,29,3,NULL,NULL,NULL),(5,30,0,NULL,NULL,NULL),(6,32,0,NULL,NULL,NULL),(7,34,0,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,'0000-00-00 00:00:00',NULL,12,NULL),(2,1,NULL,NULL,NULL,12,NULL),(3,1,NULL,NULL,NULL,25,NULL),(4,1,NULL,NULL,NULL,35,NULL),(5,1,NULL,NULL,NULL,12,NULL),(6,1,NULL,NULL,NULL,32,NULL),(7,1,NULL,NULL,NULL,422,NULL),(8,0,NULL,'0000-00-00 00:00:00',NULL,0,NULL),(9,1,NULL,'0000-00-00 00:00:00',NULL,12,NULL),(10,1,NULL,'0000-00-00 00:00:00',NULL,12,NULL),(11,1,NULL,'1458120137',NULL,12,NULL),(12,1,NULL,'1458121140',NULL,12,NULL),(13,1,NULL,'1458121174',NULL,12,NULL),(14,1,NULL,'1458121180',NULL,1122,NULL),(15,1,NULL,'1458269922',NULL,12,NULL),(16,1,NULL,'1458269924',NULL,12,NULL),(17,1,NULL,'1458272621',NULL,12,NULL),(18,1,NULL,'1458272840',NULL,12,NULL),(19,1,NULL,'1458272910',NULL,12,NULL),(20,1,NULL,'1458272930',NULL,12,NULL),(21,1,NULL,'1458272943',NULL,12,NULL),(22,1,NULL,'1458272957',NULL,12,NULL),(23,1,NULL,'1458273062',NULL,12,NULL),(24,1,NULL,'1458273103',NULL,12,NULL),(25,1,NULL,'1458273114',NULL,12,NULL),(26,1,NULL,'1458273130',NULL,12,NULL),(27,1,NULL,'1458273144',NULL,12,NULL),(28,1,NULL,'1458273299',NULL,12,NULL),(29,1,NULL,'1458273383',NULL,12,NULL),(30,1,NULL,'1458277297',NULL,12,NULL),(31,0,NULL,'',NULL,0,NULL),(32,1,NULL,'1458281035',NULL,12,0),(33,0,NULL,'',NULL,0,NULL),(34,1,NULL,'1458281075',NULL,12,0),(35,0,NULL,'',NULL,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(2,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(3,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL),(4,'妖精的口袋','妖精的口袋著作权归作者所有。\n商业转载请联系作者获得授权，非商业转载请注明出处。\n作者：罗攀\n链接：https://www.zhihu.com/question/19668651/answer/12585113\n来源：知乎\n\n第一、要有实物拍摄的商品大图、细节图；第二、要有买家购买前的咨询截图、购买之后的好评截图、买家用商品后的效果图等一系列对该商品描述有利因素都可以添加到商品描述页；第三、有物流','一盒24克',NULL,10,8,NULL,'http://www.wwhouse.com.tw/upload/image/IMG_8181.jpg',NULL);
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

-- Dump completed on 2016-03-18 15:06:51
