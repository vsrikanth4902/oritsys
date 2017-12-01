/*
SQLyog Ultimate v9.33 GA
MySQL - 5.0.45-community-nt : Database - oritsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oritsys` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `oritsys`;

/*Table structure for table `watchlist` */

DROP TABLE IF EXISTS `watchlist`;

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL auto_increment,
  `keywords` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `watchlist` */

insert  into `watchlist`(`id`,`keywords`) values (1,'Lorem'),(2,'Ipsum'),(3,'printing'),(4,'typesetting'),(5,'galley'),(6,'electronic'),(7,'software'),(8,'PageMaker');

/*Table structure for table `wordlist` */

DROP TABLE IF EXISTS `wordlist`;

CREATE TABLE `wordlist` (
  `list_id` int(11) NOT NULL auto_increment,
  `word_name` varchar(100) NOT NULL,
  `file_name` varchar(100) default NULL,
  `created_on` datetime default NULL,
  `updated_on` datetime default NULL,
  PRIMARY KEY  (`list_id`),
  UNIQUE KEY `word_unique` (`word_name`,`file_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

/*Data for the table `wordlist` */



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
