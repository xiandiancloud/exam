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
import com.dhl.domain.Category;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.service.CategoryService;
import com.dhl.service.ECategoryService;
import com.dhl.service.ExamService;
import com.dhl.web.BaseController;
import com.xiandian.cai.SchoolInterface;
import com.xiandian.model.School;

/**
 * 管理员使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ECategoryService ecategoryService;
	@Autowired
	private SchoolInterface schoolInterface;
	@Autowired
	private ExamService examService;
	
	/**
	 * 管理员到课程分类頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/category")
	public ModelAndView category(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		List<Category> categorylist = categoryService.getAllCategory();
		view.addObject("categorylist", categorylist);
		view.setViewName("/admin/category");
		return view;
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

		List<School> school = schoolInterface.getAllSchool();
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
		schoolInterface.remove(schoolId);
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
			String str = schoolInterface.saveSchool(name);
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

	/**
	 * 添加分类
	 * 
	 * @param request
	 * @param response
	 * @param name
	 */
	@RequestMapping("/addcategory")
	public void addcategory(HttpServletRequest request,
			HttpServletResponse response, String name) {
		String result = "{'sucess':'sucess','msg':'" + CommonConstant.ERROR_0
				+ "'}";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String str = categoryService.saveCategory(name);
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
	
	/**
	 * 根据id删除分类
	 * 
	 * @param request
	 * @param response
	 * @param categoryId
	 */
	@RequestMapping("/delcategory")
	public ModelAndView delcategory(HttpServletRequest request,
			HttpServletResponse response, int categoryId) {
		categoryService.remove(categoryId);
		String url = "redirect:/admin/category.action";
		return new ModelAndView(url);
	}
	
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
