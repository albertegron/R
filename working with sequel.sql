CREATE DATABASE  IF NOT EXISTS `LibraryDB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `LibraryDB`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: LibraryDB
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
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `books` (
  `Title` VARCHAR(100) NOT NULL,
  `Author` VARCHAR(25) NULL,
  `BookNo` INT NOT NULL,
  `PubDate` DATE NULL,
  `Cost` FLOAT NULL,
  PRIMARY KEY (`BookNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` 
VALUES ('Data Analysis','S Sarantakos',29,'2007-01-01',108),
('Qualitative Data Analysis','Mathew B Miles',437,'2019-01-01',76),
('Data Analysis','EdwardL Bike',3954,'2007-01-01',110),
('Statistical Data Analysis Explained','Clemens Reimann',8324,'2008-01-01',57),
('Data Analysis','Gerard Govaert',55813,'2009-01-01',45);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `borrower` (
  `LibraryCardNo` INT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Address` VARCHAR(255),
  PRIMARY KEY (`LibraryCardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` 
VALUES (1667, 'Carmen J Clyburn','2604 Victoria Park Ave'),
(5007,'Ali Ahmadi','3853 Broadmoor Blvd'),
(7032,'Sythoun Sun','3783 Front Street'),
(8163,'Jess Huynh','3094 Brew Creek Road'),
(9781,'Ethel V. Stainbrook','1074 Glover Road');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `BookLended`
--

DROP TABLE IF EXISTS `bookLended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `bookLended` (
  `LibraryCardNo` INT NOT NULL,
  `CheckOutDate` Date NOT NULL,
  `ReturnDate` Date,
  `BookId` INT NOT NULL,
  `CopyId` INT NOT NULL,
  `Librarian` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookLended`
--

LOCK TABLES `bookLended` WRITE;
/*!40000 ALTER TABLE `bookLended` DISABLE KEYS */;
INSERT INTO `bookLended` 
VALUES (5007,'2019-09-08','2019-12-08',29,1,'Sani Naddaf'),
(7032,'2019-09-15','2019-12-08',55813,2,'Sani Naddaf'),
(1667,'2019-08-27','2019-11-27',55813,1,'Gelma Vito'),
(7032,'2019-08-27','2019-11-27',8324,1,'Jong-Won Kim'),
(7032,'2019-08-27','2019-11-27',55813,3,'Emily Blake');
/*!40000 ALTER TABLE `bookLended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `librarian` (
  `LibrarianNo` INT NOT NULL,
  `Name` VARCHAR(25),
  `PhoneNo` VARCHAR(13),
  `Librarian` varchar(25),
  PRIMARY KEY (`LibrarianNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` 
VALUES (18,'Gelma Vito', '(647)229-8831', 'No'),
(20,'Sani Naddaf', '(416)342-1384', 'No'),
(29,'Emily Blake', '(416)983-6524', 'No'),
(35,'Rachel Canhasi', '(416)754-4056', 'Yes'),
(49,'Jon-Won Kim', '(647)254-7738', 'No');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;