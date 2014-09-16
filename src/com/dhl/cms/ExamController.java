package com.dhl.cms;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Role;
import com.dhl.domain.School;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.User;
import com.dhl.service.ECategoryService;
import com.dhl.service.ExamChapterService;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamSequentialService;
import com.dhl.service.ExamService;
import com.dhl.service.ExamVerticalService;
import com.dhl.service.SchoolService;
import com.dhl.service.TeacherExamService;
import com.dhl.service.TrainService;
import com.dhl.service.UserService;
import com.dhl.web.BaseController;

/**
 * 老师定义试卷，使用等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class ExamController extends BaseController {
	// 试卷
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamChapterService examchapterService;
	// 小节
	@Autowired
	private ExamSequentialService examsequentialService;
	// 单元
	@Autowired
	private ExamVerticalService examverticalService;
	@Autowired
	private ExamQuestionService examquestionService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private TeacherExamService teacherExamService;
	
//	private TeacherCourseService teacherCourseService;
//	@Autowired
//	private CategoryService categoryService;
	
	@Autowired
	private ECategoryService ecategoryService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private SchoolService schoolService;

	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms")
	public ModelAndView cms(HttpServletRequest request) {

		User user = getSessionUser(request);
		if (user == null) {
			String url = "redirect:/cms/totlogin.action";
			return new ModelAndView(url);
		}
		Role role = userService.getUserRoleByuserId(user.getId());
		if (!CommonConstant.ROLE_T.equals(role.getRoleName())) {
			String url = "redirect:/cms/totlogin.action";
			return new ModelAndView(url);
		}
		ModelAndView view = new ModelAndView();
		List<TeacherExam> tcourselist = teacherExamService
				.getMyTCourse(user.getId());
		view.addObject("texamlist", tcourselist);
		view.setViewName("/cms/texamlist");
		return view;
	}

	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamlist")
	public ModelAndView totexamlist(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<TeacherExam> tcourselist = teacherExamService
				.getMyTCourse(user.getId());
		view.addObject("texamlist", tcourselist);
		view.setViewName("/cms/texamlist");
		return view;
	}

	@RequestMapping("/totcompetion")
	public ModelAndView totcompetion(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
//		view.addObject("examId", examId);
//		Exam course = examService.get(examId);
//		view.addObject("exam", course);
		view.setViewName("/cms/competion");
		return view;
	}
	
	/**
	 * 跳转到老师登陆页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totlogin")
	public ModelAndView totlogin(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/cms/signin");
		return view;
	}

	/**
	 * 跳转到老师注册页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totregeister")
	public ModelAndView totregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/cms/signup");
		return view;
	}

	/**
	 * 跳转到老师试卷更新页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamupdate")
	public ModelAndView totexamupdate(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		view.addObject("exam", course);
		view.setViewName("/cms/update");
		return view;
	}

	/**
	 * 跳转到老师试卷团队页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamteam")
	public ModelAndView totexamteam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		view.addObject("Exam", course);
		view.setViewName("/cms/team");
		return view;
	}

	/**
	 * 跳转到老师试卷schedule页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamschedule")
	public ModelAndView totexamschedule(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		view.addObject("exam", course);
		view.setViewName("/cms/schedule");
		return view;
	}
	
	/**
	 * 老师创建试卷
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createexam")
	public void createexam(HttpServletRequest request,
			HttpServletResponse response, String name, String org,
			String coursecode, String starttime, String category, String rank) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			examService.createExam(name, org, coursecode, starttime,
					user.getId(), Integer.parseInt(category), rank);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 老师在增加课程的时候取得所有试卷分类
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/tgetAllExamCategory")
	public void tgetAllExamCategory(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			List<ECategory> list = ecategoryService.getAllCategory();
			String str = getProjectViewStr(list);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexam")
	public ModelAndView totexam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		view.addObject("exam", course);
		view.setViewName("/cms/temp");
		return view;
	}
	
	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/delexam")
	public ModelAndView delexam(HttpServletRequest request, int examId) {
		examService.remove(examId);
		String url = "redirect:/cms/totexamlist.action";
		return new ModelAndView(url);
	}
	
	/**
	 * 发布跟取消发布试卷
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/publicExam")
	public void publicExam(HttpServletRequest request,
			HttpServletResponse response, int examId, int type) {

		try {
			PrintWriter out = response.getWriter();
			Exam course = examService.get(examId);
			course.setPublish(type);
			examService.update(course);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 老师更新试卷
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/updateExam")
	public void updateExam(HttpServletRequest request,
			HttpServletResponse response, int examId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		try {
			PrintWriter out = response.getWriter();

			examService.updateCourse(examId, describle, starttimedetail,
					endtimedetail, imgpath);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createexamchapter")
	public void createexamchapter(HttpServletRequest request,
			HttpServletResponse response, int examId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = new ExamChapter();
			c.setName(name);
			c.setExam(examService.get(examId));
			examchapterService.save(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateexamchapter")
	public void updateexamchapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = examchapterService.get(chapterId);
			c.setName(name);
			examchapterService.update(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delexamchapter")
	public void delexamchapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = examchapterService.get(chapterId);
			examchapterService.remove(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamSequential")
	public void createExamSequential(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = new ExamSequential();
			s.setName(name);
			s.setEchapter(examchapterService.get(chapterId));
			examsequentialService.save(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateExamSequential")
	public void updateExamSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = examsequentialService.get(sequentialId);
			s.setName(name);
			examsequentialService.update(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delExamSequential")
	public void delExamSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = examsequentialService.get(sequentialId);
			examsequentialService.remove(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除單元
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delExamVertical")
	public void delExamVertical(HttpServletRequest request,
			HttpServletResponse response, int verticalId) {

		try {
			PrintWriter out = response.getWriter();
			ExamVertical s = examverticalService.get(verticalId);
			examverticalService.remove(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建单元或者更新单元
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamVertical")
	public void createVertical(HttpServletRequest request,
			HttpServletResponse response, int sequenticalId, int verticalId,
			String name) {
		try {
			PrintWriter out = response.getWriter();
			ExamVertical v;
			if (verticalId == -1) {
				v = new ExamVertical();
				v.setName(name);
				v.setEsequential(examsequentialService.get(sequenticalId));
				examverticalService.save(v);
			} else {
				v = examverticalService.get(verticalId);
				v.setName(name);
				examverticalService.update(v);
			}
			String str = "{'sucess':'sucess','verticalId':" + v.getId() + "}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到老师新建实验页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamtrain")
	public ModelAndView totexamtrain(HttpServletRequest request, int examId,
			int sequentialId, int verticalId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		view.addObject("sequentialId", sequentialId);
		view.addObject("verticalId", verticalId);

		List<ExamQuestion> vt = examquestionService.getVerticalTrainList(verticalId);
		view.addObject("vtlist", vt);
		ExamVertical vertical = examverticalService.get(verticalId);
		view.addObject("vertical", vertical);
		view.setViewName("/cms/unit");
		return view;
	}
	
	//--------------------------------------------------------------------------------------
	
	/**
	 * 所有学校
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/getAllSchool")
	public void getAllSchool(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			PrintWriter out = response.getWriter();
			List<School> school = schoolService.getAllSchool();
			String str = getSchoolStr(school);
			out.write(str);
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getSchoolStr(List<School> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			School p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getSchool_name() + "\"");
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
	 * 创建实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createTrain")
	public void createTrain(HttpServletRequest request,
			HttpServletResponse response, String name, String codenum,
			String envname, String conContent, String conShell,
			String conAnswer, int score, String scoretag, int courseId,
			int verticalId) {

		try {
			PrintWriter out = response.getWriter();
			String msg = trainService.save(name, codenum, envname, conContent,
					conShell, conAnswer, score, scoretag, courseId, verticalId);
			if (msg != null) {
				String str = "{'sucess':'fail','msg':'" + msg + "'}";
				out.write(str);

			} else {
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/uploadshell")
	public void uploadshell(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String path = "shell/" + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();

				out.print("{\"success\": \"true\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				out.print("{\"success\": \"false\"}");
			}
		} catch (Exception e) {
			out.print("{\"success\": \"false\"}");
		}
	}

	private String getProjectViewStr(List<ECategory> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			ECategory p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getName() + "\"");
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
}
