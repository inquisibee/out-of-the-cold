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
  `CreatedDate` timestamp NOT NULL,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`CarID`),
  KEY `StatusID_idx` (`StatusID`),
  KEY `MakeID_idx` (`MakeID`),
  KEY `ModelID_idx` (`ModelID`),
  KEY `CategoryID_idx` (`CategoryID`),
  KEY `ColorID` (`ColorID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ColorID` FOREIGN KEY (`ColorID`) REFERENCES `Color` (`ColorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
