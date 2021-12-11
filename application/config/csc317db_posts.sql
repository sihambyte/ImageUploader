-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` mediumtext NOT NULL,
  `photopath` varchar(2048) NOT NULL,
  `thumbnail` varchar(2048) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `is_UNIQUE` (`id`),
  KEY `postauthor_idx` (`fk_userid`),
  CONSTRAINT `postauthor` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test06Image','test002','public/images/uploads/098d6ddf6090ff3e3733986e29c9f440ddb003a1b0ff.jpeg','public/images/uploads/thumbnail-098d6ddf6090ff3e3733986e29c9f440ddb003a1b0ff.jpeg',1,'2021-12-05 15:22:20',3),(2,'test 01','this is a test description','public/images/uploads/95e1465cdda6fc4681636a0f4d6027134b4701236546.png','public/images/uploads/thumbnail-95e1465cdda6fc4681636a0f4d6027134b4701236546.png',1,'2021-12-05 18:42:36',5),(3,'test 02','This is a tree','public/images/uploads/9ea2f2ef1aa49d38b87bd6d64beb3a68c243cd34935b.jpeg','public/images/uploads/thumbnail-9ea2f2ef1aa49d38b87bd6d64beb3a68c243cd34935b.jpeg',1,'2021-12-05 18:47:16',6),(4,'Flower','A picture of a flower','public/images/uploads/eea16ed452f66fe631341720461cdec8904b5ffee83b.jpeg','public/images/uploads/thumbnail-eea16ed452f66fe631341720461cdec8904b5ffee83b.jpeg',1,'2021-12-05 18:50:04',7),(5,'Birds','There are three birds in this picture','public/images/uploads/a97036ce87755509b9223b98e6902a361b9dbb6bcc46.jpeg','public/images/uploads/thumbnail-a97036ce87755509b9223b98e6902a361b9dbb6bcc46.jpeg',1,'2021-12-05 18:53:41',8),(6,'Autumn','It\'s fall season','public/images/uploads/349c19cbfa497df71519259854258ad661cca43ead4e.jpeg','public/images/uploads/thumbnail-349c19cbfa497df71519259854258ad661cca43ead4e.jpeg',1,'2021-12-05 18:56:44',9),(7,'Waterfall ','this a picture of a waterfall','public/images/uploads/eee9ae90d31d7751d4fa53d06a62442e2839d949817f.jpeg','public/images/uploads/thumbnail-eee9ae90d31d7751d4fa53d06a62442e2839d949817f.jpeg',1,'2021-12-05 18:59:10',10),(8,'Dog','Picture of a cute dog','public/images/uploads/a7290b8355a444037c2e9f2782995ef325e70db1b0a2.jpeg','public/images/uploads/thumbnail-a7290b8355a444037c2e9f2782995ef325e70db1b0a2.jpeg',1,'2021-12-05 19:00:41',11),(9,'post model','post post model','public/images/uploads/1a174aa735aabe84824602e06d512d1112fee5a2a062.png','public/images/uploads/thumbnail-1a174aa735aabe84824602e06d512d1112fee5a2a062.png',1,'2021-12-07 19:59:44',3);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10 20:59:42
