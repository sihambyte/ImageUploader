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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'test06','test06@test.com','$2b$12$EoGkkqyxJj8L5dPtMvuOXe4VG02LLkekX6xfszlj9..SoFuunWTUC',1,'2021-11-16 15:48:37'),(5,'test01','test01@test.com','$2b$12$bbb7nqux4n1SEurky7ODwueecFDRu/SQi.AMdknSwQtqCUUy3yTjG',1,'2021-12-05 18:40:27'),(6,'test02','test02@test.com','$2b$12$b.rReDaEwUhOs/jFxbISTevqkToEuV2wwDsxIj.V.RVQoi8wH472u',1,'2021-12-05 18:45:43'),(7,'test03','test03@test.com','$2b$12$pHrVCLdhMpPJgnmqXn2lTe7bP32BaqDV/vOxwgK4WRVQ7HC.jeYT6',1,'2021-12-05 18:49:02'),(8,'test04','test04@test.com','$2b$12$USnMWwiKKm874AdGNedsPeOHtf.ikgC9abQW8uJRLgJMmTk1PEVLK',1,'2021-12-05 18:52:12'),(9,'test05','test05@test.com','$2b$12$qQLN7VLl7TDUBYwhnaBDZeoKXDWq3NV466mbAAQ3b30i76Gm2FEM2',1,'2021-12-05 18:55:17'),(10,'test07','test07@test.com','$2b$12$7vkR08fO6Bom3HESX3XoPOQpeS6mhpZeJ.t7Zi1RzQ.F96XMiNsFS',1,'2021-12-05 18:58:18'),(11,'test08','test08@test.com','$2b$12$WNxupzryBxfamk7zKX31lulcr97zlK14VOaFGOIlD/7oN5lg3Iil6',1,'2021-12-05 18:59:57'),(12,'refactorTest01','refactor01@gmail.com','$2b$12$cROWMLTUxnaGUubuAy898uLTj7.fACbA.3mM8I1aYxv9qwrd6Sm36',1,'2021-12-07 18:11:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
