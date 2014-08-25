package com.dhl.cms;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Role;
import com.dhl.domain.User;
import com.dhl.service.UserService;
import com.dhl.util.MD5;
import com.dhl.web.BaseController;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CmsUserController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private UserService userService;

	/**
	 * 跳转到注册页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toregeister")
	public ModelAndView toregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/regeister");
		return view;
	}

	/**
	 * 注册老师
	 * 
	 * @param name
	 *            ：全名(真实姓名)
	 */
	@RequestMapping("/tregeister")
	public void tregeister(HttpServletRequest request,
			HttpServletResponse response, String roleName, String email,
			String password, String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals) {
		try {
			PrintWriter out = response.getWriter();
			User user = userService.getUserBymail(email);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'电子邮件已经注册'}";
				out.write(result);
				return;
			}
			user = userService.getUserByUserName(username);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'公开用户名已经注册'}";
				out.write(result);
				return;
			}
			user = userService.save(roleName, email, password, username, name,
					gender, mailing_address, year_of_birth, level_of_education,
					goals);
			setSessionUser(request, user);

			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 老师退出
	 * @param request
	 * @return
	 */
	@RequestMapping("/tloginout")
	public ModelAndView tloginout(HttpServletRequest request) {
		setSessionUser(request, null);
		String url = "redirect:/getAllCategory.action";

		return new ModelAndView(url);
	}

	/**
	 * 老师登陆
	 * @param request
	 * @param response
	 * @param email
	 * @param password
	 */
	@RequestMapping("/tlogin")
	public void tlogin(HttpServletRequest request, HttpServletResponse response,
			String email, String password) {
		try {
			PrintWriter out = response.getWriter();
			User user = userService.getUserBymail(email);
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
			
			Role role = userService.getUserRoleByuserId(user.getId());
			if (!CommonConstant.ROLE_T.equals(role.getRoleName()))
			{
				String result = "{'sucess':'fail','msg':'登陆邮件不是老师身份'}";
				out.write(result);
				return;
			}
			setSessionUser(request, user);

			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
		}
	}
	
}
