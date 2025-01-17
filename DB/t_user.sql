/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/1/16 23:25:00                           */
/*==============================================================*/


drop table if exists t_user;

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   varchar(32) not null,
   username             varchar(20) not null,
   password             varchar(32) not null,
   salary               double,
   birthday             date,
   gender               varchar(10),
   station              varchar(40),
   telephone            varchar(11),
   remark               varchar(255),
   primary key (id)
);

