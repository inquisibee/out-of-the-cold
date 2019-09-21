# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: CarTracker
# Generation Time: 2014-09-10 10:58:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Car
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Car`;

CREATE TABLE `Car` (
  `CarID` int(11) NOT NULL AUTO_INCREMENT,
  `MakeID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL,
  `DriveTrainID` int(11) DEFAULT NULL,
  `Description` longtext,
  `StockNumber` varchar(45) DEFAULT NULL,
  `VIN` varchar(45) DEFAULT NULL,
  `Rating` float(7,4) DEFAULT '0.0000',
  `Fuel` varchar(45) DEFAULT NULL,
  `Engine` varchar(45) DEFAULT NULL,
  `Transmission` varchar(45) DEFAULT NULL,
  `Mileage` int(11) DEFAULT NULL,
  `Year` int(4) NOT NULL,
  `ListPrice` int(11) NOT NULL,
  `SalePrice` int(11) DEFAULT NULL,
  `AcquisitionDate` datetime NOT NULL,
  `SaleDate` datetime DEFAULT NULL,
  `IsSold` bit(1) NOT NULL DEFAULT b'0',
  `StatusID` int(11) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`CarID`),
  KEY `StatusID_idx` (`StatusID`),
  KEY `MakeID_idx` (`MakeID`),
  KEY `ModelID_idx` (`ModelID`),
  KEY `CategoryID_idx` (`CategoryID`),
  KEY `ColorID` (`ColorID`),
  KEY `DriveTrainID` (`DriveTrainID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ColorID` FOREIGN KEY (`ColorID`) REFERENCES `Color` (`ColorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DriveTrainID` FOREIGN KEY (`DriveTrainID`) REFERENCES `DriveTrain` (`DriveTrainID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MakeID` FOREIGN KEY (`MakeID`) REFERENCES `Make` (`MakeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ModelID` FOREIGN KEY (`ModelID`) REFERENCES `Model` (`ModelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StatusID` FOREIGN KEY (`StatusID`) REFERENCES `Status` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;

INSERT INTO `Car` (`CarID`, `MakeID`, `ModelID`, `CategoryID`, `ColorID`, `DriveTrainID`, `Description`, `StockNumber`, `VIN`, `Rating`, `Fuel`, `Engine`, `Transmission`, `Mileage`, `Year`, `ListPrice`, `SalePrice`, `AcquisitionDate`, `SaleDate`, `IsSold`, `StatusID`, `CreatedDate`, `Active`)
VALUES
	(11,13,15,3,3,NULL,'Updated and beautiful',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1984,22000,19000,'2013-06-11 00:00:00','2013-03-10 00:00:00',b'1',5,'2013-06-10 00:15:02',b'1'),
	(12,3,1,3,3,1,'<span style=\"color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: 15px;\">***FORD CERTIFIED***This 2012 Ford Focus 4-DR SDN TITANIUM has a great GET UP AND GO to it with a HUGE AMOUNT of OPTIONS that COME STANDARD! Features Include: 17 Painted Aluminum Whls, HALOGEN HEADLAMPS, Rear Spoiler Fog Lamps, SIRIUS SAT RADIO, Leather Wrapped Str</span><span class=\"truncate_more\" style=\"color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: 15px;\">&nbsp;Wheel w/Cruise &amp; Audio Controls, Illuminated Entry, Split Fold Rear Seat, Ambient Lighting, TITANIUM PREMIUM PACKAGE, REAR PARKING AID SENSOR, Wipers-Front Rain Sensitive, 6-Way Power Drivers Seat, Advancetrac w/ESC, Performance Suspension, Easy Fuel Capless Filler, MYFORD TOUCH, Intelligent Access w/Push Button Start, Univer Garage Door Opener, 4-Wheel Disc Brakes w/ABS, PREMIUM SOUND SYSTEM, A/C w/Dual Climate Control, SYNC VOCE ACTIVATED SYS, Power Locks w/Remote Keyless Entry, Anti-Lock Braking System, Driver/Passenger Air Bags, SIDE AIR BAGS/CURTAINS, PERSONAL SAFETY SYSTEM, Occupnt Classification Sys, Securilock Pass Anti-Theft, TIRE PRESSURE MONITOR SYS, PERIMETER ALARM...Peace of mind comes standard on every Ford Certified Pre-Owned vehicle since each includes 12-month/12,000-mile Comprehensive Limited Warranty Coverage and a 7-year/100,000-mile Powertrain Limited Warranty Coverage. Every vehicle must pass a rigorous 172 Point-by-Point Inspection by factory-trained technicians. Each vehicle also receives a Vehicle History Overview Report to ensure that it meets the Ford Certified Pre-Owned standards, and that\'s just to name a few!...Call Stephanie to schedule a test drive and SAVE $300 off the Internet price! 888-710-2244 Call Briana or Stephanie to schedule a test drive and SAVE $300 off the Internet price! 888-710-2244. The #1 Ford Certified dealer in KS, MO, NE &amp; Iowa!</span>','00PS1934','1FAHP3J24CL282474',NULL,'E-85/Gasoline','2.0L I4 16V GDI DOHC Flexible Fuel','Automatic',12079,2005,18500,17000,'2013-04-01 00:00:00','2013-01-05 00:00:00',b'1',4,'2013-06-14 22:34:35',b'1'),
	(14,3,1,3,2,NULL,'<span style=\"color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: 15px;\">***FORD CERTIFIED***This 2012 Ford Focus 4-DR SDN TITANIUM has a great GET UP AND GO to it with a HUGE AMOUNT of OPTIONS that COME STANDARD!&nbsp;</span>','','',NULL,'','','',0,2012,24995,22995,'2013-06-04 00:00:00','2013-06-06 00:00:00',b'1',3,'2013-06-18 07:08:28',b'1'),
	(15,3,2,3,8,NULL,'<div id=\"aboutThisVehicleBox\" style=\"color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: 15px; width: auto !important;\"><div class=\"paddedBox\" style=\"padding-top: 10px; width: auto; clear: left;\"><div id=\"sellersnotes\">Call Briana or Stephanie to schedule a test drive and SAVE $300 off the Internet price! 888-710-2244. The #1 Ford Certified dealer in KS, MO, NE &amp; Iowa!</div></div><div></div></div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2010,25000,23850,'2013-05-09 00:00:00','2013-06-11 00:00:00',b'1',4,'2013-06-18 07:10:35',b'1'),
	(16,2,10,6,4,NULL,'Clean and reliable. Good air',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1998,9000,8500,'2013-03-01 00:00:00','2013-03-01 00:00:00',b'1',3,'2013-06-18 07:13:12',b'1'),
	(18,2,11,4,5,NULL,'Cute, zippy little car. Perfect for a short drive to work or school!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2007,15000,13995,'2011-09-15 00:00:00','2013-06-01 00:00:00',b'1',4,'2013-06-18 07:14:43',b'1'),
	(19,15,19,8,2,NULL,'This super-classic ride runs great and is a chick magnet!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1992,6300,5500,'2013-02-04 00:00:00','2013-05-28 00:00:00',b'1',4,'2013-06-18 07:16:06',b'1'),
	(20,7,18,6,6,NULL,'Good sized family car. Clean, good air',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2010,12000,18250,'2009-06-18 00:00:00','2013-04-12 00:00:00',b'1',4,'2013-06-18 07:18:32',b'1'),
	(22,13,16,2,10,NULL,'Beautiful, clean, runs great!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2009,11200,10550,'2013-04-01 00:00:00','2013-05-16 00:00:00',b'1',5,'2013-06-18 07:20:37',b'1'),
	(23,12,12,3,7,NULL,'Fast and zippy! 5-speed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2008,13400,8850,'2013-05-02 00:00:00','2013-02-23 00:00:00',b'1',4,'2013-06-18 07:21:49',b'1'),
	(24,9,5,6,4,NULL,'Quirky, but a great option at a reasonable price.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2009,15200,16550,'2012-05-01 00:00:00','2013-01-19 00:00:00',b'1',4,'2013-06-18 07:22:56',b'1'),
	(26,6,14,19,3,NULL,'Hoss of a truck, with amazing towing power and a roomy bed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2013,38000,36950,'2012-12-01 00:00:00','2013-06-10 00:00:00',b'1',4,'2013-06-18 07:24:20',b'1'),
	(27,6,14,19,9,8,'Beauty<span style=\"white-space:pre\">	</span>','56748AGH','VIN123-GJH-1924',NULL,'28','Nice','Auto',98000,2009,36000,32000,'2013-05-01 00:00:00','2013-04-03 00:00:00',b'1',4,'2013-06-29 13:59:18',b'1');

/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CarFeature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CarFeature`;

CREATE TABLE `CarFeature` (
  `CarFeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `FeatureID` int(11) NOT NULL,
  PRIMARY KEY (`CarFeatureID`),
  KEY `CarID_ibx3_idx` (`CarID`),
  KEY `FeatureID_idx` (`FeatureID`),
  CONSTRAINT `CarID_ibx3` FOREIGN KEY (`CarID`) REFERENCES `Car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FeatureID` FOREIGN KEY (`FeatureID`) REFERENCES `Feature` (`FeatureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CarFeature` WRITE;
/*!40000 ALTER TABLE `CarFeature` DISABLE KEYS */;

INSERT INTO `CarFeature` (`CarFeatureID`, `CarID`, `FeatureID`)
VALUES
	(91,15,6),
	(92,15,11),
	(93,15,12),
	(94,15,5),
	(95,15,13),
	(96,16,6),
	(97,16,11),
	(98,16,5),
	(99,18,6),
	(100,18,11),
	(101,18,7),
	(102,18,12),
	(103,18,3),
	(104,19,6),
	(105,19,11),
	(106,20,6),
	(107,20,11),
	(108,20,12),
	(109,20,5),
	(110,20,13),
	(111,22,6),
	(112,22,11),
	(113,22,12),
	(114,22,3),
	(115,22,14),
	(116,23,12),
	(117,23,1),
	(118,23,10),
	(119,24,6),
	(120,24,11),
	(121,24,12),
	(122,24,14),
	(123,26,6),
	(124,26,11),
	(125,26,7),
	(126,26,12),
	(127,26,3),
	(128,26,14),
	(129,26,5),
	(130,26,13),
	(131,26,4),
	(132,26,1),
	(133,26,10),
	(134,26,9),
	(135,26,2),
	(149,11,8),
	(150,11,1),
	(151,11,10),
	(152,11,9),
	(153,11,2),
	(154,11,12),
	(155,11,13),
	(156,11,4),
	(250,14,6),
	(251,14,11),
	(252,14,12),
	(253,14,13),
	(254,14,4),
	(255,14,1),
	(256,14,10),
	(257,14,9),
	(304,12,11),
	(305,12,12),
	(306,12,5),
	(307,12,13),
	(308,12,9),
	(309,27,11),
	(310,27,2),
	(311,27,10),
	(312,27,13);

/*!40000 ALTER TABLE `CarFeature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CarStaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CarStaff`;

CREATE TABLE `CarStaff` (
  `CarStaffID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`CarStaffID`),
  KEY `Car_idx43` (`CarID`),
  KEY `StaffID_idx1` (`StaffID`),
  CONSTRAINT `Car_idx43` FOREIGN KEY (`CarID`) REFERENCES `Car` (`CarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StaffID_idx1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CarStaff` WRITE;
/*!40000 ALTER TABLE `CarStaff` DISABLE KEYS */;

INSERT INTO `CarStaff` (`CarStaffID`, `CarID`, `StaffID`)
VALUES
	(84,15,3),
	(86,18,3),
	(87,19,3),
	(88,19,1),
	(89,20,3),
	(92,22,2),
	(93,22,3),
	(96,26,2),
	(97,26,3),
	(102,11,1),
	(103,11,2);

/*!40000 ALTER TABLE `CarStaff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` varchar(255) NOT NULL,
  `testValue` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Category`;

CREATE TABLE `Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;

INSERT INTO `Category` (`CategoryID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Microcar','MC','2013-05-27 23:01:21',b'1'),
	(2,'Subcompact Car','SC','2013-05-27 23:01:32',b'1'),
	(3,'Compact Car','CC','2013-05-27 23:01:36',b'1'),
	(4,'Mid-size Car','MSC','2013-05-27 23:01:56',b'1'),
	(5,'Entry-level Luxury Car','ELLC','2013-05-27 23:02:10',b'1'),
	(6,'Full-size Car','FSC','2013-05-27 23:02:23',b'1'),
	(7,'Grand Tourer','GT','2013-05-27 23:02:34',b'1'),
	(8,'Supercar','S','2013-05-27 23:02:46',b'1'),
	(9,'Convertible','CVT','2013-05-27 23:02:46',b'1'),
	(10,'Roadster','RS','2013-05-27 23:03:02',b'1'),
	(11,'MPV','MPV','2013-05-27 23:03:05',b'1'),
	(12,'Minivan','MV','2013-05-27 23:03:27',b'1'),
	(13,'Mini SUV','MSUV','2013-05-27 23:03:39',b'1'),
	(14,'Compact SUV','CSUV','2013-05-27 23:03:44',b'1'),
	(15,'Mid-size SUV','MSSUV','2013-05-27 23:04:00',b'1'),
	(16,'Full-size SUV','FSSUV','2013-05-27 23:04:15',b'1'),
	(17,'Mini Pickup Truck','MPT','2013-05-27 23:04:26',b'1'),
	(18,'Mid-size Pickup Truck','MSPT','2013-05-27 23:04:41',b'1'),
	(19,'Full-size Pickup Truck','FSPT','2013-05-27 23:04:51',b'1'),
	(20,'Heavy Duty Pickup Truck','HDPT','2013-05-27 23:05:08',b'1');

/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Color`;

CREATE TABLE `Color` (
  `ColorID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ColorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;

INSERT INTO `Color` (`ColorID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Antique Gold Metallic','Gold','2013-05-25 11:34:24',b'1'),
	(2,'Aqua Pearl Metallic','Aqua','2013-05-25 11:34:52',b'1'),
	(3,'Arctic White','White','2013-05-25 11:35:02',b'1'),
	(4,'Black Metallic','Black','2013-05-25 11:35:05',b'1'),
	(5,'British Racing Green','Green','2013-05-25 11:35:05',b'1'),
	(6,'Bronze Metallic','Bronze','2013-05-25 11:35:05',b'1'),
	(7,'Burgandy Metallic','Burgandy','2013-05-25 11:35:05',b'1'),
	(8,'Candy Apple Red','Red','2013-05-25 11:35:05',b'1'),
	(9,'Champagne Gold Metallic','Champagne','2013-05-25 11:35:05',b'1'),
	(10,'Chestnut Brown Metallic','Brown','2013-05-25 11:35:07',b'1');

/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DriveTrain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DriveTrain`;

CREATE TABLE `DriveTrain` (
  `DriveTrainID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`DriveTrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `DriveTrain` WRITE;
/*!40000 ALTER TABLE `DriveTrain` DISABLE KEYS */;

INSERT INTO `DriveTrain` (`DriveTrainID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Front Engine','FE','2013-06-24 22:52:03',b'1'),
	(2,'Front Wheel Drive','FF','2013-06-24 22:52:19',b'1'),
	(3,'Front Engine, Rear Wheel Drive','FR','2013-06-24 22:52:46',b'1'),
	(4,'Mid Engine, Rear Wheel Drive','MR','2013-06-24 22:53:02',b'1'),
	(5,'Rear Engine, Rear Wheel Drive','RR','2013-06-24 22:53:15',b'1'),
	(6,'Front Engine, All Wheel Drive','FA','2013-06-24 22:53:27',b'1'),
	(7,'All Wheel Drive','MA','2013-06-24 22:53:34',b'1'),
	(8,'Rear Engine, All Wheel Drive','RA','2013-06-24 22:53:46',b'1');

/*!40000 ALTER TABLE `DriveTrain` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Feature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Feature`;

CREATE TABLE `Feature` (
  `FeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`FeatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;

INSERT INTO `Feature` (`FeatureID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Power Door Mirrors','PDM','2013-06-09 23:02:23',b'1'),
	(2,'Trailer Hitch Receiver','THR','2013-06-09 23:02:33',b'1'),
	(3,'Dual Exhaust','DE','2013-06-09 23:02:44',b'1'),
	(4,'Power Convertible Roof','PCF','2013-06-09 23:02:49',b'1'),
	(5,'Glass Rear Window','GRW','2013-06-09 23:03:04',b'1'),
	(6,'Air Conditioning','AC','2013-06-09 23:03:15',b'1'),
	(7,'Automatic Temperature Control','ATC','2013-06-09 23:03:26',b'1'),
	(8,'Power Moonroof','PM','2013-06-09 23:03:39',b'1'),
	(9,'Speed Control','SC','2013-06-09 23:03:43',b'1'),
	(10,'Power Front Windows','PFW','2013-06-09 23:03:56',b'1'),
	(11,'AM/FM Radio','AMFMR','2013-06-09 23:04:10',b'0'),
	(12,'CD Player','CD','2013-06-09 23:04:14',b'0'),
	(13,'MP3 Player','MP3','2013-06-09 23:04:26',b'1'),
	(14,'DVD-Audio','DVD','2013-06-09 23:04:38',b'1');

/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Image`;

CREATE TABLE `Image` (
  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ImageID`),
  KEY `ImageCar_idx` (`CarID`),
  CONSTRAINT `ImageCar` FOREIGN KEY (`CarID`) REFERENCES `Car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;

INSERT INTO `Image` (`ImageID`, `CarID`, `Path`, `CreatedDate`, `Active`)
VALUES
	(66,12,'/includes/images/cars/12/03.jpg','2013-06-29 14:04:11',1),
	(67,12,'/includes/images/cars/12/02.jpg','2014-04-11 01:03:47',0),
	(68,12,'/includes/images/cars/12/04.jpg','2014-04-11 01:03:48',0),
	(69,12,'/includes/images/cars/12/05.jpg','2013-06-29 14:04:11',1),
	(76,27,'/includes/images/cars/27/luka.png','2013-06-29 14:14:25',1);

/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Make
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Make`;

CREATE TABLE `Make` (
  `MakeID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`MakeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Make` WRITE;
/*!40000 ALTER TABLE `Make` DISABLE KEYS */;

INSERT INTO `Make` (`MakeID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Toyota','Toyota','2013-06-08 08:34:38',b'1'),
	(2,'Honda','Honda','2013-06-08 08:35:05',b'1'),
	(3,'Ford','Ford','2013-06-08 08:35:27',b'1'),
	(4,'Lexus','Lexus','2013-06-08 08:35:42',b'1'),
	(5,'Subaru','Subaru','2013-06-08 08:35:53',b'1'),
	(6,'Dodge','Dodge','2013-06-08 08:36:12',b'1'),
	(7,'Saturn','Saturn','2013-06-08 08:37:02',b'1'),
	(8,'Hyundai','Hyundai','2013-06-08 08:37:43',b'1'),
	(9,'Nissan','Nissan','2013-06-08 08:37:54',b'1'),
	(10,'Corvette','Corvette','2013-06-08 08:38:10',b'1'),
	(11,'Saab','Saab','2013-06-08 08:38:15',b'1'),
	(12,'Fiat','Fiat','2013-06-08 08:38:30',b'1'),
	(13,'Chevrolet','Chevrolet','2013-06-08 08:38:52',b'1'),
	(14,'Chrysler','Chrysler','2013-06-08 08:39:09',b'1'),
	(15,'Eagle','Eagle','2013-06-08 10:23:00',b'1');

/*!40000 ALTER TABLE `Make` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Model`;

CREATE TABLE `Model` (
  `ModelID` int(11) NOT NULL AUTO_INCREMENT,
  `MakeID` int(11) NOT NULL,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ModelID`),
  KEY `MakeID_idx` (`MakeID`),
  CONSTRAINT `MakeID_ibx1` FOREIGN KEY (`MakeID`) REFERENCES `Make` (`MakeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Model` WRITE;
/*!40000 ALTER TABLE `Model` DISABLE KEYS */;

INSERT INTO `Model` (`ModelID`, `MakeID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,3,'Focus','Focus','2013-06-08 08:51:18',b'1'),
	(2,3,'Fusion','Fusion','2013-06-08 10:15:31',b'1'),
	(3,3,'Explorer','Explorer','2013-06-08 10:15:59',b'1'),
	(4,3,'Sierra','Sierra','2013-06-08 10:17:18',b'1'),
	(5,9,'Cube','Cube','2013-06-08 10:18:48',b'1'),
	(6,9,'Juke','Juke','2013-06-08 10:19:03',b'1'),
	(7,9,'Pixo','Pixo','2013-06-08 10:19:19',b'1'),
	(8,5,'1600','1600','2013-06-08 10:19:33',b'1'),
	(9,5,'Tribeca','Tribeca','2013-06-08 10:19:50',b'1'),
	(10,2,'Accord','Accord','2013-06-08 10:20:09',b'1'),
	(11,2,'Civic','Civic','2013-06-08 10:20:13',b'1'),
	(12,12,'Brava','Brava','2013-06-08 10:20:36',b'1'),
	(13,12,'Idea','Idea','2013-06-08 10:20:40',b'1'),
	(14,6,'Ram','Ram','2013-06-08 10:20:53',b'1'),
	(15,6,'Caliber','Caliber','2013-06-08 10:21:04',b'1'),
	(16,13,'Aveo','Aveo','2013-06-08 10:21:59',b'1'),
	(17,13,'Spark','Spark','2013-06-08 10:22:12',b'1'),
	(18,7,'Aura','Aura','2013-06-08 10:22:20',b'1'),
	(19,15,'Premier','Premier','2013-06-08 10:23:17',b'1');

/*!40000 ALTER TABLE `Model` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Position`;

CREATE TABLE `Position` (
  `PositionID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;

INSERT INTO `Position` (`PositionID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'General Manager','GM','2013-05-27 23:00:02',b'1'),
	(2,'Manager','Mgr','2013-05-27 23:00:10',b'1'),
	(3,'Sales Person','SP','2013-05-27 23:00:21',b'1'),
	(4,'Finance Officer','FO','2013-05-27 23:00:26',b'1');

/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Staff`;

CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT '',
  `LastName` varchar(45) DEFAULT '',
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Address1` varchar(45) DEFAULT '',
  `Address2` varchar(45) DEFAULT '',
  `City` varchar(45) DEFAULT '',
  `State` varchar(2) DEFAULT '',
  `PostalCode` varchar(10) DEFAULT '',
  `Phone` varchar(45) DEFAULT '',
  `HireDate` date DEFAULT NULL,
  `PositionID` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;

INSERT INTO `Staff` (`StaffID`, `FirstName`, `LastName`, `Username`, `Password`, `DOB`, `Address1`, `Address2`, `City`, `State`, `PostalCode`, `Phone`, `HireDate`, `PositionID`, `CreatedDate`, `Active`)
VALUES
	(1,'Fred','Manchesterton','existdissolve@gmail.com','AD9CC60D82E0954272E53BEF78B6DF7686118D2A','1981-07-23','1523 Fake Way','Apt C','Fakesville1','KS','67821','555-555-5555','2008-05-19',1,'2013-06-01 07:14:05',b'1'),
	(2,'Gary','Feldman','existdissolve2@gmail.com','AD9CC60D82E0954272E53BEF78B6DF7686118D2A','1983-07-09','16 MonteWilliker Ave','','Fakesvilleington','KS','88910','555-555-5551','2000-06-06',4,'2013-06-01 16:51:58',b'1'),
	(3,'Josh','Groban','existdissolve3@gmail.com','AD9CC60D82E0954272E53BEF78B6DF7686118D2A','1985-09-16','16104','','Overland Park','KS','66062','555-555-5555','2009-06-03',3,'2013-06-18 07:11:50',b'1');

/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table StaffUserRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `StaffUserRole`;

CREATE TABLE `StaffUserRole` (
  `StaffUserRoleID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `StaffID` int(11) NOT NULL,
  `UserRoleID` int(11) NOT NULL,
  PRIMARY KEY (`StaffUserRoleID`),
  KEY `StaffID_udkk` (`StaffID`),
  KEY `UserRoleID_idk_idx` (`UserRoleID`),
  CONSTRAINT `StaffID_udkk` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  CONSTRAINT `UserRoleID_idk` FOREIGN KEY (`UserRoleID`) REFERENCES `UserRole` (`UserRoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `StaffUserRole` WRITE;
/*!40000 ALTER TABLE `StaffUserRole` DISABLE KEYS */;

INSERT INTO `StaffUserRole` (`StaffUserRoleID`, `StaffID`, `UserRoleID`)
VALUES
	(26,1,1),
	(27,1,2),
	(28,3,2),
	(29,2,3);

/*!40000 ALTER TABLE `StaffUserRole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Status`;

CREATE TABLE `Status` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;

INSERT INTO `Status` (`StatusID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Approved','Approved','2013-05-27 22:59:13',b'1'),
	(2,'Rejected','Rejected','2013-05-27 22:59:29',b'1'),
	(3,'In-Review','In-Review','2013-05-27 22:59:51',b'1'),
	(4,'Initiated','Initiated','2013-07-09 22:48:08',b'1'),
	(5,'In-Audit','In-Audit','2013-07-09 22:48:18',b'1');

/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table UserRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserRole`;

CREATE TABLE `UserRole` (
  `UserRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(255) NOT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `UserRole` WRITE;
/*!40000 ALTER TABLE `UserRole` DISABLE KEYS */;

INSERT INTO `UserRole` (`UserRoleID`, `LongName`, `ShortName`, `CreatedDate`, `Active`)
VALUES
	(1,'Admin','Admin','2013-06-29 07:09:06',b'1'),
	(2,'Content Manager','CM','2013-06-29 07:09:12',b'1'),
	(3,'Auditor','Audit','2013-07-09 22:50:12',b'1');

/*!40000 ALTER TABLE `UserRole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLogin` date DEFAULT NULL,
  `FKRoleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK6A68E0848F0E1AC` (`FKRoleID`),
  CONSTRAINT `FK6A68E0848F0E1AC` FOREIGN KEY (`FKRoleID`) REFERENCES `roles` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Workflow`;

CREATE TABLE `Workflow` (
  `WorkflowID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `LastStatusID` int(11) NOT NULL,
  `NextStatusID` int(11) DEFAULT NULL,
  `StaffID` int(11) NOT NULL,
  `Notes` text,
  `Approved` bit(1) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`WorkflowID`),
  KEY `StaffID_fkwf_idx` (`StaffID`),
  KEY `CarID_fkwf` (`CarID`),
  KEY `CurrentStatusID_fkfw_idx` (`LastStatusID`),
  KEY `NextStatusID_fkfw_idx` (`NextStatusID`),
  CONSTRAINT `CarID_fkwf` FOREIGN KEY (`CarID`) REFERENCES `Car` (`CarID`),
  CONSTRAINT `CurrentStatusID_fkfw` FOREIGN KEY (`LastStatusID`) REFERENCES `Status` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NextStatusID_fkfw` FOREIGN KEY (`NextStatusID`) REFERENCES `Status` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StaffID_fkwf` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Workflow` WRITE;
/*!40000 ALTER TABLE `Workflow` DISABLE KEYS */;

INSERT INTO `Workflow` (`WorkflowID`, `CarID`, `LastStatusID`, `NextStatusID`, `StaffID`, `Notes`, `Approved`, `CreatedDate`, `Active`)
VALUES
	(1,11,5,3,1,'Ready for Audit',b'1','2013-07-11 06:49:11',b'1'),
	(2,11,3,1,1,'Ready for Review',b'1','2013-07-11 06:50:06',b'1'),
	(3,11,1,4,1,'Need to reevaluate this one',b'1','2013-07-11 06:53:24',b'1'),
	(4,11,4,5,1,'asdfasdf',b'1','2013-07-11 06:54:08',b'1'),
	(5,11,5,3,1,'Ready for review',b'1','2013-07-11 06:55:14',b'1'),
	(6,11,5,3,1,'Approved!',b'1','2013-07-11 06:55:24',b'1'),
	(7,11,5,3,1,'Approved!',b'1','2013-07-11 06:55:47',b'1'),
	(8,11,3,1,1,'Aproved!',b'1','2013-07-11 06:57:15',b'1'),
	(9,11,3,2,1,'Need to reevaluate',b'0','2013-07-11 06:57:28',b'1'),
	(10,11,2,4,1,'Restarting',b'1','2013-07-11 06:58:17',b'1'),
	(11,11,4,5,1,'Ready for Audit',b'1','2013-07-11 06:58:27',b'1'),
	(12,11,5,3,1,'Ready for Review',b'1','2013-07-11 06:58:42',b'1'),
	(13,11,3,1,1,'Approval granted',b'1','2013-07-11 06:58:49',b'1'),
	(14,11,1,4,1,'Restarting',b'1','2013-07-11 06:58:57',b'1'),
	(15,11,4,5,1,'Ready for audit',b'1','2013-07-11 06:59:09',b'1'),
	(16,11,5,4,1,'Need more work',b'0','2013-07-11 07:01:11',b'1'),
	(17,11,4,5,1,'Ready for re-audit',b'1','2013-07-11 07:01:20',b'1'),
	(18,11,5,3,1,'Ready for review',b'1','2013-07-11 07:01:25',b'1'),
	(19,11,3,5,1,'Please do a more thorough audit',b'0','2013-07-11 07:01:34',b'1'),
	(20,11,5,4,1,'RE-enter data please',b'0','2013-07-11 23:15:58',b'1'),
	(21,11,4,5,1,'stff',b'1','2013-07-12 06:04:47',b'1'),
	(22,16,4,5,1,'Ready for audit',b'1','2013-07-12 21:06:48',b'1'),
	(23,16,5,3,1,'Ready for review',b'1','2013-07-14 00:03:18',b'1'),
	(24,14,4,5,1,'Test',b'1','2013-07-14 00:34:56',b'1'),
	(25,22,4,5,1,'TEst',b'1','2013-07-14 00:35:10',b'1'),
	(26,14,5,3,1,'Done',b'1','2013-07-14 00:35:19',b'1');

/*!40000 ALTER TABLE `Workflow` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
