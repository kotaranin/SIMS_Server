/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.18 : Database - sims
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
  `id_city` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_country` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `id_country` (`id_country`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `city` */

insert  into `city`(`id_city`,`name`,`id_country`) values 
(10,'Niksic',22),
(11,'Podgorica',22),
(40,'Beograd',1),
(41,'Novi Sad',1),
(42,'Nis',1),
(43,'Subotica',1);

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id_company` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_city` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_company`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `company` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id_country` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `country` */

insert  into `country`(`id_country`,`name`) values 
(1,'Srbija'),
(2,'Madjarska'),
(4,'Bosna i Hercegovina'),
(8,'Bugarska'),
(10,'Danska'),
(14,'Severna Koreja'),
(22,'Crna Gora');

/*Table structure for table `exam_period` */

DROP TABLE IF EXISTS `exam_period`;

CREATE TABLE `exam_period` (
  `id_exam_period` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id_exam_period`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `exam_period` */

insert  into `exam_period`(`id_exam_period`,`name`,`start_date`,`end_date`) values 
(1,'Januarski ispitni rok 2025.','2025-01-01','2025-01-31'),
(2,'Februarski ispitni rok 2025.','2025-02-01','2025-02-28'),
(3,'Junski ispitni rok 2025.','2025-06-01','2025-06-30'),
(4,'Julski ispitni rok 2025.','2025-07-01','2025-07-31'),
(7,'Septembar 2025.','2025-09-01','2025-09-30'),
(8,'Oktobarski ispitni rok 2025.','2025-10-01','2025-10-31'),
(9,'Januarski ispitni rok 2026.','2026-01-01','2026-01-31');

/*Table structure for table `internship` */

DROP TABLE IF EXISTS `internship`;

CREATE TABLE `internship` (
  `id_internship` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `defense_date` date NOT NULL,
  `grade` int(10) unsigned NOT NULL,
  `id_teacher` bigint(20) unsigned NOT NULL,
  `id_exam_period` bigint(20) unsigned NOT NULL,
  `id_report` bigint(20) unsigned NOT NULL,
  `id_student_officer` bigint(20) unsigned NOT NULL,
  `id_company` bigint(20) unsigned NOT NULL,
  `id_student` bigint(20) unsigned NOT NULL,
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
  `id_module` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_study_program` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `id_study_program` (`id_study_program`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`id_study_program`) REFERENCES `study_program` (`id_study_program`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `module` */

insert  into `module`(`id_module`,`name`,`id_study_program`) values 
(13,'softversko inzenjerstvo',9),
(14,'informaciono inzenjerstvo',9),
(15,'informacioni sistemi',9),
(16,'informacione tehnologije',9),
(17,'poslovna analitika',9),
(18,'tehnologije elektronskog poslovanja',9);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id_report` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_content` longblob NOT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `report` */

insert  into `report`(`id_report`,`file_name`,`file_content`) values 
(8,'Dnevnik_prakse_1.docx','PK\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”ËnÂ0E÷•ú‘·Ubè¢ª*‹>–-Ré{Vý’Ç¼þ¾QU‘\nl\"%3÷Þ3VÆƒÑÚšl	µw%ë=–“^i7+Ù×ä-d&á”0ÞAÉ6€l4¼½L60#µÃ’ÍS\nOœ£œƒXø\0Ž*•V$z3„ü3à÷½Þ—Þ%p)Oµ^ “²×5}nH\"dÙsÓXg•L„`´‰ê|éÔŸ”|—PrÛƒsðŽ\Z?˜PWŽìtt4Q+ÈÆ\"¦wa©‹¯|T\\y¹°¤,NÛàôU¥%´úÚ-D/‘ÎÜš¢­X¡Ýžÿ(¦¼<EãÛ)‘à\Z\0;çN„L?¯FñË¼¤¢Ü‰˜\Z¸<FkÝ	‘h¡yöÏæØÚœŠ¤Îqôi£ã?ÆÞ¯l­Îià\01éÓ]›HÖgÏõm @ÈæÛûmø\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ÁjÃ0@ïƒýƒÑ½QÚÁ£N/cÐÛÙ[ILÛØj×þý<ØØ]éaGËÒÓ“ÐzsœFuà”]ð\Z–U\rŠ½	Öù^Ã[û¼x\0•…¼¥1xÖpâ›æöfýÊ#I)Êƒ‹YŠÏ\Z‘øˆ˜ÍÀå*Döå§i\")ÏÔc$³£žqU×÷˜~3 ™1ÕÖjH[{ª=E¾†ºÎ~\nf?±—3-ÂÞ²]ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zð¼Ñêz£¿§Å‰…,	¡	‰/û|f\\ZþçŠæ?6ï!Y´_áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0ÊyK1\0\0`\0\0\0\0\0word/document.xml¤—YoÜ €ß+õ?X~O°×Þ#Vv£6Qª<TZ5Í \n‡xþú¾[·‘×yY``>†afÌÞÞ8sTé\\Š­ë_{®C‘q.Ò­ûòóñjã:Ú`c&ÝºgªÝ»ÝçO·Ç(–¤äTBGÇ‚lÝÌ˜\"BH“Œr¬¯yN”Ô21×Dr$“$\'¥ŠÑÂó½ªW(I¨Ö°ß=¬ÝGNÓh±ÂGP¶À‘+CO=Ã¿²D7h3-f€à„Œ\n.F­µj\ngÀªi9ôÃ­æ‘cÒz)“6óH£pâã\0—0™HÅ±¡JÇê­,®\0\\`“¿æ,7g`z«ƒsñ6Ã\"Ðê<ˆ/&¬—1eAÜRäÖ-•ˆ\Zý«NßšÕúMÓiP6m[ØîÑ“aÚ´ºjŠïjõ‡¦°T^CŠ2ð£:Ë‹®:ð¹4˜ÌZÈá=8k×bªý¯´=Ô×Ð§˜ßÜgµåï}oÂmZD§1Å„?÷l-áÁýÆ³\\3p®?±ø´€Å°\"tâÇ¢el\Z\"}v[N>1­ZN}+–“÷Žõ\'ÖÀ¿\0âò\"Ä\"hí°U°tlâì2\\{GÈêbƒ3¬»¤©‰ÉÄBÐÃ±0&IWÏ,“^æ´e<óÁéÇõ›’eÑÓòÑžú’}´§XMÂ‹þ˜1Ï. ’s=¥B*üÊÀ\"H_2Ð©nÀþB Û¦êÒS%·ñÓtf;qéØ’èîàø*ã³m˜£+ü9®ïïƒÕ2t+)|BM-\r¾„ëÇ\0¤<8ã[×óÖË`å?v¢½²B¾_×ð&¸df0Sm¹W¶QuÃ°HaýCdRqõòì¢Ý-j¦Q¿zªÊ12»A\"s\n…ßÀ=¾}	;©Œí\"S/­Ùv¹¦ÄìÕÔ£UHŸÁ$Tbß¿±ïƒc‰ê¯6ÁÆZb|Ç–h$|0ü0ô*Vžf¦¾Jc$ïÇŒ&ƒÙŒâ˜Â¾ëE5L¤4ƒaZšjèÕÛÉ4Hu	­×TbxçS6,\"–ºÏ\r+ƒU5‹ÚsWÝ:Pÿ×`÷\0\0ÿÿ\0PK\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ËjÃ0E÷…þƒ˜}-;}PBälJ!ÛÖý\0E?¨,	Íôá¿¯HIëÐ`ºðr®˜sÏ€6ÛÏÁŠwŒÔ{§ ÈrèŒ¯{×*x©¯îAkWkë*‘`[^^lžÐjNKÔõD¢8RÐ1‡µ”d:4e> K/ƒæ4ÆVm^u‹r•çw2NPž0Å®Vwõ5ˆjø¶ošÞàƒ7o:>S!?pÿŒÌé8JX[d“0KDçEVKŠÐ‹c2§P,ªÀ£Å©Àaž«¿]²žÓ.þ¶Æï°˜s¸YÒ¡ñŽ+½·Ÿè(!O>zù\0\0ÿÿ\0PK\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0word/theme/theme1.xmlìYK‹G¾ò†¹ËzÍè±X6ÒH²cïÚÆ»vð±WjÍôªgZt·v-Œ!Ø§\\\'äÈ-‡bˆ!&—ü˜›Äù©î‘4ÓROüZv«~|UýuUuuiæâåû1uŽ1„%·z¡â:8±1IÂŽ{ç`Xj¹Ž(#ÊÜqX¸—/}úÉE´##cä±ƒ:n$ål§\\#Fâ›áæ&ŒÇHB—‡å1G\' 7¦åZ¥Ò(Çˆ$®“ ÔÞœLÈ;J¥{i¥|@á_\"…\ZQ¾¯TcCBcÇÓªúPî#Úqa1;9À÷¥ëP$$LtÜŠþsË—.–×BTÈæä†úo)·OkZŽ‡‡kAÏó½Fw­_¨ÜÆ\ršƒÆ ±Ö§h4‚¦\\LÍZà-±9PÚ´èî7ûõªÏé¯oá»¾úx\rJ›Þ~82æ@iÓßÂû½v¯oê× ´ÙØÂ7+Ý¾×4ð\ZQ’L·Ð¿QV»]C&Œ^µÂÛ¾7lÖ–ðUÎEW*ŸÈ¢X‹ÑãC\0hç\"IG.fx‚F€%‡œ8»$Œ ðf(a†+µÊ°R‡ÿêãé–ö(ÚÁ(\'ÄÖâãˆ\'3Ùq¯V7yñüùé£g§~;}üøôÑ/Ëµ·å®¢$ÌË½úñë¿¿ÿÂùë×^=ùÆŽyüËŸ¿|ùûÿ¦^\Z´¾}úòÙÓß}õçOO,ð.G‡yø‰±pnàç6‹aƒ–ð!;‰ƒ‘¼D7	J’± 22Ð7ˆ\"®‡M;Þå.lÀ+ó#ƒð~Äç’X€×£Ø\0î1F{Œ[÷t]­•·Â<	í‹óyw¡cÛÚÁ†—óÄ=±©\"lÐ¼EÁå(Ä	–ŽšcSŒ-b÷1ìºGFœ	6‘Î=âô±šä€\ZÑ”	]%1øea#þ6l³w×é1jSßÇÇ&Î¢6•˜\Zf¼‚æÅVÆ(¦yä.’‘äþ‚ƒ	ž1eÎ`Œ…°ÉÜäƒîuH3v·ïÑEl\"¹$Sr1–GöÙ4ˆP<³r&I”Ç~&¦¢È¹Å¤•3OˆêƒPRèî»î~ýÙ¾iÈ jfÎmG3ó<.èa›ò.ÛåÄ\Z½yh„ö.Æ 1ÆÎÏlx63lž‘¾AV¹Šm¶¹†ÌXUý¨•Tqcq,FÈîãðÙ[l$žJbÄ‹4ß˜š!3€«.¶Æ+MTJ¸:´v7Elì¯Pë­a¥úÂ¯nøïMÎÈ½ƒ~kHìol›D²€9@PeØÒ-ˆîÏDÔqÒbs«ÜÄ<´™ÊEOL’×V@µÿßÔ>‰³©zìÀ÷©wŠRÊf•S„Û¬mÆÇäã/múhžÜÂp›X ç•Íyeó¿¯lŠÎóy=s^Ïœ×3v‘PÏd%Œ~´zÜ£µÄ…Ï~&„Ò}¹ xWèâGÀÙaPw´ÐúQÓ,‚ær9r¤Ûgòs\"£ýÍ`™ª^!KÕ¡pfL@ù¤‡­ºÕÇ{lœŽV««§› €d6å×jŠ5™Ž6šÙc¼µzÝõãÖ%û6$r‹™$êÍÕàkHè	‹¶…EK©/d¡¿–^ËÉAêÁ¸ï¥Œ Ü ¤ÇÊO©üÊ»gîé\"cšÛ®Y¶×V\\ÏÆÓ‰\\¸™$raÁå±9|Æ¾ng.5è)SlÓh¶>„¯UÙÈ\r41{Î	œ¹ºjFhÖq\'ðÃ	šñô	•©\r“Ž;’KC¿Kf™q!ûHD)LO¥û‰ÄÜ¡$†XÏ»&·j­©öø‘’kW>>Ëé¯¼“ñd‚G²`$ëÂ\\ªÄ:ûž`Õas ½OœC:ç·ÊoV•ÇDÈµ5Ç„ç‚;³âFºZEã­KvDEhy£ä“y\n×í5Ü>4ÓÍ]™ýåfCå¤÷¾u_/¤&rI³àQ·¦=|¸K>Ç*Ëû«4uoæºö*×Ýï!ä¨e‹ÔcµlÔ¤v†An¹uhÝg}lF­º Vu¥îm½Þf‡Gù}¨VçT\nM~µp¬^L¦™@®²Ë}éÌ9é¸*~×j~Pª´üAÉ«{•RËïÖK]ß¯W~µÒïÕ‚QdWýtí!üØ§‹åÛ{=¾õ?^•ÚF,.3]—µ°~ƒ_­¿ÁwXæA£6l×Û½F©]ïK^¿×*µƒF¯ÔoÍþ°ø­öð¡ëk°×­^cÐ*5ªAPò\ZE¿Õ.5½Z­ë5»­×}¸´5ì|õ½2¯æué\0\0\0ÿÿ\0PK\0\0\0\0\0!\0	8ùq\0\0i\r\0\0\0\0\0word/settings.xml´WÛnÛ8}_`ÿÁÐó:ÖÕ¡Na[Q›\"Þ.ê,ö™’(›)\n$Ç]ì¿ï-§q‹¸E^,jÎÌ™ÑpfH¿{ÿÄèàIx5w¼+×à*ç©¶sçïût8uR¡ª@”Wxî°tÞ_ÿþÛ»},±R &@QÉ˜åsg§TF2ßa†ä¯q`ÉC\n^ÅvÄxhêaÎYÉ%ê0ò]wìt4|î4¢Š;Š!#¹à’—J›Ä¼,IŽ»‡µ¯ñÛš$<o®”ñ8˜B¼’;RKËÆ~–\rÀ%yüÑG<2jõöžûŠÏÝsQ-^ž6¨Ï±”°AŒÚ\0IÕ;_}_ïî\r˜{®YF]Fà¿ çøé2ŽiÇ1ËSR\\Æ3>ò>±Þøç‚9!(š‹(üÀÆ¡Úü„KªØ]Fg÷h¤m‘B;$Ù2–ô2Æð„±-0Êó‡SN|YÒ¢#áõ{(_†u¦ª[èŽd‰vft%Íòøv[q2\ná@i :&:ý›¬f‰ŸŒ\\ç¶[”T/ õ×0Ò¾rÎû¸Æ\"‡¾ž;3×iyKÔPu²â5h<\"yâwp¾Cå\n‹Mrè¸¯”àÔêüO®V0ñ4dgaæ_¿Ú´³,*Äà#žÍÇ5/`ØíãF×g[ï^têò[Gf¿ ¾×ÉÛ¨Å)¿!_ñ¢*>5R`4Sò\"øQ\0¸Òž?Ãvßjœb¤\ZHÓ93;‘RR¯‰\\ÜVló›9#e‰8 Há5”|oòü£ŽÜ7òÛHü(C·÷P–K®gõrýk;iê}tZ¾pq(¤]|á\\UÝ0ñÇé´T£=â¹Þl99‹ÌÜ›Yrñ½`eûí9¤ÁlæŸC¾A4ó“éò2‰‚±—žCVaàNÆßAB÷¼Ít2Yž:	Ã XœCn¢h:»9‹,&7IÐíA—yë‹Ç_Â®tûXk±B,\rÖúj2Ò\Z™xX’Êâ†ùŠO‘M“Yp8lÉ¥)’Ìç°¸ ²NpiÖtÄ¶çí4ÄY)ÌÒOG.=f±ø xS·è^ ºmK«â…agI*uG˜•Ë&ÛX«\nN„¨©ŠÏÂä©OÏ>VPæf¼Ý!Ó.FWÃ]!äTlt+à5ªë¶£²­7w(Ùî”§›@Á[7Xó’mýó\ræ·˜yA¹þ2Ðî½Ì·²½ÀÊ‚^ZYØË\"+‹zÙØÊÆZ¶ƒ*(© ¹íRËKN)ßãâc¿µI;Tã¤=ï ¼x+è@9xŒñŒ¸ \nþÔ¤`.qžë›Æè´):ðF=ÓÕ˜V®Ÿ3èkJ7ÎFÏŒM‰‹>‡så¸9°¬?^¯ÚÀ)‘0\nk8‰ûÃ`^<¿Õ×€°«Å4ÒU0káÈœàÊLKØ÷/¸\\\"‰‹³¦Qkúo¸‹$\Z§ÃÄŸzÃ0˜¤Ã¥—xÃÅÍj\n]½X„Iú_×¤ö?Òõÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\ZÎ.w\0\0§\0\0\0\0\0word/styles.xmlì]ms›Hþ~U÷(ºûµõbù¥Ö»;ñ%uIÖ;·ŸG0²X#ÐŠãýõ7o ‘šAôÐÖzSW©Š% Ÿæé§™nóãÏßIð•çEœ¥ƒŽž†Y§÷_î®_EÉÒˆ%YÊ/žxqðóOÿÛçEù”ð\"\0iq¾/æe¹<?<,Â9_°â‡lÉS±s–åVŠ¯ùýá‚å«å«0[,YOã$.Ÿ‡GG““wAÉf³8äo²pµài©ìsžÄ,-æñ²¨Ð» =fy´Ì³…8éE¢ñ,Nk˜Á\0-â0ÏŠlVþ NÆôHA	óÁ‘ú´HÖ\0Ç8€!\0˜„üãÔ`\nK\'Žp8“\Z\'Ž,¿ÎX\0Ñ\n1Uý¤¹…UDe4ÇÁUJ[V²9+æ›ˆ³‡8¶µƒ%Yø`crÜ ×€OÉá\"<Ÿf9›&Ixe +PÀòÁü£>òoj»óa–ÈbÔ~Ò²ð\rŸ±URòk~“›¯æ›ús¥e<ž³\"Œã;Ñ_Ñè\"í¿{ñØÃYQ¾.bÖ¸s.?4î	‹ÒÚ|GñÁ¡lñç©Øý•‰êMÅõ†zË•ìÔÆ¶„¥÷Õ6ž¾ú×¥Ý9µéË­Ü4M]°üÕíke8Ÿ\'ñ=+W¹ˆcò›BÐá.®ÄùóoåŠ%òàC30ú¯5\\Ëíoª—KÆªSlVrÕ“#Ùƒ$–Atx|V}ù¼’\\²U™™F€þ[ÃÆD°¡ïVG`±—Ï>_ãÑm)v\\¨¶ÄÆ/ïoò8ËE”½88SmŠ·|¿‹£ˆ§Öé<Žøosž~)x´Þþëµrd³!ÌV©ø<:™(/JŠèí·/eÜ{S&9ý$\ryô*^7®Ìÿ[\rmMösÎäÅ\'lC¨î£ †Ò¢°Î¶sµuîê(TC£}54ÞWCÇûjh²¯†NöÕÐé¾\ZR0ÏÙPœFâ:¢Ž‡Í\0Ô]85¢qbCã8´„ÆqHãP\ZÇáèh‡£qnŠÀ)³Ðå…–³ÞÞŽ»û\Zá‡»û’à‡»û\nà‡»;àûáîŽï~¸»Ã¹îîèí‡»;XãqõT+x/d––½U6Ë²2ÍJÈIoo4–\n,•‘ÓàÉ‹ÏIN’\0FG6s!î2õ}·‡(‘ú_ÏK™8Ù,˜Å÷2åéÝqž~åI¶ä‹\"G˜s‘”9FÄÇ§s>ã9OCNéØt 2ÒÕbJà›KvO†ÅÓˆxø*D’ P;´ÈŸçR$1S/X˜gý»–1²øð!.ú•	.WIÂ‰°>Ñ¸˜ÂêŸ(˜þ©‚éŸ(˜þ‰ÅÕ4¢‘2hDfÐˆÆMû\'Õ¸4¢q3hDãfÐúÛ]\\&*ÄÛ³ŽA÷ÚÝU’É{(½ûqß§ª*ÛÉÔLƒ–³ûœ-ç¬j7ÃÚçŒmç2‹ž‚;ŠkZD5¯W.\"kÙqºê? hTâªñˆäUã	¬Æë/±bš,\'hïhò™ÛÕ´l­Bê$Ú[–¬ô„¶¿ÚXÙßÃÖ¸Žó‚LÍ°üINg%‘oÝËþ[cõ—ÕvT\"íž$è¥¼áJ†ß=-y.Ò²‡ÞH×Y’d<¢C¼-óLûš-ù¡¢¤“äß.–sVÄ*WÚ€è~©¯ž¾>²eïºIXœÒðööÕ‚ÅI@7ƒxw÷ñCp—-eš)†ð2+ËlA†i*ÿøOÿIÓÁ×\"	NŸˆÎö5QyH]Å”EDHbš§1É5Táý›?M3–G4h79×Ï£”œñ–-–zÒA -Eü!˜\r)¼ÿ°<–u!*QÝ‘€YeÃb5ý‡ýCÝ§, ©ý²*UýQMu•5\\ÿiÂ\\ÿ)‚bS\\¤ÿœì\\ÿ“Ý€£:Ù«„Eì¼…êGuºõùöOþ^–dùl•Ð\r`H6‚ ÙfÉj‘”g¬ðOXáQŸ/¡Ë(<‚’œÂûWGdd(0*&\r\nŒŠFJ@ÿ\'t,°þéX`ýŸÕÑ`DS\0ŒÊÏH/ÿDwy,0*?S`T~¦À¨üLQùÙèMÀg31	¦»ÄXT>gAÒ]hÒ’/–YÎò\'\"È·	¿gRv“g3ùK˜,Õq@Ê\ZuB8ÙÖpT$ÿÆ§d]“X”ý\"¨ˆ²$É2¢ÚÚú‚£,7Ÿ]Ûe¦~	Ò»7	ù<K\"ž;ÎÉm+òå[ý³Œíî«nt*{~ˆïçep;¯«ý6Ìäh§e•°o˜ín°iÌ\'Õ_šÌ>ò(^-ªŽÂSLFÝ•Gow¯g–Ç-a›“Ý–ëYò†åIGKØæiGK¥Ó\rË6=¼aùC£#œ´ùOã9œï¤Í‹jãÆfÛ©¶lrÁ“6/ÚJð:åÝÈN7Í¸í»‰ÇmQ‘#\'7Jg]¹!Úö™å•4U{õÓ î«It§Èùë*ÓuûNÝÔõ^LœÒ‚8£î7®6¢Œ{;‡7Dç¸ã†è€Ü\"‘Ó’Ü(c“¢srC £¼\"à¢´ÇE+hï­ ŠO´ê1pCtž¸!ÐB…h¡ö˜)¸!PBæ^B…(h¡B´P!Z¨p†*´Ç	Úû¢ø¢ …\n!ÐB…h¡B´P!Z¨žs{§¹—P!\nZ¨-Tªš/ö*´Ç	Úû¢ø¢ …\n!ÐB…h¡B´P!Z¨%T`î%Tˆ‚*„@B …ªjè/Th*´÷*Dñ*DAB …\n!ÐB…h¡B´P!J¨ÀÜK¨-T*„@UÝ,ì!Th*´÷*Dñ*DAB …\n!ÐB…h¡B´P!J¨ÀÜK¨-T*„hóOs‹Òõ˜ý\0_õt>±ßýÖ•éÔgû§Ü6Ô¨;TÕ+7V÷ß\"\\fÙCÐøÃÃ‘Ê7ºÄÓ$ÎT‰Úq[ÝÆUD n|þrÕþ½çK—Ìo!Ô=S\0>îj	j*ã6—·-A’7nótÛÌ:ÇmÑ×¶—Áq[ÐUº¬J—#`Üf,ãÃ¼-Z[æpˆÛb´eG¸-2[†p€Ûâ±exÈà¼m}Üqœ&õó¥\0¡Í-„7B›[B®ªp…Ñ•47BWöÜ]it# øtÂà‰uC¡vCùQ\re†¥Ú_¨n,ÕÁ‹j\0ãO5„ò¦\ZBùQ\r#–jˆ€¥Ú?8»¼¨0þTC(oª!”ÕðR†¥\Z\"`©†Xª{^0þTC(oª!”Õpr‡¥\Z\"`©†Xª!‚Õ\0ÆŸjåM5„ò£\ZdÉhª!–jˆ€¥\Z\"xQ\r`ü©†PÞTC¨6ªUeƒjÃ–9nfâ.È–!.8[†Ù’eí™-YžÙäªâ—-Ù¤¹º²çFèJ£Å§O¬\nÍ°Êj\\¶ÔDµ¿PÝXªqÙ’“j\\¶ÔJ5.[j¥\Z—-¹©ÆeKMTã²¥&ªýƒ³Á‹j\\¶ÔJ5.[j¥\Z—-¹©ÆeKMTã²¥&ªqÙRÕ=/ÈNªqÙR+Õ¸lÉM5.[j¢\Z—-5QË–š¨ÆeKNªqÙR+Õ¸l©•j\\¶ä¦\Z—-5QË–š¨ÆeKMTã²%\'Õ¸l©•j\\¶ÔJ5.[ú(Lb‚W@Ý.X^tï‹{ÇŠyÉú¿œðKšó\"K¾ò( =Õ¨³<|ÜXþJb«¥Åñ¥3ùtëçJ‘~¬T¾êeª¤±ìI`V3›U‡ÍíZÝ¢2ÜÑT\rnî\0üzq+ÕÂ”‰³úEŽh<•/FlØ.¢Ú^5s5g¹Þ»vÕê#Æõ¹<žçEU»ŽÆo†“k#z³xÙçËO¢}µM~üðB}[¯k6•ï#0Ò›™eÎNj3ýÖ¦_“º%Ci£u‘9ö{Ë\"srç[³MîßXgnÃr½ÎœÜ|Y¯3J•Wý\Z^Ï”ÎÕÁ*\\0¥å2j³|(E\0]^k„õ²tÕÍf{Y:½ÍZ0ÎÇy†Nç1!ˆÆy†œg-K}Ü†(ŸÙ½Ìºy;Ý«Šß™{Ù¶{ém=Ýkät/ó¸{¾÷ª†Üá^»œh®24Ã°±@¦ÚÖÓUÆNW1Ï÷Ð¸Êø…»Ê©í)UØ‡ž¢äCï)±þÿJ÷®¯ßôôˆc§G˜ç¶h<âøûð¥’—;zú€^¶ÉLKã“îcÛœ. d±× p|&ÿm;„\\uiíw±\\Í÷µâ«§7œ8½ÁT$h¼áä»ð†jÀŸ3 ì™ÿS\'ÿf4iø?}¡üïb\\‰`¿“‚ù¯ÿo(æˆgNþ\r+4üŸýEù¯†øY§\0äŒ‡b°Yh^Ìî¨£™–ê7©å•¶}Á±\n“ƒGSÛÅ£»ß¥¬æ¶ôYU{[€º ìt´ÎžVNMµøð>•Žö(½¤îiôi(±ÿŠ\'ÉG¦Î–îC>“r{Gê}œ[û§zi	§}®îA87;£¿¶û‰^l2Ö?ŽqÖ[e¡½a¸Õ/µúŽtGW…š[yÀvÿ6j©Û½4;ƒA°Ž?[­Q®0f<ÜÂÜAéÿeS4¥ºÂé¢tHD©©Óu½*}ÿ÷©\\\"ÖEFÃ#\"†M]”žá?«\0`³Õ§xˆdK×ù\\l‰Ø2¥É—ÃÖ¾xHVt­ÍÅÊ1+¦<øýhˆœ]ïrñ0!âÁ”èþê ¯d )ÑE\'%\'D”˜:Ù•ÆŸN‚®ü¸H8%\"Áá_ãªñ¼ùþnJt1ÆEÉ%fä_ê%cOe6ý‚Œí±Ö[›†[_SHkÂ\ZŠ2&aCÕÎ@Lß1“Å11tºX.¿|^I\'c«2«†8•C¸b‰ya¿¹ðlÇúŒÔY¿ª†åçõØ¯çÒÕ–cs½µg×z(×6zI_5Z®ævŽ—™ÕîŸ³f\r×kuoTï PrÖ*fS€B‰9]-ô‡8]™Ï\\âÆÎB\0÷“€ì7ñÝ ÄE~_n:‘›ó>q|fÊš•©×ØfFo¥Ð¤BjäÐLf<¯®öÓlêˆßÃÊRæ®\\µ´Ù2·É]X£Nƒ×CÕHG_•XœºYØ)‘½Ž\\³ËÊ»&ëe9¶ÇJý¨a½{—Ã¡™úÊ!cu‡KÞŸ’¯Ø3®Ø6—ëè.õI›÷ÎÕ/ÃÛ>mð¶<œ£4xêB¹Û;öø˜–‹æÐ¶¹˜Ê.÷èâìæÚ\"ÝÈ\'X^Fê¯¾/ªŽ+„\'™e¹ÿØÉÂ¿d<QêSÃîY¯ï >sKRæÌvý®B~Óneiìt¢z£nèêoê¾ÁÿO-ƒ?juÝ¾—ƒ\r‘ìðØ§ûÖ¹~5§k\0×Gô’Õ­>T”œêVÍh\"¨$WlI3v`Y=¹5¢Õ§â§ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0word/webSettings.xmlœÓÝnÂ \0àû%{‡†{¥:5Kc5Y—Ý,K¶=\0Â©%§\\uO?¨ÕÕxcwSÐóåð7_îµJ¾Á:‰&\'£aJ0…4›œ|}®$qžÁ\ZÈÉY.îïæuVÃú¼º$(Æešç¤ô¾Ê(u¼ÍÜ+0a²@«™]»¡šÙí®\ZpÔór-•ô:NÓi{‹‚E!9<#ßi0¾É§TÑ¸RVî¤Õ·h5ZQYäà\\XVGO3iÎÌhriÉ-:,ü0,¦­¨¡Bú(m\"­þ€i?`|Ì8ìû­ACf×‘¢Ÿ3;;RtœÿÓÄ®1~8Õ›˜Þ±œð¢ìÇÎˆÆ\\æYÉ\\y)ªŸ8éˆÇ¦o»&ôÛ´é<èx†šg¯ƒ–­UÂ­LÂÅJ\Z8~ÃùÄ¦	aßŒÇmiƒBÅ ìÚ\"¼_¬¼ÔòVhŸ,Ö,ÃL)¬ßß^B‡^<òÅ/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0word/fontTable.xmlÜ“M›0†ï•úïùØ4Z²RÛT©ê¡Úþ\0Ç°ÖÈã„äßwlH–*Zié¡‡r0ãw<öëááñ¤Ur¤5Éf”$Âp[JSä×óînMðÌ”LY#\nr@·?<t›Ê\Z	ÖØh^Æûv“¦À¡Ìl+&+ë4ó8uuª™{9´wÜê–y¹—JúsšSº\"Æ½‡b«JrñÕòƒÆÇúÔ	…Dk ‘-\\hÝ{hueë,\0xf­zžfÒ\\1Ùâ¤%wlågx˜aG…å‘V¯€å4@~XqqšÆXŒ+ÇYNã¬®YŽ8·™ <LBäóË>Â+”XPú²™†»ÜQ\Zj™g\rƒæOb¥¦#bß`Êò—1SL3myžu¸CÍ7ßjcÛ+$aW&ØXI‡ï\'¼b(NQ¶A¥B€®m‡?7é6†i}aJîŒ‰–\"ÃÜ‘áñÑ¦]Ò`WNtF’†…¼aD€ôi/WLKu¾¨ÐI€>ÑJÏ›‹~dN†Cô)5&°§yZPš?ív¤W2ÜþŽùâþó äá[ñù4(ó«BƒÂ#\'N³žÃ#çº¿™öÜ8ñ,µ€ä‡è’ŸV3ó†#9]¡Kô#83Ÿäˆ‹ÜIŽÐGP¹_/ÿ‰#Co$ßeÝø7;$ôÅÚ!C\0Ûß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0Hï³~\0\0\r\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’ÁJÄ0†ï‚ïPrï&í¢¬¥[AÅ‹\n‚+Š·˜Œk´MB2Ú]ðe|ßË´Ýv-.„f2ßü3™I~¼ªÊèœWFÏI2a$-ŒTz9\'·‹óxF\"\\K^\Z\rs²OŽ‹ý½\\ØL×ÎXp¨ÀGAIûLØ9yF´¥^<CÅý$:ŸŒ«8×-©åâ•/¦ŒÒ\nKŽœ6‚±ÉFRŠAÒ¾¹²‚B	hô4™$tË\"¸ÊïLh#?ÈJáÚÂN´ôÊ«¬ëzRO[4ôŸÐû«Ë›ö©±ÒÍ¬\"—\"C…%9ÝšÁòo/ °»œ`+nùúŒ.rÇµÒÑG”²4¥ŒMY›ÓsÍ^a]\'}Py“à…SÃ^»Z£‹@—ÜãUXô“y²þ»ìo¼Qpð®šS¤-1¸ùf	]« £0¼¬u¹›žž-ÎIjÄlÎ‚±,9Ê{hºåo«MÿVìº?pñ\r\0\0ÿÿ\0PK\0\0\0\0\0!\0°(bËn\0\0Â\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œRËnÂ0¼Wê?D¹ƒ­P…£\nTõÐ—D€³ål«ŽmÙÁßwCJšª·ú´3ëÍŽ\rËS£“#ú ¬Y¤“q–&h¤-”©é6\Z=¤IˆÂB[ƒ‹ôŒ!]òÛøðÖ¡\nCB&,Ò:F7g,È\ZÆÔ6Ô)­oD$è+fËRI\\[yhÐD6Í²ÃSDS`1r½`Ú)Îñ¿¢…•­¿°ËÏŽô8äØ8-\"ò·vRë	Èm:W\ròŒèÀ‡¨0ð	°®€½õEàwÀºVµðBFŠŽO§ÀÓJŠH™òW%½\r¶ŒÉûÅhÒŽ^2¿Ayð*ž[C/Êt6º‚lyQyáêoo=‚\ZW´6/…ì‡€•mœ0$ÇúŠô>ÃÖåvÝÆð=ò›ì¸W±Þ8!ÉÂô~¸í b± û½ƒž€gz	¯[yš5×;m~»îKòÉlœÑ¹våhíþ¯ð/\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0“\0\0_rels/.relsPK-\0\0\0\0\0\0!\0ÊyK1\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0word/document.xmlPK-\0\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0	8ùq\0\0i\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0\ZÎ.w\0\0§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0é\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ç)\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0Hï³~\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0°(bËn\0\0Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼.\0\0docProps/app.xmlPK\0\0\0\0\0\0Á\0\0`1\0\0\0\0'),
(9,'Dnevnik_prakse_2.docx','PK\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”ËnÂ0E÷•ú‘·Ubè¢ª*‹>–-Ré{Vý’Ç¼þ¾QU‘\nl\"%3÷Þ3VÆƒÑÚšl	µw%ë=–“^i7+Ù×ä-d&á”0ÞAÉ6€l4¼½L60#µÃ’ÍS\nOœ£œƒXø\0Ž*•V$z3„ü3à÷½Þ—Þ%p)Oµ^ “²×5}nH\"dÙsÓXg•L„`´‰ê|éÔŸ”|—PrÛƒsðŽ\Z?˜PWŽìtt4Q+ÈÆ\"¦wa©‹¯|T\\y¹°¤,NÛàôU¥%´úÚ-D/‘ÎÜš¢­X¡Ýžÿ(¦¼<EãÛ)‘à\Z\0;çN„L?¯FñË¼¤¢Ü‰˜\Z¸<FkÝ	‘h¡yöÏæØÚœŠ¤Îqôi£ã?ÆÞ¯l­Îià\01éÓ]›HÖgÏõm @ÈæÛûmø\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ÁjÃ0@ïƒýƒÑ½QÚÁ£N/cÐÛÙ[ILÛØj×þý<ØØ]éaGËÒÓ“ÐzsœFuà”]ð\Z–U\rŠ½	Öù^Ã[û¼x\0•…¼¥1xÖpâ›æöfýÊ#I)Êƒ‹YŠÏ\Z‘øˆ˜ÍÀå*Döå§i\")ÏÔc$³£žqU×÷˜~3 ™1ÕÖjH[{ª=E¾†ºÎ~\nf?±—3-ÂÞ²]ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zð¼Ñêz£¿§Å‰…,	¡	‰/û|f\\ZþçŠæ?6ï!Y´_áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0¦QcIH\0\0\r\0\0\0\0\0word/document.xml¤—ÉnÛ0@ïú‚î%Ë«;ê$È¡@Ð4ÀPÔsHzI¿¾Cí©Ò@V.&9ä<‡3#úúæÌ™s¤JgRl\\ÿÊs*ˆŒ2‘lÜ—ß÷“•ëhƒE„™tã¾QíÞl¿»>…‘$N…q\0!txÊÉÆMÉC„4I)ÇúŠgDI-csE$G2Ž3BÑIªM=ß+z¹’„j\rûýÀâˆµ[áÈy-RøÊ8C$ÅÊÐsËð/†ÌÑ\Z­ú éœpê÷QÁÅ¨²Võ@³Q °ªGš#}p¸Å8Ò´OZŽ#}Òj©N¼à2§&c©860T	âXíùÀ96ÙkÆ2óLoQcp&ö#,­†ÀƒèbÂqQD5EnÜƒa¥?iô­éa©_5eÃ¶…íÖˆž\rÓ¦ÖUC|WªïªÂRx\r)ÊÀRè4Ë›êÀÇÒ`2­!ÇÏpä¬^wÊý©ö¿Ò¶+¯¡1¿º;ÎJË?\'úÞ€Û´ˆFcˆ	ï÷¬-áÁíÆ£\\Óq®?°øÔ€i° tàÇ¢f¬*\"mv[N60­jNy+–“µŽõÖÀé\0¢ÃEˆiPÛa«ÞaéÈDée¸úŽÕÅ§X7ISã… &Î:Ä2À˜$M=³Lz™Óæ\rðwî0O¾–¨Jò––}öØ–ì“}<]Àª¾[„ô×ŒyNq•œ“ð1RáWAú:NqöÙ6E—ž¹Ÿª3Û‰Ž-‰î¯2z³m³0Ç\n?By‹õÝÝüÞw)|B•.ç·ÞÌ¿Ý4„gôzËy°ðïÑ“²ÂàÞüvÝŽÆøÀLg¦ØòIÙF•\rÃ\"õG‘IÅäåÙEÛkTM£võP•SX<lCcŽÊÕT©»Ý	zÙÞÉÞƒÏ¬‚)Õ.åoƒ/(lœ}«;‰ŒÞíé­Ž¦Ä<©¡Î/\\œ<ÿIøVøþÚ¾`N!”±\nVÖ»à\'¶D#á“æÏf^ÁÊ’Ô´ÃWiŒäí˜Ñ¸3›RQØw9-†±”¦3L¦zåvD2\rÒêØvM!†\"ÊnÈ2AŸ2CÀÊ`QÌ¢úÜE·WÔþyÙþ\0\0ÿÿ\0PK\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ËjÃ0E÷…þƒ˜}-;}PBälJ!ÛÖý\0E?¨,	Íôá¿¯HIëÐ`ºðr®˜sÏ€6ÛÏÁŠwŒÔ{§ ÈrèŒ¯{×*x©¯îAkWkë*‘`[^^lžÐjNKÔõD¢8RÐ1‡µ”d:4e> K/ƒæ4ÆVm^u‹r•çw2NPž0Å®Vwõ5ˆjø¶ošÞàƒ7o:>S!?pÿŒÌé8JX[d“0KDçEVKŠÐ‹c2§P,ªÀ£Å©Àaž«¿]²žÓ.þ¶Æï°˜s¸YÒ¡ñŽ+½·Ÿè(!O>zù\0\0ÿÿ\0PK\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0word/theme/theme1.xmlìYK‹G¾ò†¹ËzÍè±X6ÒH²cïÚÆ»vð±WjÍôªgZt·v-Œ!Ø§\\\'äÈ-‡bˆ!&—ü˜›Äù©î‘4ÓROüZv«~|UýuUuuiæâåû1uŽ1„%·z¡â:8±1IÂŽ{ç`Xj¹Ž(#ÊÜqX¸—/}úÉE´##cä±ƒ:n$ål§\\#Fâ›áæ&ŒÇHB—‡å1G\' 7¦åZ¥Ò(Çˆ$®“ ÔÞœLÈ;J¥{i¥|@á_\"…\ZQ¾¯TcCBcÇÓªúPî#Úqa1;9À÷¥ëP$$LtÜŠþsË—.–×BTÈæä†úo)·OkZŽ‡‡kAÏó½Fw­_¨ÜÆ\ršƒÆ ±Ö§h4‚¦\\LÍZà-±9PÚ´èî7ûõªÏé¯oá»¾úx\rJ›Þ~82æ@iÓßÂû½v¯oê× ´ÙØÂ7+Ý¾×4ð\ZQ’L·Ð¿QV»]C&Œ^µÂÛ¾7lÖ–ðUÎEW*ŸÈ¢X‹ÑãC\0hç\"IG.fx‚F€%‡œ8»$Œ ðf(a†+µÊ°R‡ÿêãé–ö(ÚÁ(\'ÄÖâãˆ\'3Ùq¯V7yñüùé£g§~;}üøôÑ/Ëµ·å®¢$ÌË½úñë¿¿ÿÂùë×^=ùÆŽyüËŸ¿|ùûÿ¦^\Z´¾}úòÙÓß}õçOO,ð.G‡yø‰±pnàç6‹aƒ–ð!;‰ƒ‘¼D7	J’± 22Ð7ˆ\"®‡M;Þå.lÀ+ó#ƒð~Äç’X€×£Ø\0î1F{Œ[÷t]­•·Â<	í‹óyw¡cÛÚÁ†—óÄ=±©\"lÐ¼EÁå(Ä	–ŽšcSŒ-b÷1ìºGFœ	6‘Î=âô±šä€\ZÑ”	]%1øea#þ6l³w×é1jSßÇÇ&Î¢6•˜\Zf¼‚æÅVÆ(¦yä.’‘äþ‚ƒ	ž1eÎ`Œ…°ÉÜäƒîuH3v·ïÑEl\"¹$Sr1–GöÙ4ˆP<³r&I”Ç~&¦¢È¹Å¤•3OˆêƒPRèî»î~ýÙ¾iÈ jfÎmG3ó<.èa›ò.ÛåÄ\Z½yh„ö.Æ 1ÆÎÏlx63lž‘¾AV¹Šm¶¹†ÌXUý¨•Tqcq,FÈîãðÙ[l$žJbÄ‹4ß˜š!3€«.¶Æ+MTJ¸:´v7Elì¯Pë­a¥úÂ¯nøïMÎÈ½ƒ~kHìol›D²€9@PeØÒ-ˆîÏDÔqÒbs«ÜÄ<´™ÊEOL’×V@µÿßÔ>‰³©zìÀ÷©wŠRÊf•S„Û¬mÆÇäã/múhžÜÂp›X ç•Íyeó¿¯lŠÎóy=s^Ïœ×3v‘PÏd%Œ~´zÜ£µÄ…Ï~&„Ò}¹ xWèâGÀÙaPw´ÐúQÓ,‚ær9r¤Ûgòs\"£ýÍ`™ª^!KÕ¡pfL@ù¤‡­ºÕÇ{lœŽV««§› €d6å×jŠ5™Ž6šÙc¼µzÝõãÖ%û6$r‹™$êÍÕàkHè	‹¶…EK©/d¡¿–^ËÉAêÁ¸ï¥Œ Ü ¤ÇÊO©üÊ»gîé\"cšÛ®Y¶×V\\ÏÆÓ‰\\¸™$raÁå±9|Æ¾ng.5è)SlÓh¶>„¯UÙÈ\r41{Î	œ¹ºjFhÖq\'ðÃ	šñô	•©\r“Ž;’KC¿Kf™q!ûHD)LO¥û‰ÄÜ¡$†XÏ»&·j­©öø‘’kW>>Ëé¯¼“ñd‚G²`$ëÂ\\ªÄ:ûž`Õas ½OœC:ç·ÊoV•ÇDÈµ5Ç„ç‚;³âFºZEã­KvDEhy£ä“y\n×í5Ü>4ÓÍ]™ýåfCå¤÷¾u_/¤&rI³àQ·¦=|¸K>Ç*Ëû«4uoæºö*×Ýï!ä¨e‹ÔcµlÔ¤v†An¹uhÝg}lF­º Vu¥îm½Þf‡Gù}¨VçT\nM~µp¬^L¦™@®²Ë}éÌ9é¸*~×j~Pª´üAÉ«{•RËïÖK]ß¯W~µÒïÕ‚QdWýtí!üØ§‹åÛ{=¾õ?^•ÚF,.3]—µ°~ƒ_­¿ÁwXæA£6l×Û½F©]ïK^¿×*µƒF¯ÔoÍþ°ø­öð¡ëk°×­^cÐ*5ªAPò\ZE¿Õ.5½Z­ë5»­×}¸´5ì|õ½2¯æué\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\\wK‰s\0\0i\r\0\0\0\0\0word/settings.xml´WÛnÛ8}_`ÿÁÐó:ÖÕ¡Nßšq[ÔYì3%Q6RHÊŽ[ì¿ï-§Ñq‹¼XÔœ™3£áÌ~÷þ‰ÑÞIx1u¼+×éá\"å)¶Sçï‡Uìô¤BE†(/ðÔ9bé¼¿þów‡Xb¥@Mö€¢1K§ÎN©2dºÃÉ+^âÀœ†¼Ší€!ñX•ý”³)’JÔqà»îÐihøÔ©D7}FRÁ%Ï•6‰yž“7k!^ã·6Yð´b¸PÆã@`\n1ðBîH)-ûU6\0w–dÿ³Ø3jõžûŠÏ=p‘,^ž6(O±”°AŒÚ\0IÑ:_|_ïæ\r˜{®YG]Fà¿ ¦øé2ŽqÃ1\0Ës’]Æ3<ñ6±Þð×‚9#Èª‹(üÀÆ¡ÚüŒKf*Û]Fg÷h m‘B;$OY3æô2ÆðŒ±.0ÊÓÇsN|YÒ¢á‘µ{(_†ÕQÕ5tOD=3š’fi|·-¸@	…p ´{P=þ…MÖ³ÄOF®sÛ,rªúkiß8g½C\\b‘B_O‰ë´<Ã9ª¨z@ÉFñ4öBù\rœî@©ÂbS¢:nÎ%8µzÿÄÕ&ž€†l,ÌükW›z–‚E|Ä³ù¸æ»C\\	òúlkãÝ‹Î]þèˆÃì$Ã:yu¤xÁoÈ7|Sd+©0š)ùü,\0\\hÏŸa»Ž%^a¤*HÓ93;±¢¤\\!¸¸+2Øæ7sFòp@Âk(\"øÁäù£ŽÜ7ò[Iü(C·P–3®g·Çr¹þ½4õ>8/_¸8dÒ.¾r®Nªîrä…«a©F[Ä›¸ËÉ¢ñ½`n»ê9¬ÜÀë´	VÁdâw!ÑÄ_Œg]È(\n†Þª™‡;êŒ\ZÐí¶F³Î¨a7]È2ŠÆ“e\'ò¿y[ÞŒ–‹ Ùƒ&ó,Ö/Â®tûöXm1G,õÖúj2Ð\Z‰xœ‘Ââ	†ùŠÏ‘M•X°ß¯É¥+($˜eqFd¹À¹YÓ5Û–·ÑR˜¥O\\zÌbñAðª¬Ñƒ@eÝ–VÅÃÆ’êž0+—U²±VœgPUdŸ÷Âä©MÏ!VPæf¼Ý#Ó.FýM‰¤Tlt+à5*Ëº£’­7u(Ùî”§›@Á[7Xó’lýó\ræ×˜yA©þ2Ðn­Ì·²3½ÀÊ‚VZYØÊ\"+‹ZÙÐÊ†Z¶ƒ*()¡¹íRËsN)?àì¶Å_ˆê$È*ñ¢>ï ¼x-h@ÙÛÇø	FœJ’1—8ÏõMÁ6Úy¥žéjL+—Ïô5¥gƒgÆ¦ÄˆEŸÃ)rÜYÒ¯Wuà”H…%œÄŠ‹ýe0/Œ3žÞék@XËƒáb1\n£ºÿ¼ÈœàÊLKØ÷¯8Ÿ!‰³³¦Qmúý&šÇ#Ñ÷¼±×CÙŸ¹ó›~äÃù*œŒg«Ù¿M“ÚÿH×ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0ºÃÇ\0\0\"§\0\0\0\0\0word/styles.xmlì]ßs›H~¿ªû(=Ý=dmY²l§Ö»e;ñ%uIÖ;·Ï#Y¬è\0Åñþõ7¿@#5ƒè¡­õ¦®RK@3Ì×_3Ý æÇŸ¿-’à+Ï‹8KÏÃOÃ,ŠÓûóÁ—»ëW§ƒ (Y\Z±$Kùùà‰ƒŸúûß~||]”O	/¯áù`^–Ë×E8çVü-y*vÎ²|ÁJñ5¿?X°üaµ|f‹%+ãiœÄåÓÁÑáád``ò.(Ùl‡üM®<-•ýAÎ˜¥Å<^Úc´Ç,–yò¢\'½H4Þ‚Åi\r3 EæY‘ÍÊÄÉ˜)(a><TŸÉ\Zàp\0&!ÿ†Ã85ÂÒÆ‰#Î¤Æ‰#Ç¯3@´BAª~È?ÒÜÂ*¢2šãà*Ž¤-+ÙœóMÄY‚C[ˆÚÁ’,|°19nÐŽkÀ§…äp¾~Ÿf9›&Ixe +PÀòÁü£>òoj»óa–ÈbÔ~Ò²ð\rŸ±URòk~“›¯æ›ús¥e<¾fEÇw¢¿¢ÑE,Úw‘ñ@ìá¬(/Š˜5îœË{Â¢´6_ÆQ<8->ð<»¿21ðGzSñG½¡Þr%;µ±-aé}µ§¯þuiwNmúr+7MESç–¿º½P†Ãñë$¾gå*qL~S:ÜåÑ•8þ­\\±D|`Fÿµ†k¹ýMõrÉÂXuŠÍJ.¢Úpr({Ä2ˆŸU_>¯$—lUf¦ ÿÖ°€1ìDè»ÕXìå³Â×xt[ŠçÕ–ØøåýMg¹ˆ²çƒ3Õ¦ØxËñ»8Šxj˜Îãˆÿ6çé—‚Gëí¿^+G6Âl•ŠÏ£“‰ò¢¤ˆÞ~ùRÆ]±7e’ÓOÒ ‘G¯âuãÊü¿ØÐÐÖd?çL^|‚á6„ê>\nâHZÖÙ6c®¶Î]…jh´¯†Æûjèx_\rMöÕÐÉ¾\Z:ÝWC\næ9ŠÓH\\GÔñ°€ºÇ¡F4ŽClh‡–Ð8© qJ@ã8ãðc4ŽÃM8eº¼Ðrö‘ÃÛÛqw_#üpw_üpw_üpw|?ÜÝñÝww8÷ÃÝ½ýpwk<®žjï…ÌÒ²·ÊfYV¦YÉ9éíÆR¥2r\Z<yÑã9ÉIÀèÈf.Ä½ÑB¦¾ïö%Rÿëy)Ç ›³ø^¦<½;ÎÓ¯<É–<`Q$ðs.’2ÇˆøøtÎg<çiÈ)›Tf‚AºZL	|sÉîÉ°x\Z_…Hj‡ùó\\Š$&pêó¬×2F>ÄEÿ±’ Áå*I8Ö\'\ZSXýsÓ?5P0ý3Ó?1°8£\Z\"ƒF4RhÀ\ZÑ¸iÿ¤\Z7ƒF4nhÜZÿq»‹ËD…x{Ö1ì^»»J2y¥w?nãûTUe{#™šipÃrvŸ³å<UífXûœ±í\\fÑSpGqM«‘¨æõÊEd-;NWýtJ\\5‘¼j<\"Õxý%öQL“åíM>s»š–¢UHD{Ë’•žÐöW+û{ØZ\0×q^É –Àƒ?Éé¬¤“\"ò­{Ù¿ck¬þ²ÚŽJ¤Ý3½”7\\iÂð»§%ÏEZöÐé:K’ì‘Gtˆ·eži_³%¤(é$ù·‹åœ±Ê•6 º_ê«§/‚lÙû„n§4¼½}µ`qÐÍ ÞÝ}üÜeK™fÊ¡¼ÌÊ2[ašJà?~ãÓÒtðB$ÁéÑÙ^•‡ØULp‘ÑHYD„$¦™q\Z“\\CÞ¿ùÓ4cyDƒv“sý<JÉ‰oÙb©\'ÚqñQÄ‚ÙÂûËcY¢Õ	˜U6,VÓßyØ?Ô}Ê’ÊÐ/«RÕÕTWYÓÁõŸ&lÀõŸ\"(6ÅåAú/ÁÉnÀõ?Ù\r8ª“½JXQÄÎ[¨ÞxT§[áQŸoÿäÏàeI–ÏV	Ý\0V€d#X’\ra–¬iAyÆ\nð„õùºŒÂ#(É)¼åqDF†£bBQÑ À¨8P`¤ôBÇëÿ˜ŽÖÿY\rF4°À¨üŒôòOt—Ç£ò3Fåg\nŒÊÏ•ŸÞ|6“`ºKŒIås$Ý…&-ùb™å,\"‚|›ð{FP Õh7y6“¿„ÉRý7¤¬Q\'„“m\rGEòo|JÖ5‰EÙ/‚Š(K’,#ª­­/8ÊróÙµ]fê— ½»p“°Ï³$â¹ãœÜ¶\"_¾Õ?ËØî¾êF§²ç‡ø~^·óºÚoÃLwZV	û†Ùî›Æ|Rýø¥Éì#âÕ¢ê(ü1ÅdÔÝXyô†ñx·ñz&±ayÜÑ¶9Ùm¹ž%oXžt´„mžv´T:Ý°lÓÃ–?4:ÂI›ÿÔ9žÃùNÚ¼¨6nl¶Í‘jË&<ió¢\r©a(ï@vºiÆmßM<n{ŒŠÜ(9¹Q:ëÊ\rÑ&°Ïük,¯ì˜ ©Ú«Ÿž\0q_M¢;EÎ_W™®ÛoÜpêþ£®÷bâ”<hÄu¿qµeÜãØ9Ü¸!:Ç7Dç\0ä†è‰œæ¨äFé›Üƒ”­à­ =.ZA{ŸhQ|¢UY€¢ótÀ\r*„@µÇLÁ\r*0÷*DAB …\n!ÐB…0œP¡=N¨ÐÞG¨ÅG¨-T*„@B …\n!ÐBõœÛ;Í½„\nQÐB…h¡B´PÕ|±‡P¡=N¨ÐÞG¨ÅG¨-T*„@B …\n!ÐB…(¡s/¡B´P!Z¨-TýSC¡B{œP¡½P!ŠP!\nZ¨-T*„@B …\n!PBæ^B…(h¡B´P!Z¨êfa¡B{œP¡½P!ŠP!\nZ¨-T*„@B …\n!PBæ^B…(h¡B´P!D›š[”®Çì‡øª§ó‰ýî·®L§>Û?å¶¡FÝ¡ª^¹±ºÿá2Ë‚ÆŽT¾Ñ\r$ž&q¦JÔŽÛê6®z$uãó—«ö_øØè=_ºd~¡î™ðqWKPS·¹¼m	’¼q›§Û–`Ö9n‹¾¶%¸ŽÛ‚®ÒeõPŠ¸ã¶0cæmÑÚ2‡CÜ£-C8Âm‘Ù2„Ü-Ãã@çmëãŽã4©Ÿ/mîh!œ¸ÚÜrU…c(Œ®¤¹º²çFèJ£Å§O¬\nÍ°Êj(3,ÕþBu#`©†^Tª!”7ÕÊj±TC,ÕþÁÙàE5€ñ§\ZByS\r¡ü¨†—2,ÕK5DÀRÝó‚ì„ñ§\ZByS\r¡ü¨†“;,ÕK5DÀR\r¼¨0þTC(oª!”Õ KFS\r°TC,ÕÁ‹j\0ãO5„ò¦\ZBµQ­ª(T£¶Ìq“0ËwA¶qÁÙ2ôÈ–,kÏlÉBðÌ– Wç¸lÉ&ÍÐ•=7BW\ZÝ(>0xbÝPh†ÝP~Tã²¥&ªý…êFÀRË–œTã²¥VªqÙR+Õ¸lÉM5.[j¢\Z—-5QíœÝ^Tã²¥VªqÙR+Õ¸lÉM5.[j¢\Z—-5QË–š¨îyAvÂøSË–Z©ÆeKnªqÙRÕ¸l©‰j\\¶ÔD5.[rRË–Z©ÆeK­Tã²%7Õ¸l©‰j\\¶ÔD5.[j¢\Z—-9©ÆeK­Tã²¥VªqÙÒGa¼êvÁò2 {_Ü;VÌKÖÿå„_ÒœYò•Gí©~@åÁãÆòW[-E(Ž/Å˜É7 [?WŠô`\r :ð}T/S%eO³z˜Ù¬:ln×ªÏy!rjsÌááèúp4|cú¢ wt¢nÖÜE‚†×Ë^©ö¦Lœï/rœ@·RùÊÄ†íÒUªíU3Ws–ë½k\'®Ž12uŸåÛ“áøÚ„$³¬ÙçËO¢}µM~ÌñB}[¯x6•o#0ÒKž™ÐNž3ý>§_“º%3¦ÖåçØï-ËÏÉoÍ6¹cº\rËõ\ntróe½](õ_õëèúx|¦\"€:XÅ†óS‘A9“Ú,W@—×\Za½`]uÚ^°No³–’óqž#§ó˜àDã<Gœg-X}Ü†\\ŸÙ½ÌŠz;Ý«Šß™{Ù¶{ém=Ýkät/ó {¾÷ª†Üá^»œh®rdætKgªm=]eìtóä«Œ_¸«œÚžR…}è)J>ôžëÿ¯tïúúMO8vz„y¢‹Æ#Ž¿P*yy±£§èÅa›|ÀŒ(L^¸Œmpº€’Å^ƒÂñ™ü·ír=¦µ;ÜÅrßuö=½áÄé\r¦VAã\r\'ß…7TþœaÏüŸ:ù7³\ZþO_(ÿ»W\"Øï¤àDþëÂÿŠ9â™“Ã\n\rÿgQþ«!~Ö)\09ã¡lšW¶;*lfé¥úÝAjá¥m_p¬ÏäàÑÇvñèîw)ë¼-}VuàÖÒ .;­³§•ÓDS->¼O¥£=J/©{\Z}c\ZJì¿âIò‘é£³¥ûÐ„Ï¤\\ÄÞá¡zSçÖþ©^tÂiŸ«»N€ƒÍÎè¯í~¢—¡ŒõÏfœ•XY‚onõ®¾#ÝÑ‡ÃU!†æV°Ý¿Zêv/ÍÎ`¬ãÏV@kÔ+Œw†0wPúÙM©®pº(=\"¢ÔÔéº^•¾†ûT.‘ë\"£‹áÃ¦.JÏðŸU\0°ÙêS<D²¥ë|.¶ÆDl™ÒäËakß<$+ºÖæbå˜ˆSü~4DÎƒ®w¹x˜ñ`Fñ/¡úJ’]trQrBD‰©“½Piüé$èÊ‹„S\"ÌUð¯qÕxÞ|7%ºã¢äŒˆ3ò/õ’±§2›~uÆöXë­MCŒ­¯)¤5a\rE“°¡jg @¦ï˜Éâ˜:],—_>¯¤“±U™UCœÊ!\\±Ä¼Ê_Üx¶c}Fê¬_UÃòÀózì×séjË±{v­·Ñ‰rÍ`£—ôU£åjnçx™Yíþ9kÖp½Š÷6Aõ\n%W`­b6(”˜ÓÕBˆøØ•ÙùÌ%nì,p?4	È~ß\rJ\\ä÷è¦¹9áÇg¦¬Y™zµmfôV\nM*¤6A™ÉŒçÕÕ~šMñ{XYÊÜ•«v6[æ–ãCù¯kÔiðz¨\Zéè«‹S7;%²×‘kvYy×d½`ÇöX©Ÿ;¬wïòa8#S?C9d¬îpÉûSòå{ÆÛærÝ¥>ióFºú5yÛ§\rÞ£‡s”@](w{ÇÓ2cÑÚ6—YÙå]BœÝ\\[¤ùäËËHýÕ÷EÕq…ð$³`÷ò;ùAø—Œ\'J}jØ=ËâõÔgnIÊÀœÙ®ßUÈoÚ­,NToÔ\r]ýMÒ7øÿ©ePàG­®Û÷r°!’ûâtß\Z#×/ít\ràúˆ¾Q²ºÕ‡Š’SÝª­B•äŠ-iÆL\"«ç/·F´úTüô?\0\0\0ÿÿ\0PK\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0word/webSettings.xmlœÓÝnÂ \0àû%{‡†{¥:5Kc5Y—Ý,K¶=\0Â©%§\\uO?¨ÕÕxcwSÐóåð7_îµJ¾Á:‰&\'£aJ0…4›œ|}®$qžÁ\ZÈÉY.îïæuVÃú¼º$(Æešç¤ô¾Ê(u¼ÍÜ+0a²@«™]»¡šÙí®\ZpÔór-•ô:NÓi{‹‚E!9<#ßi0¾É§TÑ¸RVî¤Õ·h5ZQYäà\\XVGO3iÎÌhriÉ-:,ü0,¦­¨¡Bú(m\"­þ€i?`|Ì8ìû­ACf×‘¢Ÿ3;;RtœÿÓÄ®1~8Õ›˜Þ±œð¢ìÇÎˆÆ\\æYÉ\\y)ªŸ8éˆÇ¦o»&ôÛ´é<èx†šg¯ƒ–­UÂ­LÂÅJ\Z8~ÃùÄ¦	aßŒÇmiƒBÅ ìÚ\"¼_¬¼ÔòVhŸ,Ö,ÃL)¬ßß^B‡^<òÅ/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0word/fontTable.xmlÜ“M›0†ï•úïùØ4Z²RÛT©ê¡Úþ\0Ç°ÖÈã„äßwlH–*Zié¡‡r0ãw<öëááñ¤Ur¤5Éf”$Âp[JSä×óînMðÌ”LY#\nr@·?<t›Ê\Z	ÖØh^Æûv“¦À¡Ìl+&+ë4ó8uuª™{9´wÜê–y¹—JúsšSº\"Æ½‡b«JrñÕòƒÆÇúÔ	…Dk ‘-\\hÝ{hueë,\0xf­zžfÒ\\1Ùâ¤%wlågx˜aG…å‘V¯€å4@~XqqšÆXŒ+ÇYNã¬®YŽ8·™ <LBäóË>Â+”XPú²™†»ÜQ\Zj™g\rƒæOb¥¦#bß`Êò—1SL3myžu¸CÍ7ßjcÛ+$aW&ØXI‡ï\'¼b(NQ¶A¥B€®m‡?7é6†i}aJîŒ‰–\"ÃÜ‘áñÑ¦]Ò`WNtF’†…¼aD€ôi/WLKu¾¨ÐI€>ÑJÏ›‹~dN†Cô)5&°§yZPš?ív¤W2ÜþŽùâþó äá[ñù4(ó«BƒÂ#\'N³žÃ#çº¿™öÜ8ñ,µ€ä‡è’ŸV3ó†#9]¡Kô#83Ÿäˆ‹ÜIŽÐGP¹_/ÿ‰#Co$ßeÝø7;$ôÅÚ!C\0Ûß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0XzID\0\0\r\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’ÁN1†ï&¾Ã¦whY¢!›eIÔpQ!\Zoµ ²Û6íÀBâËø0¾—Ý]X$&=Ìt¾ùg:Ót´-òhÎ+£‡¤×e$-ŒTz1$³é¸3 ‘G®%Ï†!Ù\'£ìò\"6ÆÁ£3*ðQPÒ>vH–ˆ6¡Ô‹%Üw¡Cpn\\Á1¸nA-+¾\0\Z3vM@.9rZ	vl«Hö’R´’víòZ@\n\n9 ÑÓ^·G,‚+üÙ„:òƒ,î,œEÁ–ÞzÕ‚eYvË~†þ{ôeòðT?µ£t5+$K¥HPaYJf°üúí6×­lá€£qÙÌ™¯ÏèÞ w\\+}D1‹cÊXŸÕ9®ÚÀ\nv¥qÒµ/`¼pÊbØkSëä\"Ð9÷8	‹ž+7»¿ËþÆ+Uý›,®‰ÖM÷KhZ…á%Í¨‘çþíÝtL²PãªÃáLKb–0öZu{’,ö\rü[ñ Ðìôgß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0°(bËn\0\0Â\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œRËnÂ0¼Wê?D¹ƒ­P…£\nTõÐ—D€³ål«ŽmÙÁßwCJšª·ú´3ëÍŽ\rËS£“#ú ¬Y¤“q–&h¤-”©é6\Z=¤IˆÂB[ƒ‹ôŒ!]òÛøðÖ¡\nCB&,Ò:F7g,È\ZÆÔ6Ô)­oD$è+fËRI\\[yhÐD6Í²ÃSDS`1r½`Ú)Îñ¿¢…•­¿°ËÏŽô8äØ8-\"ò·vRë	Èm:W\ròŒèÀ‡¨0ð	°®€½õEàwÀºVµðBFŠŽO§ÀÓJŠH™òW%½\r¶ŒÉûÅhÒŽ^2¿Ayð*ž[C/Êt6º‚lyQyáêoo=‚\ZW´6/…ì‡€•mœ0$ÇúŠô>ÃÖåvÝÆð=ò›ì¸W±Þ8!ÉÂô~¸í b± û½ƒž€gz	¯[yš5×;m~»îKòÉlœÑ¹våhíþ¯ð/\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0“\0\0_rels/.relsPK-\0\0\0\0\0\0!\0¦QcIH\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0word/document.xmlPK-\0\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0\\wK‰s\0\0i\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0ºÃÇ\0\0\"§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H(\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0é)\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0XzID\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0),\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0°(bËn\0\0Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ß.\0\0docProps/app.xmlPK\0\0\0\0\0\0Á\0\0ƒ1\0\0\0\0'),
(13,'Dnevnik_prakse_3.docx','PK\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”ËnÂ0E÷•ú‘·Ubè¢ª*‹>–-Ré{Vý’Ç¼þ¾QU‘\nl\"%3÷Þ3VÆƒÑÚšl	µw%ë=–“^i7+Ù×ä-d&á”0ÞAÉ6€l4¼½L60#µÃ’ÍS\nOœ£œƒXø\0Ž*•V$z3„ü3à÷½Þ—Þ%p)Oµ^ “²×5}nH\"dÙsÓXg•L„`´‰ê|éÔŸ”|—PrÛƒsðŽ\Z?˜PWŽìtt4Q+ÈÆ\"¦wa©‹¯|T\\y¹°¤,NÛàôU¥%´úÚ-D/‘ÎÜš¢­X¡Ýžÿ(¦¼<EãÛ)‘à\Z\0;çN„L?¯FñË¼¤¢Ü‰˜\Z¸<FkÝ	‘h¡yöÏæØÚœŠ¤Îqôi£ã?ÆÞ¯l­Îià\01éÓ]›HÖgÏõm @ÈæÛûmø\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ÁjÃ0@ïƒýƒÑ½QÚÁ£N/cÐÛÙ[ILÛØj×þý<ØØ]éaGËÒÓ“ÐzsœFuà”]ð\Z–U\rŠ½	Öù^Ã[û¼x\0•…¼¥1xÖpâ›æöfýÊ#I)Êƒ‹YŠÏ\Z‘øˆ˜ÍÀå*Döå§i\")ÏÔc$³£žqU×÷˜~3 ™1ÕÖjH[{ª=E¾†ºÎ~\nf?±—3-ÂÞ²]ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zð¼Ñêz£¿§Å‰…,	¡	‰/û|f\\ZþçŠæ?6ï!Y´_áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0¶FpF\0\0\r\0\0\0\0\0word/document.xml¤—ÉnÛ0@ïú‚î	%y“…Ø9Äp‘C i>€¦¨á\"ô’~}‡ÚS¥¬\\LqÈyg†ôÝý…3çD•Î¥Ø¸þ­ç:Tç\"Ý¸/¿÷7¡ëhƒEŒ™tã¾QíÞo¿»;G±$GN…q\0!tt.ÈÆÍŒ)\"„4É(Çú–çDI-sK$G2IrBÑYªžï•_…’„j\rë=`qÂÚ­qä2Ž+|eœ#’aeè¥cøWChÂ!(˜\0‚þ5»\ZµDÖªh>	V\rH‹i¤6·œF\n†¤Õ4ÒlH\n§‘áÄ‡.*`0‘Šc]•\"ŽÕë±¸pM~ÈYnÞ€é-ÎÅë‹@«%ðY|5a…¸Œ)›Å\rEnÜ£Q­Óê[Ó£J¿nZ\rÊÆ-Ë­½¦M£«Æø®RßÕ…¥ô\ZR”¥ÐY^´ÕO¥Á`Ö@NŸ9àÄY3ï\\ø#Sí¥mWCc~}vœU–Nô½§i­ÆÞ¯ÙXÂ!‚»…\'¹¦ç\\dñi\0Á\0°$täeÑ0ÂšH—Ý–“L«†SŠåäcý‘5ð_cz€øx\"˜5vØÆª÷X:6qv®9#du±ÁÖmÒTÄdd!hˆó±\n0&I[Ï,“^ç´E|ã½3,Ò¯%ê%EGË¿F{ìJöÙ>ž®`Õ	ß/BúkÆ<g¸€JÎIô˜\n©ðE¾d Sž€ý…@¶MùI/¥ÜÆOý‘0û[Ý-<2~³mó¨À\n?BÞ*Ü¯í•g¥p…\Z+õöûýÜ{\0iÎøˆ¼Õb¶ô÷­èIYá:ô—‹]+ÜÑ™é”K>)Û¨ªaX¤0ÿ„!2©¸yyvÑöÕÃ¨›=Vå•ÛH˜€£\nE5U\'ênw‚žDþê\n¿‚Ï¬‚©Ô®åoƒ/(lœ}«;©Œßíî­Ž¦Ä<©±Î/]œ>ÿA¸+|¿:ÎJ‰¿g¡5ÇNø‰-ÑH¸ÒüùÜ+Yyš™®{ÆHÞõMz£Å1…uWAÙM¤4½nz4e×«–#’iÖÛ¶sJ1üù¡làF,ô)7¬œ-ËQÔì»ü¬Âu^¶\0\0ÿÿ\0PK\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’ËjÃ0E÷…þƒ˜}-;}PBälJ!ÛÖý\0E?¨,	Íôá¿¯HIëÐ`ºðr®˜sÏ€6ÛÏÁŠwŒÔ{§ ÈrèŒ¯{×*x©¯îAkWkë*‘`[^^lžÐjNKÔõD¢8RÐ1‡µ”d:4e> K/ƒæ4ÆVm^u‹r•çw2NPž0Å®Vwõ5ˆjø¶ošÞàƒ7o:>S!?pÿŒÌé8JX[d“0KDçEVKŠÐ‹c2§P,ªÀ£Å©Àaž«¿]²žÓ.þ¶Æï°˜s¸YÒ¡ñŽ+½·Ÿè(!O>zù\0\0ÿÿ\0PK\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0word/theme/theme1.xmlìYK‹G¾ò†¹ËzÍè±X6ÒH²cïÚÆ»vð±WjÍôªgZt·v-Œ!Ø§\\\'äÈ-‡bˆ!&—ü˜›Äù©î‘4ÓROüZv«~|UýuUuuiæâåû1uŽ1„%·z¡â:8±1IÂŽ{ç`Xj¹Ž(#ÊÜqX¸—/}úÉE´##cä±ƒ:n$ål§\\#Fâ›áæ&ŒÇHB—‡å1G\' 7¦åZ¥Ò(Çˆ$®“ ÔÞœLÈ;J¥{i¥|@á_\"…\ZQ¾¯TcCBcÇÓªúPî#Úqa1;9À÷¥ëP$$LtÜŠþsË—.–×BTÈæä†úo)·OkZŽ‡‡kAÏó½Fw­_¨ÜÆ\ršƒÆ ±Ö§h4‚¦\\LÍZà-±9PÚ´èî7ûõªÏé¯oá»¾úx\rJ›Þ~82æ@iÓßÂû½v¯oê× ´ÙØÂ7+Ý¾×4ð\ZQ’L·Ð¿QV»]C&Œ^µÂÛ¾7lÖ–ðUÎEW*ŸÈ¢X‹ÑãC\0hç\"IG.fx‚F€%‡œ8»$Œ ðf(a†+µÊ°R‡ÿêãé–ö(ÚÁ(\'ÄÖâãˆ\'3Ùq¯V7yñüùé£g§~;}üøôÑ/Ëµ·å®¢$ÌË½úñë¿¿ÿÂùë×^=ùÆŽyüËŸ¿|ùûÿ¦^\Z´¾}úòÙÓß}õçOO,ð.G‡yø‰±pnàç6‹aƒ–ð!;‰ƒ‘¼D7	J’± 22Ð7ˆ\"®‡M;Þå.lÀ+ó#ƒð~Äç’X€×£Ø\0î1F{Œ[÷t]­•·Â<	í‹óyw¡cÛÚÁ†—óÄ=±©\"lÐ¼EÁå(Ä	–ŽšcSŒ-b÷1ìºGFœ	6‘Î=âô±šä€\ZÑ”	]%1øea#þ6l³w×é1jSßÇÇ&Î¢6•˜\Zf¼‚æÅVÆ(¦yä.’‘äþ‚ƒ	ž1eÎ`Œ…°ÉÜäƒîuH3v·ïÑEl\"¹$Sr1–GöÙ4ˆP<³r&I”Ç~&¦¢È¹Å¤•3OˆêƒPRèî»î~ýÙ¾iÈ jfÎmG3ó<.èa›ò.ÛåÄ\Z½yh„ö.Æ 1ÆÎÏlx63lž‘¾AV¹Šm¶¹†ÌXUý¨•Tqcq,FÈîãðÙ[l$žJbÄ‹4ß˜š!3€«.¶Æ+MTJ¸:´v7Elì¯Pë­a¥úÂ¯nøïMÎÈ½ƒ~kHìol›D²€9@PeØÒ-ˆîÏDÔqÒbs«ÜÄ<´™ÊEOL’×V@µÿßÔ>‰³©zìÀ÷©wŠRÊf•S„Û¬mÆÇäã/múhžÜÂp›X ç•Íyeó¿¯lŠÎóy=s^Ïœ×3v‘PÏd%Œ~´zÜ£µÄ…Ï~&„Ò}¹ xWèâGÀÙaPw´ÐúQÓ,‚ær9r¤Ûgòs\"£ýÍ`™ª^!KÕ¡pfL@ù¤‡­ºÕÇ{lœŽV««§› €d6å×jŠ5™Ž6šÙc¼µzÝõãÖ%û6$r‹™$êÍÕàkHè	‹¶…EK©/d¡¿–^ËÉAêÁ¸ï¥Œ Ü ¤ÇÊO©üÊ»gîé\"cšÛ®Y¶×V\\ÏÆÓ‰\\¸™$raÁå±9|Æ¾ng.5è)SlÓh¶>„¯UÙÈ\r41{Î	œ¹ºjFhÖq\'ðÃ	šñô	•©\r“Ž;’KC¿Kf™q!ûHD)LO¥û‰ÄÜ¡$†XÏ»&·j­©öø‘’kW>>Ëé¯¼“ñd‚G²`$ëÂ\\ªÄ:ûž`Õas ½OœC:ç·ÊoV•ÇDÈµ5Ç„ç‚;³âFºZEã­KvDEhy£ä“y\n×í5Ü>4ÓÍ]™ýåfCå¤÷¾u_/¤&rI³àQ·¦=|¸K>Ç*Ëû«4uoæºö*×Ýï!ä¨e‹ÔcµlÔ¤v†An¹uhÝg}lF­º Vu¥îm½Þf‡Gù}¨VçT\nM~µp¬^L¦™@®²Ë}éÌ9é¸*~×j~Pª´üAÉ«{•RËïÖK]ß¯W~µÒïÕ‚QdWýtí!üØ§‹åÛ{=¾õ?^•ÚF,.3]—µ°~ƒ_­¿ÁwXæA£6l×Û½F©]ïK^¿×*µƒF¯ÔoÍþ°ø­öð¡ëk°×­^cÐ*5ªAPò\ZE¿Õ.5½Z­ë5»­×}¸´5ì|õ½2¯æué\0\0\0ÿÿ\0PK\0\0\0\0\0!\0/ÙU6s\0\0i\r\0\0\0\0\0word/settings.xml´WÛnÛ8}_`ÿÁÐó:²®¶…:…/q“\"Þ.ê,ö™’(›)\n$Ç]ì¿ï-§Š¸E^,jÎÌ™ÑpfHøøÌèà	Ix9s¼«‘3ÀeÆsRîfÎßëáÄH…ÊQ^â™sÄÒùxýûo‰ÄJš\0E)–Íœ½RUâº2Ûc†ä¯p	`ÁC\n^ÅÎeH<ÖÕ0ã¬BŠ¤„utýÑ(vZ\Z>sjQ&-Å‘LpÉ¥M^$ÃíÃZˆ·ømLV<«.•ñè\nL!^Ê=©¤ec?ËàÞ’<ýè#žµzoô†Ï=p‘Ÿ,Þž6¨Ï°”°AŒÚ\0IÙ9_|_ïö\r˜{#³:<ºŒÀEgøù2ŽIËá‚å9É/ã‰O<¤K¬ÿ\\0gy}…Ø8ôC›ŸqÉ\\åûËèì¹Ú)´GòT‘\rcA/cÏ›£<{<çÄ—%-:Y·‡òuX=UÝ@÷$H43£-i–%w»’”RJ{\0Õ90Ñé_Ødý0Külä:·í¢ z©¿†‘ös68$ôõÌ™ŽWËs\\ šª”n¯@ã	AÈc¿…³=(SXl+”AÇ-y©§V/çrµ„‰\' ![3ÿºÕ¶™¥`Q\"ñb>nxÃîÔ‚¼=ÛÚÀx÷¢s—ß;â0ûÉñƒNÞV)^Cð[ò\rÏËüs-F3%!‚€Kíùl÷Ã±ÂkŒT\riz\'gf\'Ö”T\"weÛünÎHQ`RxåC?˜<ßb”Ã‘ûN~k‰ÿeè¶àÊòqÁ•âìöXí!×¿¶“¦ÞÝóò…‹C.íâ+çê¤:ZG£Å4n\"Õh‡xÓÑÍtÕ‡ø^°´]õ	ÖÁtê÷!ÑÔ_M}È8\nboÝ‡L\'^õF°ƒÑ¸7j@ÂQ/Ûr2/z£^…aÌû›(šLoz‘ùøfô!]FÝSæY¢/	»Òí;`Å±T4Øè«‰«5Rñ¸ ¥ÅSóŸ#Û:µàpØ\0’!J×PH0Ê’œÈj…³¦$vo«!z¥0K?Ÿ¸ô˜Åâ“àuÕ ª¦-­Š†­%)Õ=aV.ëtk­J8Î ºÌ¿<	“§.=‡DA™›ñvL»]\\?µÅ“Q±Õ­€7¨ªšŽJwÞÌ¡d·Wžno9Ü`ÍKºó[Ì7˜ß`æeúË@»]t2ßÊÎô+:Yhea\'‹¬,êd±•ÅZ¶‡*()¡¹íRËN)?àü¶Ã_‰š$È=ªðª9ï ¼x#h@9xJð3Œ8\'\nþT$g.qÞÈ7eÙjStäµz¡«1­\\½dÐ×”vœ¹/ŒM‰‹>‡3å¸=²´;^¯šÀ)‘0\n+8‰ûÃ`^˜ä<»Ó×€°­Åp>†ëæhô\"s‚+3-aß¿âb$Î[ÌšFé¿¾¿Š—ó›hËa¸ð—ÃÉ|±ÆËå|±ŠâxOþk›ÔþGºþ\0\0ÿÿ\0PK\0\0\0\0\0!\0Kéç\0\0\"§\0\0\0\0\0word/styles.xmlì]ms›Hþ~U÷(ºûµe½ØN­wËvâKê’¬7vn?`d±F ÇûëoÞ@#5ƒè¡­õ¦®RK@?3ÌÓO3Ý æÇŸ¿-’à+Ï‹8KÏ?<\r³(NïÏ¾Ü]¿:=Š’¥K²”Ÿ<ñâàçŸþþ·_åSÂ‹@\0¤ÅëEx~0/ËåëÃÃ\"œó+~È–<;gY¾`¥øšß.Xþ°Z¾\n³Å’•ñ4Nâòéðøèhr``ò.(Ùl‡üM®<-•ýaÎ˜¥Å<^Úc´Ç,–yò¢\'½H4Þ‚Åi\r3 EæY‘ÍÊÄÉ˜)(a>8RŸÉ\Z`Œ8\0“Ãaœ\ZŒCaiãÄgRãÄ‘…ã× Z¡ Ž‡U?äinaQÍqpG‡Ò–•lÎŠù&â,Á!Ž,Dí`I>Ø˜7hã\Zði!9\\„¯ßß§YÎ¦‰@^Ç\n°ü_ð#ÿ¨ü›Ú.‡Å|˜%òƒµŸ„t£,|Ãgl•”…üšßäæ«ù¦þ\\giY¯YÆñè¯ht‹öß]¤E| öpV”EÌ\ZwÎå‡Æ=aQZ›/ã(>8”->ð<»¿21ðÇzSñG½¡Þr%;µ±-aé}µ§¯þuiwNmúr+7MESç,u{¡£×I|ÏÊU.â˜ü¦t¸Ë£+qþü[¹b‰<øÐŒþk\r×rû›êå’…±ê›•\\DµÁäHö ‰e=ŸU_>¯$—lUf¦ ÿÖ°‡€1ìDè»ÕXìå³Â×xt[Šçª-±ñËû›<ÎreÏÎT›bã-_Äïâ(â©u`:#þÛœ§_\n­·ÿz­Ùl³U*>O&Ê‹’\"zû-äKwÅÞ”IN?IƒD½Š×+óÿV`C[“ýœ3yñ	Ûªû(ˆciQXgÛŒ¹Ú:wuª¡á¾\Z\Zí«¡ñ¾\Zšì«¡“}5tº¯†Ìs6§‘¸Ž¨ãa3\0uŽCh‡ØÐ8-¡qRAã8”€Æq8:\ZÇáÇh‡›\"pÊ,ty¡åìC‡··ãî¾Føáî¾$øáî¾øáîø~¸»ã»îîpî‡»;zûáîÖx\\=Õ\nÞ™¥eo•Í²¬L³’rÒÛ¥Keä4xò¢Çs’“$€Ñ‘Í\\ˆ{£…L}ßí!J¤þ×óR&ŽA6fñ½Lyzwœ§_y’-yÀ¢Hàæ\\$eŽññéœÏxÎÓS:6¨Ìƒtµ˜øæ’Ý“añ4\"¾\n‘$(Ô-òç¹ILàÔæYÿ®eŒ,>|ˆ‹þc%A‚ËU’p\"¬O4.¦°úç\n¦j `úg\n¦b`qF5Dh¤\ZÑ€4¢qÓþI5nhÜ\ZÑ¸´þãv—‰\nñö¬cÐ½vw•dòJï~ÜÆ÷©ªÊöF25Óà†åì>gËy «ÚÍ°ö9cÛ¹Ì¢§àŽâšV#QÍë•‹ÈZvœ®úè\Z•¸j<\"yÕxD«ñúKì£˜&Ë	Ú;š|æv5-E«:‰ö–%+=¡í¯6Vö÷°µ\0®ã¼ “A3,’ÓYI\'Eä[÷²ÇÖXýeµ•H»g 	z)o¸Ò„áwOKž‹´ì¡7Òu–$Ù#èoË<Ó¾fKþXQÒIòoË9+b•+m@t¿ÔWO_Ù²÷	Ý$,Nix{ûjÁâ$ ›A¼»ûø!¸Ë–2Í”Cx™•e¶ Ã4•ÀüÆ§ÿ¤éà…H‚Ó\'¢³½ *)°«˜à\"£‘²ˆIL3ã4&¹†*¼ó§iÆòˆí&çúy”’!Þ²ÅRO:´%ââ£ˆ?³!…÷–Ç².D%ª;0«lX¬¦¿ó°¨û”$•¡_V¥ª?ª©®²¦ƒë?MØ€ë?EPlŠËƒô_‚“Ý€ë²pT\'{•°¢ˆ·P½ñ¨N·Â£>ßþÉŸÁË’,Ÿ­º¬\0ÉF°$Â,Y-Ò‚òŒá	+<êó%t…GP’SxÿÊãˆŒFÅ„£¢AQq ÀH	èÿ„ŽÖÿ1¬ÿ³:\ZŒh\n`QùéåŸè.Fåg\nŒÊÏ•Ÿ)0*?¾	øl&&Át—’Êç,HºMZòÅ2ËYþDù6á÷Œ @ªÑnòl&	“¥ú!nHY£N\'Û\ZŽŠäßø”¬k‹²_Q–$YFT[[_p”åæ³k»ÌÔ/Azwá&a!ŸgIÄsÇ9¹mE¾|«–±Ý}ÕNeÏñý¼nçuµß†™í´¬ö\r³Ý\r6ù¤úñK“ÙGÅ«EÕQøcŠÉ°»±òè\rãÑnãõLbÃrÜÑ¶9Ùm¹ž%oXžt´„mžv´T:Ý°lÓÃ–?4:ÂI›ÿÔ9žÃùNÚ¼¨6nl¶Í‘jË&<ió¢\r©a(ï@vºiÆmßM<n{ŒŠÜ(9¹Q:ëÊ\rÑ&°Ïük,¯ì˜ ©Ú«Ÿž\0q_M¢;EÎ_W™®ÛoÜpêþ£®÷bâ”<hÄv¿qµeÜãØ9Ü¸!:Ç7Dç\0ä†è‰œæ¨äFé›Üƒ”­à­ =.ZA{ŸhQ|¢UY€¢ótÀ\r*„@µÇLÁ\r*0÷*DAB …\n!ÐB…0œP¡=N¨ÐÞG¨ÅG¨-T*„@B …\n!ÐBõœÛ;Í½„\nQÐB…h¡B´PÕ|±‡P¡=N¨ÐÞG¨ÅG¨-T*„@B …\n!ÐB…(¡s/¡B´P!Z¨-TýSC¡B{œP¡½P!ŠP!\nZ¨-T*„@B …\n!PBæ^B…(h¡B´P!Z¨êfa¡B{œP¡½P!ŠP!\nZ¨-T*„@B …\n!PBæ^B…(h¡B´P!D›š[”®Çìøª§ó‰ýî·®L§>Û?å¶¡†Ý¡ª^¹±ºÿá2Ë‚ÆU¾Ñ\r$ž&q¦JÔŽÛê6®z$uãó—«ö_øØè=_ºd~¡î™ðQWKPSµ¹¼m	’¼Q›§Û–`Ö9j‹¾¶%¸ŽÚ‚®ÒeõPŠ¸ã¶0cæmÑÚ2‡CÜ£-C8Âm‘Ù2„Ü-Ãq ƒó¶õ¸ã8MêçKB›;Z\'n„6·„\\Uá\n£+in„®ì¹ºÒèF@ñé„Áë†B3ì†ò£\ZÊKµ¿PÝXª!‚Õ\0ÆŸjåM5„ò£\ZF,ÕKµpv#xQ\r`ü©†PÞTC(?ªá¥K5DÀR\r°T÷¼ ;aü©†PÞTC(?ªáäK5DÀR\r°TC/ªŒ?ÕÊ›jåG5È’ÑTC,ÕK5Dð¢\ZÀøS\r¡¼©†PmT«*ÊÕ(†-sÜ$Ì2Ä]-C\\p¶=²%ËÚ3[²<³%ÈUÅ9.[²Is#teÏÐ•F7ŠO\'žX7ša7”Õ¸l©‰j¡º°Tã²%\'Õ¸l©•j\\¶ÔJ5.[rSË–š¨ÆeKMTûg7‚Õ¸l©•j\\¶ÔJ5.[rSË–š¨ÆeKMTã²¥&ª{^0þTã²¥VªqÙ’›j\\¶ÔD5.[j¢\Z—-5QË–œTã²¥VªqÙR+Õ¸lÉM5.[j¢\Z—-5QË–š¨ÆeKNªqÙR+Õ¸l©•j\\¶ôQ˜Ä¯€º]°¼èÞ÷Žó’õ9á—4çE–|åQ@{ªPgyø¸±ü•ÄVKŠãK1fò\rèÖÏ•\"ýX¨|ÕËTIcÙ“À¬f6«›Ûµês^ˆœÚsttv:˜Œß˜¾(È¨›5w‘ áõ²Wª½)çû‹\'Ð­T¾2±a»t•j{ÕÌÕœåzïÚ‰«cŒLÝgy=>º<3!É,köÀùò“h_m“_s¼PßÖ+žMåÛÆÄõ’gf´S£çL¿ÏéÃ×¤nÉ¤i£uù9ö{Ëòsrç[³MîßXnÃr½Ü|Y¯@JýWý:¾ÎTP«Øp~ÀTdPÎ¤6ËÇUÐåµFX/XWÝ†¶¬ÓÛ¬¥ä|œçØé<&8Ñ8ÏqçYV·!×gv/³¢ÞN÷ªbÆwæ^CC¶í^z[O÷\Z:ÝË<Bã^ÃïÄ½ª!w¸×.\'Ú‡«›9ÝÆÒ™j[OW9]Å<ùCã*£î*§¶§TazŠ’½§Äúÿ+Ý»¾~ÓÓ#ÆN0OtÑxÄøûð¥’—;zú€^¶ÉÌˆÒøÀä…ûÀÈö§(Yì5(ŒÏä¿m‡ë1­Ýá.–ëü^¨³ïé\r\'No0µ\n\Zo8ù.¼¡\Zðç{æÿÔÉ¿™•ÐðúBùßÅ¸Á~\'\'ò_þßPÌÏœüVhø?û‹ò_\rñ³NÈÅ`³Ð¼²ÝQa3K/ÕïR/mû‚c}&¦8¶‹Gw¿KYçmé³ª·–u©Øéh=­œ&šjñá}*íQzIÝÓèÓPbÿO’L-Ý‡&|&å\"öŽÔ›:·öOõ¢Nû\\ÝpnvFm÷½e¬6ã¬ÄÊ|Ãp«ßpõéŽ>®\n14·ò€íþmÔR·{ivƒ`¶Z£\\aÌx¸3„¹ƒÒÿË¦hJu…ÓEé1¥¦N×õªôý3Ü§r‰dX]‰6uQz†ÿ¬€ÍVŸâ!’-]çs±5\"bË”&_[û.à!YÑµ6+c\"VLyðûÑ9ºÞåâaBÄƒÅ¿„:è+HJtÑÉEÉ	%¦NöB¥ñ§“ +?.N‰H0WÁ¿ÆUãyóýÝ”èbŒ‹’3\"JÌÈ¿ÔKÆžÊlúÕÛc­·6\r1¶¾¦Ö„5eLÂ†ª™¾c&‹cbèt±\\~ù¼’NÆVeV\rq*‡pÅó*=r/àÙŽõ©³~U\rËÏë±_Ï¥«-c3,öìZo£åšÁF/é«FËÕÜÎñ2³ÚýsÖ¬ázïm‚êJ®ÀZÅl\nP(1§«…þ\'ð±+³ó™KÜØYà~`ý&¾”¸Èï+ÐM\'rsþÂ\'ŽÏLY³2õjÛÌè­šTHm‚<6“Ï««ý4›:â÷°²”¹+Wím¶Ì-GGò_Ö¨ÓàõP5ÒÑW%§nvJd¯#×ì²ò®ÉzÁŽí±R?wXïÞåÃp(†¦~†rÈXÝá’÷§äË÷Œ+¶Íå:ºK}Òætõkò¶O¼Gç(\rºPîöŽ=>¦eÆ¢9´m.³²Ë=º„8»¹¶H7ôÉ#–—‘ú«ï‹ªã\náIfÁî?ä#vòƒð/O”úÔ°{–Åë;¨ÏÜ’”9³]¿«ß´[Y\Z;¨Þ¨ºú›:¤oðÿSË ÀZ]·ïå`C$;<öÅé¾5F®_Úé\ZÀõ}£du«%§ºU3Z…*É[ÒŒ˜DVÏ_nhõ©øé\0\0\0ÿÿ\0PK\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0word/webSettings.xmlœÓÝnÂ \0àû%{‡†{¥:5Kc5Y—Ý,K¶=\0Â©%§\\uO?¨ÕÕxcwSÐóåð7_îµJ¾Á:‰&\'£aJ0…4›œ|}®$qžÁ\ZÈÉY.îïæuVÃú¼º$(Æešç¤ô¾Ê(u¼ÍÜ+0a²@«™]»¡šÙí®\ZpÔór-•ô:NÓi{‹‚E!9<#ßi0¾É§TÑ¸RVî¤Õ·h5ZQYäà\\XVGO3iÎÌhriÉ-:,ü0,¦­¨¡Bú(m\"­þ€i?`|Ì8ìû­ACf×‘¢Ÿ3;;RtœÿÓÄ®1~8Õ›˜Þ±œð¢ìÇÎˆÆ\\æYÉ\\y)ªŸ8éˆÇ¦o»&ôÛ´é<èx†šg¯ƒ–­UÂ­LÂÅJ\Z8~ÃùÄ¦	aßŒÇmiƒBÅ ìÚ\"¼_¬¼ÔòVhŸ,Ö,ÃL)¬ßß^B‡^<òÅ/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0word/fontTable.xmlÜ“M›0†ï•úïùØ4Z²RÛT©ê¡Úþ\0Ç°ÖÈã„äßwlH–*Zié¡‡r0ãw<öëááñ¤Ur¤5Éf”$Âp[JSä×óînMðÌ”LY#\nr@·?<t›Ê\Z	ÖØh^Æûv“¦À¡Ìl+&+ë4ó8uuª™{9´wÜê–y¹—JúsšSº\"Æ½‡b«JrñÕòƒÆÇúÔ	…Dk ‘-\\hÝ{hueë,\0xf­zžfÒ\\1Ùâ¤%wlågx˜aG…å‘V¯€å4@~XqqšÆXŒ+ÇYNã¬®YŽ8·™ <LBäóË>Â+”XPú²™†»ÜQ\Zj™g\rƒæOb¥¦#bß`Êò—1SL3myžu¸CÍ7ßjcÛ+$aW&ØXI‡ï\'¼b(NQ¶A¥B€®m‡?7é6†i}aJîŒ‰–\"ÃÜ‘áñÑ¦]Ò`WNtF’†…¼aD€ôi/WLKu¾¨ÐI€>ÑJÏ›‹~dN†Cô)5&°§yZPš?ív¤W2ÜþŽùâþó äá[ñù4(ó«BƒÂ#\'N³žÃ#çº¿™öÜ8ñ,µ€ä‡è’ŸV3ó†#9]¡Kô#83Ÿäˆ‹ÜIŽÐGP¹_/ÿ‰#Co$ßeÝø7;$ôÅÚ!C\0Ûß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0î—<,\0\0\r\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’QKÃ0€ßÿCÉû–´C™¥« ²NßbrÎh›„ä¶nàŸñÇø¿LÛ­³8DèC.÷åËõ.Ùùº,¢8¯ŒžxÈHZ©ôbBîçÓÁ˜D¹–¼0\Z&džœçÇG™°©0n±àP‚IûTØ	yE´)¥^¼BÉý0:$_Œ+9†Ð-¨åâ/€&ŒÒKŽœÖÂíŒd«”¢SÚ¥+\Z\n(A£§ñ0¦{Á•þà&óƒ,n,DwÉŽ^{ÕUU\r«Qƒ†úcú8»¹k~u tÝ+$Ï¤HQayF÷Ë°òËç7ØnwAXËïùúŒ®\rrÇµÒÑG”°$¡ŒXsfÇÕx‡MeœôÁÖ‹&Á§,†¹¶wõ6]p³0èòbó÷µ¿ñÚà`¥êw“\'\rÑ…Ùvm© £Ð¼´mõ.ó0º¼šOIî8°qøæŒ¥ñYÊØS]mïü^Xnø·1a}ãNÐ6¬ÿ€óo\0\0\0ÿÿ\0PK\0\0\0\0\0!\0»›j#m\0\0Â\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œRËnÂ0¼Wê?D¹ƒ­P…£\nTõÐ—D€³ål«ŽmÙÁßwCJšª·ú´3ëÍŽ\rËS£“#ú ¬Y¤“q–&h¤-”©é6\Z=¤IˆÂB[ƒ‹ôŒ!]òÛøðÖ¡\nCB&,Ò:F7g,È\ZÆÔ6Ô)­oD$è+fËRI\\[yhÐD6Í²ÃSDS`1r½`Ú)Îñ¿¢…•­¿°ËÏŽô8äØ8-\"ò·vRë	Èm:W\rò	Ñ=€Qah¹®€½õEàwÀºVµðBFŠŽO§ÀÓJŠH™òW%½\r¶ŒÉûÅhÒŽ^2¿Ayð*žyláE™ÎFW-/*/\\ýí­G°‘BãŠÖæ¥Ðý°²†äX_‘ÞgØºÜ®Û¾G~“ƒ÷*Ö\'$Y˜Þ·4`C,d¿wÐðL/áu+O³¦Ââzço£Ío×}I>™3:—À®­Ýÿþ\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0ß¤ÒlZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0“\0\0_rels/.relsPK-\0\0\0\0\0\0!\0¶FpF\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0word/document.xmlPK-\0\0\0\0\0\0!\0Öd³Qô\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0{C¼]Í\0\0Ï \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0/ÙU6s\0\0i\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0Kéç\0\0\"§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0&ÞúHo\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F(\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0>{6s\0\0)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ç)\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0î—<,\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\',\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0»›j#m\0\0Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ß.\0\0docProps/app.xmlPK\0\0\0\0\0\0Á\0\0‚1\0\0\0\0');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id_student` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `index_number` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `year_of_study` int(10) unsigned NOT NULL,
  `id_city` bigint(20) unsigned NOT NULL,
  `id_study_program` bigint(20) unsigned NOT NULL,
  `id_module` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `id_city` (`id_city`),
  KEY `id_study_program` (`id_study_program`),
  KEY `id_module` (`id_module`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`id_study_program`) REFERENCES `study_program` (`id_study_program`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id_student`,`index_number`,`first_name`,`last_name`,`date_of_birth`,`year_of_study`,`id_city`,`id_study_program`,`id_module`) values 
(1,'2022/0030','Uros','Kotaranin','2004-01-05',3,40,9,13),
(2,'2022/0268','Natasa','Kanjevac','2003-11-11',3,42,9,15),
(3,'2022/0392','Jana','Jovanovic','2003-07-25',3,40,9,15),
(4,'2022/0059','Masa','Savkic','2004-01-05',3,40,9,13),
(5,'2022/0033','Ana','Radovanovic','2004-01-06',4,40,8,17);

/*Table structure for table `student_officer` */

DROP TABLE IF EXISTS `student_officer`;

CREATE TABLE `student_officer` (
  `id_student_officer` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_study_level` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_student_officer`),
  KEY `id_study_level` (`id_study_level`),
  CONSTRAINT `student_officer_ibfk_1` FOREIGN KEY (`id_study_level`) REFERENCES `study_level` (`id_study_level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student_officer` */

insert  into `student_officer`(`id_student_officer`,`first_name`,`last_name`,`email`,`password`,`id_study_level`) values 
(1,'Uros','Kotaranin','uros.kotaranin@fon.bg.ac.rs','12345678',1);

/*Table structure for table `study_level` */

DROP TABLE IF EXISTS `study_level`;

CREATE TABLE `study_level` (
  `id_study_level` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_study_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `study_level` */

insert  into `study_level`(`id_study_level`,`name`) values 
(1,'Osnovne akademske test'),
(3,'Doktorske'),
(4,'Specijalisticke');

/*Table structure for table `study_program` */

DROP TABLE IF EXISTS `study_program`;

CREATE TABLE `study_program` (
  `id_study_program` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_study_level` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_study_program`),
  KEY `id_study_level` (`id_study_level`),
  CONSTRAINT `study_program_ibfk_1` FOREIGN KEY (`id_study_level`) REFERENCES `study_level` (`id_study_level`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `study_program` */

insert  into `study_program`(`id_study_program`,`name`,`id_study_level`) values 
(8,'Menadzment i organizacija - na daljinu',1),
(9,'Informacioni sistemi i tehnologije',1);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id_teacher` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id_teacher`,`first_name`,`last_name`) values 
(1,'Sinisa','Vlajic'),
(2,'Vladan','Devedzic'),
(7,'Sinisa','Jovanovic');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
