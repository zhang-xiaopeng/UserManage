/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.27 : Database - logistics
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`logistics` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `logistics`;

/*Table structure for table `auth_function` */

DROP TABLE IF EXISTS `auth_function`;

CREATE TABLE `auth_function` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `generatemenu` varchar(255) DEFAULT NULL,
  `zindex` int(11) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`),
  KEY `FK33r6np87v1p6gge7t6rpcao5h` (`pid`),
  CONSTRAINT `FK33r6np87v1p6gge7t6rpcao5h` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_1x` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_function` */

insert  into `auth_function`(`id`,`name`,`code`,`description`,`page`,`generatemenu`,`zindex`,`pid`) values ('11','基础档案','jichudangan',NULL,NULL,'1',0,NULL),('112','收派标准','standard',NULL,'page_base_standard.action','1',1,'11'),('113','取派员设置','staff',NULL,'page_base_staff.action','1',2,'11'),('114','区域设置','region',NULL,'page_base_region.action','1',3,'11'),('115','管理分区','subarea',NULL,'page_base_subarea.action','1',4,'11'),('116','管理定区/调度排班','decidedzone',NULL,'page_base_decidedzone.action','1',5,'11'),('12','受理','shouli',NULL,NULL,'1',1,NULL),('121','业务受理','noticebill',NULL,'page_qupai_noticebill_add.action','1',0,'12'),('122','工作单快速录入','quickworkordermanage',NULL,'page_qupai_quickworkorder.action','1',1,'12'),('124','工作单导入','workordermanageimport',NULL,'page_qupai_workorderimport.action','1',3,'12'),('13','调度','diaodu',NULL,NULL,'1',2,NULL),('131','查台转单','changestaff',NULL,NULL,'1',0,'13'),('132','人工调度','personalassign',NULL,'page_qupai_diaodu.action','1',1,'13'),('14','物流配送流程管理','zhongzhuan',NULL,NULL,'1',3,NULL),('141','启动配送流程','start',NULL,'workOrderManageAction_list.action','1',0,'14'),('142','查看个人任务','personaltask',NULL,'taskAction_findPersonalTask.action','1',1,'14'),('143','查看我的组任务','grouptask',NULL,'taskAction_findGroupTask.action','1',2,'14'),('40283a816fffedb3016ffffb7cff0000','修改取派员','staff-edit','修改取派员','staffAction_edit.action','0',2,'113'),('40283a817004d8c2017004dd45e00000','取派员列表查询','staff-list','取派员列表查询','staffAction_pageQuery.action','0',2,'113'),('8a7e843355a4392d0155a43aa7150000','删除取派员','staff-delete','删除取派员','staffAction_delete.action','0',1,'113');

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_role` */

insert  into `auth_role`(`id`,`name`,`code`,`description`) values ('40283a8170053e2d017005412b030000','超级管理员','admin','超级管理员'),('40283a8170053e2d017005420b180001','普通管理员','manager','普通管理员'),('40283a8170053e2d01700542abd10002','普通用户','user','普通用户'),('40283a8170053e2d01700543480d0003','游客','visitor','游客');

/*Table structure for table `bc_decidedzone` */

DROP TABLE IF EXISTS `bc_decidedzone`;

CREATE TABLE `bc_decidedzone` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh0xplk12o52a6eryw4hcqnfwt` (`staff_id`),
  CONSTRAINT `FK_decidedzone_staff` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKh0xplk12o52a6eryw4hcqnfwt` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_decidedzone` */

insert  into `bc_decidedzone`(`id`,`NAME`,`staff_id`) values ('123','北京一','402809816fb0d425016fb0d7038f0000'),('124','北京二','402809816fc07c8c016fc07d71000000'),('125','天津一','40283a81700a449a01700a57f2ea0000'),('126','河北一','40283a81700a449a01700a5834510001'),('127','河北二','40283a81700a449a01700a59ffe70003'),('128','山西一','40283a81700a449a01700a5b68a70006');

/*Table structure for table `bc_region` */

DROP TABLE IF EXISTS `bc_region`;

CREATE TABLE `bc_region` (
  `id` varchar(32) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `shortcode` varchar(30) DEFAULT NULL,
  `citycode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_region` */

insert  into `bc_region`(`id`,`province`,`city`,`district`,`postcode`,`shortcode`,`citycode`) values ('QY001','北京市','北京市','东城区','110101','BJBJDC','beijing'),('QY002','北京市','北京市','西城区','110102','BJBJXC','beijing'),('QY003','北京市','北京市','朝阳区','110105','BJBJCY','beijing'),('QY004','北京市','北京市','丰台区','110106','BJBJFT','beijing'),('QY005','北京市','北京市','石景山区','110107','BJBJSJS','beijing'),('QY006','北京市','北京市','海淀区','110108','BJBJHD','beijing'),('QY007','北京市','北京市','门头沟区','110109','BJBJMTG','beijing'),('QY008','北京市','北京市','房山区','110111','BJBJFS','beijing'),('QY009','北京市','北京市','通州区','110112','BJBJTZ','beijing'),('QY010','北京市','北京市','顺义区','110113','BJBJSY','beijing'),('QY011','北京市','北京市','昌平区','110114','BJBJCP','beijing'),('QY012','北京市','北京市','大兴区','110115','BJBJDX','beijing'),('QY013','北京市','北京市','怀柔区','110116','BJBJHR','beijing'),('QY014','北京市','北京市','平谷区','110117','BJBJPG','beijing'),('QY015','北京市','北京市','密云县','110228','BJBJMY','beijing'),('QY016','北京市','北京市','延庆县','110229','BJBJYQ','beijing'),('QY017','河北省','石家庄市','长安区','130102','HBSJZZA','shijiazhuang'),('QY018','河北省','石家庄市','桥东区','130103','HBSJZQD','shijiazhuang'),('QY019','河北省','石家庄市','桥西区','130104','HBSJZQX','shijiazhuang'),('QY020','河北省','石家庄市','新华区','130105','HBSJZXH','shijiazhuang'),('QY021','河北省','石家庄市','井陉矿区','130107','HBSJZJXK','shijiazhuang'),('QY022','河北省','石家庄市','裕华区','130108','HBSJZYH','shijiazhuang'),('QY023','河北省','石家庄市','井陉县','130121','HBSJZJX','shijiazhuang'),('QY024','河北省','石家庄市','正定县','130123','HBSJZZD','shijiazhuang'),('QY025','河北省','石家庄市','栾城县','130124','HBSJZLC','shijiazhuang'),('QY026','河北省','石家庄市','行唐县','130125','HBSJZXT','shijiazhuang'),('QY027','河北省','石家庄市','灵寿县','130126','HBSJZLS','shijiazhuang'),('QY028','河北省','石家庄市','高邑县','130127','HBSJZGY','shijiazhuang'),('QY029','河北省','石家庄市','深泽县','130128','HBSJZSZ','shijiazhuang'),('QY030','河北省','石家庄市','赞皇县','130129','HBSJZZH','shijiazhuang'),('QY031','河北省','石家庄市','无极县','130130','HBSJZWJ','shijiazhuang'),('QY032','河北省','石家庄市','平山县','130131','HBSJZPS','shijiazhuang'),('QY033','河北省','石家庄市','元氏县','130132','HBSJZYS','shijiazhuang'),('QY034','河北省','石家庄市','赵县','130133','HBSJZZ','shijiazhuang'),('QY035','河北省','石家庄市','辛集市','130181','HBSJZXJ','shijiazhuang'),('QY036','河北省','石家庄市','藁城市','130182','HBSJZGC','shijiazhuang'),('QY037','河北省','石家庄市','晋州市','130183','HBSJZJZ','shijiazhuang'),('QY038','河北省','石家庄市','新乐市','130184','HBSJZXL','shijiazhuang'),('QY039','河北省','石家庄市','鹿泉市','130185','HBSJZLQ','shijiazhuang'),('QY040','天津市','天津市','和平区','120101','TJTJHP','tianjin'),('QY041','天津市','天津市','河东区','120102','TJTJHD','tianjin'),('QY042','天津市','天津市','河西区','120103','TJTJHX','tianjin'),('QY043','天津市','天津市','南开区','120104','TJTJNK','tianjin'),('QY044','天津市','天津市','河北区','120105','TJTJHB','tianjin'),('QY045','天津市','天津市','红桥区','120106','TJTJHQ','tianjin'),('QY046','天津市','天津市','滨海新区','120116','TJTJBHX','tianjin'),('QY047','天津市','天津市','东丽区','120110','TJTJDL','tianjin'),('QY048','天津市','天津市','西青区','120111','TJTJXQ','tianjin'),('QY049','天津市','天津市','津南区','120112','TJTJJN','tianjin'),('QY050','天津市','天津市','北辰区','120113','TJTJBC','tianjin'),('QY051','天津市','天津市','武清区','120114','TJTJWQ','tianjin'),('QY052','天津市','天津市','宝坻区','120115','TJTJBC','tianjin'),('QY053','天津市','天津市','宁河县','120221','TJTJNH','tianjin'),('QY054','天津市','天津市','静海县','120223','TJTJJH','tianjin'),('QY055','天津市','天津市','蓟县','120225','TJTJJ','tianjin'),('QY056','山西省','太原市','小店区','140105','SXTYXD','taiyuan'),('QY057','山西省','太原市','迎泽区','140106','SXTYYZ','taiyuan'),('QY058','山西省','太原市','杏花岭区','140107','SXTYXHL','taiyuan'),('QY059','山西省','太原市','尖草坪区','140108','SXTYJCP','taiyuan'),('QY060','山西省','太原市','万柏林区','140109','SXTYWBL','taiyuan'),('QY061','山西省','太原市','晋源区','140110','SXTYJY','taiyuan'),('QY062','山西省','太原市','清徐县','140121','SXTYQX','taiyuan'),('QY063','山西省','太原市','阳曲县','140122','SXTYYQ','taiyuan'),('QY064','山西省','太原市','娄烦县','140123','SXTYLF','taiyuan'),('QY065','山西省','太原市','古交市','140181','SXTYGJ','taiyuan');

/*Table structure for table `bc_staff` */

DROP TABLE IF EXISTS `bc_staff`;

CREATE TABLE `bc_staff` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `haspda` char(1) DEFAULT NULL,
  `deltag` char(1) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_staff` */

insert  into `bc_staff`(`id`,`name`,`telephone`,`haspda`,`deltag`,`station`,`standard`) values ('402809816fb0d425016fb0d7038f0000','宋江','13911191333','1','0','单位一','标准一'),('402809816fc07c8c016fc07d71000000','卢俊义','13810755999','1','0','单位一','标准一'),('40283a81700a449a01700a57f2ea0000','花荣','13910669898','0','0','单位二','标准二'),('40283a81700a449a01700a5834510001','柴进','13901295444','0','0','单位二','标准二'),('40283a81700a449a01700a5980f80002','李应','13911656668','0','0','单位三','标准三'),('40283a81700a449a01700a59ffe70003','朱仝','13910001918','0','0','单位三','标准三'),('40283a81700a449a01700a5ab39b0004','鲁智深','13911379900','1','0','单位三','标准三'),('40283a81700a449a01700a5b0b2b0005','武松','13910156161','1','0','单位二','标准一'),('40283a81700a449a01700a5b68a70006','孙二娘','13910357678','1','0','单位二','标准一'),('40283a81700a449a01700a5bb24c0007','扈三娘','13671279777','0','0','单位二','标准一'),('402881e66faeef4b016faef7a5d70000','吴用','13581710000','1','1','单位一','标准一'),('402881e66faeef4b016faef9f2fa0001','公孙胜','13911559666','0','1','单位二','标准一'),('402881e66faeef4b016faefa1f800002','关胜','17801349413','1','0','单位二','标准二'),('f1b65a666fb14df7016fb14f82b10000','林冲','13439184319','1','0','单位一','标准一'),('f1b65a666fb181fc016fb18ad6300000','秦明','13911876055','0','0','单位二','标准二'),('f1b65a666fb1b1a2016fb1b42dd70000','呼延灼','13910261855','1','0','单位一','标准一');

/*Table structure for table `bc_subarea` */

DROP TABLE IF EXISTS `bc_subarea`;

CREATE TABLE `bc_subarea` (
  `id` varchar(32) NOT NULL,
  `decidedzone_id` varchar(32) DEFAULT NULL,
  `region_id` varchar(32) DEFAULT NULL,
  `addresskey` varchar(100) DEFAULT NULL,
  `startnum` varchar(30) DEFAULT NULL,
  `endnum` varchar(30) DEFAULT NULL,
  `single` char(1) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlndbc8oldgbg3k1x63n3n6t7n` (`decidedzone_id`),
  KEY `FKcjwxm19mx5njn3xyqgqp431mb` (`region_id`),
  CONSTRAINT `FK_area_decidedzone` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`),
  CONSTRAINT `FK_area_region` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`),
  CONSTRAINT `FKcjwxm19mx5njn3xyqgqp431mb` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`),
  CONSTRAINT `FKlndbc8oldgbg3k1x63n3n6t7n` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_subarea` */

insert  into `bc_subarea`(`id`,`decidedzone_id`,`region_id`,`addresskey`,`startnum`,`endnum`,`single`,`position`) values ('402809816fc099e7016fc0a1bce20000','123','QY009','北京通州','1','100','0','通州路100号'),('402809816fc1dde3016fc1df52230000','123','QY003','北京朝阳','99','104','0','朝阳路100号'),('40283a816ffe5af0016ffe5f3c610002','126','QY022','河北裕华','1','100','0','裕华路100号'),('40283a81700a5cc701700a617f560000','125','QY042','天津河西','1','100','0','河西路100号'),('40283a81700a5cc701700a6238820001','126','QY024','河北正定','1','100','0','正定路100号'),('40283a81700a5cc701700a629d340002','128','QY063','山西阳曲','1','100','0','阳曲路100号'),('40283a81700a5cc701700a62f51d0003','125','QY054','天津静海','1','100','0','静海街100号'),('40283a81700a5cc701700a634e4a0004','128','QY065','山西古交','1','100','0','古交街100号'),('40283a81700a5cc701700a63be0e0005','124','QY004','北京丰台','1','100','0','丰台街100号'),('40283a81700a5cc701700a6405780006','124','QY005','北京石景山','1','100','0','石景山街100号'),('40283a81700a5cc701700a6468df0007','126','QY031','河北无极','99','100','0','无极街100号'),('40283a81700a5cc701700a64c15b0008','125','QY040','天津和平','1','12','0','和平街188号'),('40283a81700a5cc701700a652c970009','128','QY058','山西杏花岭','1','100','0','杏花岭路100号'),('4028ab206fe5f02a016fe5f489120000','127','QY032','河北平山','1','100','1','平山路100号'),('f1b65a3d6fb2d9a5016fb2da962c0000','128','QY061','山西晋源','1','100','0','晋源路100号'),('f1b65a3d6fb2d9a5016fb2e4dcc20001','124','QY001','北京东城','1','100','0','东城街45号');

/*Table structure for table `qp_noticebill` */

DROP TABLE IF EXISTS `qp_noticebill`;

CREATE TABLE `qp_noticebill` (
  `id` varchar(32) NOT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `delegater` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `pickaddress` varchar(200) DEFAULT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `pickdate` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ordertype` varchar(20) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5j3pm969oy1qdc1318jrmbgt` (`user_id`),
  KEY `FKhmbqr6qlg0uets978w5xshler` (`staff_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKhmbqr6qlg0uets978w5xshler` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKl5j3pm969oy1qdc1318jrmbgt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_noticebill` */

insert  into `qp_noticebill`(`id`,`staff_id`,`customer_id`,`customer_name`,`delegater`,`telephone`,`pickaddress`,`arrivecity`,`product`,`pickdate`,`num`,`weight`,`volume`,`remark`,`ordertype`,`user_id`) values ('40283a816ff57b36016ff57c29f50000',NULL,'4','赵六','赵六','18633333333','石家庄市桥西区和平路10号','','',NULL,NULL,NULL,'','','人工分单','1'),('40283a816ff57b36016ff57e63e80001','f1b65a666fb181fc016fb18ad6300000','5','小白','小白','18511111111','内蒙古自治区呼和浩特市和平路100号','','',NULL,NULL,NULL,'','','自动分单','1'),('40283a816ff58d0a016ff58e07260000','402809816fb0d425016fb0d7038f0000','1','张三','张三','13811111111','北京市西城区长安街100号','','',NULL,NULL,NULL,'','','自动分单','1'),('40283a816ff58d0a016ff58eacee0002','402809816fb0d425016fb0d7038f0000','1','张三','张三','13811111111','北京市西城区长安街100号','','',NULL,NULL,NULL,'','','自动分单','1'),('40283a816ffe5af0016ffe5c73050000','402809816fb0d425016fb0d7038f0000','4','赵六','赵六','18633333333','石家庄市桥西区和平路10号','','电脑','2020-03-05',1,NULL,'','','自动分单','1');

/*Table structure for table `qp_workbill` */

DROP TABLE IF EXISTS `qp_workbill`;

CREATE TABLE `qp_workbill` (
  `id` varchar(32) NOT NULL,
  `noticebill_id` varchar(32) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `pickstate` varchar(20) DEFAULT NULL,
  `buildtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attachbilltimes` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKggojlcovnpimuukxcueb18apt` (`noticebill_id`),
  KEY `FK55ckcnjyvwinnnniu5jpelg7y` (`staff_id`),
  CONSTRAINT `FK55ckcnjyvwinnnniu5jpelg7y` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FK_workbill_noticebill_fk` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`),
  CONSTRAINT `FKggojlcovnpimuukxcueb18apt` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_workbill` */

insert  into `qp_workbill`(`id`,`noticebill_id`,`type`,`pickstate`,`buildtime`,`attachbilltimes`,`remark`,`staff_id`) values ('40283a816ff57b36016ff57e64830002','40283a816ff57b36016ff57e63e80001','新单','未取件','2020-01-30 16:08:19',0,'','f1b65a666fb181fc016fb18ad6300000'),('40283a816ff58d0a016ff58e081e0001','40283a816ff58d0a016ff58e07260000','新单','未取件','2020-01-30 16:25:24',0,'','402809816fb0d425016fb0d7038f0000'),('40283a816ff58d0a016ff58ead830003','40283a816ff58d0a016ff58eacee0002','新单','未取件','2020-01-30 16:26:06',0,'','402809816fb0d425016fb0d7038f0000'),('40283a816ffe5af0016ffe5c73620001','40283a816ffe5af0016ffe5c73050000','新单','未取件','2020-02-01 09:27:49',0,'','402809816fb0d425016fb0d7038f0000');

/*Table structure for table `qp_workordermanage` */

DROP TABLE IF EXISTS `qp_workordermanage`;

CREATE TABLE `qp_workordermanage` (
  `id` varchar(32) NOT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `floadreqr` varchar(255) DEFAULT NULL,
  `prodtimelimit` varchar(40) DEFAULT NULL,
  `prodtype` varchar(40) DEFAULT NULL,
  `sendername` varchar(20) DEFAULT NULL,
  `senderphone` varchar(20) DEFAULT NULL,
  `senderaddr` varchar(200) DEFAULT NULL,
  `receivername` varchar(20) DEFAULT NULL,
  `receiverphone` varchar(20) DEFAULT NULL,
  `receiveraddr` varchar(200) DEFAULT NULL,
  `feeitemnum` int(11) DEFAULT NULL,
  `actlweit` double DEFAULT NULL,
  `vol` varchar(20) DEFAULT NULL,
  `managerCheck` varchar(1) DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_workordermanage` */

insert  into `qp_workordermanage`(`id`,`arrivecity`,`product`,`num`,`weight`,`floadreqr`,`prodtimelimit`,`prodtype`,`sendername`,`senderphone`,`senderaddr`,`receivername`,`receiverphone`,`receiveraddr`,`feeitemnum`,`actlweit`,`vol`,`managerCheck`,`updatetime`) values ('1','山东','苹果',4,10,'无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `role_function` */

DROP TABLE IF EXISTS `role_function`;

CREATE TABLE `role_function` (
  `role_id` varchar(32) NOT NULL,
  `function_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`function_id`),
  KEY `FK5f8riddotqjpm9vly0b8c5nmf` (`function_id`),
  CONSTRAINT `FK10qo908yd9evkyb40vf88og85` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FK5f8riddotqjpm9vly0b8c5nmf` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_2x` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_3x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_function` */

insert  into `role_function`(`role_id`,`function_id`) values ('40283a8170053e2d017005412b030000','11'),('40283a8170053e2d017005420b180001','11'),('40283a8170053e2d01700542abd10002','11'),('40283a8170053e2d017005412b030000','112'),('40283a8170053e2d017005420b180001','112'),('40283a8170053e2d01700542abd10002','112'),('40283a8170053e2d017005412b030000','113'),('40283a8170053e2d017005420b180001','113'),('40283a8170053e2d01700542abd10002','113'),('40283a8170053e2d017005412b030000','114'),('40283a8170053e2d017005420b180001','114'),('40283a8170053e2d01700542abd10002','114'),('40283a8170053e2d017005412b030000','115'),('40283a8170053e2d017005420b180001','115'),('40283a8170053e2d01700542abd10002','115'),('40283a8170053e2d017005412b030000','116'),('40283a8170053e2d017005420b180001','116'),('40283a8170053e2d01700542abd10002','116'),('40283a8170053e2d017005412b030000','12'),('40283a8170053e2d017005420b180001','12'),('40283a8170053e2d017005412b030000','121'),('40283a8170053e2d017005420b180001','121'),('40283a8170053e2d017005412b030000','122'),('40283a8170053e2d017005420b180001','122'),('40283a8170053e2d017005412b030000','124'),('40283a8170053e2d017005420b180001','124'),('40283a8170053e2d017005412b030000','13'),('40283a8170053e2d017005412b030000','131'),('40283a8170053e2d017005412b030000','132'),('40283a8170053e2d017005412b030000','14'),('40283a8170053e2d01700543480d0003','14'),('40283a8170053e2d017005412b030000','141'),('40283a8170053e2d01700543480d0003','141'),('40283a8170053e2d017005412b030000','142'),('40283a8170053e2d01700543480d0003','142'),('40283a8170053e2d017005412b030000','143'),('40283a8170053e2d01700543480d0003','143'),('40283a8170053e2d017005412b030000','40283a816fffedb3016ffffb7cff0000'),('40283a8170053e2d017005420b180001','40283a816fffedb3016ffffb7cff0000'),('40283a8170053e2d01700542abd10002','40283a816fffedb3016ffffb7cff0000'),('40283a8170053e2d017005412b030000','40283a817004d8c2017004dd45e00000'),('40283a8170053e2d017005420b180001','40283a817004d8c2017004dd45e00000'),('40283a8170053e2d01700542abd10002','40283a817004d8c2017004dd45e00000'),('40283a8170053e2d017005412b030000','8a7e843355a4392d0155a43aa7150000'),('40283a8170053e2d017005420b180001','8a7e843355a4392d0155a43aa7150000'),('40283a8170053e2d01700542abd10002','8a7e843355a4392d0155a43aa7150000');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salary` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`salary`,`birthday`,`gender`,`station`,`telephone`,`remark`) values ('1','zhangsan','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL),('40283a8170053e2d01700544630b0004','lisi','e10adc3949ba59abbe56e057f20f883e',5000,'2019-01-07','男','总公司','13444444444',NULL),('40283a8170053e2d01700544d1340005','wangwu','e10adc3949ba59abbe56e057f20f883e',5000,'2016-02-08','女','基地运转中心','19900000000',NULL);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKqqlqhas35obkljn18mrh6mmms` (`role_id`),
  CONSTRAINT `FK_Reference_4x` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_5x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FKeqon9sx5vssprq67dxm3s7ump` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKqqlqhas35obkljn18mrh6mmms` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values ('40283a8170053e2d01700544630b0004','40283a8170053e2d017005420b180001'),('40283a8170053e2d01700544d1340005','40283a8170053e2d01700542abd10002'),('40283a8170053e2d01700544d1340005','40283a8170053e2d01700543480d0003');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
