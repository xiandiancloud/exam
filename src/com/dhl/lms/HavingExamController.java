package com.dhl.lms;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Exam;
import com.dhl.domain.User;
import com.dhl.domain.UserExam;
import com.dhl.service.ExamService;
import com.dhl.service.UserExamService;
import com.dhl.web.BaseController;

/**
 * 开始考试使用
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class HavingExamController extends BaseController {

	@Autowired
	private UserExamService userExamService;
	@Autowired
	private ExamService examService;
	
	//判断是否有权限去考试
	private boolean isHaving(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			
		}
		return false;
	}
	
	//判断是否有权限去判分
	private boolean isHavingPf(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			
		}
		return false;
	}
	
	/**
	 * 跳转到学生考试试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtostartexam")
	public ModelAndView toexamingtostartexam(HttpServletRequest request,int examId) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		
		User user = getSessionUser(request);
		userExamService.setMyCourseActiveState(user.getId());
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
		
		view.addObject("exam", exam);
		
		view.setViewName("/lms/exam");
		return view;
	}

}
