package com.dhl.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.web.BaseController;
import com.xiandian.cai.UserInterface;
import com.xiandian.model.Role;
import com.xiandian.model.User;
import com.xiandian.util.MD5;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/admin")
public class AdminUserController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private UserInterface userInterface;

	/**
	 * 跳轉到管理员登錄介面
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin")
	public ModelAndView admin(HttpServletRequest request) {
		User user = getSessionUser(request);
		if (user == null)
		{
			ModelAndView view = new ModelAndView();
			view.setViewName("/admin/signin");
			return view;
		}
		Role role = user.getRole();
		if (!CommonConstant.ROLE_A.equals(role.getRoleName())) {
			ModelAndView view = new ModelAndView();
			view.setViewName("/admin/signin");
			return view;
		}
		String url = "redirect:/admin/school.action";
		return new ModelAndView(url);
//		ModelAndView view = new ModelAndView();
//		view.setViewName("/admin/signin");
//		return view;
	}
	
	/**
	 * 跳轉到管理员登錄介面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toalogin")
	public ModelAndView toalogin(HttpServletRequest request) {
		User user = getSessionUser(request);
		if (user == null)
		{
			ModelAndView view = new ModelAndView();
			view.setViewName("/admin/signin");
			return view;
		}
		Role role = user.getRole();
		if (!CommonConstant.ROLE_A.equals(role.getRoleName())) {
			ModelAndView view = new ModelAndView();
			view.setViewName("/admin/signin");
			return view;
		}
		String url = "redirect:/admin/school.action";
		return new ModelAndView(url);
//		ModelAndView view = new ModelAndView();
//		view.setViewName("/admin/signin");
//		return view;
	}
	
	/**
	 * 管理员退出
	 * @param request
	 * @return
	 */
	@RequestMapping("/aloginout")
	public ModelAndView aloginout(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		setSessionUser(request, null);
		view.setViewName("/admin/signin");
		return view;
	}

	/**
	 * 管理員登陆
	 * @param request
	 * @param response
	 * @param email
	 * @param password
	 */
	@RequestMapping("/alogin")
	public void alogin(HttpServletRequest request, HttpServletResponse response,
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
			if (!CommonConstant.ROLE_A.equals(role.getRoleName()))
			{
				String result = "{'sucess':'fail','msg':'登陆邮件不是管理员身份'}";
				out.write(result);
				return;
			}
			setSessionUser(request, user);
			String toUrl = (String)request.getSession().getAttribute(CommonConstant.ADMIN_LOGIN_TO_URL);
			request.getSession().removeAttribute(CommonConstant.ADMIN_LOGIN_TO_URL);
			//如果当前会话中没有保存登录之前的请求URL，则直接跳转到主页
			if(StringUtils.isEmpty(toUrl)){
				toUrl = "admin/school.action";
			}
			String result = "{'sucess':'sucess','toaUrl':'"+toUrl+"'}";
			out.write(result);
		} catch (Exception e) {
		}
	}
	
}
