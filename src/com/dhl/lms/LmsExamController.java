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
import com.dhl.dao.Page;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamCategory;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.domain.UserExam;
import com.dhl.service.CompetionService;
import com.dhl.service.ECategoryService;
import com.dhl.service.ExamCategoryService;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamService;
import com.dhl.service.TeacherExamService;
import com.dhl.service.UserCompetionService;
import com.dhl.service.UserExamService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsExamController extends BaseController {
	
	@Autowired
	private CompetionService competionService;
	@Autowired
	private UserCompetionService userCompetionService;
	@Autowired
	private TeacherExamService teacherExamService;
	@Autowired
	private UserExamService userExamService;
	@Autowired
	private ExamService examService;
	
	@Autowired
	private ECategoryService ecategoryService;
	@Autowired
	private ExamCategoryService examCategoryService;
	@Autowired
	private ExamQuestionService examquestionService;
	/**
	 * 跳转到学生考试首页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lms")
	public ModelAndView cms(HttpServletRequest request) {
		String url = "redirect:/lms/getteamCategory.action";
		return new ModelAndView(url);
	}
	
	@RequestMapping("/getteamCategory")
	public ModelAndView getteamCategory(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		List<ECategory> category = ecategoryService.getAllCategory();
		view.addObject("category", category);
		view.addObject("navindex", 1);
		view.setViewName("/lms/courselist");
		return view;
	}
	
	@RequestMapping("/getexamByCategoryId")
	public void getexamByCategoryId(HttpServletRequest request,
			HttpServletResponse response, int categoryId, int pageNo) {
		try {
			Page page = examCategoryService.getExamByCategoryId(categoryId,
					pageNo, CommonConstant.SYS_PAGE_SIZE);
			String str = getProjectViewStr(page);
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private String getProjectViewStr(Page list) {
		StringBuffer buffer = new StringBuffer();
		long count = list.getTotalPageCount();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		List<ExamCategory> data = list.getResult();
		Iterator<ExamCategory> it = data.iterator();
		while (it.hasNext()) {
			ExamCategory p = it.next();
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getExam().getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getExam().getName() + "\"");
			buffer.append(",\"imgpath\":");
			String img = p.getExam().getImgpath();
			if (img == null || img.length() < 1)
			{
				img = "images/exam.jpg";
			}
			buffer.append("\"" + img + "\"");
			buffer.append(",\"desc\":");
			buffer.append("\"" + p.getExam().getDescrible() + "\"");
			buffer.append("},");
		}
		if (count > 0) {
			String str = buffer.substring(0, buffer.length() - 1) + "]}";
			str = str.replaceAll("null", "");
			return str;
		} else {
			String str = buffer.toString() + "]}";
			str = str.replaceAll("null", "");
			return str;
		}
	}
	
	/**
	 * 跳转到试卷开始考试介绍页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamintroduce")
	public ModelAndView toexamintroduce(HttpServletRequest request,int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		String s = exam.getStarttimedetail();
		String e = exam.getEndtimedetail();
		if ("".equals(s) || "".equals(3))
		{
			view.addObject("mm", "无限制");
		}
		else
		{
			long startT = UtilTools.fromDateStringToLong(s);
			long endT = UtilTools.fromDateStringToLong(e);
			long ss=(startT-endT)/(1000); //共计秒数
			int mm = (int)ss/60;   //共计分钟数
			view.addObject("mm", mm);
		}
		int size = exam.getExamchapters().size();
		int index = 0;
		int score = 0;
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
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
					Set<ExamQuestion> vt = vertical.getExamQuestion();//examquestionService.getVerticalTrainList(vertical.getId());
					for (ExamQuestion eq:vt)
					{
						index ++;
						Question q = eq.getQuestion();
						if (q != null)
						{
							
						}
						else
						{
							Train train = eq.getTrain();
							if (train != null)
							{
								score += train.getScore();
							}
						}
					}
				}
			}
		}
		view.addObject("score", score);
		view.addObject("size", size);
		view.addObject("index", index);
		view.setViewName("/lms/introduce");
		return view;
	}
	
	/**
	 * 首页显示最近操作的试卷，登陆后显示
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/recentexam")
	public void recentcourse(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {

				UserExam userCourse = userExamService
						.getUserRecentlyExam(user.getId());
				if (userCourse == null) {
					String str = "{'sucess':'fail'}";

					out.write(str);
				} else {
					//拿到试卷下的所有问题及实验
					List<ExamQuestion> vtlist = examquestionService
							.getAllTrainByExamId(userCourse.getExam()
									.getId());
//					List<UserTrain> utlist = utService.getMyFinishCourseTrain(
//							user.getId(), userCourse.getCourse().getId());
//					int counts = vtlist == null ? 0 : vtlist.size();
//					int ncounts = utlist == null ? 0 : utlist.size();
//					String complete = "0%";
//					if (utlist != null) {
//						double c = 0;
//						if (c != 0) {
//							c = ncounts * 100 / counts;
//							complete = Math.floor(c) + "%";
//						}
//
//					}
//					String str = "{'sucess':'sucess','name':'"
//							+ userCourse.getExam().getName() + "','img':'"
//							+ userCourse.getExam().getImgpath()
//							+ "','courseId':'" + userCourse.getExam().getId()
//							+ "','complete':'" + complete + "'}";
//
//					out.write(str);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 检测竞赛是否已经开始
	 */
	@RequestMapping("/isstartcompetion")
	public void isstartcompetion(HttpServletRequest request,
			HttpServletResponse response, int competionId) {
		try {
			Competion c = competionService.get(competionId);
			int isstart = c.getIsstart();
			String str = "";
			if (isstart == 1)
			{
				CompetionExam ce = competionService.getCompetionSelectExam(competionId);
				if (ce != null)
				{
					str = "{'sucess':'sucess','examId':"+ce.getExam().getId()+"}";
				}
				else
				{
					str = "{'sucess':'fail','msg':'竞赛还没有选卷'}";
				}
			}
			else
			{
				str = "{'sucess':'fail','msg':'竞赛还没有开始'}";
			}
			
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 试卷列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/examlist")
	public ModelAndView examlist(HttpServletRequest request, int currentpage) {
		ModelAndView view = new ModelAndView();
		
		Page page = examService.getAllExamnotcompetion(currentpage, CommonConstant.EXAMLIST_PAGE_SIZE);
		List<Exam> courses = page.getResult();
		int totalpage = (int) page.getTotalPageCount();
		view.addObject("examlist", courses);
		view.addObject("totalpage", totalpage);
		view.addObject("currentpage", currentpage);
		
		view.setViewName("/lms/online");
		return view;
	}
	
//	@RequestMapping("/toexam")
//	public ModelAndView tocourse(HttpServletRequest request, int examId) {
//		ModelAndView view = new ModelAndView();
//		User user = getSessionUser(request);
//		UserExam ucs = userExamService
//				.getUserExam(user.getId(), examId);
//		if (ucs == null) {
//			UserExam uc = new UserExam();
//			uc.setUserId(user.getId());
//			uc.setExam(examService.get(examId));
//			uc.setState(0);
//			uc.setDocounts(1);
//			uc.setActivestate(1);
//			uc.setUsetime("0");
//			userExamService.save(uc);
//		} else {
//			ucs.setActivestate(1);
//			userExamService.updateUserCourse(ucs);
//		}
//		Exam course = examService.get(examId);
//		view.addObject("exam", course);
//
//		view.setViewName("/lms/exam");
//		return view;
//	}
	
	/**
	 * 我的试卷
	 * @param request
	 * @return
	 */
	@RequestMapping("/myexam")
	public ModelAndView myexam(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<UserExam> mycourses = userExamService.getMyAllCourse(user.getId());
		view.addObject("sexamlist", mycourses);
		List<TeacherExam> tcourselist = teacherExamService
				.getMyTCourse(user.getId());
		view.addObject("texamlist", tcourselist);
		view.setViewName("/lms/mycourse");
		return view;
	}
	
	/**
	 * 我的竞赛
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycompetion")
	public ModelAndView mycompetion(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<UserCompetion> mycourses = userCompetionService.getMyAllCompetion(user
				.getId());
		view.addObject("uclist", mycourses);
		view.setViewName("/lms/mycompetion");
		return view;
	}
}
