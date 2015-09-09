CREATE DATABASE  IF NOT EXISTS `evewat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `evewat`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: evewat
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add country',8,'add_country'),(23,'Can change country',8,'change_country'),(24,'Can delete country',8,'delete_country'),(25,'Can add city',9,'add_city'),(26,'Can change city',9,'change_city'),(27,'Can delete city',9,'delete_city'),(28,'Can add location',10,'add_location'),(29,'Can change location',10,'change_location'),(30,'Can delete location',10,'delete_location'),(31,'Can add collegetype',11,'add_collegetype'),(32,'Can change collegetype',11,'change_collegetype'),(33,'Can delete collegetype',11,'delete_collegetype'),(34,'Can add college',12,'add_college'),(35,'Can change college',12,'change_college'),(36,'Can delete college',12,'delete_college'),(37,'Can add department',13,'add_department'),(38,'Can change department',13,'change_department'),(39,'Can delete department',13,'delete_department'),(40,'Can add postevent',14,'add_postevent'),(41,'Can change postevent',14,'change_postevent'),(42,'Can delete postevent',14,'delete_postevent'),(43,'Can add user profile',15,'add_userprofile'),(44,'Can change user profile',15,'change_userprofile'),(45,'Can delete user profile',15,'delete_userprofile'),(46,'Can add payu details',16,'add_payudetails'),(47,'Can change payu details',16,'change_payudetails'),(48,'Can delete payu details',16,'delete_payudetails'),(49,'Can add transaction',17,'add_transaction'),(50,'Can change transaction',17,'change_transaction'),(51,'Can delete transaction',17,'delete_transaction'),(52,'Can add site banner',18,'add_sitebanner'),(53,'Can change site banner',18,'change_sitebanner'),(54,'Can delete site banner',18,'delete_sitebanner'),(55,'Can add eventtype',19,'add_eventtype'),(56,'Can change eventtype',19,'change_eventtype'),(57,'Can delete eventtype',19,'delete_eventtype');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$O4mFrmTcbemB$PX6wp+Qnubjjlws0McXR1810LElzFCLTSCn9k7uLK9g=','2015-09-07 12:29:17',1,'root','','','root@gmail.com',1,1,'2015-09-02 06:10:23'),(6,'pbkdf2_sha256$12000$8TrIfTKF6iWD$WQdOuOEkAbqEw9HqLjwBTkZI2bOR5u+YKx4CL1h2NEE=','2015-09-03 05:10:13',0,'selvi','','','selvi@gmail.com',0,1,'2015-09-02 07:37:52'),(7,'pbkdf2_sha256$12000$H1vxLMKujW6Y$CTKAD6cChPbJCeopKlWZ+lK1J1R3yHFnvCdwURCRFjA=','2015-09-07 06:29:26',0,'neethu','','','neethu@globalensolutions.com',0,1,'2015-09-02 10:28:44'),(8,'pbkdf2_sha256$12000$3tKROpHmJWom$6G1YyK6hqC1FijF0OZnTqGek7XIHYCiLvvWE5PAOWf8=','2015-09-02 11:20:37',0,'nandhini','','','nandhini@gmail.com',0,1,'2015-09-02 11:20:37'),(9,'pbkdf2_sha256$12000$rJL4df4HTRSb$QGaSu/mWDgkETaudcLB8bpJ1lziVFc/MPPjOF91JAE4=','2015-09-03 06:21:03',0,'ramya','','','ramya@globalensolutions.com',0,1,'2015-09-02 11:39:59'),(10,'pbkdf2_sha256$12000$dodz33cWdAba$MKeqXTWDmYWSnOQIvDogeUrmxgffx2nOeHuln77kBXM=','2015-09-03 05:25:01',0,'sara','','','sara@gmail.com',0,1,'2015-09-02 11:52:30'),(11,'pbkdf2_sha256$12000$ozZMkyELnNKk$ata/kjqiQ7hho/yp8iNc8ObQPsnnGfDG7i1vAIOfbgM=','2015-09-02 12:42:45',0,'pradeepa','','','rpradeepa812@gmail.com',0,1,'2015-09-02 12:42:44'),(12,'pbkdf2_sha256$12000$teZUJ2OLxajr$vySWq0gTYmYGUNaKJz3AsBNNkX20V+NhmUkOxNNKZzc=','2015-09-03 04:36:06',0,'sathish','','','sathish@gmail.com',0,1,'2015-09-03 04:18:30'),(13,'pbkdf2_sha256$12000$4tufUrFqyrxk$euiYIJJpZ3SE3RxAHTFwQKOU2bZhYAGqlfCG9I9WPxs=','2015-09-03 05:17:12',0,'guru','','','guru@globalensolutions.com',0,1,'2015-09-03 05:17:12'),(14,'pbkdf2_sha256$12000$wOXr1pumalFS$5qYDOTbYnBOGO/e17gHBuIs29q0IkTHqezQYoGvebwQ=','2015-09-07 13:08:24',0,'spriya','','','shanmugapriya@gmail.com',0,1,'2015-09-07 12:27:32');
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
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (4,'static/banners/ELECTRET_2014_CBIT_Technical_Symposium.jpg','www.google.com','/','bottom',5000),(5,'static/banners/psr.jpeg','www.google.com','/','bottom',5000),(6,'static/banners/ptr.jpeg','www.google.com','/','bottom',5000),(7,'static/banners/ram.jpeg','www.google.com','/','bottom',5000),(10,'static/banners/paper.jpg','www.google.com','/','top',10000),(20,'static/banners/Poster12.jpg','www.google.com','/','top',10000),(21,'static/banners/ram.jpeg','www.google.com','/','top',10000);
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
  `name` varchar(150) DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_category`
--

LOCK TABLES `college_event_category` WRITE;
/*!40000 ALTER TABLE `college_event_category` DISABLE KEYS */;
INSERT INTO `college_event_category` VALUES (1,'technical','category_icon/index1.jpg'),(2,'cultural','category_icon/index1_1.jpg'),(3,'management','category_icon/index1_2.jpg'),(4,'sports','category_icon/index1_3.jpg'),(5,'literary','category_icon/index1_4.jpg'),(6,'conferences','category_icon/index1_5.jpg'),(7,'seminar','category_icon/index1_6.jpg'),(8,'workshop','category_icon/index1_7.jpg'),(9,'symposium','category_icon/index1_8.jpg'),(10,'youth summit','category_icon/index1_9.jpg'),(11,'model united nations','category_icon/index1_10.jpg'),(12,'TEDx','category_icon/index1_11.jpg'),(13,'summit','category_icon/index1_12.jpg'),(14,'conclave','category_icon/index1_13.jpg'),(15,'convention','category_icon/index1_14.jpg'),(16,'entrepreneurship summit','category_icon/index1_15.jpg'),(17,'medical','category_icon/index1_16.jpg'),(18,'pharma','category_icon/index1_17.jpg'),(19,'bio Medical','category_icon/index1_18.jpg'),(20,'online events','category_icon/index1_19.jpg');
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
INSERT INTO `college_event_city` VALUES (1,'Pondicherry',1),(2,'Chennai',1),(3,'Villupuram',1),(4,'Madurai',1),(5,'Trichy',1);
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
  `location_id` int(11) NOT NULL,
  `college_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_college_5a885087` (`collegetype_id`),
  KEY `college_event_college_b376980e` (`city_id`),
  KEY `college_event_college_afbb987d` (`location_id`),
  CONSTRAINT `city_id_refs_id_ee0fd1a3` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `collegetype_id_refs_id_3866cf03` FOREIGN KEY (`collegetype_id`) REFERENCES `college_event_collegetype` (`id`),
  CONSTRAINT `location_id_refs_id_245c8877` FOREIGN KEY (`location_id`) REFERENCES `college_event_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_college`
--

LOCK TABLES `college_event_college` WRITE;
/*!40000 ALTER TABLE `college_event_college` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_collegetype`
--

DROP TABLE IF EXISTS `college_event_collegetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_collegetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_type` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_collegetype`
--

LOCK TABLES `college_event_collegetype` WRITE;
/*!40000 ALTER TABLE `college_event_collegetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_collegetype` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_country`
--

LOCK TABLES `college_event_country` WRITE;
/*!40000 ALTER TABLE `college_event_country` DISABLE KEYS */;
INSERT INTO `college_event_country` VALUES (1,'IN','India');
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
  `college_id_id` int(11) DEFAULT NULL,
  `department` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_department_ef4a9120` (`college_id_id`),
  CONSTRAINT `college_id_id_refs_id_afb07a27` FOREIGN KEY (`college_id_id`) REFERENCES `college_event_college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_department`
--

LOCK TABLES `college_event_department` WRITE;
/*!40000 ALTER TABLE `college_event_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_eventtype`
--

DROP TABLE IF EXISTS `college_event_eventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_eventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  `college_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_eventtype`
--

LOCK TABLES `college_event_eventtype` WRITE;
/*!40000 ALTER TABLE `college_event_eventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_eventtype` ENABLE KEYS */;
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
  `festtheme` varchar(50) DEFAULT NULL,
  `festtype` varchar(50) DEFAULT NULL,
  `collegename` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `deadline` longtext,
  `registrationfee` longtext,
  `festdescription` longtext,
  `festevent` longtext,
  `department` varchar(50) DEFAULT NULL,
  `festwebsite` varchar(50) DEFAULT NULL,
  `registrationurl` varchar(250) DEFAULT NULL,
  `collegeurl` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `youtube` varchar(250) DEFAULT NULL,
  `poster` varchar(500) DEFAULT NULL,
  `brochure` varchar(100) NOT NULL,
  `applink` varchar(250) DEFAULT NULL,
  `venuedescription` longtext,
  `contactperson` longtext,
  `guest` longtext,
  `festpronites` longtext,
  `sponsorship` longtext,
  `stalls` longtext,
  `sponsor` longtext,
  `accommodation` longtext,
  `attendees` bigint(20) DEFAULT NULL,
  `feedback` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_postevent`
--

LOCK TABLES `college_event_postevent` WRITE;
/*!40000 ALTER TABLE `college_event_postevent` DISABLE KEYS */;
INSERT INTO `college_event_postevent` VALUES (1,'ramya','ramya@globalensolutions.com',NULL,'innovace',NULL,NULL,'technical','Manakula vinayagar Institue of Technology','Pondicherry','Pondicherry','2015-09-03','2015-09-03','2015-09-03','100','innovace','innovace','CSE','innovace','innovaceinnovace','innovace','innovace','innovace','innovace','','','innovace','innovace','innovace','innovace','innovace','innovace','innovace','innovace','innovace',5,'innovace'),(2,'Neethu','neethu@gmail.com',9874521360,'Zeal','Zeal','Zeal','cultural','Mailam engineering college','Villupuram','Villupuram','2015-09-11','2015-09-11','2015-09-10','100','cultural events','cultural events','ECE','www.zeal.co.in','www.zeal.co.in','www.zeal.co.in','ZEAl\'2K15','ZEAl\'2K15','ZEAl\'2K15','','[]','','Mailam engineering college,Villupuram','Sathish kumar.\r\nMailam engineering college,Villupuram','Sara','Sara','Sara','Sara','Sara','sghfkdjhlnkfgb',10,'jhkdgfresteryrht'),(3,'sara','sara@gmail.com',7895623555,'expo','expo','expo','technical','Mailam engineering college','Villupuram','Villupuram','2015-09-11','2015-09-11','2015-09-10','1000','gfhgfhfh','fhgjh','CSE','dgjjsbgshugquwrh','innovaceinnovace','welcome','welcome','welcome','welcome','','[]','','mailam engg college','fdgfhgfh','gfhgfjh','fryryh','fgfhhhhhhhhhhh','hfhg','gjhkhklj','gfhghg',15,'fsfdgfg');
/*!40000 ALTER TABLE `college_event_postevent` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-03 10:27:22',1,18,'1','www.google.com',1,''),(2,'2015-09-03 10:28:02',1,18,'2','www.google.com',1,''),(3,'2015-09-03 10:28:25',1,18,'3','www.google.com',1,''),(4,'2015-09-03 10:30:53',1,18,'4','www.google.com',1,''),(5,'2015-09-03 10:31:27',1,18,'5','www.google.com',1,''),(6,'2015-09-03 10:31:44',1,18,'6','www.google.com',1,''),(7,'2015-09-03 10:32:11',1,18,'7','www.google.com',1,''),(8,'2015-09-03 10:32:40',1,18,'8','www.google.com',1,''),(9,'2015-09-03 10:50:01',1,18,'9','www.google.com',1,''),(10,'2015-09-03 10:50:30',1,18,'10','www.google.com',1,''),(11,'2015-09-03 10:53:49',1,18,'11','www.google.com',1,''),(12,'2015-09-03 10:54:50',1,18,'12','www.google.com',1,''),(13,'2015-09-07 11:59:36',1,18,'13','www.google.com',1,''),(14,'2015-09-07 12:07:36',1,18,'14','www.google.com',1,''),(15,'2015-09-07 12:08:12',1,18,'15','www.google.com',1,''),(16,'2015-09-07 12:31:26',1,18,'16','www.google.com',1,''),(17,'2015-09-07 12:36:46',1,18,'17','www.google.com',1,''),(18,'2015-09-07 12:38:00',1,18,'18','www.google.com',1,''),(19,'2015-09-07 12:50:16',1,18,'19','www.google.com',1,''),(20,'2015-09-07 12:55:45',1,18,'3','www.google.com',3,''),(21,'2015-09-07 12:55:45',1,18,'2','www.google.com',3,''),(22,'2015-09-07 12:55:45',1,18,'1','www.google.com',3,''),(23,'2015-09-07 12:56:50',1,18,'13','www.google.com',3,''),(24,'2015-09-07 12:59:06',1,18,'18','www.google.com',3,''),(25,'2015-09-07 12:59:06',1,18,'17','www.google.com',3,''),(26,'2015-09-07 12:59:06',1,18,'16','www.google.com',3,''),(27,'2015-09-07 12:59:06',1,18,'15','www.google.com',3,''),(28,'2015-09-07 12:59:06',1,18,'14','www.google.com',3,''),(29,'2015-09-07 13:00:54',1,18,'19','www.google.com',3,''),(30,'2015-09-07 13:00:54',1,18,'12','www.google.com',3,''),(31,'2015-09-07 13:00:54',1,18,'11','www.google.com',3,''),(32,'2015-09-07 13:00:54',1,18,'9','www.google.com',3,''),(33,'2015-09-07 13:00:54',1,18,'8','www.google.com',3,''),(34,'2015-09-07 13:02:50',1,18,'20','www.google.com',1,''),(35,'2015-09-07 13:05:46',1,18,'21','www.google.com',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'category','college_event','category'),(8,'country','college_event','country'),(9,'city','college_event','city'),(10,'location','college_event','location'),(11,'collegetype','college_event','collegetype'),(12,'college','college_event','college'),(13,'department','college_event','department'),(14,'postevent','college_event','postevent'),(15,'user profile','events','userprofile'),(16,'payu details','payu','payudetails'),(17,'transaction','transaction','transaction'),(18,'site banner','banner','sitebanner'),(19,'eventtype','college_event','eventtype');
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
INSERT INTO `django_session` VALUES ('9p5ijbn3heb43d00wygrdd1zfo4vmuys','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:08:43'),('g55iv48i6whxxywb8gt6v6hyvwwp8dx5','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:16:04'),('h9f6ruh2dtznc6bcqxniys5thfy1sx65','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:38'),('mhpm48usctlgd4r45olwknpnonwuivug','YWIxYWQ2N2RlNGE0ODBlOTdjMDE5Mzc3ZDliNGMwNWM2NTVjMWUxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9','2015-09-21 13:08:24'),('szkjbro2ybcfz8zr452c2a8m1hqfuvib','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:45'),('xi31c124jg6kncqdh0hayasf6lua2npy','YTM0MmE0NWM5OWFlYTllYTRhNWUzNWU4ZGZmYTQ5OGUzNTc1NzI5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2015-09-21 06:29:26'),('z8w56o2344w201b9vl0nbbu8gv2gnsqd','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-17 10:23:53');
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
  `city_id` int(11) DEFAULT NULL,
  `mobile` varchar(50) NOT NULL,
  `confirmation_code` varchar(500) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `is_emailverified` tinyint(1) NOT NULL,
  `ad_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `events_userprofile_b376980e` (`city_id`),
  KEY `events_userprofile_d860be3c` (`country_id`),
  CONSTRAINT `city_id_refs_id_695016a4` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `country_id_refs_id_2fdf82b1` FOREIGN KEY (`country_id`) REFERENCES `college_event_country` (`id`),
  CONSTRAINT `user_id_refs_id_acf68b2c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_userprofile`
--

LOCK TABLES `events_userprofile` WRITE;
/*!40000 ALTER TABLE `events_userprofile` DISABLE KEYS */;
INSERT INTO `events_userprofile` VALUES (1,6,NULL,'','QygNP7Ws2hwZCOtveErt0EKfbi6uX9T54',0,NULL,0,NULL),(2,7,NULL,'','mGsDYYMn6vkF7JrilKlQxFqg4JyyTMjw4',0,NULL,0,NULL),(3,8,NULL,'','t5a189W0cTyScbWDBq9cxV1FqZPceQDCN',0,NULL,0,NULL),(4,9,NULL,'','GqfXeewASimSI0pNFeT3UjqRh39kZ32lq',0,NULL,0,NULL),(5,10,NULL,'','9WcLwnb3Kg5G42euryVLbkCJF47O4nVVk',0,NULL,0,NULL),(6,11,NULL,'','RqDOeIklRBHty3gIoydjh1blUdbBpsnIb',0,NULL,0,NULL),(7,12,NULL,'','NyKAMeU0RGGNKXdlYWsbEhCYsaJtPODx5',0,NULL,0,NULL),(8,13,NULL,'','SNBZh8xrr4bIEgVTvqXsESafMfgGi3ne3',0,NULL,0,NULL),(9,14,NULL,'','sFEh3137jF4cUm9kQPfLqRhxlNnja8ZIB',0,NULL,0,NULL);
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
  `userprofile_id` int(11) NOT NULL,
  `mode` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `unmappedstatus` varchar(20) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `txnid` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `cardCategory` varchar(20) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `net_amount_debit` double DEFAULT NULL,
  `addedon` datetime NOT NULL,
  `productinfo` varchar(500) DEFAULT NULL,
  `hash` varchar(250) DEFAULT NULL,
  `payment_source` varchar(20) DEFAULT NULL,
  `PG_TYPE` varchar(20) DEFAULT NULL,
  `bank_ref_num` varchar(50) DEFAULT NULL,
  `bankcode` varchar(20) DEFAULT NULL,
  `error` varchar(20) DEFAULT NULL,
  `error_Message` varchar(100) DEFAULT NULL,
  `name_on_card` varchar(50) DEFAULT NULL,
  `cardnum` varchar(20) DEFAULT NULL,
  `issuing_bank` varchar(50) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`),
  CONSTRAINT `userprofile_id_refs_id_3f437917` FOREIGN KEY (`userprofile_id`) REFERENCES `events_userprofile` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `transaction_transaction_76c5e174` (`payu_details_id`),
  CONSTRAINT `payu_details_id_refs_id_c87c932a` FOREIGN KEY (`payu_details_id`) REFERENCES `payu_payudetails` (`id`)
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

-- Dump completed on 2015-09-07 18:42:46
