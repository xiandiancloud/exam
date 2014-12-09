package com.dhl.lms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Cloud;
import com.dhl.domain.Competion;
import com.dhl.domain.Environment;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.domain.UserEnvironment;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserQuestionChild;
import com.dhl.service.CompetionService;
import com.dhl.service.EnvironmentService;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamService;
import com.dhl.service.TrainService;
import com.dhl.service.UserCloudService;
import com.dhl.service.UserEnvironmentService;
import com.dhl.service.UserExamHistoryService;
import com.dhl.service.UserExamService;
import com.dhl.service.UserQuestionService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;
import com.xiandian.model.User;

/**
 * 开始考试使用
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class HavingExamController extends BaseController {

	@Autowired
	private UserExamService userExamService;
	@Autowired
	private UserExamHistoryService userExamHistoryService;
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamQuestionService examquestionService;
	@Autowired
	private UserQuestionService userQuestionService;
//	@Autowired
//	private UserExamEnvironmentService userExamEnvironmentService;
	@Autowired
	private UserEnvironmentService userEnvironmentService;
	@Autowired
	private CompetionService competionService;
	@Autowired
	private UserCloudService userCloudService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private EnvironmentService environmentService;
	
	//判断是否有权限去考试
	private boolean isHaving(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			//如果是竞赛试卷，需要判断是否考生在这个竞赛内
		}
		return true;
	}
	
	//判断是否有权限去判分
	private boolean isHavingPf(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			
		}
		return false;
	}
	
//	private List<QuestionData> changetohtml(String content,int id)
//	{
//		return ParseQuestion.changetohtml(content,id);
//	}
	
	/**
	 * 跳转到考试错误页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamerror")
	public ModelAndView toexamerror(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/error");
		return view;
	}
	
	/**
	 * 跳转到学生考试试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtostartexam")
	public ModelAndView toexamingtostartexam(HttpServletRequest request,int competionId,int examId) {
		if (!isstart(competionId))
		{
			String url = "redirect:/lms/toexamerror.action";
			return new ModelAndView(url);
		}
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//学生分析情况，试卷页面如果性能有问题，要拆分出来
		User user = getSessionUser(request);
		List clist = userExamService.getUserExamCount(user.getId(), exam,-1);
		
		userExamService.setMyExamActiveState(user.getId());
		UserExam ucs = userExamService
				.getUserExam(user.getId(), examId);
		if (ucs == null) {
			UserExam uc = new UserExam();
			uc.setUserId(user.getId());
			uc.setExam(examService.get(examId));
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			uc.setUsetime("0");
			userExamService.save(uc);
			ucs = uc;
		} else {
			ucs.setActivestate(1);
			userExamService.updateUserExam(ucs);
		}
		view.addObject("score",clist.get(0));
		view.addObject("uedlist",clist.get(1));
		view.addObject("userexam",ucs);
		view.addObject("exam", exam);
		view.addObject("competionId",competionId);
		view.setViewName("/lms/exam");
		return view;
	}

	
	/**
	 * 跳转到学生考试的历史记录试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtohistoryexam")
	public ModelAndView toexamingtohistoryexam(HttpServletRequest request,int examId,int docounts) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		User user = getSessionUser(request);
		List clist = userExamService.getUserExamCount(user.getId(), exam,docounts);
		view.addObject("score",clist.get(0));
		view.addObject("uedlist",clist.get(1));
//		userExamService.setMyExamActiveState(user.getId());
//		UserExamHistory ucs = userExamHistoryService
//				.getUserExam(user.getId(), examId);
//		view.addObject("userexam",ucs);
		view.addObject("docounts",docounts);
		view.addObject("exam", exam);
		
		view.setViewName("/lms/examhistory");
		return view;
	}
	
	/**
	 * 跳转到老师判分试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtopfexam")
	public ModelAndView toexamingtopfexam(HttpServletRequest request,int competionId,int examId,int userId) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//统计信息
		List clist = userExamService.getUserExamCount(userId, exam,-1);
		view.addObject("score",clist.get(0));
		view.addObject("uedlist",clist.get(1));
		
		view.addObject("competionId",competionId);
		view.addObject("exam", exam);
		view.addObject("userId", userId);
		view.setViewName("/lms/pfexam");
		return view;
	}
	/**
	 * 得到用户提交的答案
	 */
	@RequestMapping("/getQuestionAnswer")
	public void getQuestionAnswer(HttpServletRequest request,
			HttpServletResponse response, int examId,int questionId,int number,int index) {
		try {
			
			User user = getSessionUser(request);
			UserQuestionChild uqc = userQuestionService.getQuestionChild(user.getId(),examId,questionId, number);
			String str = "{'sucess':'sucess','index':'"+index+"'}";
			if (uqc != null)
			{
				String useranswer = uqc.getUseranswer();
				useranswer = UtilTools.replaceBackett(useranswer);
				str = "{'sucess':'sucess','answer':'"+useranswer+"','index':'"+index+"'}";
			}
			
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 得到用户历史提交的答案
	 */
	@RequestMapping("/getQuestionHistoryAnswer")
	public void getQuestionHistoryAnswer(HttpServletRequest request,
			HttpServletResponse response, int type,int examId,int questionId,int number,int index,int docounts) {
		try {
			
			User user = getSessionUser(request);
//			UserQuestionChild uqc = userQuestionService.getQuestionChild(user.getId(),examId,questionId, number);
			String useranswer = userExamService.getUserExamOneCount(type, user.getId(), examId, questionId, number, docounts);
			String str = "{'sucess':'sucess','index':'"+index+"'}";
			if (useranswer != null)
			{
//				String useranswer = uqc.getUseranswer();
				useranswer = UtilTools.replaceBackett(useranswer);
				str = "{'sucess':'sucess','answer':'"+useranswer+"','index':'"+index+"'}";
			}
			
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	/**
//	 * 评分裁判得到用户提交的答案
//	 */
//	@RequestMapping("/getUserQuestionAnswer")
//	public void getUserQuestionAnswer(HttpServletRequest request,
//			HttpServletResponse response,int qdtype, int examId,int questionId,int number,int index,int userId) {
//		try {
//			UserQuestion uq;
//			if (qdtype == CommonConstant.QTYPE_6)
//			{
//				uq = userQuestionService.getUserExamTrainQuestion(userId, examId, questionId);
//			}
//			else
//			{
//				uq = userQuestionService.getQuestion(userId, examId, questionId);
//			}
//			String revalue="";
//			String str = "{'sucess':'sucess','answer':' ','index':'"+index+"','pfscore':'0','revalue':' '}";
//			String score = "0";
//			if (uq != null)
//			{
//				UserQuestionChild uqc = userQuestionService.getQuestionChild(uq,userId,number);
//				if (uqc != null)
//				{
//					String useranswer = uqc.getUseranswer();
//					//实训机器返回值
//					revalue = uqc.getRevalue();
//					score = UtilTools.getScore(uq, uqc, number);
//					str = "{'sucess':'sucess','answer':'"+useranswer+"','index':'"+index+"','pfscore':'"+score+"','revalue':'"+revalue+"'}";
//				}
//			}
//			PrintWriter out = response.getWriter();
//			out.write(str);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	//判断竞赛是否结束---以后修改调用
	private boolean isstart(int competionId)
	{
		if (competionId > 0)
		{
			Competion c = competionService.get(competionId);
			if (c != null)
			{
				if (c.getIsstart() == 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		}
		return true;
	}
		
	/**
	 * 提交答案
	 */
	@RequestMapping("/submitquesstion")
	public void submitquesstion(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId,int questionId,int number,String useranswer) {
		try {
			String str="";
			if (!isstart(competionId))
			{
				str = "{'sucess':'fail'}";
			}
			else
			{
				User user = getSessionUser(request);
				userQuestionService.saveQuestion(user.getUsername(),user.getId(),examId,questionId, number, useranswer);
				str = "{'sucess':'sucess'}";
			}
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 提交考卷
	 */
	@RequestMapping("/submitallquesstion")
	public ModelAndView submitallquesstion(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
			if (!isstart(competionId))
			{
				String url = "redirect:/lms/toexamerror.action";
				return new ModelAndView(url);
			}
			else
			{
				User user = getSessionUser(request);
				userExamService.finishStudentUserExam(user.getUsername(),user.getId(),examId);
				if (competionId > 0)
				{
					String url = "redirect:/lms/mycompetion.action";
					return new ModelAndView(url);
				}
				else
				{
					String url = "redirect:/lms/toexamingtohistoryexam.action?examId="+examId+"&docounts=-1";
					return new ModelAndView(url);
				}
			}
	}
	
	/**
	 * 裁判修改分值
	 */
	@RequestMapping("/setquesstionpfscore")
	public void setquesstionpfscore(HttpServletRequest request,
			HttpServletResponse response,int type,int userId, int examId,int questionId,int number,String pfscore) {
		try {
			User user = getSessionUser(request);
			boolean flag = userQuestionService.updateQuestion(user.getUsername(),type,userId,examId,questionId, number,pfscore);
			String str = flag?"{'sucess':'sucess'}":"{'sucess':'fail','msg':'"+CommonConstant.ERROR_7+"'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 裁判判分结束
	 */
	@RequestMapping("/finishpf")
	public void finishpf(HttpServletRequest request,
			HttpServletResponse response,int userId, int examId) {
		try {
			User user = getSessionUser(request);
			userExamService.finishUserExam(user.getUsername(),userId, examId);
			String str = "{'sucess':'sucess'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 考试界面调转到
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/toexamtrainone")
	public ModelAndView tocourseone(HttpServletRequest request, int competionId,int examId,
			int everticalId, int trainId) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		Exam exam = examService.get(examId);
		UserExam ucs = userExamService.getUserExam(user.getId(), examId);
		if (ucs == null) {
			UserExam uc = new UserExam();
			uc.setUserId(user.getId());
			uc.setExam(exam);
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			userExamService.save(uc);
		} else {
			
			if (ucs.getState() == 1)
			{
				String url = "redirect:/lms/toexamerror.action";
				return new ModelAndView(url);
			}
			ucs.setActivestate(1);
			userExamService.updateUserExam(ucs);
		}
		userExamService.setMyExamActiveState(user.getId());
		view.addObject("exam", exam);

		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		int currentPage = 0;
		while (it.hasNext()) {
			ExamChapter chapter = (ExamChapter) it.next();
			Set<ExamSequential> sequentialset = chapter.getEsequentials();
			Iterator it2 = sequentialset.iterator();

			while (it2.hasNext()) {
				ExamSequential sequential = (ExamSequential) it2.next();
				Set<ExamVertical> verticalset = sequential.getExamVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					ExamVertical vertical = (ExamVertical) it3.next();
					Set<ExamQuestion> verticalTrainset = vertical.getExamQuestion();
					Iterator it4 = verticalTrainset.iterator();
					while (it4.hasNext()) {
						ExamQuestion vt = (ExamQuestion) it4.next();
						Train train = vt.getTrain();
						if (train != null) {
							tlist.add(train);
							currentPage++;
							if (trainId == train.getId()) {
								view.addObject("currentPage", currentPage);
							}
						}
					}
				}
			}
		}
		Cloud cloud = userCloudService.getMyCloud(user.getId());
		if (cloud != null)
		{
			view.addObject("gateone",cloud.getIp());
		}
		view.addObject("competionId",competionId);
		view.addObject("tlist", tlist);
		view.setViewName("/lms/examtrain");
		return view;
	}
	
	//----------------------------------考试实训调用--------------------------------
	/**
	 * 判断环境是否已经准备好
	 * 
	 * @param request
	 * @param response
	 * @param courseId
	 * @param name
	 *            :环境名称
	 */
	@RequestMapping("/hasexamenv")
	public void hasexamenv(HttpServletRequest request,
			HttpServletResponse response, int examId, int trainId, String name) {

		try {
			User user = getSessionUser(request);
			PrintWriter out = response.getWriter();
//			UserEnvironment uce = userEnvironmentService.getMyUCE(user.getId(), examId,trainId);
			UserQuestionChild userTrain = userQuestionService.getUserExamTrainQuestionChild(user.getId(),
					examId, trainId);
//			String result = userTrain == null ? "" : userTrain.getResult();
			String revalue = userTrain == null ? "" : userTrain.getRevalue();
			String useranswer = userTrain == null ? "" : userTrain.getUseranswer();
			if (useranswer == null)
			{
				useranswer = "";
			}
			Train train = trainService.get(trainId);
			String con = train.getConContent();
			con = UtilTools.replaceBackett(con);
			
			List<TrainExt> telist = trainService.getTrainExtList(train.getId());
			String trainextlist = "[";
			//有可能实训下的所有脚本的执行环境都是一样的，仅仅需要显示一个就ok了
			List textlist = new ArrayList();
			for (TrainExt ext:telist)
			{
				String extstr = ext.getDevinfo();
				
				if (extstr != null && !textlist.contains(extstr))
				{
					String endt = extstr.substring(extstr.lastIndexOf(".")+1);
					//如果是动态模板，查看用户是否赋值了
					if (CommonConstant.DYNAMIC.equals(endt.trim()))
					{
						UserEnvironment uce = userEnvironmentService.getMyUCE(user.getId(), examId,extstr);
						//取得运行环境的具体描述
						Environment env = environmentService.getEnvironmentByname(extstr);
						if (uce == null)
						{
							trainextlist += "{'desc':'"+env.getDescrible()+"','ip':'','username':'','password':'','devinfo':'"+extstr+"'},";
						}
						else
						{
							trainextlist += "{'desc':'"+env.getDescrible()+"','ip':'"+uce.getHostname()+"','username':'"+uce.getUsername()+"','password':'"+uce.getPassword()+"','devinfo':'"+extstr+"'},";
						}
						textlist.add(extstr);
					}
				}
			}
			if (trainextlist != null && trainextlist.length() > 1)
			{
				trainextlist = trainextlist.substring(0,trainextlist.length()-1);
			}
			trainextlist += "]";
			if (trainextlist != null && trainextlist.length() > 2) {
				String str = "{'sucess':'sucess','trainextlist':" + trainextlist+ ",'revalue':'" + revalue+ "','conContent':'" + con + "','useranswer':'"+useranswer+"'}";
				out.write(str);
			} else {
				String str = "{'sucess':'fail','revalue':'" + revalue+ "','conContent':'" + con + "','useranswer':'"+useranswer+"'}";
				out.write(str);
			}
		} catch (Exception e) {

		}
	}
	
	/**
	 * 保存用户对应的实训运行环境
	 */
	@RequestMapping("/saveuserenv")
	public void saveuserenv(HttpServletRequest request,
			HttpServletResponse response, int examId, String ip,String username,String password,String devinfo) {

		try {
			User user = getSessionUser(request);
			int userId = user.getId();
			UserEnvironment uce = userEnvironmentService.getMyUCE(userId, examId,devinfo);
			if (uce != null)
			{
				userEnvironmentService.update(uce, ip, username, password);
			}
			else
			{
				userEnvironmentService.save(userId, examId, devinfo, ip, username, password);
			}
			String str = "{'sucess':'sucess'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {

		}
	}
	
}
