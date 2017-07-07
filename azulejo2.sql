-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: azulejo2
-- ------------------------------------------------------
-- Server version	5.5.55-0+deb8u1

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
-- Table structure for table `delivery_validation`
--

DROP TABLE IF EXISTS `delivery_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_validation` (
  `carrier_id` varchar(6) NOT NULL,
  `delivery_invoice` varchar(15) NOT NULL,
  `file_path` text NOT NULL,
  PRIMARY KEY (`carrier_id`,`delivery_invoice`),
  CONSTRAINT `fk_delivery_validation_carrier_id` FOREIGN KEY (`carrier_id`) REFERENCES `user_carrier` (`carrier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_validation`
--

LOCK TABLES `delivery_validation` WRITE;
/*!40000 ALTER TABLE `delivery_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1495539956),('m130524_201442_init',1495539958);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `user_group` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  KEY `fk_user_group_idx` (`user_group`),
  CONSTRAINT `fk_user_group` FOREIGN KEY (`user_group`) REFERENCES `user_group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin.flex','','$2y$13$mBC.71Bef7tOmdewcXfyKemv1OL4N05B/7iyac.ULhjEqE1.Ls.CW',NULL,'admin@flex-am.com.br',10,1496443225,1496443225,2),(2,'v2c6zeKFkoFaP2RNTFvvKjav0rCHR1UO','','$2y$13$k04/CWhQwTbiBSkZf9lDPOklKYYqj25smtAC7sVRxn.pBuS2a.Z02',NULL,'teste@flex-am.com.br',10,1496687360,1496687360,3),(3,'teste.implantacao','','$2y$13$e3PUjYp46ITMsAYpSdfYz.NnNw8J/blhJM2ia.DPRpQt7zwmjs2Lu',NULL,'informatica@flex-am.com.br',10,1496689515,1496689515,2),(4,'francisco.almeida','','$2y$13$fyRZXd5LSOcopf.c6V3FBe8aaxeXdviMYOGhId/qYkTFEpbCpbKBi',NULL,'francisco.almeida@flex-am.com.br',10,1496696959,1496696959,2),(5,'gilmar.costa','','$2y$13$UExh71Z9Gyg7HlCUaQ3MSu3zF7YI3mGgNXCvY.iC4.iYUkVsDqybe',NULL,'gilmar.costa@flex-am.com.br',10,1498138353,1498138353,2),(7,'izX66ZxBS6B30--V7t6AfDQjZNmDpjTK','','$2y$13$VipkhCAt4wLk35fwp6CPdO./U1MaIAwA4myRkEF2r9/GrhZUXRPLy',NULL,'teste2@flex-am.com.br',10,1498138883,1498138940,3),(8,'rV6zMpBv7b37rP7ZVbh4igf6EfVA68Ya','','$2y$13$tpoTnEvFgdyTEwlXN1mho.GlwMxTeTRinvwk7hXObI2HkiGvEFCkm',NULL,'teste3@flex-am.com.br',10,1498139068,1498139068,3),(9,'sander.liborio','','$2y$13$eQXu9BXakYWFbok1hdhSgOkxrKqOYV/zmkZVhcOqx4eFfS/VXvmzC',NULL,'sander.liborio@flex-am.com.br',10,1498232882,1498232882,2),(12,'sCoMEfqdNIE-HRzeBs2dBlFkCUkwufmB','','$2y$13$Z0F.U4FLZAsrUnPjaYslo.cM..tIoV6xewgUrhvjVaUfbAjcm.v0u',NULL,'teste5@flex-am.com.br',10,1498244304,1498244352,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_carrier`
--

DROP TABLE IF EXISTS `user_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_carrier` (
  `cnpj` varchar(14) NOT NULL,
  `user_id` int(11) NOT NULL,
  `carrier_id` varchar(6) NOT NULL,
  PRIMARY KEY (`cnpj`),
  UNIQUE KEY `carrier_id` (`carrier_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_carrier_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_carrier`
--

LOCK TABLES `user_carrier` WRITE;
/*!40000 ALTER TABLE `user_carrier` DISABLE KEYS */;
INSERT INTO `user_carrier` VALUES ('03598524000114',12,'000055'),('07575651000582',8,'000062'),('10970887003381',2,'000053'),('14038562000139',7,'000063');
/*!40000 ALTER TABLE `user_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) DEFAULT NULL,
  `group_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'Usuário sem Grupo','Usuário com os mínimos acessos'),(2,'Admin. Flex','Usuários Administradores do Sistema'),(3,'Admin. Transportadora','Administradores da Transportadora');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_person`
--

DROP TABLE IF EXISTS `user_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_person` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_person_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_person`
--

LOCK TABLES `user_person` WRITE;
/*!40000 ALTER TABLE `user_person` DISABLE KEYS */;
INSERT INTO `user_person` VALUES (1,'Admin','Flex'),(3,'Teste','Teste Implantacao'),(4,'Francisco','Almeida'),(5,'Gilmar','Costa'),(9,'Sander Paulo de Oliveira','Liborio');
/*!40000 ALTER TABLE `user_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'azulejo2'
--

--
-- Dumping routines for database 'azulejo2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27  7:23:17
