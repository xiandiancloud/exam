package com.dhl.lms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Cloud;
import com.dhl.domain.UserAction;
import com.dhl.domain.UserEnvironment;
import com.dhl.service.UserActionService;
import com.dhl.service.UserCloudService;
import com.dhl.service.UserEnvironmentService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;
import com.xiandian.cai.UserInterface;
import com.xiandian.model.Role;
import com.xiandian.model.User;
import com.xiandian.model.UserProfile;
import com.xiandian.util.MD5;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsUserController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private UserInterface userInterface;
	@Autowired
	private UserActionService userActionService;
	@Autowired
	private UserEnvironmentService ueService;
	@Autowired
	private UserCloudService userCloudService;

	/**
	 * 跳转到登陆界面
	 * 
	 * @param request
	 * @param url
	 * @return
	 */
	@RequestMapping("/tologin")
	public ModelAndView tologin(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:/lms/getteamCategory.action";
		}
		else
		{
			url = "/lms/login";
		}
		view.setViewName(url);
		return view;
	}

	/**
	 * 跳转到注册页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toregeister")
	public ModelAndView toregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/regeister");
		return view;
	}

	/**
	 * 注册用户
	 * 
	 * @param name
	 *            ：全名(真实姓名)
	 */
	@RequestMapping("/regeister")
	public void regeister(HttpServletRequest request,
			HttpServletResponse response, String roleName, String email,
			String password, String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals, String school_name,
			String major, String class_name, String admission_time) {
		try {
			PrintWriter out = response.getWriter();
			User user = userInterface.getUserBymail(email);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'电子邮件已经注册'}";
				out.write(result);
				return;
			}
			user = userInterface.getUserByUserName(username);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'公开用户名已经注册'}";
				out.write(result);
				return;
			}
			user = userInterface.save(roleName, email, password, username, name,
					gender, mailing_address, year_of_birth, level_of_education,
					goals, school_name, major, class_name, admission_time);
			setSessionUser(request, user);
			List<String> list = new ArrayList();
			list.add(CommonConstant.PERMISSION_1);
			list.add(CommonConstant.PERMISSION_2);
			list.add(CommonConstant.PERMISSION_4);
			userActionService.saveActionList(user.getId(), list);
			setSessionUserAction(request, list);
			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新用户
	 * 
	 * @param name
	 *            ：全名(真实姓名)
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,
			HttpServletResponse response, String email,
			String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals) {
		try {
			PrintWriter out = response.getWriter();
			userInterface.update(email,username, name, gender,
				mailing_address, year_of_birth,level_of_education, goals);
			User user = getSessionUser(request);
			user.setUsername(username);
			setSessionUser(request, user);
			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/sleepfront")
	public ModelAndView sleepfront(HttpServletRequest request) {
		
		setSessionUser(request, null);
		HttpSession session = request.getSession(false);
		session.setAttribute("_const_cas_assertion_", null);
		String url = "redirect:/lms/getteamCategory.action";
		return new ModelAndView(url);
	}
	
	@RequestMapping("/loginout")
	public ModelAndView loginout(HttpServletRequest request) {
		setSessionUser(request, null);
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:"+UtilTools.getConfig().getProperty("SSO_LOGOUT");
		}
		else
		{
			url = "redirect:/lms/getteamCategory.action";
		}
		return new ModelAndView(url);
	}

	/**
	 * 学生登陆
	 * 
	 * @param request
	 * @param response
	 * @param email
	 * @param password
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response,
			String email, String password) {
		try {
			PrintWriter out = response.getWriter();
			User user = userInterface.getUserBymail(email);
			if (user == null) {
				String result = "{'sucess':'fail','msg':'电子邮件不对'}";
				out.write(result);
				return;
			}
			MD5 md5 = new MD5();
			String inputstr = md5.getMD5ofStr(password);
			if (!inputstr.equals(user.getPassword())) {
				String result = "{'sucess':'fail','msg':'登陆密码不对'}";
				out.write(result);
				return;
			}
			Role role = user.getRole();
			user.setRole(role);
			setSessionUser(request, user);
			
			List<UserAction> ualist = userActionService.getActionList(user.getId());
			List<String> list = new ArrayList(); 
			for (UserAction ua:ualist)
			{
				list.add(ua.getAction().getActionname());
			}
			setSessionUserAction(request, list);
			String toUrl = (String) request.getSession().getAttribute(CommonConstant.LOGIN_TO_URL);
			request.getSession().removeAttribute(CommonConstant.LOGIN_TO_URL);
			// 如果当前会话中没有保存登录之前的请求URL，则直接跳转到主页
			if (StringUtils.isEmpty(toUrl)) {
				toUrl = "lms/home.action";
			}
			String result = "{'sucess':'sucess','toUrl':'" + toUrl + "'}";
			out.write(result);
		} catch (Exception e) {
		}
	}

	/**
	 * 个人设置，环境准备，个人课程情况等等总结信息
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/mysetting")
	public ModelAndView mysetting(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		UserProfile up = userInterface.getUserProfileByuserId(user.getId());
		view.addObject("up", up);
		view.setViewName("/lms/mysetting");
		return view;
	}
	
	/**
	 * 我的云平台
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycloudenv")
	public ModelAndView mycloudenv(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		Cloud uc = userCloudService.getMyCloud(user.getId());
		view.addObject("uc", uc);
		view.setViewName("/lms/mycloudenv");
		return view;
	}
	
	/**
	 * 更新我的云平台
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatemycloudenv")
	public void updatemycloudenv(HttpServletRequest request,HttpServletResponse response,String ip,String name,String password) {
		try
		{
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			boolean flag = userCloudService.save(user.getId(), ip, name, password);
			String temp = flag?"sucess":"fail";
			String str = "{'sucess':'"+temp+"'}";
			out.write(str);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 考试系统个人设置，环境准备，个人课程情况等等总结信息
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/myexamenv")
	public ModelAndView myexamenv(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<UserEnvironment> uce = ueService.getMyUCE(user.getId());
		view.addObject("uce", uce);
		view.setViewName("/lms/myenv");
		return view;
	}
	
//	/**
//	 * 判断环境是否已经准备好
//	 * 
//	 * @param request
//	 * @param response
//	 * @param courseId
//	 * @param name
//	 *            :环境名称
//	 */
//	@RequestMapping("/hasenv")
//	public void hasenv(HttpServletRequest request,
//			HttpServletResponse response, int courseId, int trainId, String name) {
//
//		try {
//			User user = getSessionUser(request);
//			PrintWriter out = response.getWriter();
//			UCEnvironment uce = uceService.getMyUCE(user.getId(), courseId,
//					name);
//			UserTrain userTrain = userTrainService.getUserTrain(user.getId(),
//					courseId, trainId);
//			String result = userTrain == null ? "" : userTrain.getResult();
//			String revalue = userTrain == null ? "" : userTrain.getRevalue();
//			if (uce != null) {
//
//				String str = "{'sucess':'sucess','ip':'" + uce.getHostname()
//						+ "','username':'" + uce.getUsername() + "','result':'"
//						+ result + "','revalue':'" + revalue + "','password':'"
//						+ uce.getPassword() + "','ssh':'" + uce.getServerId()
//						+ "'}";
//				out.write(str);
//			} else {
//				String str = "{'sucess':'fail','result':'" + result
//						+ "','revalue':'" + revalue + "'}";
//				out.write(str);
//			}
//		} catch (Exception e) {
//
//		}
//	}
}
