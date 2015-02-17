package com.dhl.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.domain.Log;
import com.dhl.domain.School;
import com.dhl.domain.User;
import com.dhl.service.ECategoryService;
import com.dhl.service.ExamService;
import com.dhl.service.SchoolService;
import com.dhl.service.UserService;
import com.dhl.util.MD5;
import com.dhl.web.BaseController;

/**
 * 管理员使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
//	@Autowired
//	private CategoryService categoryService;
	@Autowired
	private ECategoryService ecategoryService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private ExamService examService;
	@Autowired
	private UserService userService;
	
	/**
	 * 根据id删除用户
	 * 
	 * @param request
	 * @param response
	 * @param schoolId
	 */
	@RequestMapping("/deluser")
	public ModelAndView deluser(HttpServletRequest request,
			HttpServletResponse response, int userId) {
		userService.remove(userId);
		String url = "redirect:/admin/importuser.action";
		return new ModelAndView(url);
	}

	/**
	 * 管理员到试卷分类頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/examcategory")
	public ModelAndView examcategory(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		List<ECategory> categorylist = ecategoryService.getAllCategory();
		view.addObject("ecategorylist", categorylist);
		view.setViewName("/admin/ecategory");
		return view;
	}
	
	/**
	 * 管理员到试卷推荐頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/groom")
	public ModelAndView groom(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		List<Exam> list = examService.getAllExam();
		view.addObject("examlist", list);
		view.setViewName("/admin/groom");
		return view;
	}
	
	/**
	 * 管理员到log日志頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/log")
	public ModelAndView log(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		List<Log> list = examService.getAllLog();
		view.addObject("loglist", list);
		view.setViewName("/admin/log");
		return view;
	}
	
	/**
	 * 管理员到log日志頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/sysset")
	public ModelAndView sysset(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin/sysset");
		return view;
	}
	
	@RequestMapping("/resetpwd")
	public void resetpwd(HttpServletRequest request,
			HttpServletResponse response, String password) {
		String result = "{'sucess':'sucess','msg':'" + CommonConstant.ERROR_0
				+ "'}";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			User user = getSessionUser(request);
			MD5 md5 = new MD5();
			String pw = md5.getMD5ofStr(password);
			user.setPassword(pw);
			userService.update(user);
			result = "{'sucess':'sucess','msg':'" + CommonConstant.ERROR_2
					+ "'}";
			out.write(result);
		} catch (Exception e) {
			if (out != null)
				out.write(result);
		}
	}
	
	/**
	 * 推荐试卷
	 * @param request
	 * @param examId
	 * @return
	 */
	@RequestMapping("/groomexam")
	public ModelAndView groomexam(HttpServletRequest request,int examId,int type) {
		Exam exam = examService.get(examId);
		exam.setIsgroom(type);
		examService.update(exam);
		String url = "redirect:/admin/groom.action";
		return new ModelAndView(url);
	}
	
	/**
	 * 管理员到學校頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/school")
	public ModelAndView school(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		List<School> school = schoolService.getAllSchool();
		view.addObject("schoollist", school);
		view.setViewName("/admin/school");
		return view;
	}

	/**
	 * 根据id删除学校
	 * 
	 * @param request
	 * @param response
	 * @param schoolId
	 */
	@RequestMapping("/delschool")
	public ModelAndView delschool(HttpServletRequest request,
			HttpServletResponse response, int schoolId) {
		schoolService.remove(schoolId);
		String url = "redirect:/admin/school.action";
		return new ModelAndView(url);
	}

	/**
	 * 增加学校
	 * 
	 * @param request
	 * @param response
	 * @param name
	 */
	@RequestMapping("/addschool")
	public void delschool(HttpServletRequest request,
			HttpServletResponse response, String name) {
		String result = "{'sucess':'sucess','msg':'" + CommonConstant.ERROR_0
				+ "'}";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String str = schoolService.saveSchool(name);
			if (CommonConstant.ERROR_2.equals(str)) {
				result = "{'sucess':'sucess','msg':'" + str + "'}";
				out.write(result);
			} else {
				result = "{'sucess':'fail','msg':'" + str + "'}";
				out.write(result);
			}
		} catch (Exception e) {
			if (out != null)
				out.write(result);
		}
	}

	@RequestMapping("/removealluser")
	public void removealluser(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			userService.removeAlluser();
			out.write("{'sucess':'sucess'}");
		} catch (Exception e) {
			if (out != null)
				out.write("{'sucess':'fail'}");
		}
	}
	
	/**
	 * 添加试卷分类
	 * 
	 * @param request
	 * @param response
	 * @param name
	 */
	@RequestMapping("/addecategory")
	public void addecategory(HttpServletRequest request,
			HttpServletResponse response, String name) {
		String result = "{'sucess':'sucess','msg':'" + CommonConstant.ERROR_0
				+ "'}";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String str = ecategoryService.saveCategory(name);
			if (CommonConstant.ERROR_2.equals(str)) {
				result = "{'sucess':'sucess','msg':'" + str + "'}";
				out.write(result);
			} else {
				result = "{'sucess':'fail','msg':'" + str + "'}";
				out.write(result);
			}
		} catch (Exception e) {
			if (out != null)
				out.write(result);
		}
	}
	
//	/**
//	 * 根据id删除分类
//	 * 
//	 * @param request
//	 * @param response
//	 * @param categoryId
//	 */
//	@RequestMapping("/delcategory")
//	public ModelAndView delcategory(HttpServletRequest request,
//			HttpServletResponse response, int categoryId) {
//		categoryService.remove(categoryId);
//		String url = "redirect:/admin/category.action";
//		return new ModelAndView(url);
//	}
	
	/**
	 * 根据id删除试卷分类
	 * 
	 * @param request
	 * @param response
	 * @param categoryId
	 */
	@RequestMapping("/delecategory")
	public ModelAndView delecategory(HttpServletRequest request,
			HttpServletResponse response, int categoryId) {
		ecategoryService.remove(categoryId);
		String url = "redirect:/admin/examcategory.action";
		return new ModelAndView(url);
	}
}
