package com.dhl.cms;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Competion;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.service.CompetionService;
import com.dhl.service.ExamService;
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
	@Autowired
	private ExamService examService;
	
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
		
		List<CompetionExam> celist = competionService.getCompetionExam(competionId);
		for (CompetionExam ce:celist)
		{
			if (ce.getSelectexam() == 1)
			{
				view.addObject("sexam", ce);
			}
		}
		view.addObject("celist", celist);
		
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
	
	/**
	 * 删除竞赛裁判
	 * @param request
	 * @param response
	 * @param competionId
	 * @param userId
	 */
	@RequestMapping("/delcompetionjudgment")
	public void delcompetionjudgment(HttpServletRequest request,HttpServletResponse response,String competionId,String userId) {
		try {
			PrintWriter out = response.getWriter();
			usercompetionService.removeCompetionjudgment(Integer.parseInt(competionId), Integer.parseInt(userId));
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 竞赛创建试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/addexam")
	public void addexam(HttpServletRequest request,
			HttpServletResponse response,int userId,int competionId, String name) {
		try {
			PrintWriter out = response.getWriter();
			examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 竞赛删除试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/deleteexam")
	public void deleteexam(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
		try {
			PrintWriter out = response.getWriter();
			examService.removeExam(competionId,examId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 竞赛选择试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/selectexam")
	public void selectexam(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
		try {
			PrintWriter out = response.getWriter();
			String time = examService.selectexam(competionId,examId);
			String str = "{'sucess':'sucess','time':'"+time+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 得到可以命题的老师
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getCompetionMjudgment")
	public void getCompetionMjudgment(HttpServletRequest request,HttpServletResponse response,int competionId) {
		
		try {
			PrintWriter out = response.getWriter();
			List<UserCompetion> uclist = usercompetionService.getCompetionMjudgment(competionId);
			String str = getMjudgment(uclist);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 锁定竞赛下的所有试卷
	 * @param request
	 * @param response
	 */
	@RequestMapping("/lockallexam")
	public void lockallexam(HttpServletRequest request,HttpServletResponse response,int competionId) {
		
		try {
			PrintWriter out = response.getWriter();
			competionService.lockallexam(competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 解锁竞赛下的所有试卷
	 * @param request
	 * @param response
	 */
	@RequestMapping("/unlockallexam")
	public void unlockallexam(HttpServletRequest request,HttpServletResponse response,int competionId,int examId) {
		
		try {
			PrintWriter out = response.getWriter();
			competionService.unlockallexam(competionId,examId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param list
	 * @return
	 */
	private String getMjudgment(List<UserCompetion> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			UserCompetion p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getUser().getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getUser().getUsername() + "\"");
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
