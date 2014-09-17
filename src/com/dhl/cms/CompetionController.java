package com.dhl.cms;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Competion;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.service.CompetionService;
import com.dhl.service.UserCompetionService;
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
	@Autowired
	private UserCompetionService usercompetionService;

	/**
	 * 跳转到竞赛页面
	 * 
	 * @param request
	 * @return
	 */
//	@RequestMapping("/totcompetion")
//	public ModelAndView totcompetion(HttpServletRequest request) {
//		ModelAndView view = new ModelAndView();
//		// view.addObject("examId", examId);
//		// Exam course = examService.get(examId);
//		// view.addObject("exam", course);
//		view.setViewName("/cms/competion");
//		return view;
//	}

	@RequestMapping("/totcompetion")
	public ModelAndView totcompetion(HttpServletRequest request,int competionId) {
		ModelAndView view = new ModelAndView();
		
		Competion competion = competionService.get(competionId);
		view.addObject("competion", competion);
		
		List<UserCompetion> uclist = usercompetionService.getCompetionjudgment(competionId);
		view.addObject("judgmentlist", uclist);
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
			User user = getSessionUser(request);
			if (user != null) {
				Competion c = competionService.createCompetion(name, starttime,
						endtime, wstarttime, wendtime, examstarttime,
						examendtime, type, score, passscore, describle,
						schoolId, user);

				String str = "{'sucess':'sucess','competionId':'" + c.getId()
						+ "'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 增加竞赛裁判
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/addcompetionjudgment")
	public void addcompetionjudgment(HttpServletRequest request,
			HttpServletResponse response, int userId, int competionId,
			String job) {
		try {
			PrintWriter out = response.getWriter();
			usercompetionService.save(userId, competionId, job);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
