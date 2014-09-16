package com.dhl.lms;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.web.BaseController;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsExamController extends BaseController {
	
	@RequestMapping("/toexamintroduce")
	public ModelAndView toexamintroduce(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/introduce");
		return view;
	}
}
