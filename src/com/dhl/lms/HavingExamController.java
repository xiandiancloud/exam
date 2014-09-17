package com.dhl.lms;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.web.BaseController;

/**
 * 开始考试使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class HavingExamController extends BaseController {

	/**
	 * 跳转到学生考试试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/tostartexam")
	public ModelAndView tostartexam(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/exam");
		return view;
	}

}
