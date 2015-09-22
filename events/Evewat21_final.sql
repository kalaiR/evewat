CREATE DATABASE  IF NOT EXISTS `evewat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `evewat`;
-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: evewat
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add country',8,'add_country'),(23,'Can change country',8,'change_country'),(24,'Can delete country',8,'delete_country'),(25,'Can add city',9,'add_city'),(26,'Can change city',9,'change_city'),(27,'Can delete city',9,'delete_city'),(28,'Can add location',10,'add_location'),(29,'Can change location',10,'change_location'),(30,'Can delete location',10,'delete_location'),(34,'Can add college',12,'add_college'),(35,'Can change college',12,'change_college'),(36,'Can delete college',12,'delete_college'),(37,'Can add department',13,'add_department'),(38,'Can change department',13,'change_department'),(39,'Can delete department',13,'delete_department'),(40,'Can add postevent',14,'add_postevent'),(41,'Can change postevent',14,'change_postevent'),(42,'Can delete postevent',14,'delete_postevent'),(43,'Can add user profile',15,'add_userprofile'),(44,'Can change user profile',15,'change_userprofile'),(45,'Can delete user profile',15,'delete_userprofile'),(46,'Can add payu details',16,'add_payudetails'),(47,'Can change payu details',16,'change_payudetails'),(48,'Can delete payu details',16,'delete_payudetails'),(49,'Can add transaction',17,'add_transaction'),(50,'Can change transaction',17,'change_transaction'),(51,'Can delete transaction',17,'delete_transaction'),(52,'Can add site banner',18,'add_sitebanner'),(53,'Can change site banner',18,'change_sitebanner'),(54,'Can delete site banner',18,'delete_sitebanner'),(58,'Can add sub category',20,'add_subcategory'),(59,'Can change sub category',20,'change_subcategory'),(60,'Can delete sub category',20,'delete_subcategory'),(61,'Can add premium price info',21,'add_premiumpriceinfo'),(62,'Can change premium price info',21,'change_premiumpriceinfo'),(63,'Can delete premium price info',21,'delete_premiumpriceinfo'),(64,'Can add order',22,'add_order'),(65,'Can change order',22,'change_order'),(66,'Can delete order',22,'delete_order'),(67,'Can add college department',23,'add_collegedepartment'),(68,'Can change college department',23,'change_collegedepartment'),(69,'Can delete college department',23,'delete_collegedepartment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$O4mFrmTcbemB$PX6wp+Qnubjjlws0McXR1810LElzFCLTSCn9k7uLK9g=','2015-09-21 07:17:57',1,'root','','','root@gmail.com',1,1,'2015-09-02 06:10:23'),(6,'pbkdf2_sha256$12000$8TrIfTKF6iWD$WQdOuOEkAbqEw9HqLjwBTkZI2bOR5u+YKx4CL1h2NEE=','2015-09-10 10:28:05',0,'selvi','','','selvi@gmail.com',0,1,'2015-09-02 07:37:52'),(7,'pbkdf2_sha256$12000$H1vxLMKujW6Y$CTKAD6cChPbJCeopKlWZ+lK1J1R3yHFnvCdwURCRFjA=','2015-09-07 06:29:26',0,'neethu','','','neethu@globalensolutions.com',0,1,'2015-09-02 10:28:44'),(8,'pbkdf2_sha256$12000$3tKROpHmJWom$6G1YyK6hqC1FijF0OZnTqGek7XIHYCiLvvWE5PAOWf8=','2015-09-02 11:20:37',0,'nandhini','','','nandhini@gmail.com',0,1,'2015-09-02 11:20:37'),(9,'pbkdf2_sha256$12000$rJL4df4HTRSb$QGaSu/mWDgkETaudcLB8bpJ1lziVFc/MPPjOF91JAE4=','2015-09-19 07:39:59',0,'ramya','','','ramya@globalensolutions.com',0,1,'2015-09-02 11:39:59'),(10,'pbkdf2_sha256$12000$dodz33cWdAba$MKeqXTWDmYWSnOQIvDogeUrmxgffx2nOeHuln77kBXM=','2015-09-03 05:25:01',0,'sara','','','sara@gmail.com',0,1,'2015-09-02 11:52:30'),(11,'pbkdf2_sha256$12000$ozZMkyELnNKk$ata/kjqiQ7hho/yp8iNc8ObQPsnnGfDG7i1vAIOfbgM=','2015-09-02 12:42:45',0,'pradeepa','','','rpradeepa812@gmail.com',0,1,'2015-09-02 12:42:44'),(12,'pbkdf2_sha256$12000$teZUJ2OLxajr$vySWq0gTYmYGUNaKJz3AsBNNkX20V+NhmUkOxNNKZzc=','2015-09-03 04:36:06',0,'sathish','','','sathish@gmail.com',0,1,'2015-09-03 04:18:30'),(13,'pbkdf2_sha256$12000$4tufUrFqyrxk$euiYIJJpZ3SE3RxAHTFwQKOU2bZhYAGqlfCG9I9WPxs=','2015-09-03 05:17:12',0,'guru','','','guru@globalensolutions.com',0,1,'2015-09-03 05:17:12'),(14,'pbkdf2_sha256$12000$wOXr1pumalFS$5qYDOTbYnBOGO/e17gHBuIs29q0IkTHqezQYoGvebwQ=','2015-09-07 13:08:24',0,'spriya','','','shanmugapriya@gmail.com',0,1,'2015-09-07 12:27:32'),(15,'pbkdf2_sha256$12000$lhN1PiOGpeTN$yzCRaG8a9h73traLvMqKLLZ5xc8APODQwSuNxl/rQHk=','2015-09-09 04:13:16',0,'saran','','','saran@gmail.com',0,1,'2015-09-08 11:38:19'),(16,'pbkdf2_sha256$12000$RnPEuIKwuHdQ$KWIimmTX+0Iu0VXGvzYX+1st8HqYY44Pju7T1Tcnuj4=','2015-09-08 11:56:26',0,'devi','','','devi@gmail.com',0,1,'2015-09-08 11:56:25'),(17,'pbkdf2_sha256$12000$z4PAWSQoGjVf$5UYQ2X8yBChNnm674H+rC5E88QlXD4TlVQhVpkAUfl4=','2015-09-08 12:13:33',0,'user','','','user@gmail.com',0,1,'2015-09-08 12:13:33'),(18,'pbkdf2_sha256$12000$gpfIRxwTn3pb$ClSiJopSqs/IKkHg0T326vNlsfOdSo9gqoRIK5/bX2Y=','2015-09-09 06:54:11',0,'sang','','','sang@gmail.com',0,1,'2015-09-09 06:54:11'),(19,'pbkdf2_sha256$12000$XYc7Gjh5P179$4062AtjrcmSlDJqPuDhQj9ryRZe0IO9hui4m+HrklaI=','2015-09-09 07:29:51',0,'nisha','','','nisha@gmail.com',0,1,'2015-09-09 07:29:51'),(20,'pbkdf2_sha256$12000$xMWzidnYZtnj$SOq1We0xA3vx9H6ddzre7rLrA25z959ulPkhmt01tsY=','2015-09-09 10:18:06',0,'geetha','','','geetha@gmail.com',0,1,'2015-09-09 10:18:06'),(21,'pbkdf2_sha256$12000$VMbxP7ItqKGk$IjYHBGeIPxCg9W7NRve6MBCA333AAGNeI3BenZnfsJ8=','2015-09-10 05:00:20',0,'kalai','','','kalai@gmail.com',0,1,'2015-09-10 04:59:48'),(22,'pbkdf2_sha256$12000$rYeCsFd1svtK$ZblA43UnQphV/gJMmTu8soPV58XC9XRAVtbSES/py40=','2015-09-14 08:42:04',0,'Priya','','','avbmail93@gmail.com',0,1,'2015-09-14 04:31:56'),(23,'pbkdf2_sha256$12000$7OhZIRaR8vnd$BqwLf3CzC2Vp1ohon1zrp9CY3Ps/BBWYfM1CJYBb0ZU=','2015-09-19 07:38:48',0,'sati','','','sati@gmail.com',0,1,'2015-09-19 07:38:47'),(24,'pbkdf2_sha256$10000$fatYvLzOx7iL$SYl+pqmoTD+qKD1VUX9IRwQeAMzPdJKOkxfNsP/2gRw=','2015-09-21 12:31:27',0,'kalaiarasi','','','kalaimca.gsdfd@gmail.com',0,1,'2015-09-21 12:31:27'),(51,'pbkdf2_sha256$10000$7N2rjSPUVUWf$tqE5dzyOYuVbAcIyE/Ycy7Jrgel/5BgrBfjrRv07miE=','2015-09-21 14:35:45',0,'test1','','','test1@gmail.com',0,1,'2015-09-21 14:35:45');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_sitebanner`
--

DROP TABLE IF EXISTS `banner_sitebanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_sitebanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` varchar(100) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `pageurl` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (1,'static/banners/events_3.jpg','www.google.com','/','top',100000),(2,'static/banners/website_2.jpg','www.google.com','/','top',100000),(3,'static/banners/images_2.jpeg','www.google.com','/','bottom',50000),(4,'static/banners/palm.gif','www.google.com','/','bottom',50000),(5,'static/banners/paper_2.jpg','www.google.com','search/','top',50000),(6,'static/banners/images_3.jpeg','www.google.com','/','bottom',50000),(7,'static/banners/ram_3.jpeg','www.google.com','/','top',100000);
/*!40000 ALTER TABLE `banner_sitebanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_category`
--

DROP TABLE IF EXISTS `college_event_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `category_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_category`
--

LOCK TABLES `college_event_category` WRITE;
/*!40000 ALTER TABLE `college_event_category` DISABLE KEYS */;
INSERT INTO `college_event_category` VALUES (1,'medical','workshop,seminar,conferences'),(2,'engineering','technical,workshop,seminar,conferences,sympos'),(3,'law','literary,youth summit'),(4,'management','technical,workshop,seminar,conferences,sympos');
/*!40000 ALTER TABLE `college_event_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_city`
--

DROP TABLE IF EXISTS `college_event_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(150) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_city_d860be3c` (`country_id`),
  CONSTRAINT `country_id_refs_id_f26379ab` FOREIGN KEY (`country_id`) REFERENCES `college_event_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_city`
--

LOCK TABLES `college_event_city` WRITE;
/*!40000 ALTER TABLE `college_event_city` DISABLE KEYS */;
INSERT INTO `college_event_city` VALUES (1,'Pondicherry',1),(2,'Chennai',1),(3,'Villupuram',1),(4,'Madurai',1),(5,'Trichy',2),(6,'Cuddalore',1);
/*!40000 ALTER TABLE `college_event_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_college`
--

DROP TABLE IF EXISTS `college_event_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collegetype_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `college_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_college_a8635ab4` (`collegetype_id`),
  KEY `college_event_college_586a73b5` (`city_id`),
  KEY `college_event_college_319d859` (`location_id`),
  CONSTRAINT `collegetype_id_refs_id_3f4dbfcf` FOREIGN KEY (`collegetype_id`) REFERENCES `college_event_category` (`id`),
  CONSTRAINT `city_id_refs_id_98104450` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `location_id_refs_id_f81aa0f4` FOREIGN KEY (`location_id`) REFERENCES `college_event_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_college`
--

LOCK TABLES `college_event_college` WRITE;
/*!40000 ALTER TABLE `college_event_college` DISABLE KEYS */;
INSERT INTO `college_event_college` VALUES (1,2,1,NULL,'christ college'),(2,2,1,NULL,'manakula vinayagar'),(3,1,2,NULL,'venkateshwara');
/*!40000 ALTER TABLE `college_event_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_collegedepartment`
--

DROP TABLE IF EXISTS `college_event_collegedepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_collegedepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_collegedepartment_2ae7390` (`department_id`),
  CONSTRAINT `department_id_refs_id_381545eb` FOREIGN KEY (`department_id`) REFERENCES `college_event_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_collegedepartment`
--

LOCK TABLES `college_event_collegedepartment` WRITE;
/*!40000 ALTER TABLE `college_event_collegedepartment` DISABLE KEYS */;
INSERT INTO `college_event_collegedepartment` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `college_event_collegedepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_collegedepartment_college`
--

DROP TABLE IF EXISTS `college_event_collegedepartment_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_collegedepartment_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collegedepartment_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collegedepartment_id` (`collegedepartment_id`,`college_id`),
  KEY `college_event_collegedepartment_college_7e4a31c8` (`collegedepartment_id`),
  KEY `college_event_collegedepartment_college_f92d1f50` (`college_id`),
  CONSTRAINT `collegedepartment_id_refs_id_8aee7fe5` FOREIGN KEY (`collegedepartment_id`) REFERENCES `college_event_collegedepartment` (`id`),
  CONSTRAINT `college_id_refs_id_34163bad` FOREIGN KEY (`college_id`) REFERENCES `college_event_college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_collegedepartment_college`
--

LOCK TABLES `college_event_collegedepartment_college` WRITE;
/*!40000 ALTER TABLE `college_event_collegedepartment_college` DISABLE KEYS */;
INSERT INTO `college_event_collegedepartment_college` VALUES (3,2,1),(4,2,2),(5,3,1);
/*!40000 ALTER TABLE `college_event_collegedepartment_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_country`
--

DROP TABLE IF EXISTS `college_event_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_country`
--

LOCK TABLES `college_event_country` WRITE;
/*!40000 ALTER TABLE `college_event_country` DISABLE KEYS */;
INSERT INTO `college_event_country` VALUES (1,'IN','India'),(2,'SG','Singapore');
/*!40000 ALTER TABLE `college_event_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_department`
--

DROP TABLE IF EXISTS `college_event_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_department`
--

LOCK TABLES `college_event_department` WRITE;
/*!40000 ALTER TABLE `college_event_department` DISABLE KEYS */;
INSERT INTO `college_event_department` VALUES (1,'Mechancial Enginneering'),(2,'Civil Engineering'),(3,'Computer Science Engineering');
/*!40000 ALTER TABLE `college_event_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_location`
--

DROP TABLE IF EXISTS `college_event_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `locality` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_location_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_50d2972a` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_location`
--

LOCK TABLES `college_event_location` WRITE;
/*!40000 ALTER TABLE `college_event_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_postevent`
--

DROP TABLE IF EXISTS `college_event_postevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_postevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `festname` varchar(50) DEFAULT NULL,
  `festcaption` varchar(50) DEFAULT NULL,
  `festtype_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `deadline` longtext,
  `registrationfee` longtext,
  `festdescription` longtext,
  `registrationurl` varchar(250) DEFAULT NULL,
  `poster` varchar(500) DEFAULT NULL,
  `venuedescription` longtext,
  `contactperson` longtext,
  `admin_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_postevent_5c81e710` (`festtype_id`),
  KEY `college_event_postevent_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_a25b57ec` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `festtype_id_refs_id_c3b9140f` FOREIGN KEY (`festtype_id`) REFERENCES `college_event_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_postevent`
--

LOCK TABLES `college_event_postevent` WRITE;
/*!40000 ALTER TABLE `college_event_postevent` DISABLE KEYS */;
INSERT INTO `college_event_postevent` VALUES (1,'ramya','ramya@globalensolutions.com',9874563101,'innovace','innovace2k15',1,3,'Tamil nadu','2015-09-20','2015-09-19','2015-09-19','200','innovace oneday technical workshop ','www.innovace.co.in','events/static/img/16543534-Invitation-card-for-birthdays-Balloons-design-Stock-Vector-balloons-birthday-balloon.jpg','mailam engineering college,\r\nvillupuram.','sathish kumar,\r\nmailam engineering college,\r\nvillupuram.',NULL),(2,'ramya','ramya@globalensolutions.com',9887422020,'zeal','zeal2k15',2,4,'Tamil nadu','2015-09-21','2015-09-20','2015-09-20','200','zeal one day seminar','www.zeal.co.in','events/static/img/16543534-Invitation-card-for-birthdays-Balloons-design-Stock-Vector-balloons-birthday-balloon.jpg','sree sowdambika college of engineering,\r\naruppukottai.','ramya,\r\nsree sowdambika college of engineering,\r\naruppukottai.',NULL),(3,'ramya','ramya@globalensolutions.com',9875612345,'writer','poetry writing',8,1,' Pondicherry','2015-09-25','2015-09-24','2015-09-24','100','poetry writing','www.tamil.com','events/static/img/16543534-Invitation-card-for-birthdays-Balloons-design-Stock-Vector-balloons-birthday-balloon.jpg','psr arts and science college,\r\npondicherry.','kalai,\r\npsr arts and science college,\r\npondicherry.',NULL);
/*!40000 ALTER TABLE `college_event_postevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_premiumpriceinfo`
--

DROP TABLE IF EXISTS `college_event_premiumpriceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_premiumpriceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `premium_price` double DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_premiumpriceinfo`
--

LOCK TABLES `college_event_premiumpriceinfo` WRITE;
/*!40000 ALTER TABLE `college_event_premiumpriceinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_premiumpriceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_subcategory`
--

DROP TABLE IF EXISTS `college_event_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_subcategory`
--

LOCK TABLES `college_event_subcategory` WRITE;
/*!40000 ALTER TABLE `college_event_subcategory` DISABLE KEYS */;
INSERT INTO `college_event_subcategory` VALUES (1,'category_icon/index1_7.jpg','workshop'),(2,'category_icon/index1_6.jpg','seminar'),(3,'category_icon/index1_19.jpg','onlineevents'),(4,'category_icon/index1_5.jpg','conferences'),(5,'category_icon/index1_9.jpg','youthsummit'),(6,'category_icon/index1.jpg','technical'),(7,'category_icon/index1_6.jpg','cultural'),(8,'category_icon/index1_4.jpg','literary'),(9,'category_icon/index1_8.jpg','symposium');
/*!40000 ALTER TABLE `college_event_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_subcategory_category`
--

DROP TABLE IF EXISTS `college_event_subcategory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_subcategory_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory_id` (`subcategory_id`,`category_id`),
  KEY `college_event_subcategory_category_790ef9fb` (`subcategory_id`),
  KEY `college_event_subcategory_category_6f33f001` (`category_id`),
  CONSTRAINT `subcategory_id_refs_id_fccefbaa` FOREIGN KEY (`subcategory_id`) REFERENCES `college_event_subcategory` (`id`),
  CONSTRAINT `category_id_refs_id_e7da638a` FOREIGN KEY (`category_id`) REFERENCES `college_event_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_subcategory_category`
--

LOCK TABLES `college_event_subcategory_category` WRITE;
/*!40000 ALTER TABLE `college_event_subcategory_category` DISABLE KEYS */;
INSERT INTO `college_event_subcategory_category` VALUES (1,1,1),(4,1,2),(11,1,4),(2,2,1),(5,2,2),(12,2,4),(3,4,1),(6,4,2),(13,4,4),(9,5,3),(7,6,2),(14,6,4),(10,8,3),(8,9,2),(15,9,4);
/*!40000 ALTER TABLE `college_event_subcategory_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-03 10:27:22',1,18,'1','www.google.com',1,''),(2,'2015-09-03 10:28:02',1,18,'2','www.google.com',1,''),(3,'2015-09-03 10:28:25',1,18,'3','www.google.com',1,''),(4,'2015-09-03 10:30:53',1,18,'4','www.google.com',1,''),(5,'2015-09-03 10:31:27',1,18,'5','www.google.com',1,''),(6,'2015-09-03 10:31:44',1,18,'6','www.google.com',1,''),(7,'2015-09-03 10:32:11',1,18,'7','www.google.com',1,''),(8,'2015-09-03 10:32:40',1,18,'8','www.google.com',1,''),(9,'2015-09-03 10:50:01',1,18,'9','www.google.com',1,''),(10,'2015-09-03 10:50:30',1,18,'10','www.google.com',1,''),(11,'2015-09-03 10:53:49',1,18,'11','www.google.com',1,''),(12,'2015-09-03 10:54:50',1,18,'12','www.google.com',1,''),(13,'2015-09-07 11:59:36',1,18,'13','www.google.com',1,''),(14,'2015-09-07 12:07:36',1,18,'14','www.google.com',1,''),(15,'2015-09-07 12:08:12',1,18,'15','www.google.com',1,''),(16,'2015-09-07 12:31:26',1,18,'16','www.google.com',1,''),(17,'2015-09-07 12:36:46',1,18,'17','www.google.com',1,''),(18,'2015-09-07 12:38:00',1,18,'18','www.google.com',1,''),(19,'2015-09-07 12:50:16',1,18,'19','www.google.com',1,''),(20,'2015-09-07 12:55:45',1,18,'3','www.google.com',3,''),(21,'2015-09-07 12:55:45',1,18,'2','www.google.com',3,''),(22,'2015-09-07 12:55:45',1,18,'1','www.google.com',3,''),(23,'2015-09-07 12:56:50',1,18,'13','www.google.com',3,''),(24,'2015-09-07 12:59:06',1,18,'18','www.google.com',3,''),(25,'2015-09-07 12:59:06',1,18,'17','www.google.com',3,''),(26,'2015-09-07 12:59:06',1,18,'16','www.google.com',3,''),(27,'2015-09-07 12:59:06',1,18,'15','www.google.com',3,''),(28,'2015-09-07 12:59:06',1,18,'14','www.google.com',3,''),(29,'2015-09-07 13:00:54',1,18,'19','www.google.com',3,''),(30,'2015-09-07 13:00:54',1,18,'12','www.google.com',3,''),(31,'2015-09-07 13:00:54',1,18,'11','www.google.com',3,''),(32,'2015-09-07 13:00:54',1,18,'9','www.google.com',3,''),(33,'2015-09-07 13:00:54',1,18,'8','www.google.com',3,''),(34,'2015-09-07 13:02:50',1,18,'20','www.google.com',1,''),(35,'2015-09-07 13:05:46',1,18,'21','www.google.com',1,''),(36,'2015-09-08 12:01:47',1,18,'21','www.google.com',3,''),(37,'2015-09-08 12:01:47',1,18,'20','www.google.com',3,''),(38,'2015-09-08 12:01:47',1,18,'10','www.google.com',3,''),(39,'2015-09-08 12:01:47',1,18,'7','www.google.com',3,''),(40,'2015-09-08 12:01:47',1,18,'6','www.google.com',3,''),(41,'2015-09-08 12:01:47',1,18,'5','www.google.com',3,''),(42,'2015-09-08 12:01:47',1,18,'4','www.google.com',3,''),(43,'2015-09-08 12:02:28',1,18,'22','www.google.com',1,''),(44,'2015-09-08 12:02:58',1,18,'23','www.google.com',1,''),(45,'2015-09-08 12:03:51',1,18,'24','www.google.com',1,''),(46,'2015-09-08 12:04:23',1,18,'25','www.google.com',1,''),(47,'2015-09-08 12:04:51',1,18,'26','www.google.com',1,''),(48,'2015-09-08 12:05:31',1,18,'27','www.google.com',1,''),(49,'2015-09-08 12:05:57',1,18,'28','www.google.com',1,''),(50,'2015-09-08 12:06:28',1,18,'29','www.google.com',1,''),(51,'2015-09-08 12:07:04',1,18,'30','www.google.com',1,''),(52,'2015-09-08 13:35:36',1,18,'31','www.google.com',1,''),(53,'2015-09-09 13:20:04',1,18,'32','www.google.com',1,''),(54,'2015-09-14 11:00:25',1,18,'51','www.google.com',3,''),(55,'2015-09-21 05:08:46',1,12,'1','christ college',1,''),(56,'2015-09-21 05:09:07',1,12,'2','manakula vinayagar',1,''),(57,'2015-09-21 05:09:26',1,12,'3','venkateshwara',1,''),(58,'2015-09-21 08:20:49',1,13,'1','Mechancial Enginneering',1,''),(59,'2015-09-21 08:21:41',1,13,'2','Civil Engineering',1,''),(60,'2015-09-21 08:21:59',1,13,'3','Computer Science Engineering',1,''),(61,'2015-09-21 08:23:08',1,23,'2','Mechancial Enginneering',1,''),(62,'2015-09-21 08:23:38',1,23,'3','Civil Engineering',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'category','college_event','category'),(8,'country','college_event','country'),(9,'city','college_event','city'),(10,'location','college_event','location'),(12,'college','college_event','college'),(13,'department','college_event','department'),(14,'postevent','college_event','postevent'),(15,'user profile','events','userprofile'),(16,'payu details','payu','payudetails'),(17,'transaction','transaction','transaction'),(18,'site banner','banner','sitebanner'),(20,'sub category','college_event','subcategory'),(21,'premium price info','college_event','premiumpriceinfo'),(22,'order','transaction','order'),(23,'college department','college_event','collegedepartment');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('514wvhbi3qtdqiwjyw915nly88k50w1p','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-28 05:00:44'),('5820icnzg9gxhnc57sgr7o9oqko0sj74','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-02 09:49:12'),('6rof606zlq68upsgi5olp1xcaaco01gl','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-09-24 10:56:30'),('7aqpvtfvovp866aw3yxowp8v9rgpv1ip','NDI0MmQxYjBkNjE0Nzg5YjlkMzUxNzYwYzI5NGM0NzZiY2M3MjE1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9','2015-09-23 04:13:16'),('7d340f0322c1ed2bd9a7141ceba3bedc','YTY0ZTNkNWJmM2M3ZTkyNjRkOGRiOWJjZWQyMmMwNjc1YjVhMGE5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKATN1Lg==\n','2015-10-05 14:35:45'),('7xxcav4tks8cnogshj0585me6bf6cs2a','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-28 10:58:33'),('8kcw5p9hrvsdwwuiga8ybv323u0hiakt','ZGMzY2MzOTMzMmNjMmMxN2E4M2M0ZGQ0Y2ZmNjMzYzIzMGI0MTFiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjJ9','2015-09-28 04:31:57'),('9k0sdywb16956n5iwyp3t18nuynfcsby','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-10-03 07:39:59'),('9p5ijbn3heb43d00wygrdd1zfo4vmuys','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:08:43'),('dfj184mxjpbssh9924z2na6rcvhae24n','ZGMzY2MzOTMzMmNjMmMxN2E4M2M0ZGQ0Y2ZmNjMzYzIzMGI0MTFiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjJ9','2015-09-28 06:24:03'),('ehqrxij4qts12q82p3mc5f0n4hjw0021','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-21 13:27:50'),('g55iv48i6whxxywb8gt6v6hyvwwp8dx5','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:16:04'),('h9f6ruh2dtznc6bcqxniys5thfy1sx65','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:38'),('hjlctcdd20zz9m6dondandvd7a02izy3','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-24 08:06:25'),('hockpo8tf0xrhbnn68y16rvhg7c143z0','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-22 12:55:45'),('k2dr7zn8l4xepi8r5v43nt02dwla7hgi','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-24 07:43:01'),('nrdjsxae0lx7z62jaeonaj6m1yinzaug','NDI0MmQxYjBkNjE0Nzg5YjlkMzUxNzYwYzI5NGM0NzZiY2M3MjE1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9','2015-09-22 11:38:47'),('p7sltgr6g6bmbac42dangv4jo17qbi6t','OWVjYTA0MGFlOWFhYjhjNzkyZGRmNmU4M2Q5NjY1MGZjYmY2ZWEzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjF9','2015-09-24 05:00:20'),('phqzr3hoz8hyzwo6fb6v46gn1hhk54ta','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-03 06:48:10'),('pxi0gzeqpxedwyxnpfxy06cdop7hsxcn','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-03 07:11:20'),('szkjbro2ybcfz8zr452c2a8m1hqfuvib','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:45'),('taaayv73zzsavkptqyr4gvrmidzm154q','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-29 09:23:18'),('tp9jg6u5d22oueg3sox3ejw554svvc6l','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-09-24 06:28:26'),('xbiclkr4dlyu99hqi2z46pcqo7a0j5jw','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-29 09:44:36'),('xi31c124jg6kncqdh0hayasf6lua2npy','YTM0MmE0NWM5OWFlYTllYTRhNWUzNWU4ZGZmYTQ5OGUzNTc1NzI5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2015-09-21 06:29:26'),('z8w56o2344w201b9vl0nbbu8gv2gnsqd','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-17 10:23:53'),('zl54fd4b8do06mufw160rktuw1ei0ssu','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-28 10:59:34');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_userprofile`
--

DROP TABLE IF EXISTS `events_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `confirmation_code` varchar(500) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `is_emailverified` tinyint(1) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `events_userprofile_586a73b5` (`city_id`),
  KEY `events_userprofile_f92d1f50` (`college_id`),
  KEY `events_userprofile_2ae7390` (`department_id`),
  CONSTRAINT `college_id_refs_id_68db436c` FOREIGN KEY (`college_id`) REFERENCES `college_event_college` (`id`),
  CONSTRAINT `city_id_refs_id_81e17811` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `department_id_refs_id_2943d7de` FOREIGN KEY (`department_id`) REFERENCES `college_event_department` (`id`),
  CONSTRAINT `user_id_refs_id_76a6db98` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_userprofile`
--

LOCK TABLES `events_userprofile` WRITE;
/*!40000 ALTER TABLE `events_userprofile` DISABLE KEYS */;
INSERT INTO `events_userprofile` VALUES (3,51,'9876543210','s4Scwxx8GAxYT0Xw8fcZ1aI8Lc9mmZQBm',0,0,'test1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `events_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payu_payudetails`
--

DROP TABLE IF EXISTS `payu_payudetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payu_payudetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mihpayid` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `productinfo` varchar(500) DEFAULT NULL,
  `error_Message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payu_payudetails`
--

LOCK TABLES `payu_payudetails` WRITE;
/*!40000 ALTER TABLE `payu_payudetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `payu_payudetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_order`
--

DROP TABLE IF EXISTS `transaction_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `banner` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_order`
--

LOCK TABLES `transaction_order` WRITE;
/*!40000 ALTER TABLE `transaction_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_transaction`
--

DROP TABLE IF EXISTS `transaction_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payu_details_id` int(11) NOT NULL,
  `payu_status` varchar(20) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_transaction`
--

LOCK TABLES `transaction_transaction` WRITE;
/*!40000 ALTER TABLE `transaction_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-21 20:18:57
