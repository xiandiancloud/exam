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

drop table if exists t_school_user;
create table t_school_user
(
  id        int not null AUTO_INCREMENT,
  userId    int(20) not null,
  schoolId  int(20) not null,
  primary key (id),
  CONSTRAINT receivet_school_user_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
  CONSTRAINT receivet_school_user_ibfk_2 FOREIGN KEY (schoolId) REFERENCES auth_school (id) ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*实验课程定义分类*/
drop table if exists t_coursecategory;
create table t_coursecategory
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   describle           varchar(255) default null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷定义分类*/
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
   CONSTRAINT receivet_competion_school_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE,
   CONSTRAINT receivet_competion_school_2 FOREIGN KEY (schoolId) REFERENCES auth_school (id) ON DELETE CASCADE
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
   CONSTRAINT receivet_user_competion_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_competion_2 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*实验课程定义*/
drop table if exists t_course;
create table t_course
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
   primary key (id)
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
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*竞赛下的试卷定义*/
drop table if exists t_competion_exam;
create table t_competion_exam
(
   id                  int not null AUTO_INCREMENT,
   competionId         int(10) not null,
   examId              int(10) not null,
   selectexam          int(10) defautl 0,
   selecttime          varchar(255) default null,
   primary key (id),
   CONSTRAINT receivet_competion_exam_1 FOREIGN KEY (competionId) REFERENCES t_competion (id) ON DELETE CASCADE,
   CONSTRAINT receivet_competion_exam_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*课程属于分类定义*/
drop table if exists course_category;
create table course_category
(
   id                  int not null AUTO_INCREMENT,
   courseId            int(10) not null,
   categoryId          int(10) not null,
   primary key (id),
   UNIQUE KEY (courseId),
   CONSTRAINT receivecourse_category_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receivecourse_category_ibfk_2 FOREIGN KEY (categoryId) REFERENCES t_coursecategory (id) ON DELETE CASCADE
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

/*实验章节定义*/
drop table if exists t_chapter;
create table t_chapter
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   courseId            int(10) not null,
   primary key (id),  
   CONSTRAINT receivet_chapter_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷章节定义*/
drop table if exists t_echapter;
create table t_echapter
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   examId              int(10) not null,
   primary key (id),  
   CONSTRAINT receivet_echapter_ibfk_1 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*课程小节定义*/
drop table if exists t_sequential;
create table t_sequential
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   chapterId           int(10) not null,
   primary key (id),   
   CONSTRAINT receivet_sequential_ibfk_1 FOREIGN KEY (chapterId) REFERENCES t_chapter (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷小节定义*/
drop table if exists t_esequential;
create table t_esequential
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   echapterId          int(10) not null,
   primary key (id),   
   CONSTRAINT receivet_esequential_ibfk_1 FOREIGN KEY (echapterId) REFERENCES t_echapter (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*实验单元定义*/
drop table if exists t_vertical;
create table t_vertical
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   sequentialId        int(10) not null,
   primary key (id),
   CONSTRAINT receivet_vertical_ibfk_1 FOREIGN KEY (sequentialId) REFERENCES t_sequential (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷单元定义*/
drop table if exists t_evertical;
create table t_evertical
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   esequentialId        int(10) not null,
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
   conContent          text not null,
   conShell            varchar(255) default null,
   conAnswer           varchar(3000) default null,
   score               int(10) not null,
   scoretag            varchar(255) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*试卷问题定义*/
drop table if exists t_question;
create table t_question
(
   id                  int not null AUTO_INCREMENT,
   content             varchar(3000) not null,
   lowcontent          varchar(3000) default null,
   primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*课程下的实验定义*/
drop table if exists vertical_train;
create table vertical_train
(
   id                  int not null AUTO_INCREMENT,
   courseId            int(10) not null,
   verticalId          int(10) not null,
   trainId             int(10) not null,
   primary key (id),
   UNIQUE KEY (courseId,trainId),
   CONSTRAINT receivevertical_train_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receivevertical_train_ibfk_2 FOREIGN KEY (verticalId) REFERENCES t_vertical (id) ON DELETE CASCADE,
   CONSTRAINT receivevertical_train_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
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

/*用户实训的对应关系*/
drop table if exists user_train;
create table user_train
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   counts              int(10) default 0,
   revalue             varchar(3000) default null,
   result              varchar(255) default null,
   primary key (id),
   UNIQUE KEY (courseId,trainId),
   CONSTRAINT receiveuser_train_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id),
   CONSTRAINT receiveuser_train_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
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
   CONSTRAINT receivet_user_question_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_ibfk_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_ibfk_4 FOREIGN KEY (questionId) REFERENCES t_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统下问题跟子问题的对应关系*/
drop table if exists t_user_questionchild;
create table t_user_questionchild
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   number              int(10) not null,
   userquestionId      int(10) not null,
   useranswer          text default null,
   revalue             text default null,
   result              varchar(255) default null,
   pfscore             int(10) not null,
   primary key (id),
   CONSTRAINT receivet_user_questionchild_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_questionchild_ibfk_2 FOREIGN KEY (userquestionId) REFERENCES t_user_question (id) ON DELETE CASCADE
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
   CONSTRAINT receivet_user_question_history_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_history_ibfk_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_history_3 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_question_history_4 FOREIGN KEY (questionId) REFERENCES t_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*考试系统下问题跟子问题的对应关系的历史记录*/
drop table if exists t_user_questionchild_history;
create table t_user_questionchild_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   number              int(10) not null,
   userquestionId      int(10) not null,
   useranswer          text default null,
   revalue             text default null,
   result              varchar(255) default null,
   pfscore             int(10) not null,
   primary key (id),
   CONSTRAINT receivet_user_questionchild_history_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_questionchild_history_ibfk_2 FOREIGN KEY (userquestionId) REFERENCES t_user_question (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_user_course;
create table t_user_course
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   state               int(10) default 0,
   activestate         int(10) default 0,
   usetime             varchar(255) default 0,
   docounts            int(10) default 1,
   primary key (id),
   UNIQUE KEY (userId,courseId),
   CONSTRAINT receivet_user_course_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_course_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*老师相关课程定义*/
drop table if exists teacher_course;
create table teacher_course
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   primary key (id),
   UNIQUE KEY (userId,courseId),
   CONSTRAINT receiveteacher_course_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveteacher_course_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
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
   CONSTRAINT receivet_teacher_exam_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_teacher_exam_ibfk_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
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
   CONSTRAINT receivet_user_exam_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_exam_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
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
   docounts            int(10) default 1,
   primary key (id),
   UNIQUE KEY (userId,examId,docounts),
   CONSTRAINT receivet_user_exam_history_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_exam_history_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_train_history;
create table user_train_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   counts              int(10) default 0,
   revalue             varchar(3000) default null,
   result              varchar(255) default null,
   docounts            int(10) not null,
   usetime             varchar(255) default 0,
   primary key (id),
   UNIQUE KEY (courseId,trainId,docounts),
   CONSTRAINT receiveuser_train_history_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_history_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id),
   CONSTRAINT receiveuser_train_history_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_environment;
create table t_environment
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*用户实训课程对应的环境模块*/
drop table if exists user_course_environment;
create table user_course_environment
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   name                varchar(255) not null,  
   createtime          varchar(255) not null, 
   hostname            varchar(255) default null,
   username            varchar(255) default null,
   password            varchar(255) default null,
   serverId            varchar(255) default null,
   primary key (id),
   CONSTRAINT receiveuser_course_environment_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_course_environment_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_course_environment_ibfk_3 FOREIGN KEY (name) REFERENCES t_environment (name) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*用户考试系统对应的环境模块*/
drop table if exists t_exam_environment;
create table t_exam_environment
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   examId              int(10) not null,
   name                varchar(255) not null,  
   createtime          varchar(255) not null, 
   hostname            varchar(255) default null,
   username            varchar(255) default null,
   password            varchar(255) default null,
   serverId            varchar(255) default null,
   primary key (id),
   CONSTRAINT receivet_exam_environment_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_environment_ibfk_2 FOREIGN KEY (examId) REFERENCES t_exam (id) ON DELETE CASCADE,
   CONSTRAINT receivet_exam_environment_ibfk_3 FOREIGN KEY (name) REFERENCES t_environment (name) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
