package com.dhl.cms;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Competion;
import com.dhl.service.CompetionService;
import com.dhl.web.BaseController;

/**
 * 定义竞赛等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CompetionController extends BaseController {

	@Autowired
	private CompetionService competionService;

	/**
	 * 跳转到竞赛页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totcompetion")
	public ModelAndView totcompetion(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		// view.addObject("examId", examId);
		// Exam course = examService.get(examId);
		// view.addObject("exam", course);
		view.setViewName("/cms/competion");
		return view;
	}

	/**
	 * 创建竞赛
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createcompetion")
	public void createcompetion(HttpServletRequest request,
			HttpServletResponse response, String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, String type,
			String score, String passscore, String describle, String schoolId) {
		try {
			PrintWriter out = response.getWriter();

			Competion c = competionService.createCompetion(name, starttime, endtime,
					wstarttime, wendtime, examstarttime, examendtime, type,
					score, passscore, describle, schoolId);

			String str = "{'sucess':'sucess','competionId':'"+c.getId()+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
