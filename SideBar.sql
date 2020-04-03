-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.8-MariaDB

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

-- LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Luigi'),(2,'Thiago'),(3,'Matheus');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` double NOT NULL,
  `Alunos_id` int(11) NOT NULL,
  `Disciplinas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Alunos_id`,`Disciplinas_id`),
  KEY `fk_Avaliacoes_Alunos_idx` (`Alunos_id`),
  KEY `fk_Avaliacoes_Disciplinas1_idx` (`Disciplinas_id`),
  CONSTRAINT `fk_Avaliacoes_Alunos` FOREIGN KEY (`Alunos_id`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacoes_Disciplinas1` FOREIGN KEY (`Disciplinas_id`) REFERENCES `disciplinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

-- LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES (1,6.5,1,2),(2,8,1,2),(3,9,1,2),(4,2.5,1,1),(5,10,1,1),(6,5,1,1),(7,8.5,1,3),(8,1,1,3),(9,7,1,3),(10,8.5,2,3),(11,5,2,3),(12,7,2,3),(13,1.5,2,2),(14,2,2,2),(15,6,2,2),(16,8.5,3,2),(17,5,3,2),(18,9,3,2),(19,8.5,2,1),(20,5,2,1),(21,9,2,1),(22,9,3,1),(23,2,3,1),(24,7,3,1),(25,10,3,3),(26,5,3,3),(27,8,3,3);
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `cep`
--

DROP TABLE IF EXISTS `cep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cep`
--

-- LOCK TABLES `cep` WRITE;
/*!40000 ALTER TABLE `cep` DISABLE KEYS */;
INSERT INTO `cep` VALUES (1,'99930-00','zoraide todeschini 611',' ','Centro','Tucunduva','Rio Grande do sul');
/*!40000 ALTER TABLE `cep` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

-- LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` VALUES (1,'informatica'),(2,'psicologia'),(3,'matematica');
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Data_hora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

-- LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'alo','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_venda` (
  `venda_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  KEY `fk_vendaId__idx` (`venda_id`),
  KEY `fk_produtoId__idx` (`produto_id`),
  CONSTRAINT `fk_produtoId_` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendaId_` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

-- LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (26,1,1,123321),(26,1,2,246642),(27,1,1,123321),(27,1,1,123321),(27,1,1,123321),(28,1,1,123321),(28,1,2,246642),(29,1,5,616605),(29,1,5,616605),(29,1,5,616605),(29,1,5,616605),(30,1,4,493284),(30,20,7,73.92),(31,1,10,1233210),(31,20,5,52.800000000000004),(33,19,26,39),(34,22,15,9),(35,23,16,16),(36,24,13,13),(37,6,1,1231),(38,24,16,16),(39,24,43,43),(40,6,6,7386),(41,6,6,7386),(41,20,4,42.24),(42,6,6,7386),(42,24,27,27),(45,1,1,123321),(54,1,6,739926),(54,20,4,42.24),(55,1,5,616605),(55,6,4,4924),(55,24,5,5);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

-- LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'asda',123321),(6,'asdad',1231),(19,'banana',1.5),(20,'banana',10.56),(22,'asd',0.8),(23,'asda',1),(24,'a',1),(25,'asdad',1),(26,'asdad',1330000),(27,'asdad',1.23),(28,'asdad',1.23),(29,'asdads',1.23),(30,'asdas',1.23),(31,'asdasd',1.23),(32,'asdas',1.22),(33,'asda',1.23),(34,'asd',1.23),(35,'sadad',5),(36,'opa lele',5),(37,'aligato',1),(38,'aligato',1000),(39,'aligato',10000),(40,'arigatai',5000000),(41,'asda',123.21),(42,'asdad',12313.13),(43,'asdad',12313.13),(44,'asdad',12313.13),(45,'asdad',12313.13),(46,'asdad',12313.13),(47,'produto',89000),(48,'morango',10.5),(49,'paçoca',1.5),(50,'camionete',10000),(51,'asdsad',1.23),(52,'carai mermao',123),(55,'a',1.11),(56,'asd',10),(57,'banana',15);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `requisicao`
--

DROP TABLE IF EXISTS `requisicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL,
  `ip` varchar(12) NOT NULL,
  `user_agent` varchar(200) NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao`
--

-- LOCK TABLES `requisicao` WRITE;
/*!40000 ALTER TABLE `requisicao` DISABLE KEYS */;
INSERT INTO `requisicao` VALUES (1,'/a','','','0000-00-00 00:00:00'),(2,'/a','','','0000-00-00 00:00:00'),(3,'/b','','','0000-00-00 00:00:00'),(4,'/uashduahsd','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(5,'/uashduahsd','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(6,'/uashduahsd','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(7,'/uashduahsd','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(8,'/uashduahsd','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(9,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(10,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(11,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(12,'/','::ffff:192.1','avast! Antivirus','0000-00-00 00:00:00'),(13,'/HNAP1/','::ffff:192.1','avast! Antivirus','0000-00-00 00:00:00'),(14,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(15,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(16,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(17,'/alo','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(18,'/alo','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(19,'/alo','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(20,'/alo','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(21,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(22,'/?rank','::ffff:127.0','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(23,'/rank','::ffff:127.0','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(24,'/rank','::ffff:127.0','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(25,'/rank','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(26,'/favicon.ico','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00'),(27,'/favicon.ico','::1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.115 (Edition Campaign 75)','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `requisicao` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

-- LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'adm','123'),(2,'Thiago','123'),(3,'Repo','1234'),(4,'a','123'),(5,'a','123'),(6,'alo','123'),(7,'a','123'),(8,'a','123'),(9,'a','123'),(10,'baiano','123'),(11,'',''),(12,'',''),(13,'',''),(14,'','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

-- LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'0000-00-00 00:00:00'),(2,'0000-00-00 00:00:00'),(3,'2020-03-24 21:30:21'),(4,'2020-03-24 21:51:24'),(5,'2020-03-24 22:07:10'),(6,'2020-03-24 22:07:50'),(7,'2020-03-24 22:09:44'),(8,'2020-03-24 22:13:39'),(9,'2020-03-24 22:16:52'),(10,'2020-03-24 22:18:17'),(11,'2020-03-24 22:19:46'),(12,'2020-03-24 22:20:44'),(13,'2020-03-24 22:24:39'),(14,'2020-03-24 22:49:01'),(15,'2020-03-24 22:51:22'),(16,'2020-03-24 22:52:10'),(17,'2020-03-24 22:55:26'),(18,'2020-03-24 22:56:36'),(19,'2020-03-24 22:58:36'),(20,'2020-03-24 22:59:13'),(21,'2020-03-24 23:10:07'),(22,'2020-03-24 23:12:59'),(23,'2020-03-24 23:16:25'),(24,'2020-03-24 23:16:57'),(25,'2020-03-24 23:18:15'),(26,'2020-03-24 23:22:24'),(27,'2020-03-24 23:22:42'),(28,'2020-03-24 23:23:22'),(29,'2020-03-24 23:26:13'),(30,'2020-03-25 18:31:45'),(31,'2020-03-25 19:57:46'),(32,'2021-03-12 00:00:00'),(33,'2020-03-26 20:28:00'),(34,'2020-03-26 20:28:08'),(35,'2020-03-26 21:14:55'),(36,'2020-03-26 21:40:16'),(37,'2020-03-26 21:40:46'),(38,'2020-03-26 21:41:12'),(39,'2020-03-26 21:59:45'),(40,'2020-03-26 22:28:16'),(41,'2020-03-26 22:28:23'),(42,'2020-03-29 04:41:41'),(43,'2020-03-31 21:00:38'),(44,'2020-03-31 21:02:27'),(45,'2020-03-31 21:02:31'),(46,'2020-03-31 21:09:20'),(47,'2020-03-31 21:27:19'),(48,'2020-03-31 21:27:27'),(49,'2020-03-31 21:29:27'),(50,'2020-03-31 21:43:34'),(51,'2020-03-31 21:45:34'),(52,'2020-03-31 21:47:58'),(53,'2020-03-31 21:48:59'),(54,'2020-04-01 21:12:54'),(55,'2020-04-01 21:14:20');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
-- UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-02 21:25:50
