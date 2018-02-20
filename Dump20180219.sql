CREATE DATABASE  IF NOT EXISTS `escritorio5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `escritorio5`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: escritorio5
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(40) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `rua` varchar(50) DEFAULT 'sem endereco',
  `numeroCasa` varchar(12) DEFAULT '000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Douglas','Macedo Pereira','5123432123','Camaqua','Jorge Machado','332'),(2,'Joao','Silveira','5123323456','Porto Alegre','Coronel Pedro Osorio','2211'),(3,'Diogo','Machado','5345432345','Pelotas','Almirante Barroso','234'),(4,'Ricardo','Chagas da Silva','534234563','Pelotas','Borges de Medeiros','2113'),(5,'Jonatan','Rosa','5323432123','Pelotas','Borges de Medeiros','331'),(6,'Joao','Maciel Souza','53234432123','Pelotas','Almirante Neto','231'),(7,'Douglas','Moura','5323542123','Pelotas','General Souza','213'),(8,'Douglas','Roque Junior','5324535643','Pelotas','Beato Salu','213'),(9,'Robert','Lewandowski','5365454123','Pelotas','General Souza','2345'),(10,'Pedro','Rogerio Silva','5323431123','Pelotas','Jorge Soyza','3333'),(11,'Tiago','Souto','532343244','Pelotas','Beco diagonal','3213'),(12,'Estanislau','Wasiliuk','5323432134','Pelotas','Almirante Neto','2341'),(13,'Luciano','Vieto','513276567','Cristal',' BR 116','1223'),(14,'GREMIO','FBPA','513345123','Porto Alegre','Azenha','1'),(15,'JME LTDA','LTDA','5323412123','Pelotas','Jorge Machado','112'),(16,'Papelaria ME','ME','5323432123','Pelotas','Almirante Neto','213');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultoria`
--

DROP TABLE IF EXISTS `consultoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDono` int(11) DEFAULT NULL,
  `nome` varchar(30) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `cnpj` (`cnpj`),
  KEY `idDono` (`idDono`),
  CONSTRAINT `consultoria_ibfk_1` FOREIGN KEY (`idDono`) REFERENCES `dono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultoria`
--

LOCK TABLES `consultoria` WRITE;
/*!40000 ALTER TABLE `consultoria` DISABLE KEYS */;
INSERT INTO `consultoria` VALUES (1,1,'Solucoes contabeis MM','090493434533',12342),(2,1,'Escritorio Santos','57434943378',20122);
/*!40000 ALTER TABLE `consultoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultoriaTrabalho`
--

DROP TABLE IF EXISTS `consultoriaTrabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultoriaTrabalho` (
  `idTrabalho` int(11) NOT NULL,
  `idConsultoria` int(11) NOT NULL,
  KEY `idTrabalho` (`idTrabalho`),
  KEY `idConsultoria` (`idConsultoria`),
  CONSTRAINT `consultoriaTrabalho_ibfk_1` FOREIGN KEY (`idTrabalho`) REFERENCES `trabalho` (`id`),
  CONSTRAINT `consultoriaTrabalho_ibfk_2` FOREIGN KEY (`idConsultoria`) REFERENCES `consultoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultoriaTrabalho`
--

LOCK TABLES `consultoriaTrabalho` WRITE;
/*!40000 ALTER TABLE `consultoriaTrabalho` DISABLE KEYS */;
INSERT INTO `consultoriaTrabalho` VALUES (3,1),(2,1),(5,1),(2,2),(5,2);
/*!40000 ALTER TABLE `consultoriaTrabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacao`
--

DROP TABLE IF EXISTS `contratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idDono` int(11) NOT NULL,
  `dia` tinyint(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `ano` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDono` (`idDono`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `contratacao_ibfk_1` FOREIGN KEY (`idDono`) REFERENCES `dono` (`id`),
  CONSTRAINT `contratacao_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacao`
--

LOCK TABLES `contratacao` WRITE;
/*!40000 ALTER TABLE `contratacao` DISABLE KEYS */;
INSERT INTO `contratacao` VALUES (1,1,1,20,6,2015),(2,2,1,20,9,2015),(3,3,1,2,5,2015);
/*!40000 ALTER TABLE `contratacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demissao`
--

DROP TABLE IF EXISTS `demissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idDono` int(11) NOT NULL,
  `dia` tinyint(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `ano` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDono` (`idDono`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `demissao_ibfk_1` FOREIGN KEY (`idDono`) REFERENCES `dono` (`id`),
  CONSTRAINT `demissao_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demissao`
--

LOCK TABLES `demissao` WRITE;
/*!40000 ALTER TABLE `demissao` DISABLE KEYS */;
INSERT INTO `demissao` VALUES (1,3,1,10,2,2018);
/*!40000 ALTER TABLE `demissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dono`
--

DROP TABLE IF EXISTS `dono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(40) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `rua` varchar(40) NOT NULL,
  `numeroCasa` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dono`
--

LOCK TABLES `dono` WRITE;
/*!40000 ALTER TABLE `dono` DISABLE KEYS */;
INSERT INTO `dono` VALUES (1,'Douglas','Janovik Maliszewski','43256743300','5388765390','Joao Afonso Pereira','213');
/*!40000 ALTER TABLE `dono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(40) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `rua` varchar(50) DEFAULT 'sem endereco',
  `numeroCasa` varchar(12) DEFAULT '000',
  `salario` int(11) NOT NULL,
  `idDemissao` int(11) DEFAULT NULL,
  `idContratacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Geraldo','Pedroso','534373729','Borges de Medeiros','432',2000,NULL,NULL),(2,'Jorge','Janovik','5348930209','Almirante Neto','345',1500,NULL,NULL),(3,'Robert','Lewandowski','539942123','General Souza','945',1000,NULL,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarioTrabalho`
--

DROP TABLE IF EXISTS `funcionarioTrabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarioTrabalho` (
  `idFuncionario` int(11) NOT NULL,
  `idTrabalho` int(11) NOT NULL,
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idTrabalho` (`idTrabalho`),
  CONSTRAINT `funcionarioTrabalho_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `funcionarioTrabalho_ibfk_2` FOREIGN KEY (`idTrabalho`) REFERENCES `trabalho` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarioTrabalho`
--

LOCK TABLES `funcionarioTrabalho` WRITE;
/*!40000 ALTER TABLE `funcionarioTrabalho` DISABLE KEYS */;
INSERT INTO `funcionarioTrabalho` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,3),(2,4),(3,1),(3,2),(3,5);
/*!40000 ALTER TABLE `funcionarioTrabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoaFisica`
--

DROP TABLE IF EXISTS `pessoaFisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoaFisica` (
  `idCliente` int(11) DEFAULT NULL,
  `CPF` varchar(30) NOT NULL,
  PRIMARY KEY (`CPF`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pessoaFisica_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoaFisica`
--

LOCK TABLES `pessoaFisica` WRITE;
/*!40000 ALTER TABLE `pessoaFisica` DISABLE KEYS */;
INSERT INTO `pessoaFisica` VALUES (1,'37866463894893'),(2,'94832849839834'),(3,'19482343849894'),(4,'79321217837283'),(5,'78437487837240'),(6,'89128392838923'),(7,'82983823892380'),(8,'12302930293029'),(9,'49894972837287'),(10,'2398984737465'),(11,'1293837495049'),(12,'0932832838377'),(13,'1232434300019');
/*!40000 ALTER TABLE `pessoaFisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoaJuridica`
--

DROP TABLE IF EXISTS `pessoaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoaJuridica` (
  `idCliente` int(11) DEFAULT NULL,
  `CNPJ` varchar(30) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pessoaJuridica_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoaJuridica`
--

LOCK TABLES `pessoaJuridica` WRITE;
/*!40000 ALTER TABLE `pessoaJuridica` DISABLE KEYS */;
INSERT INTO `pessoaJuridica` VALUES (14,'37866464000195'),(15,'03713050000104'),(16,'12324343000195');
/*!40000 ALTER TABLE `pessoaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCliente` (`idCliente`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `servico_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,1,1,515),(2,2,1,678),(3,3,3,890),(4,4,2,1200),(5,5,1,421),(6,6,1,2000),(7,7,2,2567),(8,8,3,511),(9,9,3,1223),(10,10,1,897),(11,11,2,776),(12,12,1,2009),(13,13,3,1560),(14,14,1,7670),(15,15,2,5480),(16,16,3,3309);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicoMensal`
--

DROP TABLE IF EXISTS `servicoMensal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicoMensal` (
  `idServico` int(11) NOT NULL,
  `diaPagamento` tinyint(4) NOT NULL,
  `anoQuitacao` int(11) NOT NULL,
  KEY `idServico` (`idServico`),
  CONSTRAINT `servicoMensal_ibfk_1` FOREIGN KEY (`idServico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicoMensal`
--

LOCK TABLES `servicoMensal` WRITE;
/*!40000 ALTER TABLE `servicoMensal` DISABLE KEYS */;
INSERT INTO `servicoMensal` VALUES (3,6,2018),(4,12,2018),(7,9,2017),(15,26,2016);
/*!40000 ALTER TABLE `servicoMensal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicoSimples`
--

DROP TABLE IF EXISTS `servicoSimples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicoSimples` (
  `idServico` int(11) NOT NULL,
  `dia` tinyint(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `ano` int(11) NOT NULL,
  KEY `idServico` (`idServico`),
  CONSTRAINT `servicoSimples_ibfk_1` FOREIGN KEY (`idServico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicoSimples`
--

LOCK TABLES `servicoSimples` WRITE;
/*!40000 ALTER TABLE `servicoSimples` DISABLE KEYS */;
INSERT INTO `servicoSimples` VALUES (1,3,11,2016),(5,1,2,2017),(6,22,6,2017),(8,29,9,2017),(10,7,10,2017),(11,1,1,2017),(12,4,1,2016),(13,21,12,2016),(14,3,3,2016),(9,12,10,2017),(16,16,11,2017);
/*!40000 ALTER TABLE `servicoSimples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicoTrabalho`
--

DROP TABLE IF EXISTS `servicoTrabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicoTrabalho` (
  `idServico` int(11) NOT NULL,
  `idTrabalho` int(11) NOT NULL,
  KEY `idServico` (`idServico`),
  KEY `idTrabalho` (`idTrabalho`),
  CONSTRAINT `servicoTrabalho_ibfk_1` FOREIGN KEY (`idServico`) REFERENCES `servico` (`id`),
  CONSTRAINT `servicoTrabalho_ibfk_2` FOREIGN KEY (`idTrabalho`) REFERENCES `trabalho` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicoTrabalho`
--

LOCK TABLES `servicoTrabalho` WRITE;
/*!40000 ALTER TABLE `servicoTrabalho` DISABLE KEYS */;
INSERT INTO `servicoTrabalho` VALUES (1,4),(2,4),(3,1),(4,1),(4,4),(5,4),(6,5),(6,1),(7,4),(7,5),(7,1),(7,4),(8,4),(9,5),(9,1),(10,5),(11,4),(12,5),(13,5),(13,1),(14,3),(14,2),(15,2),(16,3);
/*!40000 ALTER TABLE `servicoTrabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalho`
--

DROP TABLE IF EXISTS `trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalho`
--

LOCK TABLES `trabalho` WRITE;
/*!40000 ALTER TABLE `trabalho` DISABLE KEYS */;
INSERT INTO `trabalho` VALUES (1,'IRPF'),(2,'Contab empresa'),(3,'criar empresa'),(4,'ITR'),(5,'contab pessoal');
/*!40000 ALTER TABLE `trabalho` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-19 17:30:11
