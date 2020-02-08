`dept`/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/1/16 9:54:41                            */
/*==============================================================*/


DROP TABLE IF EXISTS bc_decidedzone;

DROP TABLE IF EXISTS bc_region;

DROP TABLE IF EXISTS bc_staff;

DROP TABLE IF EXISTS bc_subarea;

/*==============================================================*/
/* Table: bc_decidedzone                                        */
/*==============================================================*/
CREATE TABLE bc_decidedzone
(
   id                   VARCHAR(32) NOT NULL,
   NAME                 VARCHAR(30),
   staff_id             VARCHAR(32),
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: bc_region                                             */
/*==============================================================*/
create table bc_region
(
   id                   varchar(32) not null,
   province             varchar(50),
   city                 varchar(50),
   district             varchar(50),
   postcode             varchar(50),
   shortcode            varchar(30),
   citycode             varchar(30),
   primary key (id)
);

/*==============================================================*/
/* Table: bc_staff                                              */
/*==============================================================*/
create table bc_staff
(
   id                   varchar(32) not null,
   name                 varchar(20),
   telephone            varchar(20),
   haspda               char(1),
   deltag               char(1),
   station              varchar(40),
   standard             varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: bc_subarea                                            */
/*==============================================================*/
create table bc_subarea
(
   id                   varchar(32) not null,
   decidedzone_id       varchar(32),
   region_id            varchar(32),
   addresskey           varchar(100),
   startnum             varchar(30),
   endnum               varchar(30),
   single               char(1),
   position             varchar(255),
   primary key (id)
);

alter table bc_decidedzone add constraint FK_decidedzone_staff foreign key (staff_id)
      references bc_staff (id) on delete restrict on update restrict;

alter table bc_subarea add constraint FK_area_decidedzone foreign key (decidedzone_id)
      references bc_decidedzone (id) on delete restrict on update restrict;

alter table bc_subarea add constraint FK_area_region foreign key (region_id)
      references bc_region (id) on delete restrict on update restrict;

