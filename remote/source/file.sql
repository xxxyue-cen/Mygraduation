-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: message
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Current Database: `message`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `message` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `message`;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `num` int(11) DEFAULT NULL,
  `name` char(32) DEFAULT NULL,
  `passwd` char(32) DEFAULT NULL,
  UNIQUE KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (1,'1','1'),(2,'2','2'),(12,'12','12');
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `帐号` int(11) DEFAULT NULL,
  `密码` char(32) DEFAULT NULL,
  `日期` date DEFAULT NULL,
  `时间` time DEFAULT NULL,
  `操作` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,'1','2019-04-20','15:55:38','connect'),(1,'1','2019-04-20','15:55:47','break'),(1,'1','2019-04-20','15:55:50','connect'),(1,'1','2019-04-20','15:56:01','break'),(1,'1','2019-04-20','15:56:46','connect'),(1,'1','2019-04-20','15:57:11','break'),(1,'1','2019-04-20','15:57:16','connect'),(1,'1','2019-04-20','15:57:37','break'),(1,'1','2019-04-20','16:01:20','connect'),(1,'1','2019-04-20','16:01:31','break'),(1,'1','2019-04-20','16:02:42','connect'),(1,'1','2019-04-20','16:02:52','break'),(1,'1','2019-04-20','16:02:55','connect'),(1,'1','2019-04-20','16:02:58','order: ls'),(1,'1','2019-04-20','16:03:04','order: ls -l'),(1,'1','2019-04-20','16:03:11','order: ps -ef'),(1,'1','2019-04-20','16:03:20','order: ipcs'),(1,'1','2019-04-20','16:03:32','break'),(1,'1','2019-04-20','16:04:30','connect'),(1,'1','2019-04-20','16:04:42','break'),(1,'1','2019-04-20','16:05:40','connect'),(1,'1','2019-04-20','16:05:44','break'),(1,'1','2019-04-20','16:05:47','connect'),(1,'1','2019-04-20','16:05:54','break'),(1,'1','2019-04-20','16:07:01','connect'),(1,'1','2019-04-20','16:07:14','break'),(0,'0','2019-04-20','16:07:21','break'),(1,'1','2019-04-20','16:08:02','connect'),(1,'1','2019-04-20','16:08:05','break'),(0,'0','2019-04-20','16:08:09','break'),(1,'1','2019-04-20','16:08:58','connect'),(1,'1','2019-04-20','16:09:24','break'),(0,'0','2019-04-20','16:09:32','break'),(1,'1','2019-04-20','16:10:02','connect'),(1,'1','2019-04-20','16:10:04','order: ls'),(1,'1','2019-04-20','16:10:11','order: ls -l'),(1,'1','2019-04-20','16:10:16','order: pa -ef'),(1,'1','2019-04-20','16:10:23','order: ps -ef'),(1,'1','2019-04-20','16:10:28','break'),(1,'1','2019-04-20','16:10:36','connect'),(12,'12','2019-04-20','16:11:16','connect'),(12,'12','2019-04-20','16:11:25','break'),(1,'1','2019-04-20','16:11:28','break');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20 16:13:33
