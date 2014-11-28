package com.dhl.cons;

/**
 *整个应用通用的常量 
 *<br><b>类描述:</b>
 *<pre>|</pre>
 *@see
 *@since
 */
public class CommonConstant
{	
   /**
    * 用户对象放到Session中的键名称
    */
   public static final String USER_CONTEXT = "USER_CONTEXT";
   
   public static final String USER_ROLE = "USER_ROLE";
   
   public static final String USER_GROUP = "USER_GROUP";
   
   /**
    * 将登录前的URL放到Session中的键名称
    */
   public static final String LOGIN_TO_URL = "toUrl";
   public static final String CMS_LOGIN_TO_URL = "tocUrl";
   public static final String ADMIN_LOGIN_TO_URL = "toaUrl";
   /**
    * 每页的记录数
    */
   //public static final int PAGE_SIZE = 10;
   public static final int SYS_PAGE_SIZE = 6;
   public static final int EXAMLIST_PAGE_SIZE = 15;
   //系统4种角色
   public static final String ROLE_S = "学生";
   public static final String ROLE_T = "老师";
   public static final String ROLE_C = "裁判";
   public static final String ROLE_A = "管理员";
   //考试系统对应的问题的6种类型————>1:html问题描述 2：单选 3：多选 4：填空 5：多文本填空6：实训
   public static final int QTYPE_1 = 1;
   public static final int QTYPE_2 = 2;
   public static final int QTYPE_3 = 3;
   public static final int QTYPE_4 = 4;
   public static final int QTYPE_5 = 5;
   public static final int QTYPE_6 = 6;
   //竞赛对应的4种角色关系-------角色对应的所有的都是老师
   //public static final String CROLE_1 = "创建者";
   public static final String CROLE_2 = "主裁判";
   public static final String CROLE_3 = "命题裁判";
   public static final String CROLE_4 = "判分裁判";
   public static final String CROLE_5 = "考生";
   //
   public static final String STRING_0 = "评分当中";
   public static final String STRING_1 = "评分完毕";
   //错误提示
   public static final String ERROR_0 = "后台异常，请联系系统管理员";
   public static final String ERROR_1 = "学校已经存在";
   public static final String ERROR_2 = "保存成功";
   public static final String ERROR_3 = "分类已经存在";
   public static final String ERROR_4 = "实验已经存在";
   public static final String ERROR_5 = "竞赛还没有选卷";
   public static final String ERROR_6 = "竞赛还没有开始";
   public static final String ERROR_7 = "用户没有答题，不允许修改评分";
   //课程级别
   public static final String LEVEL_1 = "初级";
   public static final String LEVEL_2 = "中级";
   public static final String LEVEL_3 = "高级";
   
   //是否是单点登录  默认0的话不是单点登录
   public static final int SSO_NO = 0;
   public static final int SSO_CAS = 1;
   
   //日志信息记录
   public static final String LOG_1 = "提交答案：";
   public static final String LOG_2 = "提交试卷：";
   public static final String LOG_3 = "修改判分：";
   public static final String LOG_4 = "结束判分：";
   public static final String LOG_5 = "更新答案：";
}
