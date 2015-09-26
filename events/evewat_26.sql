CREATE DATABASE  IF NOT EXISTS `evewat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `evewat`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: evewat
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(25,'Can add city',9,'add_city'),(26,'Can change city',9,'change_city'),(27,'Can delete city',9,'delete_city'),(34,'Can add college',12,'add_college'),(35,'Can change college',12,'change_college'),(36,'Can delete college',12,'delete_college'),(37,'Can add department',13,'add_department'),(38,'Can change department',13,'change_department'),(39,'Can delete department',13,'delete_department'),(40,'Can add postevent',14,'add_postevent'),(41,'Can change postevent',14,'change_postevent'),(42,'Can delete postevent',14,'delete_postevent'),(43,'Can add user profile',15,'add_userprofile'),(44,'Can change user profile',15,'change_userprofile'),(45,'Can delete user profile',15,'delete_userprofile'),(46,'Can add payu details',16,'add_payudetails'),(47,'Can change payu details',16,'change_payudetails'),(48,'Can delete payu details',16,'delete_payudetails'),(49,'Can add transaction',17,'add_transaction'),(50,'Can change transaction',17,'change_transaction'),(51,'Can delete transaction',17,'delete_transaction'),(52,'Can add site banner',18,'add_sitebanner'),(53,'Can change site banner',18,'change_sitebanner'),(54,'Can delete site banner',18,'delete_sitebanner'),(58,'Can add sub category',20,'add_subcategory'),(59,'Can change sub category',20,'change_subcategory'),(60,'Can delete sub category',20,'delete_subcategory'),(61,'Can add premium price info',21,'add_premiumpriceinfo'),(62,'Can change premium price info',21,'change_premiumpriceinfo'),(63,'Can delete premium price info',21,'delete_premiumpriceinfo'),(64,'Can add order',22,'add_order'),(65,'Can change order',22,'change_order'),(66,'Can delete order',22,'delete_order'),(67,'Can add college department',23,'add_collegedepartment'),(68,'Can change college department',23,'change_collegedepartment'),(69,'Can delete college department',23,'delete_collegedepartment'),(70,'Can add postevent_v2',24,'add_postevent_v2'),(71,'Can change postevent_v2',24,'change_postevent_v2'),(72,'Can delete postevent_v2',24,'delete_postevent_v2');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$O4mFrmTcbemB$PX6wp+Qnubjjlws0McXR1810LElzFCLTSCn9k7uLK9g=','2015-09-26 14:59:49',1,'root','','','root@gmail.com',1,1,'2015-09-02 06:10:23'),(6,'pbkdf2_sha256$12000$8TrIfTKF6iWD$WQdOuOEkAbqEw9HqLjwBTkZI2bOR5u+YKx4CL1h2NEE=','2015-09-10 10:28:05',0,'selvi','','','selvi@gmail.com',0,1,'2015-09-02 07:37:52'),(7,'pbkdf2_sha256$12000$H1vxLMKujW6Y$CTKAD6cChPbJCeopKlWZ+lK1J1R3yHFnvCdwURCRFjA=','2015-09-07 06:29:26',0,'neethu','','','neethu@globalensolutions.com',0,1,'2015-09-02 10:28:44'),(8,'pbkdf2_sha256$12000$3tKROpHmJWom$6G1YyK6hqC1FijF0OZnTqGek7XIHYCiLvvWE5PAOWf8=','2015-09-02 11:20:37',0,'nandhini','','','nandhini@gmail.com',0,1,'2015-09-02 11:20:37'),(9,'pbkdf2_sha256$12000$rJL4df4HTRSb$QGaSu/mWDgkETaudcLB8bpJ1lziVFc/MPPjOF91JAE4=','2015-09-19 07:39:59',0,'ramya','','','ramya@globalensolutions.com',0,1,'2015-09-02 11:39:59'),(10,'pbkdf2_sha256$12000$dodz33cWdAba$MKeqXTWDmYWSnOQIvDogeUrmxgffx2nOeHuln77kBXM=','2015-09-03 05:25:01',0,'sara','','','sara@gmail.com',0,1,'2015-09-02 11:52:30'),(11,'pbkdf2_sha256$12000$ozZMkyELnNKk$ata/kjqiQ7hho/yp8iNc8ObQPsnnGfDG7i1vAIOfbgM=','2015-09-02 12:42:45',0,'pradeepa','','','rpradeepa812@gmail.com',0,1,'2015-09-02 12:42:44'),(12,'pbkdf2_sha256$12000$teZUJ2OLxajr$vySWq0gTYmYGUNaKJz3AsBNNkX20V+NhmUkOxNNKZzc=','2015-09-03 04:36:06',0,'sathish','','','sathish@gmail.com',0,1,'2015-09-03 04:18:30'),(13,'pbkdf2_sha256$12000$4tufUrFqyrxk$euiYIJJpZ3SE3RxAHTFwQKOU2bZhYAGqlfCG9I9WPxs=','2015-09-03 05:17:12',0,'guru','','','guru@globalensolutions.com',0,1,'2015-09-03 05:17:12'),(14,'pbkdf2_sha256$12000$wOXr1pumalFS$5qYDOTbYnBOGO/e17gHBuIs29q0IkTHqezQYoGvebwQ=','2015-09-07 13:08:24',0,'spriya','','','shanmugapriya@gmail.com',0,1,'2015-09-07 12:27:32'),(15,'pbkdf2_sha256$12000$lhN1PiOGpeTN$yzCRaG8a9h73traLvMqKLLZ5xc8APODQwSuNxl/rQHk=','2015-09-09 04:13:16',0,'saran','','','saran@gmail.com',0,1,'2015-09-08 11:38:19'),(16,'pbkdf2_sha256$12000$RnPEuIKwuHdQ$KWIimmTX+0Iu0VXGvzYX+1st8HqYY44Pju7T1Tcnuj4=','2015-09-08 11:56:26',0,'devi','','','devi@gmail.com',0,1,'2015-09-08 11:56:25'),(17,'pbkdf2_sha256$12000$z4PAWSQoGjVf$5UYQ2X8yBChNnm674H+rC5E88QlXD4TlVQhVpkAUfl4=','2015-09-08 12:13:33',0,'user','','','user@gmail.com',0,1,'2015-09-08 12:13:33'),(18,'pbkdf2_sha256$12000$gpfIRxwTn3pb$ClSiJopSqs/IKkHg0T326vNlsfOdSo9gqoRIK5/bX2Y=','2015-09-09 06:54:11',0,'sang','','','sang@gmail.com',0,1,'2015-09-09 06:54:11'),(19,'pbkdf2_sha256$12000$XYc7Gjh5P179$4062AtjrcmSlDJqPuDhQj9ryRZe0IO9hui4m+HrklaI=','2015-09-09 07:29:51',0,'nisha','','','nisha@gmail.com',0,1,'2015-09-09 07:29:51'),(20,'pbkdf2_sha256$12000$xMWzidnYZtnj$SOq1We0xA3vx9H6ddzre7rLrA25z959ulPkhmt01tsY=','2015-09-09 10:18:06',0,'geetha','','','geetha@gmail.com',0,1,'2015-09-09 10:18:06'),(21,'pbkdf2_sha256$12000$VMbxP7ItqKGk$IjYHBGeIPxCg9W7NRve6MBCA333AAGNeI3BenZnfsJ8=','2015-09-22 13:22:45',0,'kalai','','','kalai@gmail.com',0,1,'2015-09-10 04:59:48'),(22,'pbkdf2_sha256$12000$rYeCsFd1svtK$ZblA43UnQphV/gJMmTu8soPV58XC9XRAVtbSES/py40=','2015-09-14 08:42:04',0,'Priya','','','avbmail93@gmail.com',0,1,'2015-09-14 04:31:56'),(23,'pbkdf2_sha256$12000$7OhZIRaR8vnd$BqwLf3CzC2Vp1ohon1zrp9CY3Ps/BBWYfM1CJYBb0ZU=','2015-09-19 07:38:48',0,'sati','','','sati@gmail.com',0,1,'2015-09-19 07:38:47'),(24,'pbkdf2_sha256$10000$fatYvLzOx7iL$SYl+pqmoTD+qKD1VUX9IRwQeAMzPdJKOkxfNsP/2gRw=','2015-09-21 12:31:27',0,'kalaiarasi','','','kalaimca.gsdfd@gmail.com',0,1,'2015-09-21 12:31:27'),(52,'pbkdf2_sha256$12000$yVjzxMFRRdLg$g3ZuG+rLGwAO+uj/RnZ/JzvCdoNYnwLquqa6OEhuFVI=','2015-09-22 04:28:40',0,'test','','','test@gmail.com',0,1,'2015-09-22 04:28:40'),(53,'pbkdf2_sha256$12000$z8ewoq6WXURw$Y4ll2ILZPu35BVMrpkUzcxettJMeFt+geaSttCFTrOA=','2015-09-23 12:57:22',0,'test1','','','test1@gmail.com',0,1,'2015-09-22 04:31:01'),(54,'pbkdf2_sha256$12000$cHwHDJtnlPQX$0mAhSeKoEKsoIvVe5EEdqIfeXvsegsJ1ip2sT/sjCnM=','2015-09-22 04:33:06',0,'test2','','','test2@gmail.com',0,1,'2015-09-22 04:33:05'),(55,'pbkdf2_sha256$12000$SMoIbLw0IlIp$6/RnXGti8i+eDZ2IWXV4dAhqrZJSerTmwUI3fS7C9fE=','2015-09-22 05:08:59',0,'dfdf','','','dadfs@gmail.com',0,1,'2015-09-22 05:08:59'),(56,'pbkdf2_sha256$12000$RS0IcjZ7CDNY$Sx2VSVpz8F0YUQGjT9+p8yiozZMMfNbhQgpYc/D3yEc=','2015-09-22 05:23:37',0,'dasf','','','asdfa@gmail.com',0,1,'2015-09-22 05:23:37'),(57,'pbkdf2_sha256$12000$pIgTtmhxSN8P$2Zyo/cNllXh/u9OesZDD6WheUfBOuRqB/QJ+1XMlDbo=','2015-09-22 05:25:42',0,'dfasfd','','','asdf@gmail.com',0,1,'2015-09-22 05:25:42'),(58,'pbkdf2_sha256$12000$hoWx016TizlP$AkINS6IibXmBc+D8noV3iafWGQ+HY2iimWMnC5nW34Y=','2015-09-22 07:36:51',0,'dfd','','','dfsad@gmail.com',0,1,'2015-09-22 07:36:51'),(59,'pbkdf2_sha256$12000$7VKaYDPOJGV1$ta/jC2A5LleEq0f0faW0ZABwm+XWqVFip6G3eIqkkTs=','2015-09-22 07:38:01',0,'test3','','','test3@gmail.com',0,1,'2015-09-22 07:38:01'),(60,'pbkdf2_sha256$12000$mfnvvEmsv1in$VGErFmPdZMDOL9qGamlUGNrPYCdGPvEOfX7QsKK08gY=','2015-09-22 07:51:33',0,'test4','','','test4@gmail.com',0,1,'2015-09-22 07:51:33'),(61,'pbkdf2_sha256$12000$8egSVvLSNRId$sl3qG6ruan1rVxhyFgGQdRFBDJOkmybQKz+TXqEU8Gs=','2015-09-22 07:52:21',0,'test5','','','test5@gmail.com',0,1,'2015-09-22 07:52:21'),(62,'pbkdf2_sha256$12000$Obw6UzGkw2Cb$W4bk4N9w+4iRWwZXT4yw5V7WjNXMHeWy51KUVfPvaaQ=','2015-09-23 08:35:18',0,'test6','','','test6@gmail.com',0,1,'2015-09-23 08:35:18'),(63,'pbkdf2_sha256$12000$OMj925UyICNT$HlSwNL8JA4cTSHsc5XUsMM+iPvO7I1yjpND8TqNaYjI=','2015-09-25 10:57:09',0,'sastha','','','sastha@gmail.com',0,1,'2015-09-25 10:57:08'),(64,'pbkdf2_sha256$12000$x9tOR0icCwxh$DR/QsT2TvdfLVv0rV94D+Xgpmbpa/hWUBfzYn6lJobg=','2015-09-26 12:09:16',0,'pretheev','','','pretheevraj@gmail.com',0,1,'2015-09-26 11:35:55');
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
  `admin_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (1,'static/banners/dance3.jpeg','www.google.com','/','top',100000,1),(2,'static/banners/kolam.jpeg','www.google.com','/','top',100000,1),(3,'static/banners/images_2.jpeg','www.google.com','/','bottom',50000,NULL),(4,'static/banners/palm.gif','www.google.com','/','bottom',50000,NULL),(5,'static/banners/paper_2.jpg','www.google.com','search/','top',50000,NULL),(6,'static/banners/images_3.jpeg','www.google.com','/','bottom',50000,NULL),(7,'static/banners/dance1.jpg','www.google.com','/','top',100000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
  `state` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT 'IN',
  `country_name` varchar(50) DEFAULT 'india',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1624 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_city`
--

LOCK TABLES `college_event_city` WRITE;
/*!40000 ALTER TABLE `college_event_city` DISABLE KEYS */;
INSERT INTO `college_event_city` VALUES (1,'Pondicherry','Pondicherry','IN','India'),(2,'Chennai','Tamil Nadu','IN','India'),(3,'Adilabad','Andhra Pradesh','IN','india'),(4,'Adoni','Andhra Pradesh','IN','india'),(5,'Amadalavalasa','Andhra Pradesh','IN','india'),(6,'Amalapuram','Andhra Pradesh','IN','india'),(7,'Anakapalle','Andhra Pradesh','IN','india'),(8,'Anantapur','Andhra Pradesh','IN','india'),(9,'Badepalle','Andhra Pradesh','IN','india'),(10,'Banganapalle','Andhra Pradesh','IN','india'),(11,'Bapatla','Andhra Pradesh','IN','india'),(12,'Bellampalle','Andhra Pradesh','IN','india'),(13,'Bethamcherla','Andhra Pradesh','IN','india'),(14,'Bhadrachalam','Andhra Pradesh','IN','india'),(15,'Bhainsa','Andhra Pradesh','IN','india'),(16,'Bheemunipatnam','Andhra Pradesh','IN','india'),(17,'Bhimavaram','Andhra Pradesh','IN','india'),(18,'Bhongir','Andhra Pradesh','IN','india'),(19,'Bobbili','Andhra Pradesh','IN','india'),(20,'Bodhan','Andhra Pradesh','IN','india'),(21,'Chilakaluripet','Andhra Pradesh','IN','india'),(22,'Chirala','Andhra Pradesh','IN','india'),(23,'Chittoor','Andhra Pradesh','IN','india'),(24,'Cuddapah','Andhra Pradesh','IN','india'),(25,'Devarakonda','Andhra Pradesh','IN','india'),(26,'Dharmavaram','Andhra Pradesh','IN','india'),(27,'Eluru','Andhra Pradesh','IN','india'),(28,'Farooqnagar','Andhra Pradesh','IN','india'),(29,'Gadwal','Andhra Pradesh','IN','india'),(30,'Gooty','Andhra Pradesh','IN','india'),(31,'Gudivada','Andhra Pradesh','IN','india'),(32,'Gudur','Andhra Pradesh','IN','india'),(33,'Guntakal','Andhra Pradesh','IN','india'),(34,'Guntur','Andhra Pradesh','IN','india'),(35,'Hanuman Junction','Andhra Pradesh','IN','india'),(36,'Hindupur','Andhra Pradesh','IN','india'),(37,'Hyderabad','Andhra Pradesh','IN','india'),(38,'Ichchapuram','Andhra Pradesh','IN','india'),(39,'Jaggaiahpet','Andhra Pradesh','IN','india'),(40,'Jagtial','Andhra Pradesh','IN','india'),(41,'Jammalamadugu','Andhra Pradesh','IN','india'),(42,'Jangaon','Andhra Pradesh','IN','india'),(43,'Kadapa','Andhra Pradesh','IN','india'),(44,'Kadiri','Andhra Pradesh','IN','india'),(45,'Kagaznagar','Andhra Pradesh','IN','india'),(46,'Kakinada','Andhra Pradesh','IN','india'),(47,'Kalyandurg','Andhra Pradesh','IN','india'),(48,'Kamareddy','Andhra Pradesh','IN','india'),(49,'Kandukur','Andhra Pradesh','IN','india'),(50,'Karimnagar','Andhra Pradesh','IN','india'),(51,'Kavali','Andhra Pradesh','IN','india'),(52,'Khammam','Andhra Pradesh','IN','india'),(53,'Koratla','Andhra Pradesh','IN','india'),(54,'Kothagudem','Andhra Pradesh','IN','india'),(55,'Kothapeta','Andhra Pradesh','IN','india'),(56,'Kovvur','Andhra Pradesh','IN','india'),(57,'Kurnool','Andhra Pradesh','IN','india'),(58,'Kyathampalle','Andhra Pradesh','IN','india'),(59,'Macherla','Andhra Pradesh','IN','india'),(60,'Machilipatnam','Andhra Pradesh','IN','india'),(61,'Madanapalle','Andhra Pradesh','IN','india'),(62,'Mahbubnagar','Andhra Pradesh','IN','india'),(63,'Mancherial','Andhra Pradesh','IN','india'),(64,'Mandamarri','Andhra Pradesh','IN','india'),(65,'Mandapeta','Andhra Pradesh','IN','india'),(66,'Manuguru','Andhra Pradesh','IN','india'),(67,'Markapur','Andhra Pradesh','IN','india'),(68,'Medak','Andhra Pradesh','IN','india'),(69,'Miryalaguda','Andhra Pradesh','IN','india'),(70,'Mogalthur','Andhra Pradesh','IN','india'),(71,'Nagari','Andhra Pradesh','IN','india'),(72,'Nagarkurnool','Andhra Pradesh','IN','india'),(73,'Nandyal','Andhra Pradesh','IN','india'),(74,'Narasapur','Andhra Pradesh','IN','india'),(75,'Narasaraopet','Andhra Pradesh','IN','india'),(76,'Narayanpet','Andhra Pradesh','IN','india'),(77,'Narsipatnam','Andhra Pradesh','IN','india'),(78,'Nellore','Andhra Pradesh','IN','india'),(79,'Nidadavole','Andhra Pradesh','IN','india'),(80,'Nirmal','Andhra Pradesh','IN','india'),(81,'Nizamabad','Andhra Pradesh','IN','india'),(82,'Nuzvid','Andhra Pradesh','IN','india'),(83,'Ongole','Andhra Pradesh','IN','india'),(84,'Palacole','Andhra Pradesh','IN','india'),(85,'Palasa Kasibugga','Andhra Pradesh','IN','india'),(86,'Palwancha','Andhra Pradesh','IN','india'),(87,'Parvathipuram','Andhra Pradesh','IN','india'),(88,'Pedana','Andhra Pradesh','IN','india'),(89,'Peddapuram','Andhra Pradesh','IN','india'),(90,'Pithapuram','Andhra Pradesh','IN','india'),(91,'Pondur','Andhra pradesh','IN','india'),(92,'Ponnur','Andhra Pradesh','IN','india'),(93,'Proddatur','Andhra Pradesh','IN','india'),(94,'Punganur','Andhra Pradesh','IN','india'),(95,'Puttur','Andhra Pradesh','IN','india'),(96,'Rajahmundry','Andhra Pradesh','IN','india'),(97,'Rajam','Andhra Pradesh','IN','india'),(98,'Ramachandrapuram','Andhra Pradesh','IN','india'),(99,'Ramagundam','Andhra Pradesh','IN','india'),(100,'Rayachoti','Andhra Pradesh','IN','india'),(101,'Rayadurg','Andhra Pradesh','IN','india'),(102,'Renigunta','Andhra Pradesh','IN','india'),(103,'Repalle','Andhra Pradesh','IN','india'),(104,'Sadasivpet','Andhra Pradesh','IN','india'),(105,'Salur','Andhra Pradesh','IN','india'),(106,'Samalkot','Andhra Pradesh','IN','india'),(107,'Sangareddy','Andhra Pradesh','IN','india'),(108,'Sattenapalle','Andhra Pradesh','IN','india'),(109,'Siddipet','Andhra Pradesh','IN','india'),(110,'Singapur','Andhra Pradesh','IN','india'),(111,'Sircilla','Andhra Pradesh','IN','india'),(112,'Srikakulam','Andhra Pradesh','IN','india'),(113,'Srikalahasti','Andhra Pradesh','IN','india'),(115,'Suryapet','Andhra Pradesh','IN','india'),(116,'Tadepalligudem','Andhra Pradesh','IN','india'),(117,'Tadpatri','Andhra Pradesh','IN','india'),(118,'Tandur','Andhra Pradesh','IN','india'),(119,'Tanuku','Andhra Pradesh','IN','india'),(120,'Tenali','Andhra Pradesh','IN','india'),(121,'Tirupati','Andhra Pradesh','IN','india'),(122,'Tuni','Andhra Pradesh','IN','india'),(123,'Uravakonda','Andhra Pradesh','IN','india'),(124,'Venkatagiri','Andhra Pradesh','IN','india'),(125,'Vicarabad','Andhra Pradesh','IN','india'),(126,'Vijayawada','Andhra Pradesh','IN','india'),(127,'Vinukonda','Andhra Pradesh','IN','india'),(128,'Visakhapatnam','Andhra Pradesh','IN','india'),(129,'Vizianagaram','Andhra Pradesh','IN','india'),(130,'Wanaparthy','Andhra Pradesh','IN','india'),(131,'Warangal','Andhra Pradesh','IN','india'),(132,'Yellandu','Andhra Pradesh','IN','india'),(133,'Yemmiganur','Andhra Pradesh','IN','india'),(134,'Yerraguntla','Andhra Pradesh','IN','india'),(135,'Zahirabad','Andhra Pradesh','IN','india'),(136,'Rajampet','Andra Pradesh','IN','india'),(137,'Along','Arunachal Pradesh','IN','india'),(138,'Bomdila','Arunachal Pradesh','IN','india'),(139,'Itanagar','Arunachal Pradesh','IN','india'),(140,'Naharlagun','Arunachal Pradesh','IN','india'),(141,'Pasighat','Arunachal Pradesh','IN','india'),(142,'Abhayapuri','Assam','IN','india'),(143,'Amguri','Assam','IN','india'),(144,'Anandnagaar','Assam','IN','india'),(145,'Barpeta','Assam','IN','india'),(146,'Barpeta Road','Assam','IN','india'),(147,'Bilasipara','Assam','IN','india'),(148,'Bongaigaon','Assam','IN','india'),(149,'Dhekiajuli','Assam','IN','india'),(150,'Dhubri','Assam','IN','india'),(151,'Dibrugarh','Assam','IN','india'),(152,'Digboi','Assam','IN','india'),(153,'Diphu','Assam','IN','india'),(154,'Dispur','Assam','IN','india'),(156,'Gauripur','Assam','IN','india'),(157,'Goalpara','Assam','IN','india'),(158,'Golaghat','Assam','IN','india'),(159,'Guwahati','Assam','IN','india'),(160,'Haflong','Assam','IN','india'),(161,'Hailakandi','Assam','IN','india'),(162,'Hojai','Assam','IN','india'),(163,'Jorhat','Assam','IN','india'),(164,'Karimganj','Assam','IN','india'),(165,'Kokrajhar','Assam','IN','india'),(166,'Lanka','Assam','IN','india'),(167,'Lumding','Assam','IN','india'),(168,'Mangaldoi','Assam','IN','india'),(169,'Mankachar','Assam','IN','india'),(170,'Margherita','Assam','IN','india'),(171,'Mariani','Assam','IN','india'),(172,'Marigaon','Assam','IN','india'),(173,'Nagaon','Assam','IN','india'),(174,'Nalbari','Assam','IN','india'),(175,'North Lakhimpur','Assam','IN','india'),(176,'Rangia','Assam','IN','india'),(177,'Sibsagar','Assam','IN','india'),(178,'Silapathar','Assam','IN','india'),(179,'Silchar','Assam','IN','india'),(180,'Tezpur','Assam','IN','india'),(181,'Tinsukia','Assam','IN','india'),(182,'Amarpur','Bihar','IN','india'),(183,'Araria','Bihar','IN','india'),(184,'Areraj','Bihar','IN','india'),(185,'Arrah','Bihar','IN','india'),(186,'Asarganj','Bihar','IN','india'),(187,'Aurangabad','Bihar','IN','india'),(188,'Bagaha','Bihar','IN','india'),(189,'Bahadurganj','Bihar','IN','india'),(190,'Bairgania','Bihar','IN','india'),(191,'Bakhtiarpur','Bihar','IN','india'),(192,'Banka','Bihar','IN','india'),(193,'Banmankhi Bazar','Bihar','IN','india'),(194,'Barahiya','Bihar','IN','india'),(195,'Barauli','Bihar','IN','india'),(196,'Barbigha','Bihar','IN','india'),(197,'Barh','Bihar','IN','india'),(198,'Begusarai','Bihar','IN','india'),(199,'Behea','Bihar','IN','india'),(200,'Bettiah','Bihar','IN','india'),(201,'Bhabua','Bihar','IN','india'),(202,'Bhagalpur','Bihar','IN','india'),(203,'Bihar Sharif','Bihar','IN','india'),(204,'Bikramganj','Bihar','IN','india'),(205,'Bodh Gaya','Bihar','IN','india'),(206,'Buxar','Bihar','IN','india'),(207,'Chandan Bara','Bihar','IN','india'),(208,'Chanpatia','Bihar','IN','india'),(209,'Chhapra','Bihar','IN','india'),(210,'Colgong','Bihar','IN','india'),(211,'Dalsinghsarai','Bihar','IN','india'),(212,'Darbhanga','Bihar','IN','india'),(213,'Daudnagar','Bihar','IN','india'),(214,'Dehri-on-Sone','Bihar','IN','india'),(215,'Dhaka','Bihar','IN','india'),(216,'Dighwara','Bihar','IN','india'),(217,'Dumraon','Bihar','IN','india'),(218,'Fatwah','Bihar','IN','india'),(219,'Forbesganj','Bihar','IN','india'),(220,'Gaya','Bihar','IN','india'),(221,'Gogri Jamalpur','Bihar','IN','india'),(222,'Gopalganj','Bihar','IN','india'),(223,'Hajipur','Bihar','IN','india'),(224,'Hilsa','Bihar','IN','india'),(225,'Hisua','Bihar','IN','india'),(226,'Islampur','Bihar','IN','india'),(227,'Jagdispur','Bihar','IN','india'),(228,'Jamalpur','Bihar','IN','india'),(229,'Jamui','Bihar','IN','india'),(230,'Jehanabad','Bihar','IN','india'),(231,'Jhajha','Bihar','IN','india'),(232,'Jhanjharpur','Bihar','IN','india'),(233,'Jogabani','Bihar','IN','india'),(234,'Kanti','Bihar','IN','india'),(235,'Katihar','Bihar','IN','india'),(236,'Khagaria','Bihar','IN','india'),(237,'Kharagpur','Bihar','IN','india'),(238,'Kishanganj','Bihar','IN','india'),(239,'Lakhisarai','Bihar','IN','india'),(240,'Lalganj','Bihar','IN','india'),(241,'Madhepura','Bihar','IN','india'),(242,'Madhubani','Bihar','IN','india'),(243,'Maharajganj','Bihar','IN','india'),(244,'Mahnar Bazar','Bihar','IN','india'),(245,'Makhdumpur','Bihar','IN','india'),(246,'Maner','Bihar','IN','india'),(247,'Manihari','Bihar','IN','india'),(248,'Marhaura','Bihar','IN','india'),(249,'Masaurhi','Bihar','IN','india'),(250,'Mirganj','Bihar','IN','india'),(251,'Mokameh','Bihar','IN','india'),(252,'Motihari','Bihar','IN','india'),(253,'Motipur','Bihar','IN','india'),(254,'Munger','Bihar','IN','india'),(255,'Murliganj','Bihar','IN','india'),(256,'Muzaffarpur','Bihar','IN','india'),(257,'Narkatiaganj','Bihar','IN','india'),(258,'Naugachhia','Bihar','IN','india'),(259,'Nawada','Bihar','IN','india'),(260,'Nokha','Bihar','IN','india'),(261,'Patna','Bihar','IN','india'),(262,'Piro','Bihar','IN','india'),(263,'Purnia','Bihar','IN','india'),(264,'Rafiganj','Bihar','IN','india'),(265,'Rajgir','Bihar','IN','india'),(266,'Ramnagar','Bihar','IN','india'),(267,'Raxaul Bazar','Bihar','IN','india'),(268,'Revelganj','Bihar','IN','india'),(269,'Rosera','Bihar','IN','india'),(270,'Saharsa','Bihar','IN','india'),(271,'Samastipur','Bihar','IN','india'),(272,'Sasaram','Bihar','IN','india'),(273,'Sheikhpura','Bihar','IN','india'),(274,'Sheohar','Bihar','IN','india'),(275,'Sherghati','Bihar','IN','india'),(276,'Silao','Bihar','IN','india'),(277,'Sitamarhi','Bihar','IN','india'),(278,'Siwan','Bihar','IN','india'),(279,'Sonepur','Bihar','IN','india'),(280,'Sugauli','Bihar','IN','india'),(281,'Sultanganj','Bihar','IN','india'),(282,'Supaul','Bihar','IN','india'),(283,'Warisaliganj','Bihar','IN','india'),(284,'Ahiwara','Chhattisgarh','IN','india'),(285,'Akaltara','Chhattisgarh','IN','india'),(286,'Ambagarh Chowki','Chhattisgarh','IN','india'),(287,'Ambikapur','Chhattisgarh','IN','india'),(288,'Arang','Chhattisgarh','IN','india'),(289,'Bade Bacheli','Chhattisgarh','IN','india'),(290,'Balod','Chhattisgarh','IN','india'),(291,'Baloda Bazar','Chhattisgarh','IN','india'),(292,'Bemetra','Chhattisgarh','IN','india'),(293,'Bhatapara','Chhattisgarh','IN','india'),(294,'Bilaspur','Chhattisgarh','IN','india'),(295,'Birgaon','Chhattisgarh','IN','india'),(296,'Champa','Chhattisgarh','IN','india'),(297,'Chirmiri','Chhattisgarh','IN','india'),(298,'Dalli-Rajhara','Chhattisgarh','IN','india'),(299,'Dhamtari','Chhattisgarh','IN','india'),(300,'Dipka','Chhattisgarh','IN','india'),(301,'Dongargarh','Chhattisgarh','IN','india'),(302,'Durg-Bhilai Nagar','Chhattisgarh','IN','india'),(303,'Gobranawapara','Chhattisgarh','IN','india'),(304,'Jagdalpur','Chhattisgarh','IN','india'),(305,'Janjgir','Chhattisgarh','IN','india'),(306,'Jashpurnagar','Chhattisgarh','IN','india'),(307,'Kanker','Chhattisgarh','IN','india'),(308,'Kawardha','Chhattisgarh','IN','india'),(309,'Kondagaon','Chhattisgarh','IN','india'),(310,'Korba','Chhattisgarh','IN','india'),(311,'Mahasamund','Chhattisgarh','IN','india'),(312,'Mahendragarh','Chhattisgarh','IN','india'),(313,'Mungeli','Chhattisgarh','IN','india'),(314,'Naila Janjgir','Chhattisgarh','IN','india'),(315,'Raigarh','Chhattisgarh','IN','india'),(316,'Raipur','Chhattisgarh','IN','india'),(317,'Rajnandgaon','Chhattisgarh','IN','india'),(318,'Sakti','Chhattisgarh','IN','india'),(319,'Tilda Newra','Chhattisgarh','IN','india'),(320,'Amli','Dadra & Nagar Haveli','IN','india'),(321,'Silvassa','Dadra and Nagar Haveli','IN','india'),(322,'Daman and Diu','Daman & Diu','IN','india'),(323,'Daman and Diu','Daman & Diu','IN','india'),(324,'Asola','Delhi','IN','india'),(325,'Delhi','Delhi','IN','india'),(326,'Aldona','Goa','IN','india'),(327,'Curchorem Cacora','Goa','IN','india'),(328,'Madgaon','Goa','IN','india'),(329,'Mapusa','Goa','IN','india'),(330,'Margao','Goa','IN','india'),(331,'Marmagao','Goa','IN','india'),(332,'Panaji','Goa','IN','india'),(333,'Ahmedabad','Gujarat','IN','india'),(334,'Amreli','Gujarat','IN','india'),(335,'Anand','Gujarat','IN','india'),(336,'Ankleshwar','Gujarat','IN','india'),(337,'Bharuch','Gujarat','IN','india'),(338,'Bhavnagar','Gujarat','IN','india'),(339,'Bhuj','Gujarat','IN','india'),(340,'Cambay','Gujarat','IN','india'),(341,'Dahod','Gujarat','IN','india'),(342,'Deesa','Gujarat','IN','india'),(343,'\"Dharampur',' India\"','IN','india'),(344,'Dholka','Gujarat','IN','india'),(345,'Gandhinagar','Gujarat','IN','india'),(346,'Godhra','Gujarat','IN','india'),(347,'Himatnagar','Gujarat','IN','india'),(348,'Idar','Gujarat','IN','india'),(349,'Jamnagar','Gujarat','IN','india'),(350,'Junagadh','Gujarat','IN','india'),(351,'Kadi','Gujarat','IN','india'),(352,'Kalavad','Gujarat','IN','india'),(353,'Kalol','Gujarat','IN','india'),(354,'Kapadvanj','Gujarat','IN','india'),(355,'Karjan','Gujarat','IN','india'),(356,'Keshod','Gujarat','IN','india'),(357,'Khambhalia','Gujarat','IN','india'),(358,'Khambhat','Gujarat','IN','india'),(359,'Kheda','Gujarat','IN','india'),(360,'Khedbrahma','Gujarat','IN','india'),(361,'Kheralu','Gujarat','IN','india'),(362,'Kodinar','Gujarat','IN','india'),(363,'Lathi','Gujarat','IN','india'),(364,'Limbdi','Gujarat','IN','india'),(365,'Lunawada','Gujarat','IN','india'),(366,'Mahesana','Gujarat','IN','india'),(367,'Mahuva','Gujarat','IN','india'),(368,'Manavadar','Gujarat','IN','india'),(369,'Mandvi','Gujarat','IN','india'),(370,'Mangrol','Gujarat','IN','india'),(371,'Mansa','Gujarat','IN','india'),(372,'Mehmedabad','Gujarat','IN','india'),(373,'Modasa','Gujarat','IN','india'),(374,'Morvi','Gujarat','IN','india'),(375,'Nadiad','Gujarat','IN','india'),(376,'Navsari','Gujarat','IN','india'),(377,'Padra','Gujarat','IN','india'),(378,'Palanpur','Gujarat','IN','india'),(379,'Palitana','Gujarat','IN','india'),(380,'Pardi','Gujarat','IN','india'),(381,'Patan','Gujarat','IN','india'),(382,'Petlad','Gujarat','IN','india'),(383,'Porbandar','Gujarat','IN','india'),(384,'Radhanpur','Gujarat','IN','india'),(385,'Rajkot','Gujarat','IN','india'),(386,'Rajpipla','Gujarat','IN','india'),(387,'Rajula','Gujarat','IN','india'),(388,'Ranavav','Gujarat','IN','india'),(389,'Rapar','Gujarat','IN','india'),(390,'Salaya','Gujarat','IN','india'),(391,'Sanand','Gujarat','IN','india'),(392,'Savarkundla','Gujarat','IN','india'),(393,'Sidhpur','Gujarat','IN','india'),(394,'Sihor','Gujarat','IN','india'),(395,'Songadh','Gujarat','IN','india'),(396,'Surat','Gujarat','IN','india'),(397,'Talaja','Gujarat','IN','india'),(398,'Thangadh','Gujarat','IN','india'),(399,'Tharad','Gujarat','IN','india'),(400,'Umbergaon','Gujarat','IN','india'),(401,'Umreth','Gujarat','IN','india'),(402,'Una','Gujarat','IN','india'),(403,'Unjha','Gujarat','IN','india'),(404,'Upleta','Gujarat','IN','india'),(405,'Vadnagar','Gujarat','IN','india'),(406,'Vadodara','Gujarat','IN','india'),(407,'Valsad','Gujarat','IN','india'),(408,'Vapi','Gujarat','IN','india'),(409,'Vapi','Gujarat','IN','india'),(410,'Veraval','Gujarat','IN','india'),(411,'Vijapur','Gujarat','IN','india'),(412,'Viramgam','Gujarat','IN','india'),(413,'Visnagar','Gujarat','IN','india'),(414,'Vyara','Gujarat','IN','india'),(415,'Wadhwan','Gujarat','IN','india'),(416,'Wankaner','Gujarat','IN','india'),(417,'Adalaj','Gujrat','IN','india'),(418,'Adityana','Gujrat','IN','india'),(419,'Alang','Gujrat','IN','india'),(420,'Ambaji','Gujrat','IN','india'),(421,'Ambaliyasan','Gujrat','IN','india'),(422,'Andada','Gujrat','IN','india'),(423,'Anjar','Gujrat','IN','india'),(424,'Anklav','Gujrat','IN','india'),(425,'Antaliya','Gujrat','IN','india'),(426,'Arambhada','Gujrat','IN','india'),(427,'Atul','Gujrat','IN','india'),(428,'Ballabhgarh','Hariyana','IN','india'),(429,'Ambala','Haryana','IN','india'),(430,'Ambala','Haryana','IN','india'),(431,'Asankhurd','Haryana','IN','india'),(432,'Assandh','Haryana','IN','india'),(433,'Ateli','Haryana','IN','india'),(434,'Babiyal','Haryana','IN','india'),(435,'Bahadurgarh','Haryana','IN','india'),(436,'Barwala','Haryana','IN','india'),(437,'Bhiwani','Haryana','IN','india'),(438,'Charkhi Dadri','Haryana','IN','india'),(439,'Cheeka','Haryana','IN','india'),(440,'Ellenabad 2','Haryana','IN','india'),(441,'Faridabad','Haryana','IN','india'),(442,'Fatehabad','Haryana','IN','india'),(443,'Ganaur','Haryana','IN','india'),(444,'Gharaunda','Haryana','IN','india'),(445,'Gohana','Haryana','IN','india'),(446,'Gurgaon','Haryana','IN','india'),(447,'Haibat(Yamuna Nagar)','Haryana','IN','india'),(448,'Hansi','Haryana','IN','india'),(449,'Hisar','Haryana','IN','india'),(450,'Hodal','Haryana','IN','india'),(451,'Jhajjar','Haryana','IN','india'),(452,'Jind','Haryana','IN','india'),(453,'Kaithal','Haryana','IN','india'),(454,'Kalan Wali','Haryana','IN','india'),(455,'Kalka','Haryana','IN','india'),(456,'Karnal','Haryana','IN','india'),(457,'Ladwa','Haryana','IN','india'),(458,'Mahendragarh','Haryana','IN','india'),(459,'Mandi Dabwali','Haryana','IN','india'),(460,'Narnaul','Haryana','IN','india'),(461,'Narwana','Haryana','IN','india'),(462,'Palwal','Haryana','IN','india'),(463,'Panchkula','Haryana','IN','india'),(464,'Panipat','Haryana','IN','india'),(465,'Pehowa','Haryana','IN','india'),(466,'Pinjore','Haryana','IN','india'),(467,'Rania','Haryana','IN','india'),(468,'Ratia','Haryana','IN','india'),(469,'Rewari','Haryana','IN','india'),(470,'Rohtak','Haryana','IN','india'),(471,'Safidon','Haryana','IN','india'),(472,'Samalkha','Haryana','IN','india'),(473,'Shahbad','Haryana','IN','india'),(474,'Sirsa','Haryana','IN','india'),(475,'Sohna','Haryana','IN','india'),(476,'Sonipat','Haryana','IN','india'),(477,'Taraori','Haryana','IN','india'),(478,'Thanesar','Haryana','IN','india'),(479,'Tohana','Haryana','IN','india'),(480,'Yamunanagar','Haryana','IN','india'),(481,'Arki','Himachal Pradesh','IN','india'),(482,'Baddi','Himachal Pradesh','IN','india'),(483,'Bilaspur','Himachal Pradesh','IN','india'),(484,'Chamba','Himachal Pradesh','IN','india'),(485,'Dalhousie','Himachal Pradesh','IN','india'),(486,'Dharamsala','Himachal Pradesh','IN','india'),(487,'Hamirpur','Himachal Pradesh','IN','india'),(488,'Mandi','Himachal Pradesh','IN','india'),(489,'Nahan','Himachal Pradesh','IN','india'),(490,'Shimla','Himachal Pradesh','IN','india'),(491,'Solan','Himachal Pradesh','IN','india'),(492,'Sundarnagar','Himachal Pradesh','IN','india'),(493,'Jammu','Jammu & Kashmir','IN','india'),(494,'Achabbal','Jammu and Kashmir','IN','india'),(495,'Akhnoor','Jammu and Kashmir','IN','india'),(496,'Anantnag','Jammu and Kashmir','IN','india'),(497,'Arnia','Jammu and Kashmir','IN','india'),(498,'Awantipora','Jammu and Kashmir','IN','india'),(499,'Bandipore','Jammu and Kashmir','IN','india'),(500,'Baramula','Jammu and Kashmir','IN','india'),(501,'Kathua','Jammu and Kashmir','IN','india'),(502,'Leh','Jammu and Kashmir','IN','india'),(503,'Punch','Jammu and Kashmir','IN','india'),(504,'Rajauri','Jammu and Kashmir','IN','india'),(505,'Sopore','Jammu and Kashmir','IN','india'),(506,'Srinagar','Jammu and Kashmir','IN','india'),(507,'Udhampur','Jammu and Kashmir','IN','india'),(508,'Amlabad','Jharkhand','IN','india'),(509,'Ara','Jharkhand','IN','india'),(510,'Barughutu','Jharkhand','IN','india'),(511,'Bokaro Steel City','Jharkhand','IN','india'),(512,'Chaibasa','Jharkhand','IN','india'),(513,'Chakradharpur','Jharkhand','IN','india'),(514,'Chandrapura','Jharkhand','IN','india'),(515,'Chatra','Jharkhand','IN','india'),(516,'Chirkunda','Jharkhand','IN','india'),(517,'Churi','Jharkhand','IN','india'),(518,'Daltonganj','Jharkhand','IN','india'),(519,'Deoghar','Jharkhand','IN','india'),(520,'Dhanbad','Jharkhand','IN','india'),(521,'Dumka','Jharkhand','IN','india'),(522,'Garhwa','Jharkhand','IN','india'),(523,'Ghatshila','Jharkhand','IN','india'),(524,'Giridih','Jharkhand','IN','india'),(525,'Godda','Jharkhand','IN','india'),(526,'Gomoh','Jharkhand','IN','india'),(527,'Gumia','Jharkhand','IN','india'),(528,'Gumla','Jharkhand','IN','india'),(529,'Hazaribag','Jharkhand','IN','india'),(530,'Hussainabad','Jharkhand','IN','india'),(531,'Jamshedpur','Jharkhand','IN','india'),(532,'Jamtara','Jharkhand','IN','india'),(533,'Jhumri Tilaiya','Jharkhand','IN','india'),(534,'Khunti','Jharkhand','IN','india'),(535,'Lohardaga','Jharkhand','IN','india'),(536,'Madhupur','Jharkhand','IN','india'),(537,'Mihijam','Jharkhand','IN','india'),(538,'Musabani','Jharkhand','IN','india'),(539,'Pakaur','Jharkhand','IN','india'),(540,'Patratu','Jharkhand','IN','india'),(541,'Phusro','Jharkhand','IN','india'),(542,'Ramngarh','Jharkhand','IN','india'),(543,'Ranchi','Jharkhand','IN','india'),(544,'Sahibganj','Jharkhand','IN','india'),(545,'Saunda','Jharkhand','IN','india'),(546,'Simdega','Jharkhand','IN','india'),(547,'Tenu Dam-cum- Kathhara','Jharkhand','IN','india'),(548,'Arasikere','Karnataka','IN','india'),(549,'Bangalore','Karnataka','IN','india'),(550,'Belgaum','Karnataka','IN','india'),(551,'Bellary','Karnataka','IN','india'),(552,'Chamrajnagar','Karnataka','IN','india'),(553,'Chikkaballapur','Karnataka','IN','india'),(554,'Chintamani','Karnataka','IN','india'),(555,'Chitradurga','Karnataka','IN','india'),(556,'Gulbarga','Karnataka','IN','india'),(557,'Gundlupet','Karnataka','IN','india'),(558,'Hassan','Karnataka','IN','india'),(559,'Hospet','Karnataka','IN','india'),(560,'Hubli','Karnataka','IN','india'),(561,'Karkala','Karnataka','IN','india'),(562,'Karwar','Karnataka','IN','india'),(563,'Kolar','Karnataka','IN','india'),(564,'Kota','Karnataka','IN','india'),(565,'Lakshmeshwar','Karnataka','IN','india'),(566,'Lingsugur','Karnataka','IN','india'),(567,'Maddur','Karnataka','IN','india'),(568,'Madhugiri','Karnataka','IN','india'),(569,'Madikeri','Karnataka','IN','india'),(570,'Magadi','Karnataka','IN','india'),(571,'Mahalingpur','Karnataka','IN','india'),(572,'Malavalli','Karnataka','IN','india'),(573,'Malur','Karnataka','IN','india'),(574,'Mandya','Karnataka','IN','india'),(575,'Mangalore','Karnataka','IN','india'),(576,'Manvi','Karnataka','IN','india'),(577,'Mudalgi','Karnataka','IN','india'),(578,'Mudbidri','Karnataka','IN','india'),(579,'Muddebihal','Karnataka','IN','india'),(580,'Mudhol','Karnataka','IN','india'),(581,'Mulbagal','Karnataka','IN','india'),(582,'Mundargi','Karnataka','IN','india'),(583,'Mysore','Karnataka','IN','india'),(584,'Nanjangud','Karnataka','IN','india'),(585,'Pavagada','Karnataka','IN','india'),(586,'Puttur','Karnataka','IN','india'),(587,'Rabkavi Banhatti','Karnataka','IN','india'),(588,'Raichur','Karnataka','IN','india'),(589,'Ramanagaram','Karnataka','IN','india'),(590,'Ramdurg','Karnataka','IN','india'),(591,'Ranibennur','Karnataka','IN','india'),(592,'Robertson Pet','Karnataka','IN','india'),(593,'Ron','Karnataka','IN','india'),(594,'Sadalgi','Karnataka','IN','india'),(595,'Sagar','Karnataka','IN','india'),(596,'Sakleshpur','Karnataka','IN','india'),(597,'Sandur','Karnataka','IN','india'),(598,'Sankeshwar','Karnataka','IN','india'),(599,'Saundatti-Yellamma','Karnataka','IN','india'),(600,'Savanur','Karnataka','IN','india'),(601,'Sedam','Karnataka','IN','india'),(602,'Shahabad','Karnataka','IN','india'),(603,'Shahpur','Karnataka','IN','india'),(604,'Shiggaon','Karnataka','IN','india'),(605,'Shikapur','Karnataka','IN','india'),(606,'Shimoga','Karnataka','IN','india'),(607,'Shorapur','Karnataka','IN','india'),(608,'Shrirangapattana','Karnataka','IN','india'),(609,'Sidlaghatta','Karnataka','IN','india'),(610,'Sindgi','Karnataka','IN','india'),(611,'Sindhnur','Karnataka','IN','india'),(612,'Sira','Karnataka','IN','india'),(613,'Sirsi','Karnataka','IN','india'),(614,'Siruguppa','Karnataka','IN','india'),(615,'Srinivaspur','Karnataka','IN','india'),(616,'Talikota','Karnataka','IN','india'),(617,'Tarikere','Karnataka','IN','india'),(618,'Tekkalakota','Karnataka','IN','india'),(619,'Terdal','Karnataka','IN','india'),(620,'Tiptur','Karnataka','IN','india'),(621,'Tumkur','Karnataka','IN','india'),(622,'Udupi','Karnataka','IN','india'),(623,'Vijayapura','Karnataka','IN','india'),(624,'Wadi','Karnataka','IN','india'),(625,'Yadgir','Karnataka','IN','india'),(626,'Adoor','Kerala','IN','india'),(627,'Akathiyoor','Kerala','IN','india'),(628,'Alappuzha','Kerala','IN','india'),(629,'Ancharakandy','Kerala','IN','india'),(630,'Aroor','Kerala','IN','india'),(631,'Ashtamichira','Kerala','IN','india'),(632,'Attingal','Kerala','IN','india'),(633,'Avinissery','Kerala','IN','india'),(634,'Chalakudy','Kerala','IN','india'),(635,'Changanassery','Kerala','IN','india'),(636,'Chendamangalam','Kerala','IN','india'),(637,'Chengannur','Kerala','IN','india'),(638,'Cherthala','Kerala','IN','india'),(639,'Cheruthazham','Kerala','IN','india'),(640,'Chittur-Thathamangalam','Kerala','IN','india'),(641,'Chockli','Kerala','IN','india'),(642,'Erattupetta','Kerala','IN','india'),(643,'Guruvayoor','Kerala','IN','india'),(644,'Irinjalakuda','Kerala','IN','india'),(645,'Kadirur','Kerala','IN','india'),(646,'Kalliasseri','Kerala','IN','india'),(647,'Kalpetta','Kerala','IN','india'),(648,'Kanhangad','Kerala','IN','india'),(649,'Kanjikkuzhi','Kerala','IN','india'),(650,'Kannur','Kerala','IN','india'),(651,'Kasaragod','Kerala','IN','india'),(652,'Kayamkulam','Kerala','IN','india'),(653,'Kochi','Kerala','IN','india'),(654,'Kodungallur','Kerala','IN','india'),(655,'Kollam','Kerala','IN','india'),(656,'Koothuparamba','Kerala','IN','india'),(657,'Kothamangalam','Kerala','IN','india'),(658,'Kottayam','Kerala','IN','india'),(659,'Kozhikode','Kerala','IN','india'),(660,'Kunnamkulam','Kerala','IN','india'),(661,'Malappuram','Kerala','IN','india'),(662,'Mattannur','Kerala','IN','india'),(663,'Mavelikkara','Kerala','IN','india'),(664,'Mavoor','Kerala','IN','india'),(665,'Muvattupuzha','Kerala','IN','india'),(666,'Nedumangad','Kerala','IN','india'),(667,'Neyyattinkara','Kerala','IN','india'),(668,'Ottappalam','Kerala','IN','india'),(669,'Palai','Kerala','IN','india'),(670,'Palakkad','Kerala','IN','india'),(671,'Panniyannur','Kerala','IN','india'),(672,'Pappinisseri','Kerala','IN','india'),(673,'Paravoor','Kerala','IN','india'),(674,'Pathanamthitta','Kerala','IN','india'),(675,'Payyannur','Kerala','IN','india'),(676,'Peringathur','Kerala','IN','india'),(677,'Perinthalmanna','Kerala','IN','india'),(678,'Perumbavoor','Kerala','IN','india'),(679,'Ponnani','Kerala','IN','india'),(680,'Punalur','Kerala','IN','india'),(681,'Quilandy','Kerala','IN','india'),(682,'Shoranur','Kerala','IN','india'),(683,'Taliparamba','Kerala','IN','india'),(684,'Thiruvalla','Kerala','IN','india'),(685,'Thiruvananthapuram','Kerala','IN','india'),(686,'Thodupuzha','Kerala','IN','india'),(687,'Thrissur','Kerala','IN','india'),(688,'Tirur','Kerala','IN','india'),(689,'Vadakara','Kerala','IN','india'),(690,'Vaikom','Kerala','IN','india'),(691,'Varkala','Kerala','IN','india'),(692,'Kavaratti','Lakshadweep','IN','india'),(693,'Ashok Nagar','Madhya Pradesh','IN','india'),(694,'Balaghat','Madhya Pradesh','IN','india'),(695,'Betul','Madhya Pradesh','IN','india'),(696,'Bhopal','Madhya Pradesh','IN','india'),(697,'Burhanpur','Madhya Pradesh','IN','india'),(698,'Chhatarpur','Madhya Pradesh','IN','india'),(699,'Dabra','Madhya Pradesh','IN','india'),(700,'Datia','Madhya Pradesh','IN','india'),(701,'Dewas','Madhya Pradesh','IN','india'),(702,'Dhar','Madhya Pradesh','IN','india'),(703,'Fatehabad','Madhya Pradesh','IN','india'),(704,'Gwalior','Madhya Pradesh','IN','india'),(705,'Indore','Madhya Pradesh','IN','india'),(706,'Itarsi','Madhya Pradesh','IN','india'),(707,'Jabalpur','Madhya Pradesh','IN','india'),(708,'Katni','Madhya Pradesh','IN','india'),(709,'Kotma','Madhya Pradesh','IN','india'),(710,'Lahar','Madhya Pradesh','IN','india'),(711,'Lundi','Madhya Pradesh','IN','india'),(712,'Maharajpur','Madhya Pradesh','IN','india'),(713,'Mahidpur','Madhya Pradesh','IN','india'),(714,'Maihar','Madhya Pradesh','IN','india'),(715,'Malajkhand','Madhya Pradesh','IN','india'),(716,'Manasa','Madhya Pradesh','IN','india'),(717,'Manawar','Madhya Pradesh','IN','india'),(718,'Mandideep','Madhya Pradesh','IN','india'),(719,'Mandla','Madhya Pradesh','IN','india'),(720,'Mandsaur','Madhya Pradesh','IN','india'),(721,'Mauganj','Madhya Pradesh','IN','india'),(722,'Mhow Cantonment','Madhya Pradesh','IN','india'),(723,'Mhowgaon','Madhya Pradesh','IN','india'),(724,'Morena','Madhya Pradesh','IN','india'),(725,'Multai','Madhya Pradesh','IN','india'),(726,'Murwara','Madhya Pradesh','IN','india'),(727,'Nagda','Madhya Pradesh','IN','india'),(728,'Nainpur','Madhya Pradesh','IN','india'),(729,'Narsinghgarh','Madhya Pradesh','IN','india'),(730,'Narsinghgarh','Madhya Pradesh','IN','india'),(731,'Neemuch','Madhya Pradesh','IN','india'),(732,'Nepanagar','Madhya Pradesh','IN','india'),(733,'Niwari','Madhya Pradesh','IN','india'),(734,'Nowgong','Madhya Pradesh','IN','india'),(735,'Nowrozabad','Madhya Pradesh','IN','india'),(736,'Pachore','Madhya Pradesh','IN','india'),(737,'Pali','Madhya Pradesh','IN','india'),(738,'Panagar','Madhya Pradesh','IN','india'),(739,'Pandhurna','Madhya Pradesh','IN','india'),(740,'Panna','Madhya Pradesh','IN','india'),(741,'Pasan','Madhya Pradesh','IN','india'),(742,'Pipariya','Madhya Pradesh','IN','india'),(743,'Pithampur','Madhya Pradesh','IN','india'),(744,'Porsa','Madhya Pradesh','IN','india'),(745,'Prithvipur','Madhya Pradesh','IN','india'),(746,'Raghogarh-Vijaypur','Madhya Pradesh','IN','india'),(747,'Rahatgarh','Madhya Pradesh','IN','india'),(748,'Raisen','Madhya Pradesh','IN','india'),(749,'Rajgarh','Madhya Pradesh','IN','india'),(750,'Ratlam','Madhya Pradesh','IN','india'),(751,'Rau','Madhya Pradesh','IN','india'),(752,'Rehli','Madhya Pradesh','IN','india'),(753,'Rewa','Madhya Pradesh','IN','india'),(754,'Sabalgarh','Madhya Pradesh','IN','india'),(755,'Sagar','Madhya Pradesh','IN','india'),(756,'Sanawad','Madhya Pradesh','IN','india'),(757,'Sarangpur','Madhya Pradesh','IN','india'),(758,'Sarni','Madhya Pradesh','IN','india'),(759,'Satna','Madhya Pradesh','IN','india'),(760,'Sausar','Madhya Pradesh','IN','india'),(761,'Sehore','Madhya Pradesh','IN','india'),(762,'Sendhwa','Madhya Pradesh','IN','india'),(763,'Seoni','Madhya Pradesh','IN','india'),(764,'Seoni-Malwa','Madhya Pradesh','IN','india'),(765,'Shahdol','Madhya Pradesh','IN','india'),(766,'Shajapur','Madhya Pradesh','IN','india'),(767,'Shamgarh','Madhya Pradesh','IN','india'),(768,'Sheopur','Madhya Pradesh','IN','india'),(769,'Shivpuri','Madhya Pradesh','IN','india'),(770,'Shujalpur','Madhya Pradesh','IN','india'),(771,'Sidhi','Madhya Pradesh','IN','india'),(772,'Sihora','Madhya Pradesh','IN','india'),(773,'Singrauli','Madhya Pradesh','IN','india'),(774,'Sironj','Madhya Pradesh','IN','india'),(775,'Sohagpur','Madhya Pradesh','IN','india'),(776,'Tarana','Madhya Pradesh','IN','india'),(777,'Tikamgarh','Madhya Pradesh','IN','india'),(778,'Ujhani','Madhya Pradesh','IN','india'),(779,'Ujjain','Madhya Pradesh','IN','india'),(780,'Umaria','Madhya Pradesh','IN','india'),(781,'Vidisha','Madhya Pradesh','IN','india'),(782,'Wara Seoni','Madhya Pradesh','IN','india'),(783,'Ahmednagar','Maharashtra','IN','india'),(784,'Akola','Maharashtra','IN','india'),(785,'Amravati','Maharashtra','IN','india'),(786,'Aurangabad','Maharashtra','IN','india'),(787,'Baramati','Maharashtra','IN','india'),(788,'Chalisgaon','Maharashtra','IN','india'),(789,'Chinchani','Maharashtra','IN','india'),(790,'Devgarh','Maharashtra','IN','india'),(791,'Dhule','Maharashtra','IN','india'),(792,'Dombivli','Maharashtra','IN','india'),(793,'Durgapur','Maharashtra','IN','india'),(794,'Ichalkaranji','Maharashtra','IN','india'),(795,'Jalna','Maharashtra','IN','india'),(796,'Kalyan','Maharashtra','IN','india'),(797,'Latur','Maharashtra','IN','india'),(798,'Loha','Maharashtra','IN','india'),(799,'Lonar','Maharashtra','IN','india'),(800,'Lonavla','Maharashtra','IN','india'),(801,'Mahad','Maharashtra','IN','india'),(802,'Mahuli','Maharashtra','IN','india'),(803,'Malegaon','Maharashtra','IN','india'),(804,'Malkapur','Maharashtra','IN','india'),(805,'Manchar','Maharashtra','IN','india'),(806,'Mangalvedhe','Maharashtra','IN','india'),(807,'Mangrulpir','Maharashtra','IN','india'),(808,'Manjlegaon','Maharashtra','IN','india'),(809,'Manmad','Maharashtra','IN','india'),(810,'Manwath','Maharashtra','IN','india'),(811,'Mehkar','Maharashtra','IN','india'),(812,'Mhaswad','Maharashtra','IN','india'),(813,'Miraj','Maharashtra','IN','india'),(814,'Morshi','Maharashtra','IN','india'),(815,'Mukhed','Maharashtra','IN','india'),(816,'Mul','Maharashtra','IN','india'),(817,'Mumbai','Maharashtra','IN','india'),(818,'Murtijapur','Maharashtra','IN','india'),(819,'Nagpur','Maharashtra','IN','india'),(820,'Nalasopara','Maharashtra','IN','india'),(821,'Nanded-Waghala','Maharashtra','IN','india'),(822,'Nandgaon','Maharashtra','IN','india'),(823,'Nandura','Maharashtra','IN','india'),(824,'Nandurbar','Maharashtra','IN','india'),(825,'Narkhed','Maharashtra','IN','india'),(826,'Nashik','Maharashtra','IN','india'),(827,'Navi Mumbai','Maharashtra','IN','india'),(828,'Nawapur','Maharashtra','IN','india'),(829,'Nilanga','Maharashtra','IN','india'),(830,'Osmanabad','Maharashtra','IN','india'),(831,'Ozar','Maharashtra','IN','india'),(832,'Pachora','Maharashtra','IN','india'),(833,'Paithan','Maharashtra','IN','india'),(834,'Palghar','Maharashtra','IN','india'),(835,'Pandharkaoda','Maharashtra','IN','india'),(836,'Pandharpur','Maharashtra','IN','india'),(837,'Panvel','Maharashtra','IN','india'),(838,'Parbhani','Maharashtra','IN','india'),(839,'Parli','Maharashtra','IN','india'),(840,'Parola','Maharashtra','IN','india'),(841,'Partur','Maharashtra','IN','india'),(842,'Pathardi','Maharashtra','IN','india'),(843,'Pathri','Maharashtra','IN','india'),(844,'Patur','Maharashtra','IN','india'),(845,'Pauni','Maharashtra','IN','india'),(846,'Pen','Maharashtra','IN','india'),(847,'Phaltan','Maharashtra','IN','india'),(848,'Pulgaon','Maharashtra','IN','india'),(849,'Pune','Maharashtra','IN','india'),(850,'Purna','Maharashtra','IN','india'),(851,'Pusad','Maharashtra','IN','india'),(852,'Rahuri','Maharashtra','IN','india'),(853,'Rajura','Maharashtra','IN','india'),(854,'Ramtek','Maharashtra','IN','india'),(855,'Ratnagiri','Maharashtra','IN','india'),(856,'Raver','Maharashtra','IN','india'),(857,'Risod','Maharashtra','IN','india'),(858,'Sailu','Maharashtra','IN','india'),(859,'Sangamner','Maharashtra','IN','india'),(860,'Sangli','Maharashtra','IN','india'),(861,'Sangole','Maharashtra','IN','india'),(862,'Sasvad','Maharashtra','IN','india'),(863,'Satana','Maharashtra','IN','india'),(864,'Satara','Maharashtra','IN','india'),(865,'Savner','Maharashtra','IN','india'),(866,'Sawantwadi','Maharashtra','IN','india'),(867,'Shahade','Maharashtra','IN','india'),(868,'Shegaon','Maharashtra','IN','india'),(869,'Shendurjana','Maharashtra','IN','india'),(870,'Shirdi','Maharashtra','IN','india'),(871,'Shirpur-Warwade','Maharashtra','IN','india'),(872,'Shirur','Maharashtra','IN','india'),(873,'Shrigonda','Maharashtra','IN','india'),(874,'Shrirampur','Maharashtra','IN','india'),(875,'Sillod','Maharashtra','IN','india'),(876,'Sinnar','Maharashtra','IN','india'),(877,'Solapur','Maharashtra','IN','india'),(878,'Soyagaon','Maharashtra','IN','india'),(879,'Talegaon Dabhade','Maharashtra','IN','india'),(880,'Talode','Maharashtra','IN','india'),(881,'Tasgaon','Maharashtra','IN','india'),(882,'Tirora','Maharashtra','IN','india'),(883,'Tuljapur','Maharashtra','IN','india'),(884,'Tumsar','Maharashtra','IN','india'),(885,'Uran','Maharashtra','IN','india'),(886,'Uran Islampur','Maharashtra','IN','india'),(887,'Wadgaon Road','Maharashtra','IN','india'),(888,'Wai','Maharashtra','IN','india'),(889,'Wani','Maharashtra','IN','india'),(890,'Wardha','Maharashtra','IN','india'),(891,'Warora','Maharashtra','IN','india'),(892,'Warud','Maharashtra','IN','india'),(893,'Washim','Maharashtra','IN','india'),(894,'Yevla','Maharashtra','IN','india'),(895,'Uchgaon','Maharastra','IN','india'),(896,'Udgir','Maharastra','IN','india'),(897,'Umarga','Maharastra','IN','india'),(898,'Umarkhed','Maharastra','IN','india'),(899,'Umred','Maharastra','IN','india'),(900,'Vadgaon Kasba','Maharastra','IN','india'),(901,'Vaijapur','Maharastra','IN','india'),(902,'Vasai','Maharastra','IN','india'),(903,'Virar','Maharastra','IN','india'),(904,'Vita','Maharastra','IN','india'),(905,'Yavatmal','Maharastra','IN','india'),(906,'Yawal','Maharastra','IN','india'),(907,'Imphal','Manipur','IN','india'),(908,'Kakching','Manipur','IN','india'),(909,'Lilong','Manipur','IN','india'),(910,'Mayang Imphal','Manipur','IN','india'),(911,'Thoubal','Manipur','IN','india'),(912,'Jowai','Meghalaya','IN','india'),(913,'Nongstoin','Meghalaya','IN','india'),(914,'Shillong','Meghalaya','IN','india'),(915,'Tura','Meghalaya','IN','india'),(916,'Aizawl','Mizoram','IN','india'),(917,'Champhai','Mizoram','IN','india'),(918,'Lunglei','Mizoram','IN','india'),(919,'Saiha','Mizoram','IN','india'),(920,'Dimapur','Nagaland','IN','india'),(921,'Kohima','Nagaland','IN','india'),(922,'Mokokchung','Nagaland','IN','india'),(923,'Tuensang','Nagaland','IN','india'),(924,'Wokha','Nagaland','IN','india'),(925,'Zunheboto','Nagaland','IN','india'),(950,'Anandapur','Orissa','IN','india'),(951,'Anugul','Orissa','IN','india'),(952,'Asika','Orissa','IN','india'),(953,'Balangir','Orissa','IN','india'),(954,'Balasore','Orissa','IN','india'),(955,'Baleshwar','Orissa','IN','india'),(956,'Bamra','Orissa','IN','india'),(957,'Barbil','Orissa','IN','india'),(958,'Bargarh','Orissa','IN','india'),(959,'Bargarh','Orissa','IN','india'),(960,'Baripada','Orissa','IN','india'),(961,'Basudebpur','Orissa','IN','india'),(962,'Belpahar','Orissa','IN','india'),(963,'Bhadrak','Orissa','IN','india'),(964,'Bhawanipatna','Orissa','IN','india'),(965,'Bhuban','Orissa','IN','india'),(966,'Bhubaneswar','Orissa','IN','india'),(967,'Biramitrapur','Orissa','IN','india'),(968,'Brahmapur','Orissa','IN','india'),(969,'Brajrajnagar','Orissa','IN','india'),(970,'Byasanagar','Orissa','IN','india'),(971,'Cuttack','Orissa','IN','india'),(972,'Debagarh','Orissa','IN','india'),(973,'Dhenkanal','Orissa','IN','india'),(974,'Gunupur','Orissa','IN','india'),(975,'Hinjilicut','Orissa','IN','india'),(976,'Jagatsinghapur','Orissa','IN','india'),(977,'Jajapur','Orissa','IN','india'),(978,'Jaleswar','Orissa','IN','india'),(979,'Jatani','Orissa','IN','india'),(980,'Jeypur','Orissa','IN','india'),(981,'Jharsuguda','Orissa','IN','india'),(982,'Joda','Orissa','IN','india'),(983,'Kantabanji','Orissa','IN','india'),(984,'Karanjia','Orissa','IN','india'),(985,'Kendrapara','Orissa','IN','india'),(986,'Kendujhar','Orissa','IN','india'),(987,'Khordha','Orissa','IN','india'),(988,'Koraput','Orissa','IN','india'),(989,'Malkangiri','Orissa','IN','india'),(990,'Nabarangapur','Orissa','IN','india'),(991,'Paradip','Orissa','IN','india'),(992,'Parlakhemundi','Orissa','IN','india'),(993,'Pattamundai','Orissa','IN','india'),(994,'Phulabani','Orissa','IN','india'),(995,'Puri','Orissa','IN','india'),(996,'Rairangpur','Orissa','IN','india'),(997,'Rajagangapur','Orissa','IN','india'),(998,'Raurkela','Orissa','IN','india'),(999,'Rayagada','Orissa','IN','india'),(1000,'Sambalpur','Orissa','IN','india'),(1001,'Soro','Orissa','IN','india'),(1002,'Sunabeda','Orissa','IN','india'),(1003,'Sundargarh','Orissa','IN','india'),(1004,'Talcher','Orissa','IN','india'),(1005,'Titlagarh','Orissa','IN','india'),(1006,'Umarkote','Orissa','IN','india'),(1007,'Karaikal','Pondicherry','IN','india'),(1008,'Mahe','Pondicherry','IN','india'),(1009,'Kolhapur','Maharashtra','IN','india'),(1010,'Yanam','Pondicherry','IN','india'),(1011,'Ahmedgarh','Punjab','IN','india'),(1012,'Amritsar','Punjab','IN','india'),(1013,'Barnala','Punjab','IN','india'),(1014,'Batala','Punjab','IN','india'),(1015,'Bathinda','Punjab','IN','india'),(1016,'Bhagha Purana','Punjab','IN','india'),(1017,'Budhlada','Punjab','IN','india'),(1018,'Chandigarh','Punjab','IN','india'),(1019,'Dasua','Punjab','IN','india'),(1020,'Dhuri','Punjab','IN','india'),(1021,'Dinanagar','Punjab','IN','india'),(1022,'Faridkot','Punjab','IN','india'),(1023,'Fazilka','Punjab','IN','india'),(1024,'Firozpur','Punjab','IN','india'),(1025,'Firozpur Cantt.','Punjab','IN','india'),(1026,'Giddarbaha','Punjab','IN','india'),(1027,'Gobindgarh','Punjab','IN','india'),(1028,'Gurdaspur','Punjab','IN','india'),(1029,'Hoshiarpur','Punjab','IN','india'),(1030,'Jagraon','Punjab','IN','india'),(1031,'Jaitu','Punjab','IN','india'),(1032,'Jalalabad','Punjab','IN','india'),(1033,'Jalandhar','Punjab','IN','india'),(1034,'Jalandhar Cantt.','Punjab','IN','india'),(1035,'Jandiala','Punjab','IN','india'),(1036,'Kapurthala','Punjab','IN','india'),(1037,'Karoran','Punjab','IN','india'),(1038,'Kartarpur','Punjab','IN','india'),(1039,'Khanna','Punjab','IN','india'),(1040,'Kharar','Punjab','IN','india'),(1041,'Kot Kapura','Punjab','IN','india'),(1042,'Kurali','Punjab','IN','india'),(1043,'Longowal','Punjab','IN','india'),(1044,'Ludhiana','Punjab','IN','india'),(1045,'Malerkotla','Punjab','IN','india'),(1046,'Malout','Punjab','IN','india'),(1047,'Mansa','Punjab','IN','india'),(1048,'Maur','Punjab','IN','india'),(1049,'Moga','Punjab','IN','india'),(1050,'Mohali','Punjab','IN','india'),(1051,'Morinda','Punjab','IN','india'),(1052,'Mukerian','Punjab','IN','india'),(1053,'Muktsar','Punjab','IN','india'),(1054,'Nabha','Punjab','IN','india'),(1055,'Nakodar','Punjab','IN','india'),(1056,'Nangal','Punjab','IN','india'),(1057,'Nawanshahr','Punjab','IN','india'),(1058,'Pathankot','Punjab','IN','india'),(1059,'Patiala','Punjab','IN','india'),(1060,'Patran','Punjab','IN','india'),(1061,'Patti','Punjab','IN','india'),(1062,'Phagwara','Punjab','IN','india'),(1063,'Phillaur','Punjab','IN','india'),(1064,'Qadian','Punjab','IN','india'),(1065,'Raikot','Punjab','IN','india'),(1066,'Rajpura','Punjab','IN','india'),(1067,'Rampura Phul','Punjab','IN','india'),(1068,'Rupnagar','Punjab','IN','india'),(1069,'Samana','Punjab','IN','india'),(1070,'Sangrur','Punjab','IN','india'),(1071,'Sirhind Fatehgarh Sahib','Punjab','IN','india'),(1072,'Sujanpur','Punjab','IN','india'),(1073,'Sunam','Punjab','IN','india'),(1074,'Talwara','Punjab','IN','india'),(1075,'Tarn Taran','Punjab','IN','india'),(1076,'Urmar Tanda','Punjab','IN','india'),(1077,'Zira','Punjab','IN','india'),(1078,'Zirakpur','Punjab','IN','india'),(1079,'Bali','Rajastan','IN','india'),(1080,'Banswara','Rajastan','IN','india'),(1081,'Ajmer','Rajasthan','IN','india'),(1082,'Alwar','Rajasthan','IN','india'),(1083,'Bandikui','Rajasthan','IN','india'),(1084,'Baran','Rajasthan','IN','india'),(1085,'Barmer','Rajasthan','IN','india'),(1086,'Bikaner','Rajasthan','IN','india'),(1087,'Fatehpur','Rajasthan','IN','india'),(1088,'Jaipur','Rajasthan','IN','india'),(1089,'Jaisalmer','Rajasthan','IN','india'),(1090,'Jodhpur','Rajasthan','IN','india'),(1091,'Kota','Rajasthan','IN','india'),(1092,'Lachhmangarh','Rajasthan','IN','india'),(1093,'Ladnu','Rajasthan','IN','india'),(1094,'Lakheri','Rajasthan','IN','india'),(1095,'Lalsot','Rajasthan','IN','india'),(1096,'Losal','Rajasthan','IN','india'),(1097,'Makrana','Rajasthan','IN','india'),(1098,'Malpura','Rajasthan','IN','india'),(1099,'Mandalgarh','Rajasthan','IN','india'),(1100,'Mandawa','Rajasthan','IN','india'),(1101,'Mangrol','Rajasthan','IN','india'),(1102,'Merta City','Rajasthan','IN','india'),(1103,'Mount Abu','Rajasthan','IN','india'),(1104,'Nadbai','Rajasthan','IN','india'),(1105,'Nagar','Rajasthan','IN','india'),(1106,'Nagaur','Rajasthan','IN','india'),(1107,'Nargund','Rajasthan','IN','india'),(1108,'Nasirabad','Rajasthan','IN','india'),(1109,'Nathdwara','Rajasthan','IN','india'),(1110,'Navalgund','Rajasthan','IN','india'),(1111,'Nawalgarh','Rajasthan','IN','india'),(1112,'Neem-Ka-Thana','Rajasthan','IN','india'),(1113,'Nelamangala','Rajasthan','IN','india'),(1114,'Nimbahera','Rajasthan','IN','india'),(1115,'Nipani','Rajasthan','IN','india'),(1116,'Niwai','Rajasthan','IN','india'),(1117,'Nohar','Rajasthan','IN','india'),(1118,'Nokha','Rajasthan','IN','india'),(1119,'Pali','Rajasthan','IN','india'),(1120,'Phalodi','Rajasthan','IN','india'),(1121,'Phulera','Rajasthan','IN','india'),(1122,'Pilani','Rajasthan','IN','india'),(1123,'Pilibanga','Rajasthan','IN','india'),(1124,'Pindwara','Rajasthan','IN','india'),(1125,'Pipar City','Rajasthan','IN','india'),(1126,'Prantij','Rajasthan','IN','india'),(1127,'Pratapgarh','Rajasthan','IN','india'),(1128,'Raisinghnagar','Rajasthan','IN','india'),(1129,'Rajakhera','Rajasthan','IN','india'),(1130,'Rajaldesar','Rajasthan','IN','india'),(1131,'Rajgarh (Alwar)','Rajasthan','IN','india'),(1132,'Rajgarh (Churu','Rajasthan','IN','india'),(1133,'Rajsamand','Rajasthan','IN','india'),(1134,'Ramganj Mandi','Rajasthan','IN','india'),(1135,'Ramngarh','Rajasthan','IN','india'),(1136,'Ratangarh','Rajasthan','IN','india'),(1137,'Rawatbhata','Rajasthan','IN','india'),(1138,'Rawatsar','Rajasthan','IN','india'),(1139,'Reengus','Rajasthan','IN','india'),(1140,'Sadri','Rajasthan','IN','india'),(1141,'Sadulshahar','Rajasthan','IN','india'),(1142,'Sagwara','Rajasthan','IN','india'),(1143,'Sambhar','Rajasthan','IN','india'),(1144,'Sanchore','Rajasthan','IN','india'),(1145,'Sangaria','Rajasthan','IN','india'),(1146,'Sardarshahar','Rajasthan','IN','india'),(1147,'Sawai Madhopur','Rajasthan','IN','india'),(1148,'Shahpura','Rajasthan','IN','india'),(1149,'Shahpura','Rajasthan','IN','india'),(1150,'Sheoganj','Rajasthan','IN','india'),(1151,'Sikar','Rajasthan','IN','india'),(1152,'Sirohi','Rajasthan','IN','india'),(1153,'Sojat','Rajasthan','IN','india'),(1154,'Sri Madhopur','Rajasthan','IN','india'),(1155,'Sujangarh','Rajasthan','IN','india'),(1156,'Sumerpur','Rajasthan','IN','india'),(1157,'Suratgarh','Rajasthan','IN','india'),(1158,'Taranagar','Rajasthan','IN','india'),(1159,'Todabhim','Rajasthan','IN','india'),(1160,'Todaraisingh','Rajasthan','IN','india'),(1161,'Tonk','Rajasthan','IN','india'),(1162,'Udaipur','Rajasthan','IN','india'),(1163,'Udaipurwati','Rajasthan','IN','india'),(1164,'Vijainagar','Rajasthan','IN','india'),(1165,'Gangtok','Sikkim','IN','india'),(1166,'Calcutta','West Bengal','IN','india'),(1167,'Arakkonam','Tamil Nadu','IN','india'),(1168,'Arcot','Tamil Nadu','IN','india'),(1169,'Aruppukkottai','Tamil Nadu','IN','india'),(1170,'Bhavani','Tamil Nadu','IN','india'),(1171,'Chengalpattu','Tamil Nadu','IN','india'),(1172,'Port Blair','Andaman and Nicobar Islands','IN','india'),(1173,'Chinna salem','Tamil nadu','IN','india'),(1174,'Coimbatore','Tamil Nadu','IN','india'),(1175,'Coonoor','Tamil Nadu','IN','india'),(1176,'Cuddalore','Tamil Nadu','IN','india'),(1177,'Dharmapuri','Tamil Nadu','IN','india'),(1178,'Dindigul','Tamil Nadu','IN','india'),(1179,'Erode','Tamil Nadu','IN','india'),(1180,'Gudalur','Tamil Nadu','IN','india'),(1181,'Gudalur','Tamil Nadu','IN','india'),(1182,'Gudalur','Tamil Nadu','IN','india'),(1183,'Kanchipuram','Tamil Nadu','IN','india'),(1184,'Karaikudi','Tamil Nadu','IN','india'),(1185,'Karungal','Tamil Nadu','IN','india'),(1186,'Karur','Tamil Nadu','IN','india'),(1187,'Kollankodu','Tamil Nadu','IN','india'),(1188,'Lalgudi','Tamil Nadu','IN','india'),(1189,'Madurai','Tamil Nadu','IN','india'),(1190,'Nagapattinam','Tamil Nadu','IN','india'),(1191,'Nagercoil','Tamil Nadu','IN','india'),(1192,'Namagiripettai','Tamil Nadu','IN','india'),(1193,'Namakkal','Tamil Nadu','IN','india'),(1194,'Nandivaram-Guduvancheri','Tamil Nadu','IN','india'),(1195,'Nanjikottai','Tamil Nadu','IN','india'),(1196,'Natham','Tamil Nadu','IN','india'),(1197,'Nellikuppam','Tamil Nadu','IN','india'),(1198,'Neyveli','Tamil Nadu','IN','india'),(1199,'O\' Valley','Tamil Nadu','IN','india'),(1200,'Oddanchatram','Tamil Nadu','IN','india'),(1201,'P.N.Patti','Tamil Nadu','IN','india'),(1202,'Pacode','Tamil Nadu','IN','india'),(1203,'Padmanabhapuram','Tamil Nadu','IN','india'),(1204,'Palani','Tamil Nadu','IN','india'),(1205,'Palladam','Tamil Nadu','IN','india'),(1206,'Pallapatti','Tamil Nadu','IN','india'),(1207,'Pallikonda','Tamil Nadu','IN','india'),(1208,'Panagudi','Tamil Nadu','IN','india'),(1209,'Panruti','Tamil Nadu','IN','india'),(1210,'Paramakudi','Tamil Nadu','IN','india'),(1211,'Parangipettai','Tamil Nadu','IN','india'),(1212,'Pattukkottai','Tamil Nadu','IN','india'),(1213,'Perambalur','Tamil Nadu','IN','india'),(1214,'Peravurani','Tamil Nadu','IN','india'),(1215,'Periyakulam','Tamil Nadu','IN','india'),(1216,'Periyasemur','Tamil Nadu','IN','india'),(1217,'Pernampattu','Tamil Nadu','IN','india'),(1218,'Pollachi','Tamil Nadu','IN','india'),(1219,'Polur','Tamil Nadu','IN','india'),(1220,'Ponneri','Tamil Nadu','IN','india'),(1221,'Pudukkottai','Tamil Nadu','IN','india'),(1222,'Pudupattinam','Tamil Nadu','IN','india'),(1223,'Puliyankudi','Tamil Nadu','IN','india'),(1224,'Punjaipugalur','Tamil Nadu','IN','india'),(1225,'Rajapalayam','Tamil Nadu','IN','india'),(1226,'Ramanathapuram','Tamil Nadu','IN','india'),(1227,'Rameshwaram','Tamil Nadu','IN','india'),(1228,'Rasipuram','Tamil Nadu','IN','india'),(1229,'Salem','Tamil Nadu','IN','india'),(1230,'Sankarankoil','Tamil Nadu','IN','india'),(1231,'Sankari','Tamil Nadu','IN','india'),(1232,'Sathyamangalam','Tamil Nadu','IN','india'),(1233,'Sattur','Tamil Nadu','IN','india'),(1234,'Shenkottai','Tamil Nadu','IN','india'),(1235,'Sholavandan','Tamil Nadu','IN','india'),(1236,'Sholingur','Tamil Nadu','IN','india'),(1237,'Sirkali','Tamil Nadu','IN','india'),(1238,'Sivaganga','Tamil Nadu','IN','india'),(1239,'Sivagiri','Tamil Nadu','IN','india'),(1240,'Sivakasi','Tamil Nadu','IN','india'),(1241,'Srivilliputhur','Tamil Nadu','IN','india'),(1242,'Surandai','Tamil Nadu','IN','india'),(1243,'Suriyampalayam','Tamil Nadu','IN','india'),(1244,'Tenkasi','Tamil Nadu','IN','india'),(1245,'Thammampatti','Tamil Nadu','IN','india'),(1246,'Thanjavur','Tamil Nadu','IN','india'),(1247,'Tharamangalam','Tamil Nadu','IN','india'),(1248,'Tharangambadi','Tamil Nadu','IN','india'),(1249,'Theni Allinagaram','Tamil Nadu','IN','india'),(1250,'Thirumangalam','Tamil Nadu','IN','india'),(1251,'Thirunindravur','Tamil Nadu','IN','india'),(1252,'Thiruparappu','Tamil Nadu','IN','india'),(1253,'Thirupuvanam','Tamil Nadu','IN','india'),(1254,'Thiruthuraipoondi','Tamil Nadu','IN','india'),(1255,'Thiruvallur','Tamil Nadu','IN','india'),(1256,'Thiruvarur','Tamil Nadu','IN','india'),(1257,'Thoothukudi','Tamil Nadu','IN','india'),(1258,'Thuraiyur','Tamil Nadu','IN','india'),(1259,'Tindivanam','Tamil Nadu','IN','india'),(1260,'Tiruchendur','Tamil Nadu','IN','india'),(1261,'Tiruchengode','Tamil Nadu','IN','india'),(1262,'Tiruchirappalli','Tamil Nadu','IN','india'),(1263,'Tirukalukundram','Tamil Nadu','IN','india'),(1264,'Tirukkoyilur','Tamil Nadu','IN','india'),(1265,'Tirunelveli','Tamil Nadu','IN','india'),(1266,'Tirupathur','Tamil Nadu','IN','india'),(1267,'Tirupathur','Tamil Nadu','IN','india'),(1268,'Tiruppur','Tamil Nadu','IN','india'),(1269,'Tiruttani','Tamil Nadu','IN','india'),(1270,'Tiruvannamalai','Tamil Nadu','IN','india'),(1271,'Tiruvethipuram','Tamil Nadu','IN','india'),(1272,'Tittakudi','Tamil Nadu','IN','india'),(1273,'Udhagamandalam','Tamil Nadu','IN','india'),(1274,'Udumalaipettai','Tamil Nadu','IN','india'),(1275,'Unnamalaikadai','Tamil Nadu','IN','india'),(1276,'Usilampatti','Tamil Nadu','IN','india'),(1277,'Uthamapalayam','Tamil Nadu','IN','india'),(1278,'Uthiramerur','Tamil Nadu','IN','india'),(1279,'Vadakkuvalliyur','Tamil Nadu','IN','india'),(1280,'Vadalur','Tamil Nadu','IN','india'),(1281,'Vadipatti','Tamil Nadu','IN','india'),(1282,'Valparai','Tamil Nadu','IN','india'),(1283,'Vandavasi','Tamil Nadu','IN','india'),(1284,'Vaniyambadi','Tamil Nadu','IN','india'),(1285,'Vedaranyam','Tamil Nadu','IN','india'),(1286,'Vellakoil','Tamil Nadu','IN','india'),(1287,'Vellore','Tamil Nadu','IN','india'),(1288,'Vikramasingapuram','Tamil Nadu','IN','india'),(1289,'Viluppuram','Tamil Nadu','IN','india'),(1290,'Virudhachalam','Tamil Nadu','IN','india'),(1291,'Virudhunagar','Tamil Nadu','IN','india'),(1292,'Viswanatham','Tamil Nadu','IN','india'),(1293,'Agartala','Tripura','IN','india'),(1294,'Badharghat','Tripura','IN','india'),(1295,'Dharmanagar','Tripura','IN','india'),(1296,'Indranagar','Tripura','IN','india'),(1297,'Jogendranagar','Tripura','IN','india'),(1298,'Kailasahar','Tripura','IN','india'),(1299,'Khowai','Tripura','IN','india'),(1300,'Pratapgarh','Tripura','IN','india'),(1301,'Udaipur','Tripura','IN','india'),(1302,'Achhnera','Uttar Pradesh','IN','india'),(1303,'Adari','Uttar Pradesh','IN','india'),(1304,'Agra','Uttar Pradesh','IN','india'),(1305,'Aligarh','Uttar Pradesh','IN','india'),(1306,'Allahabad','Uttar Pradesh','IN','india'),(1307,'Amroha','Uttar Pradesh','IN','india'),(1308,'Azamgarh','Uttar Pradesh','IN','india'),(1309,'Bahraich','Uttar Pradesh','IN','india'),(1310,'Ballia','Uttar Pradesh','IN','india'),(1311,'Balrampur','Uttar Pradesh','IN','india'),(1312,'Banda','Uttar Pradesh','IN','india'),(1313,'Bareilly','Uttar Pradesh','IN','india'),(1314,'Chandausi','Uttar Pradesh','IN','india'),(1315,'Dadri','Uttar Pradesh','IN','india'),(1316,'Deoria','Uttar Pradesh','IN','india'),(1317,'Etawah','Uttar Pradesh','IN','india'),(1318,'Fatehabad','Uttar Pradesh','IN','india'),(1319,'Fatehpur','Uttar Pradesh','IN','india'),(1320,'Fatehpur','Uttar Pradesh','IN','india'),(1321,'Greater Noida','Uttar Pradesh','IN','india'),(1322,'Hamirpur','Uttar Pradesh','IN','india'),(1323,'Hardoi','Uttar Pradesh','IN','india'),(1324,'Jajmau','Uttar Pradesh','IN','india'),(1325,'Jaunpur','Uttar Pradesh','IN','india'),(1326,'Jhansi','Uttar Pradesh','IN','india'),(1327,'Kalpi','Uttar Pradesh','IN','india'),(1328,'Kanpur','Uttar Pradesh','IN','india'),(1329,'Kota','Uttar Pradesh','IN','india'),(1330,'Laharpur','Uttar Pradesh','IN','india'),(1331,'Lakhimpur','Uttar Pradesh','IN','india'),(1332,'Lal Gopalganj Nindaura','Uttar Pradesh','IN','india'),(1333,'Lalganj','Uttar Pradesh','IN','india'),(1334,'Lalitpur','Uttar Pradesh','IN','india'),(1335,'Lar','Uttar Pradesh','IN','india'),(1336,'Loni','Uttar Pradesh','IN','india'),(1337,'Lucknow','Uttar Pradesh','IN','india'),(1338,'Mathura','Uttar Pradesh','IN','india'),(1339,'Meerut','Uttar Pradesh','IN','india'),(1340,'Modinagar','Uttar Pradesh','IN','india'),(1341,'Muradnagar','Uttar Pradesh','IN','india'),(1342,'Nagina','Uttar Pradesh','IN','india'),(1343,'Najibabad','Uttar Pradesh','IN','india'),(1344,'Nakur','Uttar Pradesh','IN','india'),(1345,'Nanpara','Uttar Pradesh','IN','india'),(1346,'Naraura','Uttar Pradesh','IN','india'),(1347,'Naugawan Sadat','Uttar Pradesh','IN','india'),(1348,'Nautanwa','Uttar Pradesh','IN','india'),(1349,'Nawabganj','Uttar Pradesh','IN','india'),(1350,'Nehtaur','Uttar Pradesh','IN','india'),(1351,'NOIDA','Uttar Pradesh','IN','india'),(1352,'Noorpur','Uttar Pradesh','IN','india'),(1353,'Obra','Uttar Pradesh','IN','india'),(1354,'Orai','Uttar Pradesh','IN','india'),(1355,'Padrauna','Uttar Pradesh','IN','india'),(1356,'Palia Kalan','Uttar Pradesh','IN','india'),(1357,'Parasi','Uttar Pradesh','IN','india'),(1358,'Phulpur','Uttar Pradesh','IN','india'),(1359,'Pihani','Uttar Pradesh','IN','india'),(1360,'Pilibhit','Uttar Pradesh','IN','india'),(1361,'Pilkhuwa','Uttar Pradesh','IN','india'),(1362,'Powayan','Uttar Pradesh','IN','india'),(1363,'Pukhrayan','Uttar Pradesh','IN','india'),(1364,'Puranpur','Uttar Pradesh','IN','india'),(1365,'Purquazi','Uttar Pradesh','IN','india'),(1366,'Purwa','Uttar Pradesh','IN','india'),(1367,'Rae Bareli','Uttar Pradesh','IN','india'),(1368,'Rampur','Uttar Pradesh','IN','india'),(1369,'Rampur Maniharan','Uttar Pradesh','IN','india'),(1370,'Rasra','Uttar Pradesh','IN','india'),(1371,'Rath','Uttar Pradesh','IN','india'),(1372,'Renukoot','Uttar Pradesh','IN','india'),(1373,'Reoti','Uttar Pradesh','IN','india'),(1374,'Robertsganj','Uttar Pradesh','IN','india'),(1375,'Rudauli','Uttar Pradesh','IN','india'),(1376,'Rudrapur','Uttar Pradesh','IN','india'),(1377,'Sadabad','Uttar Pradesh','IN','india'),(1378,'Safipur','Uttar Pradesh','IN','india'),(1379,'Saharanpur','Uttar Pradesh','IN','india'),(1380,'Sahaspur','Uttar Pradesh','IN','india'),(1381,'Sahaswan','Uttar Pradesh','IN','india'),(1382,'Sahawar','Uttar Pradesh','IN','india'),(1383,'Sahjanwa','Uttar Pradesh','IN','india'),(1384,'\"Saidpur',' Ghazipur\"','IN','india'),(1385,'Sambhal','Uttar Pradesh','IN','india'),(1386,'Samdhan','Uttar Pradesh','IN','india'),(1387,'Samthar','Uttar Pradesh','IN','india'),(1388,'Sandi','Uttar Pradesh','IN','india'),(1389,'Sandila','Uttar Pradesh','IN','india'),(1390,'Sardhana','Uttar Pradesh','IN','india'),(1391,'Seohara','Uttar Pradesh','IN','india'),(1392,'\"Shahabad',' Hardoi\"','IN','india'),(1393,'\"Shahabad',' Rampur\"','IN','india'),(1394,'Shahganj','Uttar Pradesh','IN','india'),(1395,'Shahjahanpur','Uttar Pradesh','IN','india'),(1396,'Shamli','Uttar Pradesh','IN','india'),(1397,'\"Shamsabad',' Agra\"','IN','india'),(1398,'\"Shamsabad',' Farrukhabad\"','IN','india'),(1399,'Sherkot','Uttar Pradesh','IN','india'),(1400,'\"Shikarpur',' Bulandshahr\"','IN','india'),(1401,'Shikohabad','Uttar Pradesh','IN','india'),(1402,'Shishgarh','Uttar Pradesh','IN','india'),(1403,'Siana','Uttar Pradesh','IN','india'),(1404,'Sikanderpur','Uttar Pradesh','IN','india'),(1405,'Sikandra Rao','Uttar Pradesh','IN','india'),(1406,'Sikandrabad','Uttar Pradesh','IN','india'),(1407,'Sirsaganj','Uttar Pradesh','IN','india'),(1408,'Sirsi','Uttar Pradesh','IN','india'),(1409,'Sitapur','Uttar Pradesh','IN','india'),(1410,'Soron','Uttar Pradesh','IN','india'),(1411,'Suar','Uttar Pradesh','IN','india'),(1412,'Sultanpur','Uttar Pradesh','IN','india'),(1413,'Sumerpur','Uttar Pradesh','IN','india'),(1414,'Tanda','Uttar Pradesh','IN','india'),(1415,'Tanda','Uttar Pradesh','IN','india'),(1416,'Tetri Bazar','Uttar Pradesh','IN','india'),(1417,'Thakurdwara','Uttar Pradesh','IN','india'),(1418,'Thana Bhawan','Uttar Pradesh','IN','india'),(1419,'Tilhar','Uttar Pradesh','IN','india'),(1420,'Tirwaganj','Uttar Pradesh','IN','india'),(1421,'Tulsipur','Uttar Pradesh','IN','india'),(1422,'Tundla','Uttar Pradesh','IN','india'),(1423,'Unnao','Uttar Pradesh','IN','india'),(1424,'Utraula','Uttar Pradesh','IN','india'),(1425,'Varanasi','Uttar Pradesh','IN','india'),(1426,'Vrindavan','Uttar Pradesh','IN','india'),(1427,'Warhapur','Uttar Pradesh','IN','india'),(1428,'Zaidpur','Uttar Pradesh','IN','india'),(1429,'Zamania','Uttar Pradesh','IN','india'),(1430,'Almora','Uttarakhand','IN','india'),(1431,'Bazpur','Uttarakhand','IN','india'),(1432,'Chamba','Uttarakhand','IN','india'),(1433,'Dehradun','Uttarakhand','IN','india'),(1434,'Haldwani','Uttarakhand','IN','india'),(1435,'Haridwar','Uttarakhand','IN','india'),(1436,'Jaspur','Uttarakhand','IN','india'),(1437,'Kashipur','Uttarakhand','IN','india'),(1438,'kichha','Uttarakhand','IN','india'),(1439,'Kotdwara','Uttarakhand','IN','india'),(1440,'Manglaur','Uttarakhand','IN','india'),(1441,'Mussoorie','Uttarakhand','IN','india'),(1442,'Nagla','Uttarakhand','IN','india'),(1443,'Nainital','Uttarakhand','IN','india'),(1444,'Pauri','Uttarakhand','IN','india'),(1445,'Pithoragarh','Uttarakhand','IN','india'),(1446,'Ramnagar','Uttarakhand','IN','india'),(1447,'Rishikesh','Uttarakhand','IN','india'),(1448,'Roorkee','Uttarakhand','IN','india'),(1449,'Rudrapur','Uttarakhand','IN','india'),(1450,'Sitarganj','Uttarakhand','IN','india'),(1451,'Tehri','Uttarakhand','IN','india'),(1452,'Muzaffarnagar','Uttarpradesh','IN','india'),(1453,'\"Adra',' Purulia\"','IN','india'),(1454,'Alipurduar','West Bengal','IN','india'),(1455,'Arambagh','West Bengal','IN','india'),(1456,'Asansol','West Bengal','IN','india'),(1457,'Baharampur','West Bengal','IN','india'),(1458,'Bally','West Bengal','IN','india'),(1459,'Balurghat','West Bengal','IN','india'),(1460,'Bankura','West Bengal','IN','india'),(1461,'Barakar','West Bengal','IN','india'),(1462,'Barasat','West Bengal','IN','india'),(1463,'Bardhaman','West Bengal','IN','india'),(1464,'Bidhan Nagar','West Bengal','IN','india'),(1465,'Chinsura','West Bengal','IN','india'),(1466,'Contai','West Bengal','IN','india'),(1467,'Cooch Behar','West Bengal','IN','india'),(1468,'Darjeeling','West Bengal','IN','india'),(1469,'Durgapur','West Bengal','IN','india'),(1470,'Haldia','West Bengal','IN','india'),(1471,'Howrah','West Bengal','IN','india'),(1472,'Islampur','West Bengal','IN','india'),(1473,'Jhargram','West Bengal','IN','india'),(1474,'Kharagpur','West Bengal','IN','india'),(1475,'Kolkata','West Bengal','IN','india'),(1476,'Mainaguri','West Bengal','IN','india'),(1477,'Mal','West Bengal','IN','india'),(1478,'Mathabhanga','West Bengal','IN','india'),(1479,'Medinipur','West Bengal','IN','india'),(1480,'Memari','West Bengal','IN','india'),(1481,'Monoharpur','West Bengal','IN','india'),(1482,'Murshidabad','West Bengal','IN','india'),(1483,'Nabadwip','West Bengal','IN','india'),(1484,'Naihati','West Bengal','IN','india'),(1485,'Panchla','West Bengal','IN','india'),(1486,'Pandua','West Bengal','IN','india'),(1487,'Paschim Punropara','West Bengal','IN','india'),(1488,'Purulia','West Bengal','IN','india'),(1489,'Raghunathpur','West Bengal','IN','india'),(1490,'Raiganj','West Bengal','IN','india'),(1491,'Rampurhat','West Bengal','IN','india'),(1492,'Ranaghat','West Bengal','IN','india'),(1493,'Sainthia','West Bengal','IN','india'),(1494,'Santipur','West Bengal','IN','india'),(1495,'Siliguri','West Bengal','IN','india'),(1496,'Sonamukhi','West Bengal','IN','india'),(1497,'Srirampore','West Bengal','IN','india'),(1498,'Suri','West Bengal','IN','india'),(1499,'Taki','West Bengal','IN','india'),(1500,'Tamluk','West Bengal','IN','india'),(1501,'Tarakeswar','West Bengal','IN','india'),(1502,'Chikmagalur','Karnataka','IN','india'),(1503,'Davanagere','Karnataka','IN','india'),(1504,'Dharwad','Karnataka','IN','india'),(1505,'Gadag','Karnataka','IN','india'),(1506,'Chennai','Tamil Nadu','IN','india'),(1507,'Coimbatore','Tamil Nadu','IN','india'),(1508,'Barrackpur','unknown','IN','india'),(1509,'Barwani','unknown','IN','india'),(1510,'Basna','unknown','IN','india'),(1511,'Bawal','unknown','IN','india'),(1512,'Beawar','unknown','IN','india'),(1513,'Berhampur','unknown','IN','india'),(1514,'Bhajanpura','unknown','IN','india'),(1515,'Bhandara','unknown','IN','india'),(1516,'Bharatpur','unknown','IN','india'),(1517,'Bharthana','unknown','IN','india'),(1518,'Bhilai','unknown','IN','india'),(1519,'Bhilwara','unknown','IN','india'),(1520,'Bhinmal','unknown','IN','india'),(1521,'Bhiwandi','unknown','IN','india'),(1522,'Bhusawal','unknown','IN','india'),(1523,'Bidar','unknown','IN','india'),(1524,'Bijnaur','unknown','IN','india'),(1525,'Bilara','unknown','IN','india'),(1527,'Budaun','unknown','IN','india'),(1528,'Bulandshahr','unknown','IN','india'),(1529,'Burla','unknown','IN','india'),(1532,'Chakeri','unknown','IN','india'),(1533,'Champawat','unknown','IN','india'),(1534,'Chandil','unknown','IN','india'),(1535,'Chandrapur','unknown','IN','india'),(1536,'Chapirevula','unknown','IN','india'),(1537,'Charkhari','unknown','IN','india'),(1538,'Charkhi Dadri','unknown','IN','india'),(1539,'Chhindwara','unknown','IN','india'),(1540,'Chiplun','unknown','IN','india'),(1541,'Chitrakoot','unknown','IN','india'),(1542,'Churu','unknown','IN','india'),(1543,'Dalkhola','unknown','IN','india'),(1544,'Damoh','unknown','IN','india'),(1545,'Daund','unknown','IN','india'),(1546,'Dehgam','unknown','IN','india'),(1547,'Devgarh','unknown','IN','india'),(1548,'Dhulian','unknown','IN','india'),(1549,'Dumdum','unknown','IN','india'),(1550,'Dwarka1','unknown','IN','india'),(1551,'Etah','unknown','IN','india'),(1552,'Faizabad','unknown','IN','india'),(1553,'Falna','unknown','IN','india'),(1554,'Farrukhabad','unknown','IN','india'),(1555,'Fatehgarh','unknown','IN','india'),(1556,'Fatehpur Chaurasi','unknown','IN','india'),(1557,'Fatehpur Sikri','unknown','IN','india'),(1558,'Firozabad','unknown','IN','india'),(1559,'Gadchiroli','unknown','IN','india'),(1560,'Gandhidham','unknown','IN','india'),(1561,'Ganjam','unknown','IN','india'),(1562,'Ghatampur','unknown','IN','india'),(1563,'Ghatanji','unknown','IN','india'),(1564,'Ghaziabad','unknown','IN','india'),(1565,'Ghazipur','unknown','IN','india'),(1566,'Goa Velha','unknown','IN','india'),(1567,'Gokak','unknown','IN','india'),(1568,'Gondiya','unknown','IN','india'),(1569,'Gorakhpur','unknown','IN','india'),(1571,'Guna','unknown','IN','india'),(1572,'Hanumangarh','unknown','IN','india'),(1573,'Harda','unknown','IN','india'),(1574,'Harsawa','unknown','IN','india'),(1575,'Hastinapur','unknown','IN','india'),(1576,'Hathras','unknown','IN','india'),(1579,'Jagadhri','unknown','IN','india'),(1580,'Jais','unknown','IN','india'),(1581,'Jaitaran','unknown','IN','india'),(1582,'Jalgaon','unknown','IN','india'),(1583,'Jalore','unknown','IN','india'),(1584,'Jhabua','unknown','IN','india'),(1585,'Jhalawar','unknown','IN','india'),(1586,'Jhunjhunu','unknown','IN','india'),(1588,'Junnar','unknown','IN','india'),(1589,'Kailaras','unknown','IN','india'),(1590,'Kalburgi','unknown','IN','india'),(1591,'Kalimpong','unknown','IN','india'),(1592,'Kamthi','unknown','IN','india'),(1593,'Kanpur','unknown','IN','india'),(1594,'Karad','unknown','IN','india'),(1595,'Keylong','unknown','IN','india'),(1596,'Kheri','unknown','IN','india'),(1598,'Khurai','unknown','IN','india'),(1600,'Kodad','unknown','IN','india'),(1601,'Konnagar','unknown','IN','india'),(1602,'Krishnanagar','unknown','IN','india'),(1603,'Kuchinda','unknown','IN','india'),(1605,'Madhyamgram','unknown','IN','india'),(1606,'Mahabaleswar','unknown','IN','india'),(1608,'Mahoba','unknown','IN','india'),(1609,'Mahwa','unknown','IN','india'),(1614,'Manesar','unknown','IN','india'),(1615,'Mangalagiri','unknown','IN','india'),(1616,'Mira-Bhayandar','unknown','IN','india'),(1617,'Mirzapur','unknown','IN','india'),(1618,'Mithapur','unknown','IN','india'),(1619,'Mohania','unknown','IN','india'),(1620,'Mokama','unknown','IN','india'),(1621,'Moradabad','unknown','IN','india'),(1622,'Mukatsar','unknown','IN','india'),(1623,'Nagalapuram','unknown','IN','india');
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
  `college_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_college_5a885087` (`collegetype_id`),
  KEY `college_event_college_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_ee0fd1a3` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `collegetype_id_refs_id_b61b14dd` FOREIGN KEY (`collegetype_id`) REFERENCES `college_event_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_college`
--

LOCK TABLES `college_event_college` WRITE;
/*!40000 ALTER TABLE `college_event_college` DISABLE KEYS */;
INSERT INTO `college_event_college` VALUES (1,2,1,'christ college'),(2,2,1,'manakula vinayagar'),(3,1,2,'venkateshwara');
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
  KEY `college_event_collegedepartment_69d14838` (`department_id`),
  CONSTRAINT `department_id_refs_id_620c1a1d` FOREIGN KEY (`department_id`) REFERENCES `college_event_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_collegedepartment`
--

LOCK TABLES `college_event_collegedepartment` WRITE;
/*!40000 ALTER TABLE `college_event_collegedepartment` DISABLE KEYS */;
INSERT INTO `college_event_collegedepartment` VALUES (1,1),(2,2),(3,4);
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
  KEY `college_event_collegedepartment_college_84c61854` (`collegedepartment_id`),
  KEY `college_event_collegedepartment_college_ac3b121a` (`college_id`),
  CONSTRAINT `collegedepartment_id_refs_id_a5c5306c` FOREIGN KEY (`collegedepartment_id`) REFERENCES `college_event_collegedepartment` (`id`),
  CONSTRAINT `college_id_refs_id_01889fba` FOREIGN KEY (`college_id`) REFERENCES `college_event_college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_collegedepartment_college`
--

LOCK TABLES `college_event_collegedepartment_college` WRITE;
/*!40000 ALTER TABLE `college_event_collegedepartment_college` DISABLE KEYS */;
INSERT INTO `college_event_collegedepartment_college` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_department`
--

LOCK TABLES `college_event_department` WRITE;
/*!40000 ALTER TABLE `college_event_department` DISABLE KEYS */;
INSERT INTO `college_event_department` VALUES (1,'Mechancial Enginneering'),(2,'Civil Engineering'),(3,'Computer Science Engineering'),(4,'Biotechnology');
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
  `admin_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_postevent_5c81e710` (`festtype_id`),
  KEY `college_event_postevent_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_a25b57ec` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `festtype_id_refs_id_c3b9140f` FOREIGN KEY (`festtype_id`) REFERENCES `college_event_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_postevent`
--

LOCK TABLES `college_event_postevent` WRITE;
/*!40000 ALTER TABLE `college_event_postevent` DISABLE KEYS */;
INSERT INTO `college_event_postevent` VALUES (1,'AnonymousUser','test@gmail.com',9876543210,'Innovace','innovace',1,1,'puducherry','2015-09-23','2015-09-25','2015-09-21','100','innovace conducted in our college, puducherry on the announced date','','static/img/dance1.jpg','','',1);
/*!40000 ALTER TABLE `college_event_postevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_event_postevent_v2`
--

DROP TABLE IF EXISTS `college_event_postevent_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_postevent_v2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `event_title` varchar(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `eventtype_id` int(11) DEFAULT NULL,
  `eventdescription` longtext,
  `address` longtext,
  `organizer` longtext,
  `state` varchar(50) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `poster` varchar(500) DEFAULT NULL,
  `admin_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_postevent_v2_6f33f001` (`category_id`),
  KEY `college_event_postevent_v2_7a4f8c6c` (`eventtype_id`),
  KEY `college_event_postevent_v2_b376980e` (`city_id`),
  KEY `college_event_postevent_v2_ac3b121a` (`college_id`),
  CONSTRAINT `college_id_refs_id_65ebd7b2` FOREIGN KEY (`college_id`) REFERENCES `college_event_college` (`id`),
  CONSTRAINT `category_id_refs_id_5fc8e4db` FOREIGN KEY (`category_id`) REFERENCES `college_event_category` (`id`),
  CONSTRAINT `city_id_refs_id_29cae1ea` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `eventtype_id_refs_id_60b490bb` FOREIGN KEY (`eventtype_id`) REFERENCES `college_event_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_postevent_v2`
--

LOCK TABLES `college_event_postevent_v2` WRITE;
/*!40000 ALTER TABLE `college_event_postevent_v2` DISABLE KEYS */;
INSERT INTO `college_event_postevent_v2` VALUES (1,'root','root@gmail.com',9786243201,'Pondy Fest','2015-09-20','2015-09-24',2,1,'\r\nTest Content and Structure\r\n\r\nThe GRE® revised General Test features question types that closely reflect the kind of thinking you’ll do — and the skills you need to succeed — in today\'s demanding graduate and business school programs. The test-taker friendly design lets you skip questions within a section, go back and change answers and have the flexibility to choose which questions within a section you want to answer first. Get a look at the structure of the computer-delivered or paper-delivered GRE revised General Test.\r\n\r\nThe GRE revised General Test measures your verbal reasoning, quantitative reasoning, critical thinking and analytical writing skills — skills that have been developed over a long period of time and are not related to a specific field of study but are important for all. Here\'s a look at content covered in the three test sections — Verbal Reasoning, Quantitative Reasoning and Analytical Writing.','No:145 , Mg Road,\r\nNehru street\r\nPondy','No:145 , Mg Road,\r\nNehru street\r\nPondy','Pondicherry',1,2,'1','/static/img/03TSHIRT_GESAVORN9_2533627g.jpg',0);
/*!40000 ALTER TABLE `college_event_postevent_v2` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_premiumpriceinfo`
--

LOCK TABLES `college_event_premiumpriceinfo` WRITE;
/*!40000 ALTER TABLE `college_event_premiumpriceinfo` DISABLE KEYS */;
INSERT INTO `college_event_premiumpriceinfo` VALUES (1,0,'INR','free',1),(2,100,'INR','paid',1);
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
  CONSTRAINT `category_id_refs_id_e7da638a` FOREIGN KEY (`category_id`) REFERENCES `college_event_category` (`id`),
  CONSTRAINT `subcategory_id_refs_id_fccefbaa` FOREIGN KEY (`subcategory_id`) REFERENCES `college_event_subcategory` (`id`)
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
-- Table structure for table `college_event_tempevent`
--

DROP TABLE IF EXISTS `college_event_tempevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_event_tempevent` (
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
  `initial` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phoneno` bigint(20) DEFAULT NULL,
  `payu_mail` varchar(50) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `college_event_tempevent_5c81e710` (`festtype_id`),
  KEY `college_event_tempevent_b376980e` (`city_id`),
  CONSTRAINT `city_id_refs_id_7f1630b3` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `festtype_id_refs_id_49a38036` FOREIGN KEY (`festtype_id`) REFERENCES `college_event_subcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_tempevent`
--

LOCK TABLES `college_event_tempevent` WRITE;
/*!40000 ALTER TABLE `college_event_tempevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `college_event_tempevent` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-03 10:27:22',1,18,'1','www.google.com',1,''),(2,'2015-09-03 10:28:02',1,18,'2','www.google.com',1,''),(3,'2015-09-03 10:28:25',1,18,'3','www.google.com',1,''),(4,'2015-09-03 10:30:53',1,18,'4','www.google.com',1,''),(5,'2015-09-03 10:31:27',1,18,'5','www.google.com',1,''),(6,'2015-09-03 10:31:44',1,18,'6','www.google.com',1,''),(7,'2015-09-03 10:32:11',1,18,'7','www.google.com',1,''),(8,'2015-09-03 10:32:40',1,18,'8','www.google.com',1,''),(9,'2015-09-03 10:50:01',1,18,'9','www.google.com',1,''),(10,'2015-09-03 10:50:30',1,18,'10','www.google.com',1,''),(11,'2015-09-03 10:53:49',1,18,'11','www.google.com',1,''),(12,'2015-09-03 10:54:50',1,18,'12','www.google.com',1,''),(13,'2015-09-07 11:59:36',1,18,'13','www.google.com',1,''),(14,'2015-09-07 12:07:36',1,18,'14','www.google.com',1,''),(15,'2015-09-07 12:08:12',1,18,'15','www.google.com',1,''),(16,'2015-09-07 12:31:26',1,18,'16','www.google.com',1,''),(17,'2015-09-07 12:36:46',1,18,'17','www.google.com',1,''),(18,'2015-09-07 12:38:00',1,18,'18','www.google.com',1,''),(19,'2015-09-07 12:50:16',1,18,'19','www.google.com',1,''),(20,'2015-09-07 12:55:45',1,18,'3','www.google.com',3,''),(21,'2015-09-07 12:55:45',1,18,'2','www.google.com',3,''),(22,'2015-09-07 12:55:45',1,18,'1','www.google.com',3,''),(23,'2015-09-07 12:56:50',1,18,'13','www.google.com',3,''),(24,'2015-09-07 12:59:06',1,18,'18','www.google.com',3,''),(25,'2015-09-07 12:59:06',1,18,'17','www.google.com',3,''),(26,'2015-09-07 12:59:06',1,18,'16','www.google.com',3,''),(27,'2015-09-07 12:59:06',1,18,'15','www.google.com',3,''),(28,'2015-09-07 12:59:06',1,18,'14','www.google.com',3,''),(29,'2015-09-07 13:00:54',1,18,'19','www.google.com',3,''),(30,'2015-09-07 13:00:54',1,18,'12','www.google.com',3,''),(31,'2015-09-07 13:00:54',1,18,'11','www.google.com',3,''),(32,'2015-09-07 13:00:54',1,18,'9','www.google.com',3,''),(33,'2015-09-07 13:00:54',1,18,'8','www.google.com',3,''),(34,'2015-09-07 13:02:50',1,18,'20','www.google.com',1,''),(35,'2015-09-07 13:05:46',1,18,'21','www.google.com',1,''),(36,'2015-09-08 12:01:47',1,18,'21','www.google.com',3,''),(37,'2015-09-08 12:01:47',1,18,'20','www.google.com',3,''),(38,'2015-09-08 12:01:47',1,18,'10','www.google.com',3,''),(39,'2015-09-08 12:01:47',1,18,'7','www.google.com',3,''),(40,'2015-09-08 12:01:47',1,18,'6','www.google.com',3,''),(41,'2015-09-08 12:01:47',1,18,'5','www.google.com',3,''),(42,'2015-09-08 12:01:47',1,18,'4','www.google.com',3,''),(43,'2015-09-08 12:02:28',1,18,'22','www.google.com',1,''),(44,'2015-09-08 12:02:58',1,18,'23','www.google.com',1,''),(45,'2015-09-08 12:03:51',1,18,'24','www.google.com',1,''),(46,'2015-09-08 12:04:23',1,18,'25','www.google.com',1,''),(47,'2015-09-08 12:04:51',1,18,'26','www.google.com',1,''),(48,'2015-09-08 12:05:31',1,18,'27','www.google.com',1,''),(49,'2015-09-08 12:05:57',1,18,'28','www.google.com',1,''),(50,'2015-09-08 12:06:28',1,18,'29','www.google.com',1,''),(51,'2015-09-08 12:07:04',1,18,'30','www.google.com',1,''),(52,'2015-09-08 13:35:36',1,18,'31','www.google.com',1,''),(53,'2015-09-09 13:20:04',1,18,'32','www.google.com',1,''),(54,'2015-09-14 11:00:25',1,18,'51','www.google.com',3,''),(55,'2015-09-21 05:08:46',1,12,'1','christ college',1,''),(56,'2015-09-21 05:09:07',1,12,'2','manakula vinayagar',1,''),(57,'2015-09-21 05:09:26',1,12,'3','venkateshwara',1,''),(58,'2015-09-21 08:20:49',1,13,'1','Mechancial Enginneering',1,''),(59,'2015-09-21 08:21:41',1,13,'2','Civil Engineering',1,''),(60,'2015-09-21 08:21:59',1,13,'3','Computer Science Engineering',1,''),(61,'2015-09-21 08:23:08',1,23,'2','Mechancial Enginneering',1,''),(62,'2015-09-21 08:23:38',1,23,'3','Civil Engineering',1,''),(63,'2015-09-23 08:31:56',1,12,'1','christ college',1,''),(64,'2015-09-23 08:32:09',1,12,'2','manakula vinayagar',1,''),(65,'2015-09-23 08:32:22',1,9,'2','Chennai',1,''),(66,'2015-09-23 08:32:27',1,12,'3','venkateshwara',1,''),(67,'2015-09-23 08:32:38',1,23,'1','Mechancial Enginneering',1,''),(68,'2015-09-23 08:32:45',1,23,'2','Civil Engineering',1,''),(69,'2015-09-23 08:33:13',1,13,'4','Biotechnology',1,''),(70,'2015-09-23 08:33:15',1,23,'3','Biotechnology',1,''),(71,'2015-09-26 15:03:57',1,21,'1','Free',1,''),(72,'2015-09-26 15:04:27',1,21,'2','PAID',1,''),(73,'2015-09-26 15:16:13',1,21,'2','paid',2,'Changed purpose.'),(74,'2015-09-26 15:16:23',1,21,'1','free',2,'Changed purpose.');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'category','college_event','category'),(9,'city','college_event','city'),(12,'college','college_event','college'),(13,'department','college_event','department'),(14,'postevent','college_event','postevent'),(15,'user profile','events','userprofile'),(16,'payu details','payu','payudetails'),(17,'transaction','transaction','transaction'),(18,'site banner','banner','sitebanner'),(20,'sub category','college_event','subcategory'),(21,'premium price info','college_event','premiumpriceinfo'),(22,'order','transaction','order'),(23,'college department','college_event','collegedepartment'),(24,'postevent_v2','college_event','postevent_v2');
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
INSERT INTO `django_session` VALUES ('207zp8u7qb6zduyiytpjw13xj3bql0xh','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-10-10 10:54:13'),('4398ul64xscqq50rmn3u3it1ukn8x1yd','MGE3NTgxYjMzNTdmNTA5NTFmMGVhZmExYjhiMzVlMjc4ODYxNWJjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NTN9','2015-10-07 12:57:22'),('514wvhbi3qtdqiwjyw915nly88k50w1p','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-28 05:00:44'),('5820icnzg9gxhnc57sgr7o9oqko0sj74','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-02 09:49:12'),('6rof606zlq68upsgi5olp1xcaaco01gl','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-09-24 10:56:30'),('6w3h59eci8x4qfvo8xyahm8354zribe3','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-10-10 14:59:49'),('7aqpvtfvovp866aw3yxowp8v9rgpv1ip','NDI0MmQxYjBkNjE0Nzg5YjlkMzUxNzYwYzI5NGM0NzZiY2M3MjE1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9','2015-09-23 04:13:16'),('7xxcav4tks8cnogshj0585me6bf6cs2a','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-28 10:58:33'),('8kcw5p9hrvsdwwuiga8ybv323u0hiakt','ZGMzY2MzOTMzMmNjMmMxN2E4M2M0ZGQ0Y2ZmNjMzYzIzMGI0MTFiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjJ9','2015-09-28 04:31:57'),('9k0sdywb16956n5iwyp3t18nuynfcsby','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-10-03 07:39:59'),('9p5ijbn3heb43d00wygrdd1zfo4vmuys','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:08:43'),('dfj184mxjpbssh9924z2na6rcvhae24n','ZGMzY2MzOTMzMmNjMmMxN2E4M2M0ZGQ0Y2ZmNjMzYzIzMGI0MTFiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjJ9','2015-09-28 06:24:03'),('ehqrxij4qts12q82p3mc5f0n4hjw0021','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-21 13:27:50'),('g55iv48i6whxxywb8gt6v6hyvwwp8dx5','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 04:16:04'),('h9f6ruh2dtznc6bcqxniys5thfy1sx65','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:38'),('hjlctcdd20zz9m6dondandvd7a02izy3','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-24 08:06:25'),('hockpo8tf0xrhbnn68y16rvhg7c143z0','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-22 12:55:45'),('k2dr7zn8l4xepi8r5v43nt02dwla7hgi','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-24 07:43:01'),('nrdjsxae0lx7z62jaeonaj6m1yinzaug','NDI0MmQxYjBkNjE0Nzg5YjlkMzUxNzYwYzI5NGM0NzZiY2M3MjE1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9','2015-09-22 11:38:47'),('o5xfiaygz6v4vxmpkngc78bdob4tsghg','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-07 08:35:38'),('p7sltgr6g6bmbac42dangv4jo17qbi6t','OWVjYTA0MGFlOWFhYjhjNzkyZGRmNmU4M2Q5NjY1MGZjYmY2ZWEzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjF9','2015-09-24 05:00:20'),('phqzr3hoz8hyzwo6fb6v46gn1hhk54ta','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-03 06:48:10'),('pxi0gzeqpxedwyxnpfxy06cdop7hsxcn','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-03 07:11:20'),('pyybvn3l8dofseirvamv9cnr4kvjmea5','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-06 07:52:26'),('qqit6yikqjgklrqp38sefnt9xrxhy5du','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-10 11:02:46'),('szkjbro2ybcfz8zr452c2a8m1hqfuvib','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 05:24:45'),('taaayv73zzsavkptqyr4gvrmidzm154q','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-29 09:23:18'),('tp9jg6u5d22oueg3sox3ejw554svvc6l','MWJhOGIwMjE0NDYwYmYzYWU3YjRkNmMwNjIwNjdhZWMxMTJjNzFmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=','2015-09-24 06:28:26'),('x382xeoapfy8gett1qicq1scev4d1ti3','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-10-10 12:18:22'),('xbiclkr4dlyu99hqi2z46pcqo7a0j5jw','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-29 09:44:36'),('xi31c124jg6kncqdh0hayasf6lua2npy','YTM0MmE0NWM5OWFlYTllYTRhNWUzNWU4ZGZmYTQ5OGUzNTc1NzI5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2015-09-21 06:29:26'),('z8w56o2344w201b9vl0nbbu8gv2gnsqd','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-17 10:23:53'),('zjasgi786a1uwvwjxj9mklyowxg7xmrq','OWVjYTA0MGFlOWFhYjhjNzkyZGRmNmU4M2Q5NjY1MGZjYmY2ZWEzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjF9','2015-10-06 13:22:45'),('zl54fd4b8do06mufw160rktuw1ei0ssu','NDE3YTY5NTA5N2M0ZTYwMmUwMWIyNmYzZjFhMThiNzAwYTI4Zjc5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-09-28 10:59:34');
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
  KEY `events_userprofile_b376980e` (`city_id`),
  KEY `events_userprofile_ac3b121a` (`college_id`),
  KEY `events_userprofile_69d14838` (`department_id`),
  CONSTRAINT `city_id_refs_id_695016a4` FOREIGN KEY (`city_id`) REFERENCES `college_event_city` (`id`),
  CONSTRAINT `college_id_refs_id_c0400547` FOREIGN KEY (`college_id`) REFERENCES `college_event_college` (`id`),
  CONSTRAINT `department_id_refs_id_d664371b` FOREIGN KEY (`department_id`) REFERENCES `college_event_department` (`id`),
  CONSTRAINT `user_id_refs_id_acf68b2c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_userprofile`
--

LOCK TABLES `events_userprofile` WRITE;
/*!40000 ALTER TABLE `events_userprofile` DISABLE KEYS */;
INSERT INTO `events_userprofile` VALUES (1,62,'test6','6s7cahP7v1eLuHv8yRZxCXfFDYznHYI1f',0,0,'test6',1,1,1),(2,63,'9786243201','H8pEMSLhWqerqpLPiQMw0CVpVeOH8bIV7',0,0,'mano',2,3,4),(3,64,'8754405589','5jeo9NEjzwGcXPletrJrEiF7aDH7y4L9M',0,0,'raj',1,1,1);
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

-- Dump completed on 2015-09-26 21:23:16
