CREATE DATABASE  IF NOT EXISTS `e_class_register` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `e_class_register`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_class_register
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jmbg_jmbg` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_administrators_users_jmbg` (`jmbg_jmbg`),
  CONSTRAINT `fk_administrators_users_jmbg` FOREIGN KEY (`jmbg_jmbg`) REFERENCES `users` (`jmbg`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Administrator3','Administrator3',3),(2,'Administrator4','Administrator4',4),(3,'Administrator5','Administrator5',5);
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `announcement` varchar(1028) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_classes`
--

DROP TABLE IF EXISTS `announcements_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements_classes` (
  `announcement_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`announcement_id`,`class_id`),
  KEY `fk_announcements_classes_classes_class_id_idx` (`class_id`),
  CONSTRAINT `fk_announcements_classes_announcements_announcement_id` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_announcements_classes_classes_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_classes`
--

LOCK TABLES `announcements_classes` WRITE;
/*!40000 ALTER TABLE `announcements_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_schedule`
--

DROP TABLE IF EXISTS `class_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_schedule` (
  `class_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_the_week` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `class_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_schedule_id`),
  KEY `fk_class_schedule_subjects_subject_id_idx` (`subject`),
  KEY `fk_class_schedule_classes_class_id_idx` (`class`),
  CONSTRAINT `fk_class_schedule_classes_class_id` FOREIGN KEY (`class`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_schedule_subjects_subject_id` FOREIGN KEY (`subject`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_schedule`
--

LOCK TABLES `class_schedule` WRITE;
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `UK_q04x54tgu6ph5k0scj9r5ia7j` (`teacher_id`),
  CONSTRAINT `fk_classes_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'I22',1),(3,'I2',3),(4,'III1',2),(5,'IV1',4);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communications`
--

DROP TABLE IF EXISTS `communications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communications` (
  `communication_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1028) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  PRIMARY KEY (`communication_id`),
  KEY `fk_communications_parents_parent_id_idx` (`parent`),
  KEY `fk_communications_teachers_teacher_id_idx` (`teacher`),
  CONSTRAINT `fk_communications_parents_parent_id` FOREIGN KEY (`parent`) REFERENCES `parents` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_communications_teachers_teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communications`
--

LOCK TABLES `communications` WRITE;
/*!40000 ALTER TABLE `communications` DISABLE KEYS */;
/*!40000 ALTER TABLE `communications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jmbg_jmbg` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_directors_users_JMBG` (`jmbg_jmbg`),
  CONSTRAINT `fk_directors_users_JMBG` FOREIGN KEY (`jmbg_jmbg`) REFERENCES `users` (`jmbg`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Director1','Director1',6),(2,'Director2','Director2',7);
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `final` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `fk_grades_teachers_teacher_id_idx` (`teacher`),
  KEY `fk_grades_subjects_subject_id_idx` (`subject`),
  KEY `fk_grades_students_student_id_idx` (`student`),
  CONSTRAINT `fk_grades_students_student_id` FOREIGN KEY (`student`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_grades_subjects_subject_id` FOREIGN KEY (`subject`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_grades_teachers_teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_door_requests`
--

DROP TABLE IF EXISTS `open_door_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_door_requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_door` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `fk_open_door_requests_open_doors_open_door_id_idx` (`open_door`),
  KEY `fk_open_door_requests_parents_parent_id_idx` (`parent`),
  CONSTRAINT `fk_open_door_requests_open_doors_open_door_id` FOREIGN KEY (`open_door`) REFERENCES `open_doors` (`open_door_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_open_door_requests_parents_parent_id` FOREIGN KEY (`parent`) REFERENCES `parents` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_door_requests`
--

LOCK TABLES `open_door_requests` WRITE;
/*!40000 ALTER TABLE `open_door_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_door_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_doors`
--

DROP TABLE IF EXISTS `open_doors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_doors` (
  `open_door_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`open_door_id`),
  KEY `fk_open_doors_teachers_teacher_id_idx` (`teacher`),
  CONSTRAINT `fk_open_doors_teachers_teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_doors`
--

LOCK TABLES `open_doors` WRITE;
/*!40000 ALTER TABLE `open_doors` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_doors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jmbg_jmbg` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parents_users_JMBG` (`jmbg_jmbg`),
  CONSTRAINT `fk_parents_users_JMBG` FOREIGN KEY (`jmbg_jmbg`) REFERENCES `users` (`jmbg`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1,'Parent6','Parent6',15),(2,'Parent7','Parent7',16),(3,'Parent8','Parent8',17),(4,'Parent9','Parent9',18),(5,'Parent10','',19),(6,'Parent11','Parent11',20);
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Administrator'),(2,'Director'),(3,'Teacher'),(4,'Parent');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `fk_students_classes_class_id_idx` (`class`),
  CONSTRAINT `fk_students_classes_class_id` FOREIGN KEY (`class`) REFERENCES `classes` (`class_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Student1','Student1',1),(2,'Student2','Student2',1),(5,'Student4','Student4',1),(6,'Student 5','Student 5',1),(7,'Student 6','Student 6',1),(8,'Student 7','Student 7',1),(9,'Student 8','Student 8',1),(10,'Student 9','Student 9',1),(11,'Student 10','Student 10',1),(12,'Student 11','Student 11',3),(13,'Student 12','Student 12',4),(14,'Student 13','Student 13',3),(15,'Student 14','Student 14',5),(16,'Student 15','Student 15',5);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_parents`
--

DROP TABLE IF EXISTS `students_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_parents` (
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`parent_id`),
  KEY `fk_students_parents_parents_parent_id_idx` (`parent_id`),
  CONSTRAINT `fk_students_parents_parents_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_parents_students_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_parents`
--

LOCK TABLES `students_parents` WRITE;
/*!40000 ALTER TABLE `students_parents` DISABLE KEYS */;
INSERT INTO `students_parents` VALUES (11,1),(12,1),(13,2),(14,3),(15,4),(16,4);
/*!40000 ALTER TABLE `students_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'History'),(2,'Geography'),(3,'Math'),(4,'English'),(5,'Biology'),(6,'Serbian ');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jmbg_jmbg` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teachers_users_JMBG` (`jmbg_jmbg`),
  CONSTRAINT `fk_teachers_users_JMBG` FOREIGN KEY (`jmbg_jmbg`) REFERENCES `users` (`jmbg`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Teacher1Proba','Teacher1Proba',8),(2,'Teacher2','Teacher2',9),(3,'Test33','Test33',333),(4,'Teacher4','Teacher4',22),(5,'Teacher23','Teacher23',23),(6,'Teacher24','Teacher24',24),(7,'Teacher25','Teacher25',25);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_subjects`
--

DROP TABLE IF EXISTS `teachers_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers_subjects` (
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_id`,`subject_id`),
  KEY `fk_teachers_subjects_subjects_subject_id_idx` (`subject_id`),
  CONSTRAINT `fk_teachers_subjects_subjects_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_subjects_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_subjects`
--

LOCK TABLES `teachers_subjects` WRITE;
/*!40000 ALTER TABLE `teachers_subjects` DISABLE KEYS */;
INSERT INTO `teachers_subjects` VALUES (1,1),(1,2),(2,3),(2,4),(1,6),(2,6);
/*!40000 ALTER TABLE `teachers_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `jmbg` bigint(13) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`jmbg`),
  KEY `fk_users_status_status_status_id_idx` (`status_id`),
  CONSTRAINT `fk_users_status_status_status_id` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test1@test.com','1',1),(2,'test2@test.com','2',1),(3,'test3@test.com','3',1),(4,'test4@test.com','4',1),(5,'test5@test.com','5',1),(6,'test6@test.com','6',2),(7,'test7@test.com','7',2),(8,'test8@test.com','8',3),(9,'test9@test.com','9',3),(10,'test10@test.com','10',4),(11,'test11@test.com','11',4),(12,'test12@test.com','12',4),(13,'test13@test.com','13',4),(14,'test14@test.com','14',4),(15,'test15@test.com','15',4),(16,'test16@test.com','16',4),(17,'test17@test.com','17',4),(18,'test18@test.com','18',4),(19,'test19@test.com','19',4),(20,'test20','20',4),(22,'test22@test.com','22',3),(23,'test23@test.com','23',3),(24,'test24@test.com','24',3),(25,'test25@test.com','25',3),(333,'test333@test.com','333',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'e_class_register'
--

--
-- Dumping routines for database 'e_class_register'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-08 13:20:08
