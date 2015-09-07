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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site banner',7,'add_sitebanner'),(20,'Can change site banner',7,'change_sitebanner'),(21,'Can delete site banner',7,'delete_sitebanner'),(22,'Can add postevent',8,'add_postevent'),(23,'Can change postevent',8,'change_postevent'),(24,'Can delete postevent',8,'delete_postevent'),(25,'Can add eventtype',9,'add_eventtype'),(26,'Can change eventtype',9,'change_eventtype'),(27,'Can delete eventtype',9,'delete_eventtype');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$hcj3cqLyMJya$++AFfe6EmfiJFwrqdDvboPC0+Djoca1OmKxrJwGPavw=','2015-09-03 13:34:46',1,'root','','','root@gmail.com',1,1,'2015-08-25 11:04:35'),(2,'pbkdf2_sha256$12000$QJhkgRQDr5oM$Jn42OpUjJnofPu3hqTZD3KdBJqYB2iUmuny2yH86TnQ=','2015-09-03 14:15:06',0,'priya','','','avbmail93@gmail.com',0,1,'2015-09-03 14:15:06'),(3,'pbkdf2_sha256$12000$TwH2uGBDpEhb$xnPySreDF6gFM1IxQSBJTRzZS5NsqwBCz6ZMMy2ehc4=','2015-09-03 14:19:26',0,'yavaniga','','','spshanthibala@gmail.com',0,1,'2015-09-03 14:19:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (1,'static/banners/banner1.jpeg','www.google.com','/','bottom',NULL),(2,'static/banners/banner2.jpeg','www.google.com','/','bottom',1000),(3,'static/banners/banner3.jpeg','www.google.com','/','bottom',1500),(4,'static/banners/banner4.jpeg','www.google.com','/','bottom',1500),(5,'static/banners/banner5.jpeg','www.google.com','/','bottom',1500),(6,'static/banners/banner6.png','www.google.com','/','bottom',1500),(7,'',NULL,NULL,NULL,NULL),(8,'banner6.png',NULL,NULL,NULL,NULL),(9,'',NULL,NULL,NULL,NULL),(10,'banner5.jpeg',NULL,NULL,NULL,NULL),(11,'banner4.jpeg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `banner_sitebanner` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_event_postevent`
--

LOCK TABLES `college_event_postevent` WRITE;
/*!40000 ALTER TABLE `college_event_postevent` DISABLE KEYS */;
INSERT INTO `college_event_postevent` VALUES (1,'priya','avbmail93@gmail.com',8148635051,'symposium','techno festa','paper presentation','management','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','frshdfjhsdgh','jgdsjgdgj','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','gfjsffgjfgj','gfjsfjfg','gfjsdrtyujesyu','turuwryuiyruiyru','jjyjsykykyr','kyrkytktrky','kyrkyrkkyry','rkrykyrk','yrkfyhkdmvh',30,'ykyrkryk'),(2,'ramya','ramya@globalensoutions.com',8148635051,'symposium','techno festa','gjgfjgfj','literary','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','gsfhdajyyksr','kykyrkk','nmn','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','kyhdglsgulkut','fgtudlgjlggll','jglgjdfkgkjhgdkhg','dkgklghklghfgks','fyyfkfkk','fsfyksfksk','fskfkkhgkhvkmgh','khgkhgkgdkrgtjs','jsjfyjkfyjksjkfsj',50,'fskhkkmhmn'),(3,'nethra','nethra@gmail.com',8148635051,'symposium','techno festa','paper presentation','management','jhgkjgk','jgdjg,ljg,.','jgdgj,,.jg,j','2015-08-25','2015-09-20','2015-09-15','100','jg,fjt,djg,','jg,jg,gj,,jg,jg,cnh','djfgjfgjgfj','gfjsgfjsgjgfj','sgjsfsgfjn','sjgdjgjg','gjsgjgj','fgjsgg','jgjsgn','','[]','jgsfjfs','mfmfhmmfshmfh','mhfmsmhmfsmhs','mhshsfmfmnvbnss','fjmsfmfhfsmgjf','gjsfgjgfjcvnbvcb','sgdjgdjsdgtjgn','fgjtdshethshdh','dgsdhesthdgbgdnhssfn',60,'gnsgmngmfsmm'),(4,'dsgadrhdtj','avbmail93@gmail.com',8148635051,'adgjdgjdgj','dgjajdgjdgj','gjgfjgfj','literary','adgjdgjdgj','jgdajdgjaj','jagdjgdjdgj','2015-08-25','2015-09-20','2015-09-15','100','gdajdgjdgjdaj','dgjadgjgdjdgjgdj','nmn','gdagjd','gdjgdajaadgj','jgdagdgdjgdj','gdjgdjgdj','dgjg','jajjgdajgd','','[]','gdajjgdj','gdjgdjgjdgjd','gdjgdjdgjjgd','jgdjgdgjdgdj','gjdjgdgdjjgddg','jstesetjhj','jtjejtjejtejt','jettjjtejj','tejjthdg',50,'gdfjsfdjjm'),(5,'priya','avbmail93@gmail.com',8148635051,'symposium','gdhsgjhsfgjgfj','paper presentation','management','Sree Sowdambika college of engineering','gfjgfjgfjg','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','fwgfadshdfdg','jdgjdgjdfjdfaj','cse','www.ssce.com','gdjgdajaadgj','www.sree sowdambikaenng.co.in','ssce','ssce','jajjgdajgd','','[]','dfgjadgjdg','jdgjadgjdg','jdagjdgajdjg','jgdjdgjdgjjgd','jdgjdgjdgjgd','jdgjdgjdgjdg','jdgjgdsjdg','dgndgjhdjh','djhdjjgdj',50,'jgdjdgj'),(6,'priya','avbmail93@gmail.com',9500681125,'symposium','techno festa','paper presentation','technical','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','sfadgadgsdg','dsgadsghsfghfs','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','sfdgfsahf','hfshfshfsfs','aahfshasfhfs','fsahfshfs','fahfshfs','fshfshfsfshf','sahfshfshh','asfhfshfshfs','fsahsfhfshf',50,'fsahsfhfsh'),(7,'priya','avbmail93@gmail.com',8148635051,'symposium','techno festa','paper presentation','management','Sree Sowdambika college of engineering','gfjgfjgfjg','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','aFDGASHS','GSGSFhgsf','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','fhfgdhgjhf','gdhbzdghng','gnjzsgz','gcjnfj','gjgj','gjgdjgd','gdjgdj','ghngjhn','gjng',50,'gdjgdj'),(9,'priya','avbmail93@gmail.com',8148635051,'symposium','techno festa','paper presentation','technical','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','sse','ssce','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce',50,'ssce'),(10,'priya','avbmail93@gmail.com',8148635051,'symposium','techno festa','paper presentation','technical','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','ssce','ssce','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce',50,'ssce'),(11,'priya','avbmail93@gmail.com',8148635051,'symposium','techno festa','paper presentation','literary','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-08-25','2015-09-20','2015-09-15','100','ssce','ssce','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce',50,'ssce'),(12,'yavaniga','spshanthibala@gmail.com',7894561230,'symposium','techno festa','paper presentation','sports','Sree Sowdambika college of engineering','Aruppukottai','Tamilnadu','2015-09-25','2015-10-05','2015-09-30','100','ssce','ssce','cse','www.ssce.com','https://www.ssce.co.in','www.sree sowdambikaenng.co.in','ssce','ssce','ssce','','[]','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce','ssce',50,'ssce');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-08-25 11:06:00',1,7,'1','www.google.com',1,''),(2,'2015-08-25 11:07:22',1,7,'2','www.google.com',1,''),(3,'2015-08-25 11:07:40',1,7,'3','www.google.com',1,''),(4,'2015-08-25 11:07:58',1,7,'4','www.google.com',1,''),(5,'2015-08-25 11:08:14',1,7,'5','www.google.com',1,''),(6,'2015-08-25 11:08:30',1,7,'6','www.google.com',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site banner','banner','sitebanner'),(8,'postevent','college_event','postevent'),(9,'eventtype','college_event','eventtype');
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
INSERT INTO `django_session` VALUES ('717bs6rxhofnf8sbbwzggtr73higpoal','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-08 11:08:58'),('ccsdngqhxds0qz5nsbvtwy5yipzmev7f','MWM2NDY3OTI1YTFlYmE4Zjg4YzE0Y2YwODUyNTNjYTIyZjBkMDE3Yjp7fQ==','2015-09-17 14:24:15');
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
  `ad_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_userprofile`
--

LOCK TABLES `events_userprofile` WRITE;
/*!40000 ALTER TABLE `events_userprofile` DISABLE KEYS */;
INSERT INTO `events_userprofile` VALUES (1,3,'','F354I6X29choiAoSf9eErBvMVspCXUx8p',0,0,NULL);
/*!40000 ALTER TABLE `events_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-03 20:26:32
