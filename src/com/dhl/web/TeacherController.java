package com.dhl.web;

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

import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.Sequential;
import com.dhl.domain.TeacherCourse;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.Vertical;
import com.dhl.service.ChapterService;
import com.dhl.service.CourseService;
import com.dhl.service.SequentialService;
import com.dhl.service.TeacherCourseService;
import com.dhl.service.TrainService;
import com.dhl.service.VerticalService;

/**
 * 老师定义课程，使用等使用
 * 
 * @see
 * @since
 */
@Controller
public class TeacherController extends BaseController {
	// 课程
	@Autowired
	private CourseService courseService;
	// 章节
	@Autowired
	private ChapterService chapterService;
	// 章节
	@Autowired
	private SequentialService sequentialService;
	// 小节
	@Autowired
	private VerticalService verticalService;
	@Autowired
	private TrainService trainService;
	// @Autowired
	// private VerticalService verticalService;
	// @Autowired
	// private VerticalTrainService vtService;
	// @Autowired
	// private UserTrainService utService;
	// @Autowired
	// private UserCourseService userCourseService;
	// @Autowired
	// private UserTrainHistoryService userTrainHistoryService;
	@Autowired
	private TeacherCourseService teacherCourseService;

	/**
	 * 跳转到老师课程页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totcourselist")
	public ModelAndView totcourselist(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<TeacherCourse> tcourselist = teacherCourseService.getMyTCourse(user.getId());
		if (tcourselist != null && tcourselist.size() == 0)
		{
			tcourselist = null;
		}
		view.addObject("tcourselist", tcourselist);
		view.setViewName("/teacher/tcourselist");
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
		view.setViewName("/teacher/signin");
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
		view.setViewName("/teacher/signup");
		return view;
	}
	
	/**
	 * 发布课程
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/publicCourse")
	public void publicCourse(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {
				Course course = courseService.get(courseId);
				course.setPublish(1);
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建课程
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createcourse")
	public ModelAndView createcourse(HttpServletRequest request, String name) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		if (user == null) {
			String url = "redirect:/tologin.action";
			return new ModelAndView(url);
		}
		Course c = new Course();
		c.setName(name);
		courseService.save(c);
		TeacherCourse tc = new TeacherCourse();
		tc.setCourse(c);
		tc.setUserId(user.getId());
		teacherCourseService.save(tc);
		view.addObject("course", c);
		view.setViewName("/teachercourse");
		return view;
	}

	/**
	 * 创建章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createchapter")
	public void createchapter(HttpServletRequest request,
			HttpServletResponse response, int courseId, String name) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {
				Chapter c = new Chapter();
				c.setName(name);
				c.setCourse(courseService.get(courseId));
				chapterService.save(c);
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createSequential")
	public void createSequential(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {
				Sequential s = new Sequential();
				s.setName(name);
				s.setChapter(chapterService.get(chapterId));
				sequentialService.save(s);
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建单元
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createVertical")
	public void createVertical(HttpServletRequest request,
			HttpServletResponse response, int sequenticalId, String name) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {

				Vertical v = new Vertical();
				v.setName(name);
				v.setSequential(sequentialService.get(sequenticalId));
				verticalService.save(v);
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			String preName,String conContent,String conShell,String conAnswer,int score,String scoretag) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {

				Train t = new Train();
				t.setName(name);
				t.setCodenum(codenum);
				t.setPreName(preName);
				t.setConContent(conContent);
				t.setConShell(conShell);
				t.setConAnswer(conAnswer);
				t.setScore(score);
				t.setScoretag(scoretag);
				trainService.save(t);
				String str = "{'sucess':'sucess'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadshell")
	public void uploadshell(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="qqfile", required=true) MultipartFile file)
	{
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			out.print("{\"success\": \"false\"}");
		}
		try
		{
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext().getRealPath("/");
				String path =  "shell/" + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath+path);
				fos.write(bytes); 
				fos.close();
				
				out.print("{\"success\": \"true\"}");
//				out.write("<script>parent.callback('sucess')</script>");
			}
			else
			{
				out.print("{\"success\": \"false\"}");
			}
		}
		catch(Exception e)
		{
			out.print("{\"success\": \"false\"}");
		}
	}
}
