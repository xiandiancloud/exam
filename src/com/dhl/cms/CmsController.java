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

import com.dhl.domain.Category;
import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.Sequential;
import com.dhl.domain.TeacherCourse;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.service.CategoryService;
import com.dhl.service.ChapterService;
import com.dhl.service.CourseService;
import com.dhl.service.SchoolService;
import com.dhl.service.SequentialService;
import com.dhl.service.TeacherCourseService;
import com.dhl.service.TrainService;
import com.dhl.service.UserService;
import com.dhl.service.VerticalService;
import com.dhl.service.VerticalTrainService;
import com.dhl.web.BaseController;

/**
 * 老师定义课程，使用等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CmsController extends BaseController {
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
	private VerticalTrainService verticalTrainService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private TeacherCourseService teacherCourseService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private SchoolService schoolService;

	
	
//	/**
//	 * 所有学校
//	 * 
//	 * @param request
//	 * @param index
//	 * @return
//	 */
//	@RequestMapping("/getAllSchool")
//	public void getAllSchool(HttpServletRequest request,HttpServletResponse response) {
//		
//		try {
//			PrintWriter out = response.getWriter();
//			List<School> school = schoolService.getAllSchool();
//			String str = getSchoolStr(school);
//			out.write(str);
//			// }
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	private String getSchoolStr(List<School> list) {
//		StringBuffer buffer = new StringBuffer();
//		int count = list.size();
//		buffer.append("{\"total\":" + count + ",\"rows\":[");
//		for (int i = 0; i < count; i++) {
//			School p = list.get(i);
//			buffer.append("{");
//			buffer.append("\"id\":");
//			buffer.append("\"" + p.getId() + "\"");
//			buffer.append(",\"name\":");
//			buffer.append("\"" + p.getSchool_name() + "\"");
//			buffer.append("},");
//		}
//		if (count > 0) {
//			String str = buffer.substring(0, buffer.length() - 1) + "]}";
//			str = str.replaceAll("null", "");
//			return str;
//		} else {
//			String str = buffer.toString() + "]}";
//			str = str.replaceAll("null", "");
//			return str;
//		}
//	}
//	
//	
//	/**
//	 * 跳转到老师课程页面
//	 * 
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("/cms")
//	public ModelAndView cms(HttpServletRequest request) {
//
//		User user = getSessionUser(request);
//		if (user == null) {
//			String url = "redirect:/cms/totlogin.action";
//			return new ModelAndView(url);
//		}
//		Role role = userService.getUserRoleByuserId(user.getId());
//		if (!CommonConstant.ROLE_T.equals(role.getRoleName())) {
//			String url = "redirect:/cms/totlogin.action";
//			return new ModelAndView(url);
//		}
//		ModelAndView view = new ModelAndView();
//		List<TeacherCourse> tcourselist = teacherCourseService
//				.getMyTCourse(user.getId());
//		view.addObject("tcourselist", tcourselist);
//		view.setViewName("/cms/tcourselist");
//		return view;
//	}

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
		List<TeacherCourse> tcourselist = teacherCourseService
				.getMyTCourse(user.getId());
		view.addObject("tcourselist", tcourselist);
		view.setViewName("/cmscourse/tcourselist");
		return view;
	}

//	/**
//	 * 跳转到老师登陆页面
//	 * 
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("/totlogin")
//	public ModelAndView totlogin(HttpServletRequest request) {
//		ModelAndView view = new ModelAndView();
//		view.setViewName("/cmscourse/signin");
//		return view;
//	}
//
//	/**
//	 * 跳转到老师注册页面
//	 * 
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("/totregeister")
//	public ModelAndView totregeister(HttpServletRequest request) {
//		ModelAndView view = new ModelAndView();
//		view.setViewName("/cmscourse/signup");
//		return view;
//	}

	/**
	 * 跳转到老师课程页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totcourse")
	public ModelAndView totcourse(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cmscourse/temp");
		return view;
	}

	/**
	 * 跳转到老师更新页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totupdate")
	public ModelAndView totupdate(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cmscourse/update");
		return view;
	}

	/**
	 * 跳转到老师团队页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totteam")
	public ModelAndView totteam(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cmscourse/team");
		return view;
	}

	/**
	 * 跳转到老师schedule页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totschedule")
	public ModelAndView totschedule(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cmscourse/schedule");
		return view;
	}

	/**
	 * 跳转到老师新建实验页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/tottrain")
	public ModelAndView tottrain(HttpServletRequest request, int courseId,
			int sequentialId, int verticalId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		view.addObject("sequentialId", sequentialId);
		view.addObject("verticalId", verticalId);
		/*
		 * Course course = courseService.get(courseId); view.addObject("course",
		 * course);
		 */
		List<VerticalTrain> vt = verticalTrainService.getVerticalTrainList(verticalId);
		view.addObject("vtlist", vt);
		Vertical vertical = verticalService.get(verticalId);
		view.addObject("vertical", vertical);
		view.setViewName("/cmscourse/unit");
		return view;
	}

	/**
	 * 发布跟取消发布
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/publicCourse")
	public void publicCourse(HttpServletRequest request,
			HttpServletResponse response, int courseId, int type) {

		try {
			PrintWriter out = response.getWriter();
			// User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			Course course = courseService.get(courseId);
			course.setPublish(type);
			courseService.update(course);
			String str = "{'sucess':'sucess'}";
			out.write(str);
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 老师更新课程
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/updatecourse")
	public void updatecourse(HttpServletRequest request,
			HttpServletResponse response, int courseId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		try {
			PrintWriter out = response.getWriter();

			courseService.updateCourse(courseId, describle, starttimedetail,
					endtimedetail, imgpath);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 老师创建课程
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createcourse")
	public void createcourse(HttpServletRequest request,
			HttpServletResponse response, String name, String org,
			String coursecode, String starttime, String category, String rank) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			courseService.createCourse(name, org, coursecode, starttime,
					user.getId(), Integer.parseInt(category), rank);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			Chapter c = new Chapter();
			c.setName(name);
			c.setCourse(courseService.get(courseId));
			chapterService.save(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updatechapter")
	public void updatechapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			Chapter c = chapterService.get(chapterId);
			c.setName(name);
			chapterService.update(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delchapter")
	public void delchapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId) {

		try {
			PrintWriter out = response.getWriter();
			Chapter c = chapterService.get(chapterId);
			chapterService.remove(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delSequential")
	public void delSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId) {

		try {
			PrintWriter out = response.getWriter();
			Sequential s = sequentialService.get(sequentialId);
			sequentialService.remove(s);
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
	@RequestMapping("/delVertical")
	public void delVertical(HttpServletRequest request,
			HttpServletResponse response, int verticalId) {

		try {
			PrintWriter out = response.getWriter();
			Vertical s = verticalService.get(verticalId);
			verticalService.remove(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
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
			Sequential s = new Sequential();
			s.setName(name);
			s.setChapter(chapterService.get(chapterId));
			sequentialService.save(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateSequential")
	public void updateSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId, String name) {

		try {
			PrintWriter out = response.getWriter();
			Sequential s = sequentialService.get(sequentialId);
			s.setName(name);
			sequentialService.update(s);
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
	@RequestMapping("/createVertical")
	public void createVertical(HttpServletRequest request,
			HttpServletResponse response, int sequenticalId, int verticalId,
			String name) {
		try {
			PrintWriter out = response.getWriter();
			Vertical v;
			if (verticalId == -1) {
				v = new Vertical();
				v.setName(name);
				v.setSequential(sequentialService.get(sequenticalId));
				verticalService.save(v);
			} else {
				v = verticalService.get(verticalId);
				v.setName(name);
				verticalService.update(v);
			}
			String str = "{'sucess':'sucess','verticalId':" + v.getId() + "}";
			out.write(str);
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

	/**
	 * 得到实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getTrain")
	public void getTrain(HttpServletRequest request,
			HttpServletResponse response,int trainId) {

		try {
			PrintWriter out = response.getWriter();
			Train t = trainService.get(trainId);
    		
			String str = "{'sucess':'sucess','name':'"+t.getName()+"','codenum':'"+t.getCodenum()
					+"','envname':'"+t.getEnvname()+"','conContent':'"+t.getConContent()+"','conShell':'"
					+t.getConShell()+"','conAnswer':'"+t.getConAnswer()+"','scoretag':'"+t.getScoretag()+"','score':'"+t.getScore()+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateTrain")
	public void updateTrain(HttpServletRequest request,
			HttpServletResponse response,int trainId, String name, String codenum,
			String envname, String conContent, String conShell,
			String conAnswer, int score, String scoretag) {

		try {
			PrintWriter out = response.getWriter();
			trainService.update(trainId,name, codenum, envname, conContent,
					conShell, conAnswer, score, scoretag);
			String str = "{'sucess':'sucess'}";
			out.write(str);
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

	/**
	 * 老师在增加课程的时候取得所有分类
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/tgetAllCategory")
	public void tgetAllCategory(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			List<Category> list = categoryService.getAllCategory();
			String str = getProjectViewStr(list);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getProjectViewStr(List<Category> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			Category p = list.get(i);
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
