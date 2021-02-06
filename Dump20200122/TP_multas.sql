-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multas` (
  `id_multa` varchar(6) NOT NULL,
  `id_tipo_multa` int(11) NOT NULL,
  `latitude` varchar(11) DEFAULT NULL,
  `longitude` varchar(11) DEFAULT NULL,
  `localidade` varchar(20) DEFAULT NULL,
  `distrito` varchar(20) DEFAULT NULL,
  `matricula` varchar(8) NOT NULL,
  `estado_multa` varchar(50) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  PRIMARY KEY (`id_multa`),
  KEY `fk_multas_1_idx` (`matricula`),
  KEY `fk_multas_2_idx` (`id_tipo_multa`),
  CONSTRAINT `fk_multas_1` FOREIGN KEY (`matricula`) REFERENCES `veiculo` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_multas_2` FOREIGN KEY (`id_tipo_multa`) REFERENCES `tipo_multa` (`id_tipo_multa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
INSERT INTO `multas` VALUES ('MU-1',1,'39.221749','-8.688089','Complexo Andaluz','Santarém','AB-12-CD','Não Pago','2021-01-22'),('MU-2',1,'39.221718','-8.688033','Complexo Andaluz','Santarém','AB-12-CD','Não Pago','2019-01-22'),('MU-3',1,'39.221712','-8.688012','Complexo Andaluz','Santarem','67-79-QB','Não Pago','2021-01-22');
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 16:19:34
