CREATE DATABASE  IF NOT EXISTS `smartstay` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartstay`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smartstay
-- ------------------------------------------------------
-- Server version	5.1.73-community

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
-- Table structure for table `coupon_tb`
--

DROP TABLE IF EXISTS `coupon_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_tb` (
  `coupon_no` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `coupon_info` longtext NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`coupon_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_tb`
--

LOCK TABLES `coupon_tb` WRITE;
/*!40000 ALTER TABLE `coupon_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doorlock_tb`
--

DROP TABLE IF EXISTS `doorlock_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doorlock_tb` (
  `office_no` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`office_no`,`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doorlock_tb`
--

LOCK TABLES `doorlock_tb` WRITE;
/*!40000 ALTER TABLE `doorlock_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `doorlock_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_tb`
--

DROP TABLE IF EXISTS `office_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_tb` (
  `owner_no` int(11) NOT NULL,
  `office_no` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(45) NOT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `office_call` varchar(45) DEFAULT NULL,
  `office_inform` varchar(255) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`office_no`),
  KEY `owner_no` (`owner_no`),
  CONSTRAINT `office_tb_ibfk_1` FOREIGN KEY (`owner_no`) REFERENCES `user_tb` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_tb`
--

LOCK TABLES `office_tb` WRITE;
/*!40000 ALTER TABLE `office_tb` DISABLE KEYS */;

/*!40000 ALTER TABLE `office_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_tb`
--

DROP TABLE IF EXISTS `reservation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_tb` (
  `reservation_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `office_no` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  PRIMARY KEY (`reservation_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_tb`
--

LOCK TABLES `reservation_tb` WRITE;
/*!40000 ALTER TABLE `reservation_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_tb`
--

DROP TABLE IF EXISTS `room_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_tb` (
  `room_no` int(11) NOT NULL,
  `room_name` varchar(45) NOT NULL,
  `room_type` varchar(45) NOT NULL,
  `standard_num` int(11) NOT NULL,
  `maximum_num` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `office_no` int(11) NOT NULL,
  `image` varchar(20) NOT NULL,
  PRIMARY KEY (`room_no`),
  KEY `office_no` (`office_no`),
  CONSTRAINT `room_tb_ibfk_1` FOREIGN KEY (`office_no`) REFERENCES `office_tb` (`office_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_tb`
--

LOCK TABLES `room_tb` WRITE;
/*!40000 ALTER TABLE `room_tb` DISABLE KEYS */;

/*!40000 ALTER TABLE `room_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupon_tb`
--

DROP TABLE IF EXISTS `user_coupon_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupon_tb` (
  `user_id` varchar(45) NOT NULL,
  `coupon_no` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`coupon_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon_tb`
--

LOCK TABLES `user_coupon_tb` WRITE;
/*!40000 ALTER TABLE `user_coupon_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_coupon_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_key_tb`
--

DROP TABLE IF EXISTS `user_key_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_key_tb` (
  `reservation_no` int(11) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  PRIMARY KEY (`reservation_no`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_key_tb`
--

LOCK TABLES `user_key_tb` WRITE;
/*!40000 ALTER TABLE `user_key_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_key_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tb` (
  `user_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `user_pw` varchar(255) NOT NULL,
  `user_mobile` varchar(11) NOT NULL,
  `user_token` tinytext NOT NULL,
  `user_corporate_number` int(100) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

LOCK TABLES `user_tb` WRITE;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;

/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-22 23:30:04
