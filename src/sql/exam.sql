drop database if exists exam;
create database exam character set utf8;
use exam;

/*试卷分类*/
drop table if exists t_examcategory;
create table t_examcategory
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   describle           varchar(255) default null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*竞赛定义*/
drop table if exists t_competion;
create table t_competion
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   describle           varchar(1000) default null,   
   imgpath             varchar(255) default null,
   starttime           varchar(255) not null,
   endtime             varchar(255) not null,
   wstarttime          varchar(255) not null,
   wendtime            varchar(255) not null,
   examstarttime       varchar(255) not null,
   examendtime         varchar(255) not null,
   type                varchar(255) not null,
   score               varchar(255) not null,
   passscore           varchar(255) not null,
   isstart             int(10) default 0,
   rank                varchar(255) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*竞赛的举办方定义*/
drop table if exists t_competion_school;
create table t_competion_school
(
   id                  int not null AUTO_INCREMENT,
   competionId         int(10) not null,
   schoolId            int(10) not null,
   primary key (id),
   CONSTRAINT receivet_competion_school_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*用户竞赛的对应关系定义*/
drop table if exists t_user_competion;
create table t_user_competion
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   competionId         int(10) not null,
   job                 varchar(255) not null,
   primary key (id),
   CONSTRAINT receivet_user_competion_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷定义*/
drop table if exists t_exam;
create table t_exam
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   imgpath             varchar(255) default null,
   describle           varchar(255) default null, 
   publish             int(10) default 0,
   starttime           varchar(255) default null,
   starttimedetail     varchar(255) default null,
   endtimedetail       varchar(255) default null,
   org                 varchar(255) default null,
   coursecode          varchar(255) default null,
   rank                varchar(255) default null,
   lockexam            int(10) default 0,
   isnormal            int(10) default 0,
   isgroom           int(10) default 0,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*竞赛下的试卷定义*/
drop table if exists t_competion_exam;
create table t_competion_exam
(
   id                  int not null AUTO_INCREMENT,
   competionId         int(10) not null,
   examId              int(10) not null,
   selectexam          int(10) default 0,
   selecttime          varchar(255) default null,
   primary key (id),
   CONSTRAINT receivet_competion_exam_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE,
   CONSTRAINT receivet_competion_exam_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷属于分类定义*/
drop table if exists t_exam_category;
create table t_exam_category
(
   id                  int not null AUTO_INCREMENT,
   examId              int(10) not null,
   ecategoryId         int(10) not null,
   primary key (id),
   UNIQUE KEY (examId),
   CONSTRAINT receivet_exam_category_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_category_ibfk_2 FOREIGN KEY (ecategoryId) REFERENCES t_examcategory (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*竞赛属于分类定义*/
drop table if exists t_competion_category;
create table t_competion_category
(
   id                  int not null AUTO_INCREMENT,
   competionId         int(10) not null,
   ecategoryId         int(10) not null,
   primary key (id),
   CONSTRAINT receivet_competion_category_ibfk_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE,
   CONSTRAINT receivet_competion_category_2 FOREIGN KEY (ecategoryId) REFERENCES t_examcategory (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷章节定义*/
drop table if exists t_echapter;
create table t_echapter
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   examId              int(10) not null,
   sortnumber          int(10) default 10000,
   primary key (id),  
   CONSTRAINT receivet_echapter_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷小节定义*/
drop table if exists t_esequential;
create table t_esequential
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   echapterId          int(10) not null,
   sortnumber          int(10) default 10000,
   primary key (id),   
   CONSTRAINT receivet_esequential_ibfk_1 FOREIGN KEY (echapterId) REFERENCES t_echapter (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷单元定义*/
drop table if exists t_evertical;
create table t_evertical
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   esequentialId       int(10) not null,
   sortnumber          int(10) default 10000,
   primary key (id),
   CONSTRAINT receivet_evertical_ibfk_1 FOREIGN KEY (esequentialId) REFERENCES t_esequential (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*课程实验定义*/
drop table if exists t_train;
create table t_train
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,
   codenum             varchar(255) not null,
   envname             varchar(255) not null,    
   conContent          longtext not null,
   /*conShell            varchar(255) default null,*/
   conAnswer           longtext default null,
   score               int(10) not null,
   scoretag            varchar(1000) default null,
   iscreate            int(10) default 0,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*课程实验的扩展部分*/
drop table if exists t_train_ext;
create table t_train_ext
(
   id                  int not null AUTO_INCREMENT,
   trainId             int(10) not null,
   shellpath           varchar(255) default null,
   shellname           varchar(255) default null,
   shellparameter      varchar(255) default null,
   devinfo             varchar(255) default null,   
   primary key (id),
   CONSTRAINT receivet_train_ext_1 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷问题定义*/
drop table if exists t_question;
create table t_question
(
   id                  int not null AUTO_INCREMENT,
   content             longtext not null,
   lowcontent          longtext default null,
   type                int(10) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷下的问题定义*/
drop table if exists t_exam_question;
create table t_exam_question
(
   id                  int not null AUTO_INCREMENT,
   examId              int(10) not null,
   everticalId         int(10) not null,
   questionId          int(10) default null,
   trainId             int(10) default null,
   primary key (id),
   CONSTRAINT receivet_exam_question_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_question_2 FOREIGN KEY (everticalId) REFERENCES t_evertical (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_question_3 FOREIGN KEY (questionId) REFERENCES t_question (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_question_4 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统下问题，实训的对应关系*/
drop table if exists t_user_question;
create table t_user_question
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   trainId             int(10) default null,
   questionId          int(10) default null,
   counts              int(10) default 0,
   primary key (id),
   CONSTRAINT receivet_user_question_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_ibfk_2 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_ibfk_3 FOREIGN KEY (questionId) REFERENCES t_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统下问题跟子问题的对应关系*/
drop table if exists t_user_questionchild;
create table t_user_questionchild
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   number              int(10) not null,
   userquestionId      int(10) not null,
   useranswer          longtext default null,
   revalue             longtext default null,
   result              varchar(255) default null,
   pfscore             int(10) default null,
   devinfo             varchar(255) default null,
   primary key (id),
   CONSTRAINT receivet_user_questionchild_ibfk_1 FOREIGN KEY (userquestionId) REFERENCES t_user_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/*考试系统下问题，实训的对应关系的历史记录*/
drop table if exists t_user_question_history;
create table t_user_question_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   trainId             int(10) default null,
   questionId          int(10) default null,
   counts              int(10) default 0,
   docounts            int(10) not null,
   primary key (id),
   CONSTRAINT receivet_user_question_history_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_history_2 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_history_3 FOREIGN KEY (questionId) REFERENCES t_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统下问题跟子问题的对应关系的历史记录*/
drop table if exists t_user_questionchild_history;
create table t_user_questionchild_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   number              int(10) not null,
   userquestionId      int(10) not null,
   useranswer          longtext default null,
   revalue             longtext default null,
   result              varchar(255) default null,
   pfscore             int(10) default null,
   primary key (id),
   CONSTRAINT receivet_user_questionchild_history_ibfk_1 FOREIGN KEY (userquestionId) REFERENCES t_user_question_history (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*老师相关试卷定义*/
drop table if exists t_teacher_exam;
create table t_teacher_exam
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   primary key (id),
   UNIQUE KEY (userId,examId),
   CONSTRAINT receivet_teacher_exam_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*学生（用户）相关试卷定义*/
drop table if exists t_user_exam;
create table t_user_exam
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   state               int(10) default 0,
   fipf                int(10) default 0,
   activestate         int(10) default 0,
   usetime             varchar(255) default 0,
   docounts            int(10) default 1,
   primary key (id),
   UNIQUE KEY (userId,examId),
   CONSTRAINT receivet_user_exam_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*学生（用户）相关试卷定义的历史记录*/
drop table if exists t_user_exam_history;
create table t_user_exam_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   state               int(10) default 0,
   activestate         int(10) default 0,
   usetime             varchar(255) default 0,
   againdotime         varchar(255) not null,
   docounts            int(10) default 1,
   primary key (id),
   UNIQUE KEY (userId,examId,docounts),
   CONSTRAINT receivet_user_exam_history_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*环境模板*/
drop table if exists t_environment;
create table t_environment
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   value               varchar(255) not null,
   type                varchar(255) not null,
   describle           varchar(255) not null,
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*脚本参数模板*/
drop table if exists t_exam_shellenvironment;
create table t_exam_shellenvironment
(
   id                  int not null AUTO_INCREMENT,
   examId              int(10) not null,
   name                varchar(255) not null, 
   value               varchar(255) not null,
   primary key (id),
   UNIQUE KEY (name),
   CONSTRAINT receivet_exam_shellenvironment_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统对应的用户动态模板对应的运行环境*/
drop table if exists t_user_environment;
create table t_user_environment
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   name                varchar(255) not null,  
   hostname            varchar(255) default null,
   username            varchar(255) default null,
   password            varchar(255) default null,
   primary key (id),
   UNIQUE KEY (userId,examId,name),
   CONSTRAINT receivet_user_environment_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_cloud;
create table t_cloud
(
   id                int not null AUTO_INCREMENT,
   ip                varchar(255) not null,
   userId            int(10) not null,
   name              varchar(255) not null,
   password          varchar(255) not null,
   primary key (id),
   UNIQUE KEY (ip,userId)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_user_cloud;
create table t_user_cloud
(
   id                int not null AUTO_INCREMENT,
   userId            int(10) not null,
   cloudId           int(10) not null,
   primary key (id),
   UNIQUE KEY (userId),
   CONSTRAINT receivet_user_clound_1 FOREIGN KEY (cloudId) REFERENCES t_cloud (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_log;
create table t_log
(
   id                int not null AUTO_INCREMENT,
   username          varchar(255) default null,
   useraction        varchar(255) default null,
   dotime            varchar(255) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_action;
create table t_action
(
   id                int not null AUTO_INCREMENT,
   actionname        varchar(255) default null,
   actiondesc        varchar(255) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_actionuser;
create table t_actionuser
(
  id        int not null AUTO_INCREMENT,
  userId    int(20) not null,
  actionId    int(20) not null,
  primary key (id),
  UNIQUE KEY (userId,actionId),
  CONSTRAINT receivet_actionuser_ibfk_1 FOREIGN KEY (actionId) REFERENCES t_action (id) ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into t_examcategory values ('1', '国赛', '国赛');
insert into t_action values ('1', '首页', '首页');
insert into t_action values ('2', '题库', '题库');
insert into t_action values ('3', '竞赛', '竞赛');
insert into t_action values ('4', '我的云试卷', '我的云试卷');

INSERT INTO `t_environment` VALUES ('1', 'iaas.host.controller.ip', '', 'IP', '云平台');
INSERT INTO `t_environment` VALUES ('2', 'pass.host.compute.dynamic', '', 'IP', '你自己的虚拟机');
INSERT INTO `t_environment` VALUES ('3', 'paas.rhc.compute.dynamic', '', 'IP', '你自己的虚拟机');
INSERT INTO `t_environment` VALUES ('4', 'iaas.host.compute.ip', '192.168.20.60', 'IP', '计算节点IP');
INSERT INTO `t_environment` VALUES ('5', 'iaas.host.compute.username', 'root', 'string', '计算节点登录用户名');
INSERT INTO `t_environment` VALUES ('6', 'iaas.host.compute.password', '000000', 'string', '计算节点登录密码');
