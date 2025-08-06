/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.40 : Database - sims
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sims` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sims`;

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id_city` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_country` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `id_country` (`id_country`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `city` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id_company` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_city` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_company`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `company` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id_country` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `country` */

/*Table structure for table `exam_period` */

DROP TABLE IF EXISTS `exam_period`;

CREATE TABLE `exam_period` (
  `id_exam_period` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id_exam_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `exam_period` */

/*Table structure for table `internship` */

DROP TABLE IF EXISTS `internship`;

CREATE TABLE `internship` (
  `id_internship` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `defense_date` date NOT NULL,
  `grade` int unsigned NOT NULL,
  `id_teacher` bigint unsigned NOT NULL,
  `id_exam_period` bigint unsigned NOT NULL,
  `id_report` bigint unsigned NOT NULL,
  `id_student_officer` bigint unsigned NOT NULL,
  `id_company` bigint unsigned NOT NULL,
  `id_student` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_internship`),
  KEY `id_teacher` (`id_teacher`),
  KEY `id_exam_period` (`id_exam_period`),
  KEY `id_report` (`id_report`),
  KEY `id_student_officer` (`id_student_officer`),
  KEY `id_company` (`id_company`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id_teacher`),
  CONSTRAINT `internship_ibfk_2` FOREIGN KEY (`id_exam_period`) REFERENCES `exam_period` (`id_exam_period`),
  CONSTRAINT `internship_ibfk_3` FOREIGN KEY (`id_report`) REFERENCES `report` (`id_report`),
  CONSTRAINT `internship_ibfk_4` FOREIGN KEY (`id_student_officer`) REFERENCES `student_officer` (`id_student_officer`),
  CONSTRAINT `internship_ibfk_5` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`),
  CONSTRAINT `internship_ibfk_6` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `internship` */

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id_module` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_study_program` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `id_study_program` (`id_study_program`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`id_study_program`) REFERENCES `study_program` (`id_study_program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `module` */

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id_report` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `report` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id_student` bigint unsigned NOT NULL AUTO_INCREMENT,
  `index` varchar(9) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `year_of_study` int unsigned NOT NULL,
  `id_city` bigint unsigned NOT NULL,
  `id_study_program` bigint unsigned NOT NULL,
  `id_module` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_student`),
  KEY `id_city` (`id_city`),
  KEY `id_study_program` (`id_study_program`),
  KEY `id_module` (`id_module`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`id_study_program`) REFERENCES `study_program` (`id_study_program`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

/*Table structure for table `student_officer` */

DROP TABLE IF EXISTS `student_officer`;

CREATE TABLE `student_officer` (
  `id_student_officer` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_study_level` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_student_officer`),
  KEY `id_study_level` (`id_study_level`),
  CONSTRAINT `student_officer_ibfk_1` FOREIGN KEY (`id_study_level`) REFERENCES `study_level` (`id_study_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student_officer` */

/*Table structure for table `study_level` */

DROP TABLE IF EXISTS `study_level`;

CREATE TABLE `study_level` (
  `id_study_level` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_study_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `study_level` */

/*Table structure for table `study_program` */

DROP TABLE IF EXISTS `study_program`;

CREATE TABLE `study_program` (
  `id_study_program` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_study_level` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_study_program`),
  KEY `id_study_level` (`id_study_level`),
  CONSTRAINT `study_program_ibfk_1` FOREIGN KEY (`id_study_level`) REFERENCES `study_level` (`id_study_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `study_program` */

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id_teacher` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
