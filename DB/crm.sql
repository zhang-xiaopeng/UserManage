/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.20 : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `station` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `decidedzone_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer` */

insert  into `t_customer`(`id`,`name`,`station`,`telephone`,`address`,`decidedzone_id`) values (1,'张三','百度','13811111111','北京市西城区长安街100号','123'),(2,'李四','哇哈哈','13822222222','上海市虹桥区南京路250号','123'),(3,'王五','搜狗','13533333333','天津市河北区中山路30号','123'),(4,'赵六','联想','18633333333','石家庄市桥西区和平路10号','123'),(5,'小白','测试空间','18511111111','内蒙古自治区呼和浩特市和平路100号','124'),(6,'小黑','联想','13722222222','天津市南开区红旗路20号','124'),(7,'小花','百度','13733333333','北京市东城区王府井大街20号','124'),(8,'小李','长城','13788888888','北京市昌平区建材城西路100号',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
