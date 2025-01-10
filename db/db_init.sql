SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET SESSION collation_connection = utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS entrename;

USE entrename;

-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: entrename
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id_activity` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user_instructor` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sport` bigint unsigned NOT NULL,
  `n_activity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `week_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slot_hour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_activity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spots` int NOT NULL,
  `spots_available` int NOT NULL,
  `slug_activity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_activity`),
  CONSTRAINT `activities_id_user_instructor_foreign` FOREIGN KEY (`id_user_instructor`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `activities_id_sport_foreign` FOREIGN KEY (`id_sport`) REFERENCES `sports` (`id_sport`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `activities` (`id_activity`, `id_user_instructor`, `id_sport`, `n_activity`, `description`, `week_day`, `slot_hour`, `img_activity`, `spots`, `spots_available`, `slug_activity`) VALUES
(1, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', 2, 'Baloncesto Avanzado', 'Clase avanzada de baloncesto', 'Lunes', '9:00-10:00', 'baloncesto_avanzado.jpg', 10, 10, 'baloncesto-avanzado'),
(2, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', 1, 'Fútbol Básico', 'Clase introductoria de fútbol', 'Martes', '10:00-11:00', 'futbol_basico.jpg', 15, 15, 'futbol-basico'),
(3, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', 3, 'Tenis Intermedio', 'Clase intermedia de tenis', 'Miércoles', '11:00-12:00', 'tenis_intermedio.jpg', 8, 8, 'tenis-intermedio'),
(4, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', 2, 'Baloncesto Básico', 'Clase básica de baloncesto', 'Jueves', '9:00-10:00', 'baloncesto_basico.jpg', 12, 12, 'baloncesto-basico'),
(5, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', 1, 'Fútbol Intermedio', 'Clase intermedia de fútbol', 'Viernes', '10:00-11:00', 'futbol_intermedio.jpg', 15, 15, 'futbol-intermedio'),
(6, 'c32f8f00-2b00-4ca9-bd60-72a95022cfb8', 3, 'Tenis Avanzado', 'Clase avanzada de tenis', 'Sábado', '11:00-12:00', 'tenis_avanzado.jpg', 6, 6, 'tenis-avanzado');

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id_admin` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_admin`),
  CONSTRAINT `admins_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `admins` (`id_admin`, `id_user`) VALUES
(1, 'e6081264-147a-4a2c-9de9-61665fdbcfcd');

--
-- Table structure for table `blacklist_tokens`
--

DROP TABLE IF EXISTS `blacklist_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist_tokens` (
  `id_blacklist` bigint unsigned NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id_booking` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_count_hours` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `slug_booking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_booking`),
  CONSTRAINT `bookings_id_count_hours_foreign` FOREIGN KEY (`id_count_hours`) REFERENCES `courts_hours` (`id_court_hour`) ON DELETE CASCADE,
  CONSTRAINT `bookings_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `bookings` (`id_booking`, `id_user`, `id_count_hours`, `date`, `is_deleted`, `slug_booking`) VALUES
(1, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 1, '2024-12-29', 0, 'booking-2024-12-29T18:35:27.897043100Z');

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nif` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tlf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  CONSTRAINT `clients_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `clients` (`id_client`, `id_user`, `nif`, `tlf`) VALUES
(1, 'f9a64c70-9b25-48c0-9b9e-9652012b74cc', '12345678A', '600123456'),
(2, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', '48289926T', '625761313');

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_activity` bigint unsigned NOT NULL,
  `slug_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  CONSTRAINT `comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `comments_id_activity_foreign` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id_activity`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `comments` (`id_comment`, `body`, `date`, `id_user`, `id_activity`, `slug_comment`) VALUES
(1, 'Este es un comentario de prueba', '2024-12-31', '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 5, 'comment-futbol-intermedio-montes'),
(2, 'Este es un comentario de prueba', '2024-12-31', '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 2, 'comment-futbol-basico-montes'),
(3, 'Este es un comentario de prueba', '2024-12-31', '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 5, 'comment-futbol-intermedio-montes-1');

--
-- Table structure for table `courts`
--

DROP TABLE IF EXISTS `courts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courts` (
  `id_court` bigint unsigned NOT NULL AUTO_INCREMENT,
  `n_court` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_court` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_court` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_court`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `courts` (`id_court`, `n_court`, `img_court`, `slug_court`) VALUES 
(1,'Principal fútbol','principal_futbol.jpg','principal-futbol-061a47eb4d'),
(2,'Secundaria fútbol','secundaria_futbol.jpg','secundaria-futbol-70c620b9b8'),
(3,'Principal baloncesto','principal_baloncesto.jpg','principal-baloncesto-aedae4faa3'),
(4,'Secundaria baloncesto','secundaria_baloncesto.jpg','secundaria-baloncesto-c0f7fd7b38'),
(5,'Principal tenis','principal_tenis.jpg','principal-tenis-be7b396818'),
(6,'Secundaria tenis','secundaria_tenis.jpg','secundaria-tenis-ca17425666'),
(7,'Terciaria tenis','terciaria_tenis.jpg','terciaria-tenis-0e84240ae5'),
(8,'Principal voleibol','principal_voleibol.jpg','principal-voleibol-ee674f4e8c');

--
-- Table structure for table `courts_hours`
--

DROP TABLE IF EXISTS `courts_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courts_hours` (
  `id_court_hour` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_court` bigint unsigned NOT NULL,
  `id_hour` bigint unsigned NOT NULL,
  `id_month` bigint unsigned NOT NULL,
  `day_number` int NOT NULL,
  `year` int NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `slug_court_hour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_court_hour`),
  CONSTRAINT `courts_hours_id_court_foreign` FOREIGN KEY (`id_court`) REFERENCES `courts` (`id_court`) ON DELETE CASCADE,
  CONSTRAINT `courts_hours_id_hour_foreign` FOREIGN KEY (`id_hour`) REFERENCES `hours` (`id_hour`) ON DELETE CASCADE,
  CONSTRAINT `courts_hours_id_month_foreign` FOREIGN KEY (`id_month`) REFERENCES `months` (`id_month`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `courts_hours` (`id_court_hour`, `id_court`, `id_hour`, `id_month`, `day_number`, `year`, `available`, `slug_court_hour`) VALUES
(1, 1, 9, 11, 30, 2024, 0, 'pista1-09:00-10:00-30-12-2024'),
(2, 1, 11, 0, 2, 2025, 1, 'pista1-11:00-12:00-02-01-2025'),
(3, 1, 8, 0, 10, 2025, 1, 'pista1-08:00-09:00-10-01-2025'),
(4, 1, 8, 1, 20, 2025, 1, 'pista1-08:00-09:00-20-02-2025'),
(5, 2, 11, 0, 8, 2025, 1, 'pista2-11:00-12:00-08-01-2025'),
(6, 2, 17, 1, 15, 2025, 1, 'pista2-17:00-18:00-15-02-2025');

--
-- Table structure for table `courts_sports`
--

DROP TABLE IF EXISTS `courts_sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courts_sports` (
  `id_sport` bigint unsigned NOT NULL,
  `id_court` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_sport`,`id_court`),
  CONSTRAINT `courts_sports_id_court_foreign` FOREIGN KEY (`id_court`) REFERENCES `courts` (`id_court`) ON DELETE CASCADE,
  CONSTRAINT `courts_sports_id_sport_foreign` FOREIGN KEY (`id_sport`) REFERENCES `sports` (`id_sport`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `courts_sports` (`id_sport`, `id_court`) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8);

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id_follower` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_followed` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_follower`,`id_followed`),
  CONSTRAINT `follows_id_follower_foreign` FOREIGN KEY (`id_follower`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `follows_id_followed_foreign` FOREIGN KEY (`id_followed`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `follows` (`id_follower`, `id_followed`) VALUES 
('c32f8f00-2b00-4ca9-bd60-72a95022cfb8', '7e2f069a-e5db-4c26-b006-a3ef07b2b26e'),
('7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 'c32f8f00-2b00-4ca9-bd60-72a95022cfb8');

--
-- Table structure for table `hours`
--

DROP TABLE IF EXISTS `hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hours` (
  `id_hour` bigint unsigned NOT NULL,
  `hour` int NOT NULL,
  `slot_hour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `hours` (`id_hour`, `slot_hour`) VALUES
(8, '8:00-9:00'),
(9, '9:00-10:00'),
(10, '10:00-11:00'),
(11, '11:00-12:00'),
(12, '12:00-13:00'),
(13, '13:00-14:00'),
(16, '16:00-17:00'),
(17, '17:00-18:00'),
(18, '18:00-19:00'),
(19, '19:00-20:00');

--
-- Table structure for table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscriptions` (
  `id_inscription` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_activity` bigint unsigned NOT NULL,
  `id_user_client` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `slug_inscription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_inscription`),
  CONSTRAINT `inscriptions_id_activity_foreign` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id_activity`) ON DELETE CASCADE,
  CONSTRAINT `inscriptions_id_user_client_foreign` FOREIGN KEY (`id_user_client`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `inscriptions` (`id_inscription`, `id_activity`, `id_user_client`, `date`, `state`, `slug_inscription`) VALUES
(1, 1, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', '2024-12-29', 2, 'inscription-2024-12-29T18:36:43.931526600Z'),
(2, 3, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', '2024-12-29', 2, 'inscription-2024-12-29T18:37:23.422801900Z'),
(3, 2, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', '2024-12-30', 2, 'inscription-2024-12-30T22:04:41.497905500Z'),
(4, 5, '7e2f069a-e5db-4c26-b006-a3ef07b2b26e', '2024-12-31', 2, 'inscription-2024-12-31T00:14:00.839931200Z');

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `id_instructor` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nif` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tlf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_instructor`),
  CONSTRAINT `instructors_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `instructors` (`id_instructor`, `id_user`, `nif`, `tlf`, `address`) VALUES
(1, '889864b1-ae75-4c03-b9e9-ca8a5defc34b', '11223344C', '600123456', 'Calle Falsa 123'),
(2, 'c32f8f00-2b00-4ca9-bd60-72a95022cfb8', '12345678A', '666123123', 'Calle Imaginaria 321'),
(3, '6d7bccdb-6313-41e2-b640-3c1a22e7ddd9', '50123456Z', '666789123', 'Calle Mayor 45');

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `months` (
  `id_month` bigint unsigned NOT NULL AUTO_INCREMENT,
  `n_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_month`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `months` (`id_month`, `n_month`, `slug_month`) VALUES
(0, 'Enero', '00-enero'),
(1, 'Febrero', '01-ebrero'),
(2, 'Marzo', '02-marzo'),
(3, 'Abril', '03-abril'),
(4, 'Mayo', '04-mayo'),
(5, 'Junio', '05-junio'),
(6, 'Julio', '06-julio'),
(7, 'Agosto', '07-agosto'),
(8, 'Septiembre', '08-septiembre'),
(9, 'Octubre', '09-octubre'),
(10, 'Noviembre', '10-noviembre'),
(11, 'Diciembre', '11-diciembre');

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id_refresh` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_refresh`),
  UNIQUE KEY `unique_id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports` (
  `id_sport` bigint unsigned NOT NULL AUTO_INCREMENT,
  `n_sport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_sport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_sport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sport`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `sports` (`id_sport`, `n_sport`, `img_sport`, `slug_sport`) VALUES
(1,'Bailes de salón','baile.jpg','Bailes-de-salón-8n'),
(2,'Baloncesto','baloncesto.jpg','Baloncesto-5c996dd213'),
(3,'Ciclismo','ciclismo.jpg','Ciclismo-7b'),
(4,'Fitness','fitness.jpg','Fitness-6x'),
(5,'Frontón','fronton.jpg','Fronton-3f'),
(6,'Fútbol','futbol.jpg','Fútbol-e73d32e18c'),
(7,'Futbol Sala','futbol_sala.jpg','Futbol-sala-4e'),
(8,'Judo','judo.jpg','Judo-6h'),
(9,'Karate','karate.jpg','Karate-8j'),
(10,'Natación','natacion.jpg','Natación-1r'),
(11,'Padel','padel.jpg','Padel-5l'),
(12,'Pilates','pilates.jpg','Pilates-2b'),
(13,'Tenis','tenis.jpg','Tenis-7475e388a0'),
(14,'Voleibol','voleibol.jpg','Voleibol-255beab103'),
(15,'Yoga','yoga.jpg','Yoga-7i');

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `bio` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_user` enum('admin','client','instructor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `users` (`id_user`, `img_user`, `email`, `username`, `name`, `surname`, `birthday`, `bio`, `password`, `type_user`, `is_active`, `is_deleted`) VALUES
('6d7bccdb-6313-41e2-b640-3c1a22e7ddd9', 'instructor.jpg', 'prueba@gmail.com', 'prueba', 'nombre', 'apellidos', '2000-03-15', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'instructor', 1, 0),
('7e2f069a-e5db-4c26-b006-a3ef07b2b26e', 'client.jpg', 'framondo@gmail.com', 'montes', 'Paco', 'Montés Doria', '1979-08-28', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'client', 1, 0),
('889864b1-ae75-4c03-b9e9-ca8a5defc34b', 'instructor.jpg', 'framondo@hotmail.com', 'instructor', 'nombre', 'apellidos', '1995-05-25', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'instructor', 1, 0),
('c32f8f00-2b00-4ca9-bd60-72a95022cfb8', 'instructor.jpg', 'llorens@gmail.com', 'llorens', 'Diego', 'Llorens Soriano', '2000-07-05', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'instructor', 1, 0),
('e6081264-147a-4a2c-9de9-61665fdbcfcd', 'admin.jpg', 'f.montesdoria@gmail.com', 'admin', 'nombre', 'apellidos', '1990-01-10', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'admin', 1, 0),
('f9a64c70-9b25-48c0-9b9e-9652012b74cc', 'client.jpg', 'client@gmail.com', 'client', 'nombre', 'apellidos', '2000-03-15', "Mi descripción", '$2a$10$fRcwOaWJj1MRgdOZzpoJBuri.UAKB3rYx7R0zWI33R28F0WEHgFuW', 'client', 1, 0);

--
-- Dumping routines for database 'entrename'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 19:37:24
