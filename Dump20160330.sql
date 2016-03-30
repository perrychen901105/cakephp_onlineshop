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
INSERT INTO `categories` VALUES (1,'潮流女装',0,0),(2,'品牌男装',0,0),(3,'手机数码',0,0),(4,'品牌图书',0,0),(5,'精品皮包',0,0),(6,'各式鞋类',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2),(5,5,2),(6,6,3),(7,7,3),(8,8,3),(9,9,4),(10,10,4),(11,11,4),(12,12,4),(13,13,5),(14,14,5),(15,15,5),(16,16,5),(17,17,5),(18,18,6),(19,19,6),(20,20,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_addresses`
--

LOCK TABLES `order_addresses` WRITE;
/*!40000 ALTER TABLE `order_addresses` DISABLE KEYS */;
INSERT INTO `order_addresses` VALUES (1,93,'苏州市工业园区星湖街255号生物纳米园A1南座5楼','13962141961','Perry'),(2,93,'苏州市人民广场','13900005555','Paul Chen '),(4,93,'Vgkkgg','125555','guy'),(5,93,'Fhhdcxkgfff','13966666666','tyujhgfvg');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_infos`
--

LOCK TABLES `order_infos` WRITE;
/*!40000 ALTER TABLE `order_infos` DISABLE KEYS */;
INSERT INTO `order_infos` VALUES (17,40,0,NULL,NULL,NULL),(19,42,0,NULL,NULL,NULL),(25,48,1,NULL,NULL,NULL),(26,48,2,NULL,NULL,NULL),(27,48,13,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (40,0,NULL,'1458637018',NULL,0,0),(41,0,NULL,'',NULL,0,NULL),(42,0,NULL,'1458698119',NULL,0,0),(43,0,NULL,'',NULL,0,NULL),(44,0,NULL,'',NULL,0,NULL),(45,0,NULL,'1458720820',NULL,0,0),(46,0,NULL,'',NULL,0,NULL),(48,93,NULL,'1459324466',NULL,578,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'拓谷新款春装2016欧美时尚短袖中腰套头显瘦两件套纯棉连衣裙女装','产品参数：\n廓形: H型材质成分: 棉100%货号: 126155531风格: 街头街头: 欧美组合形式: 两件套裙长: 中长裙款式: 其他/other袖长: 短袖领型: 圆领袖型: 常规腰型: 中腰衣门襟: 套头裙型: 百褶裙图案: 字母流行元素/工艺: 拼接 印花品牌: 拓谷适用年龄: 25-29周岁年份季节: 2016年春季颜色分类: 黑色尺码: S M','库存24件',NULL,421,421,NULL,'https://img.alicdn.com/bao/uploaded/i4/TB1I.0ULVXXXXa1aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',NULL),(2,'2016新款春装女韩版雪纺无袖连衣裙夏装甜美宽松中长款蛋糕裙子','风格: 甜美甜美: 公主组合形式: 单件裙长: 中裙袖长: 无袖领型: 圆领腰型: 宽松腰衣门襟: 单排扣裙型: 公主裙图案: 纯色流行元素/工艺: 镶钻面料: 绸缎成分含量: 81%(含)-90%(含)材质: 其他适用年龄: 25-29周岁年份季节: 2016年夏季颜色分类: 浅粉 玫红色 白色尺码: S M L XL','库存1188件',NULL,79,79,NULL,'https://gd3.alicdn.com/bao/uploaded/i3/TB1W3qUHFXXXXbcXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg',NULL),(3,'春秋款爸爸装中老年外套商务休闲中年男士夹克衫翻领抗皱正品茄克','其他适用场景：其他休闲适用对象：中年\n工艺/流行工艺处理：免烫处理细分风格：商务休闲图案：纯色\n关键信息上市年份季节：2015年秋季材质成分：棉100%货号：15028销售渠道类型：纯电商(只在线上销售)面料分类：色丁布品牌：LESEYATON/蓝狮雅盾厚薄：常规基础风格：商务绅士','库存14522件',NULL,198,198,NULL,'https://img.alicdn.com/bao/uploaded/i3/TB1msJKJpXXXXXZXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',NULL),(4,'2016春秋男士夹克男薄款外套中年男装夹克商务休闲轻薄立领夹克衫','上市时间: 2016年穿搭方式: 外穿袖长: 长袖领型: 立领颜色: 深蓝色100%聚酯纤维 卡其灰 100%聚酯纤维 灰蓝色100%聚酯纤维 黑蓝色 100%棉 浅米黄 100%棉尺码: 165/84A=46 170/88A=48 175/92A=50 180/96A=52 185/100A=54 190/104A=56面料分类: 涤纶款式细节: 多口袋（三个或两种以上））工艺处理: 免烫处理品','库存2件',NULL,588,588,NULL,'https://gd1.alicdn.com/bao/uploaded/i1/2623823556/TB2GIeZlFXXXXbDXpXXXXXXXXXX_!!2623823556.jpg',NULL),(5,'花花公子春男装休闲夹克衫中年纯棉翻领薄外套中长款爸爸装茄克男','上市时间: 2016年穿搭方式: 外穿袖长: 长袖领型: 翻领颜色: 藏蓝色 灰色【115款】 卡其色【115款】 藏蓝色【115款】 卡其色 墨绿色尺码: 170/M 175/L 180/XL 185/XXL 190/XXXL 【品质保证】 195/XXXXL款式细节: 多口袋（三个或两种以上））工艺处理: 水洗品牌: PLAYBOY/花花公子适用季节: 春季袖型: 散口袖厚薄: 薄版型: 标准','库存8581件',NULL,178,178,NULL,'https://gd3.alicdn.com/bao/uploaded/i3/TB1JpLzJFXXXXb.XXXXXXXXXXXX_!!0-item_pic.jpg',NULL),(6,'Daxian/大显7I八核安卓智能手机 超薄5.5寸大屏 移动4G正品智能机','机身颜色: 白色 黑色 金色套餐类型: 套餐一 套餐二 套餐三 套餐四 官方标配售后服务: 全国联保版本类型: 中国大陆','库存16591件',NULL,388,388,NULL,'https://gd4.alicdn.com/bao/uploaded/i4/2751915922/TB2A9TNlpXXXXa8XXXXXXXXXXXX_!!2751915922.jpg',NULL),(7,'F－FOOK/福中福 F668 5.0英寸移动4G安卓智能手机超薄大屏触屏','机身颜色: 皓月白 土豪金 神秘黑套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五售后服务: 全国联保版本类型: 中国大陆','库存159800件',NULL,338,338,NULL,'https://gd4.alicdn.com/bao/uploaded/i4/2760161883/TB2SPnDlFXXXXXRXpXXXXXXXXXX_!!2760161883.jpg',NULL),(8,'正品Changhong/长虹T11移动4G超薄5.0寸屏四核安卓智能手机一体机','机身颜色: 玫瑰金 土豪金 白色套餐类型: 套餐一 套餐二 套餐三 套餐四 官方标配售后服务: 全国联保版本类型: 中国大陆','库存39956件',NULL,468,468,NULL,NULL,NULL),(9,'青春励志书籍畅销书 文学小说 心理学书籍 图书 文学书籍为人处事管理书籍 将来的你 马云创业人际交往沟通销售技巧 成功励志书籍','产品名称：将来的你,一定会感谢现在...是否是套装: 否书名: 将来的你,一定会感谢现在拼命的自己定价: 32.00元出版社名称: 天津人民出版社出版时间: 2014年6月作者: 无编者: 汤木开本: 32开书名: 将来的你,一定会感谢现在拼命的自己ISBN编号: 9787201086880','库存30199件',NULL,23.1,23.1,NULL,'https://img.alicdn.com/bao/uploaded/i1/TB1XpQALXXXXXXMaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',NULL),(10,'【包邮现货】罗辑思维1 有种有趣有料 罗振宇书籍 有种，有趣，有','产品名称：罗辑思维是否是套装: 否书名: 罗辑思维定价: 36.00元出版社名称: 长江文艺出版社出版时间: 2013年10月作者: 罗振宇作者地区: 中国大陆开本: 16开书名: 罗辑思维ISBN编号: 9787535469977','库存59件',NULL,21.9,21.9,NULL,'https://img.alicdn.com/bao/uploaded/i4/TB1lFoqJXXXXXbwXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',NULL),(11,'包邮 汤姆叔叔的小屋 正版斯托夫人著新课标必读世界文学名著青少年课外读物正版书籍包邮','产品名称：汤姆叔叔的小屋是否是套装: 否书名: 汤姆叔叔的小屋定价: 21.80元出版社名称: 中央编译出版社出版时间: 2010年8月作者: 斯托夫人作者地区: 美国开本: 16开书名: 汤姆叔叔的小屋ISBN编号: 9787511704245','库存380件',NULL,15,15,NULL,'https://img.alicdn.com/bao/uploaded/i4/TB13C.QFFXXXXXnapXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',NULL),(12,'小红花贴贴纸2-5岁童书幼儿书籍动脑贴贴画贴纸书我来贴贴纸早教','品牌: 小红花颜色分类: 2-3岁一套6本 3-4岁一套6本 4-5岁一套6本造型: 数字 字母 形状 动物 人物 植物 交通工具 其他种类: 智力贴贴画适用年龄: 2岁 3岁 4岁 5岁 6岁','库存642件',NULL,26.2,26.2,NULL,'https://gd2.alicdn.com/bao/uploaded/i2/402734121/TB2A8d5lVXXXXaAXpXXXXXXXXXX_!!402734121.jpg',NULL),(13,'高档商务包男士手提包公文包男单肩包斜挎包皮包电脑包横款男包包','上市时间: 2015年秋季大小: 大容纳电脑尺寸: 14英寸适用对象: 中年销售渠道类型: 纯电商(只在线上销售)款式: 手提包质地: PVC提拎部件类型: 软把闭合方式: 拉链内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋箱包外袋种类: 内贴袋流行元素: 车缝线图案: 条纹颜色分类: 宝石蓝横款【小号】 绅士棕横款【小号】 骑士黑横款【小号】 宝石蓝横款小号 绅士棕横款小号','库存2111件',NULL,78,78,NULL,'https://img.alicdn.com/imgextra/i2/2074772232/TB2ZzrdgVXXXXX1XXXXXXXXXXXX_!!2074772232.jpg_430x430q9',NULL),(14,'伊媚水洗皮韩版女士编花斜挎包 时尚柔软斜跨小包包 2016新款女包','上市时间: 2016年春季大小: 小流行款式名称: 小方包适用对象: 青年销售渠道类型: 纯电商(只在线上销售)款式: 斜挎包背包方式: 斜挎包质地: 其他闭合方式: 拉链搭扣内部结构: 卡位 拉链暗袋 手机袋 证件袋箱包外袋种类: 挖袋图案: 纯色颜色分类: 纯黑色 条纹黑有无夹层: 有箱包硬度: 软成色: 全新适用场景: 休闲品牌: 伊媚货号: 3014风格: 日韩形状: 贝壳形肩带样式: 单','库存389件',NULL,79,79,NULL,'https://img.alicdn.com/imgextra/i4/699569624/TB2ppDVlFXXXXX2XXXXXXXXXXXX_!!699569624.jpg_430x430q90.',NULL),(15,'莎缇2016春夏新款真皮女包潮时尚头层牛皮女士包包单肩手提挎包软','上市时间: 2015年大小: 中流行款式名称: 波士顿包款式: 斜挎包背包方式: 斜挎单肩手提质地: 牛皮皮革材质: 头层牛皮提拎部件类型: 软把闭合方式: 拉链内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋箱包外袋种类: 内贴袋流行元素: 皮带装饰图案: 纯色颜色分类: 玫红色 紫色预定7号发货 薄荷绿 宝石蓝 米白色 黑色有无夹层: 有箱包硬度: 软是否可折叠: 是成色: 全新适用场景: 休','库存311件',NULL,218,218,NULL,'https://img.alicdn.com/imgextra/i3/773153382/TB2CTePhXXXXXbbXpXXXXXXXXXX_!!773153382.jpg_430x430q90.',NULL),(16,'经典永恒！春夏必背时尚真皮女包欧美单肩包女士包袋高档手拎包','大小: 中流行款式名称: 饺子包适用对象: 青年款式: 单肩包背包方式: 单肩手提质地: 牛皮皮革材质: 头层牛皮提拎部件类型: 装卸式提把闭合方式: 拉链内部结构: 卡位 手机袋 证件袋流行元素: 花朵图案: 几何图案颜色分类: 附带专柜小票 小票可以扫码防伪 先付款先发货 咖色-大号 咖色小号 咖啡色箱包硬度: 软成色: 全新适用场景: 休闲品牌: other/其他风格: 欧美时尚形状: 水饺','库存353件',NULL,399,399,NULL,'https://gd4.alicdn.com/bao/uploaded/i4/1900537923/TB2Dyb2lVXXXXcRXXXXXXXXXXXX_!!1900537923.jpg',NULL),(17,'尼迪袋鼠 男包 单肩包男斜挎包 正品男士包包休闲商务斜跨背包','大小: 小款式: 单肩包背包方式: 单肩斜挎质地: 其他闭合方式: 拉链搭扣内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋箱包外袋种类: 内贴袋流行元素: 车缝线图案: 纯色颜色分类: 竖款小号【棕色】 竖款小号【黑色】 竖款中号【棕色】 竖款中号【黑色】 竖款大号【棕色】 竖款大号【黑色】 竖款加大【棕色】 竖款加大【黑色】 横款小号【棕色】 横款小号【黑色】 横款中号【棕色】 横款中号【黑色','库存108926件',NULL,66,66,NULL,'https://gd3.alicdn.com/bao/uploaded/i3/279199408/TB2ywdYlpXXXXazXXXXXXXXXXXX_!!279199408.jpg',NULL),(18,'男士皮鞋男鞋新款2016春季牛皮潮鞋子真皮英伦商务休闲鞋圆头系带','货号: D5518鞋垫材质: PU品牌: SITUBULL/斯图公牛鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 超纤真皮材质工艺: 粒面皮鞋面内里材质: 无内里鞋制作工艺: 缝制鞋跟底款式: 平跟图案: 纯色流行元素: 车缝线风格: 休闲细分风格: 日常休闲场合: 日常季节: 春秋颜色分类: 5518棕色 5518黑色 5518黄色尺码: 39 40 41 42 43 44款式: ','库存17792件',NULL,59,59,NULL,'https://gd2.alicdn.com/bao/uploaded/i2/TB1f7PiJFXXXXX2XpXXXXXXXXXX_!!0-item_pic.jpg',NULL),(19,'米先生真皮豆豆鞋男2016新款英伦男鞋驾车鞋潮流套脚鞋男士休闲鞋','上市年份季节: 2015年冬季货号: 95491981销售渠道类型: 商场同款(线上线下都销售)鞋垫材质: 头层猪皮鞋跟高: 低跟(1-3cm)品牌: Mr．me/米先生鞋头款式: 圆头闭合方式: 套脚鞋底材质: 橡胶鞋面材质: 二层牛皮（除牛反绒）真皮材质工艺: 水染皮鞋面内里材质: 头层猪皮鞋制作工艺: 胶粘鞋跟底款式: 平跟图案: 纯色流行元素: 车缝线风格: 英伦场合: 日常季节: 冬季颜','库存1725件',NULL,178,178,NULL,'https://img.alicdn.com/imgextra/i3/508099320/TB2_FCclpXXXXXRXXXXXXXXXXXX_!!508099320.jpg_430x430q90.',NULL),(20,'米先生 春季新品真皮休闲皮鞋英伦时尚擦色做旧潮流简约百搭男鞋','上市年份季节: 2016年春季货号: 96191061销售渠道类型: 商场同款(线上线下都销售)鞋垫材质: 头层猪皮鞋跟高: 低跟(1-3cm)品牌: Mr．me/米先生鞋头款式: 圆头闭合方式: 系带鞋底材质: 橡胶鞋面材质: 牛反绒真皮材质工艺: 反绒皮鞋面内里材质: 头层猪皮鞋制作工艺: 胶粘鞋跟底款式: 平跟图案: 纯色流行元素: 车缝线风格: 休闲细分风格: 日常休闲场合: 日常季节: ','库存2053件',NULL,258,258,NULL,'https://img.alicdn.com/imgextra/i2/508099320/TB2ZKrBkXXXXXckXpXXXXXXXXXX_!!508099320.jpg_430x430q90.',NULL);
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

-- Dump completed on 2016-03-30 16:31:10
