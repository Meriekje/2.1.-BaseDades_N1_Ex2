-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id_channel` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_channel`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,1,'Tech Reviews','A channel dedicated to tech product reviews.','2025-03-01 12:00:00'),(2,2,'Cooking Mastery','Learn new recipes and cooking techniques.','2025-02-15 08:30:00');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_reaction`
--

DROP TABLE IF EXISTS `comment_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_reaction` (
  `id_comment` int NOT NULL,
  `id_user` int NOT NULL,
  `reaction` enum('like','dislike') NOT NULL,
  `reacted_at` datetime NOT NULL,
  PRIMARY KEY (`id_comment`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `comment_reaction_ibfk_1` FOREIGN KEY (`id_comment`) REFERENCES `comments` (`id_comment`),
  CONSTRAINT `comment_reaction_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_reaction`
--

LOCK TABLES `comment_reaction` WRITE;
/*!40000 ALTER TABLE `comment_reaction` DISABLE KEYS */;
INSERT INTO `comment_reaction` VALUES (1,2,'like','2025-03-01 12:30:00'),(2,1,'dislike','2025-02-18 14:05:00');
/*!40000 ALTER TABLE `comment_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `id_video` int NOT NULL,
  `id_user` int NOT NULL,
  `text` text NOT NULL,
  `commented_at` datetime NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_video` (`id_video`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id_video`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'Great video! I love the tech analysis.','2025-03-01 12:15:00'),(2,2,2,'The recipe was delicious! Thanks for sharing.','2025-02-18 14:00:00');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_videos`
--

DROP TABLE IF EXISTS `playlist_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_videos` (
  `id_playlist` int NOT NULL,
  `id_video` int NOT NULL,
  PRIMARY KEY (`id_playlist`,`id_video`),
  KEY `id_video` (`id_video`),
  CONSTRAINT `playlist_videos_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlists` (`id_playlist`),
  CONSTRAINT `playlist_videos_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_videos`
--

LOCK TABLES `playlist_videos` WRITE;
/*!40000 ALTER TABLE `playlist_videos` DISABLE KEYS */;
INSERT INTO `playlist_videos` VALUES (1,1),(2,1),(1,2);
/*!40000 ALTER TABLE `playlist_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `status` enum('public','private') NOT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'Tech Favorites','A collection of my favorite tech videos.','2025-03-01 15:00:00','public'),(2,2,'Healthy Recipes','A playlist of healthy recipes I like to cook.','2025-02-18 10:00:00','private');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id_subscriber` int NOT NULL,
  `id_channel` int NOT NULL,
  `subscribed_at` datetime NOT NULL,
  PRIMARY KEY (`id_subscriber`,`id_channel`),
  KEY `id_channel` (`id_channel`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`id_subscriber`) REFERENCES `users` (`id_user`),
  CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`id_channel`) REFERENCES `channels` (`id_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,'2025-03-01 12:10:00'),(2,1,'2025-02-20 15:00:00'),(2,2,'2025-02-18 16:00:00');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (3,'Comedy'),(2,'Education'),(1,'Music'),(4,'Sports');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `username` varchar(100) NOT NULL,
  `date_birth` date NOT NULL,
  `sex` enum('Man','Woman','No binary') DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1@example.com','password123','user1','1990-01-01','Man','USA','12345'),(2,'user2@example.com','password456','user2','1985-05-15','Woman','Canada','54321');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_reactions`
--

DROP TABLE IF EXISTS `video_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_reactions` (
  `id_video` int NOT NULL,
  `id_user` int NOT NULL,
  `reaction` enum('like','dislike') NOT NULL,
  `reacted_at` datetime NOT NULL,
  PRIMARY KEY (`id_video`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `video_reactions_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id_video`),
  CONSTRAINT `video_reactions_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_reactions`
--

LOCK TABLES `video_reactions` WRITE;
/*!40000 ALTER TABLE `video_reactions` DISABLE KEYS */;
INSERT INTO `video_reactions` VALUES (1,1,'like','2025-03-01 13:00:00'),(1,2,'dislike','2025-03-01 13:05:00'),(2,1,'like','2025-03-01 14:00:00');
/*!40000 ALTER TABLE `video_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_tag`
--

DROP TABLE IF EXISTS `video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_tag` (
  `id_video` int NOT NULL,
  `id_tag` int NOT NULL,
  PRIMARY KEY (`id_video`,`id_tag`),
  KEY `id_tag` (`id_tag`),
  CONSTRAINT `video_tag_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id_video`),
  CONSTRAINT `video_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_tag`
--

LOCK TABLES `video_tag` WRITE;
/*!40000 ALTER TABLE `video_tag` DISABLE KEYS */;
INSERT INTO `video_tag` VALUES (1,1),(1,2),(2,3),(2,4);
/*!40000 ALTER TABLE `video_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id_video` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `size` int NOT NULL,
  `name_file` varchar(255) NOT NULL,
  `duration` int DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `view_quant` int NOT NULL DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `dislikes` int NOT NULL DEFAULT '0',
  `status` enum('public','hidden','private') NOT NULL,
  `published` datetime NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_video`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'Learn SQL Basics','This is an educational video about SQL.',5000000,'learn_sql_basics.mp4',300,'thumbnail1.jpg',100,20,1,'public','2025-03-26 10:00:00',1),(2,'Amazing Cooking Recipe','Watch this recipe tutorial for a delicious meal.',8000000,'cooking_recipe.mp4',600,'thumbnail2.jpg',200,50,5,'private','2025-03-25 14:30:00',2),(3,'Fitness for Beginners','A workout video for beginners with easy exercises.',4000000,'fitness_beginner.mp4',350,'thumbnail3.jpg',150,30,2,'public','2025-03-27 08:00:00',1);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-01 11:22:38
