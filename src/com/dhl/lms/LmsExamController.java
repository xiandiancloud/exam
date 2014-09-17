package com.dhl.lms;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Exam;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.domain.UserExam;
import com.dhl.service.ExamService;
import com.dhl.service.TeacherExamService;
import com.dhl.service.UserCompetionService;
import com.dhl.service.UserExamService;
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
	private UserCompetionService userCompetionService;
	@Autowired
	private TeacherExamService teacherExamService;
	@Autowired
	private UserExamService userExamService;
	@Autowired
	private ExamService examService;
	
	/**
	 * 跳转到试卷开始考试介绍页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamintroduce")
	public ModelAndView toexamintroduce(HttpServletRequest request,int examId) {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("/lms/introduce");
		return view;
	}
	
	@RequestMapping("/toexam")
	public ModelAndView tocourse(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
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
		} else {
			ucs.setActivestate(1);
			userExamService.updateUserCourse(ucs);
		}
		Exam course = examService.get(examId);
		view.addObject("exam", course);

		view.setViewName("/lms/exam");
		return view;
	}
	
	/**
	 * 我的课程
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
