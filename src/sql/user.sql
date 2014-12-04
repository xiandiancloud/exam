/*==============================================================*/
/* 用户相关信息                          */
/*==============================================================*/
drop database if exists xduser;
create database xduser character set utf8;
use xduser;

drop table if exists `auth_school`;
CREATE TABLE `auth_school` (
  `id` int(10) NOT NULL auto_increment,
  `school_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `auth_userprofile`;
CREATE TABLE `auth_userprofile` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `meta` longtext NOT NULL,
  `courseware` varchar(255) NOT NULL,
  `gender` varchar(6) default NULL,
  `mailing_address` longtext,
  `year_of_birth` int(11) default NULL,
  `level_of_education` varchar(6) default NULL,
  `goals` longtext,
  `allow_certificate` tinyint(1) NOT NULL,
  `country` varchar(2) default NULL,
  `city` longtext,
  `school_name` varchar(255) default NULL,
  `major` varchar(255) default NULL,
  `class_name` varchar(255) default NULL,
  `admission_time` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_52094d6e` (`name`),
  KEY `auth_userprofile_8a7ac9ab` (`language`),
  KEY `auth_userprofile_b54954de` (`location`),
  KEY `auth_userprofile_fca3d292` (`gender`),
  KEY `auth_userprofile_d85587` (`year_of_birth`),
  KEY `auth_userprofile_551e365c` (`level_of_education`),
  CONSTRAINT receiveauth_userprofile_1 FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_role;
create table t_role
(
 id          int not null AUTO_INCREMENT,
 roleName    char(100) not null,
 roleDesc    varchar(255) default null,
 primary key (id),
 UNIQUE KEY (roleName)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_roleuser;
create table t_roleuser
(
  id        int not null AUTO_INCREMENT,
  userId    int(20) not null,
  roleId    int(20) not null,
  primary key (id),
  CONSTRAINT receivet_roleuser_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
  CONSTRAINT receivet_roleuser_ibfk_2 FOREIGN KEY (roleId) REFERENCES t_role (id) ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;