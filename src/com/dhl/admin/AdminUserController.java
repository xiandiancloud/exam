package com.dhl.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Role;
import com.dhl.domain.User;
import com.dhl.service.UserService;
import com.dhl.util.MD5;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

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
	private UserService userService;

	/**
	 * 管理员到用户頁面
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/importuser")
	public ModelAndView importuser(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		List<User> userlist = userService.getAllUser();
		view.addObject("userlist", userlist);
		view.setViewName("/admin/importuser");
		return view;
	}
	
	
	@RequestMapping("/uploaduser")
	public void uploaduser(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="qqfile", required=true) MultipartFile file)
	{
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			out.print("{\"success\": \"false\"}");
		}
		try
		{
			if (!file.isEmpty()) {
				BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream(),"GBK"));
				// 读取直到最后一行 
				String line = ""; 
				while ((line = br.readLine()) != null) {
					// 把一行数据分割成多个字段 
					String[] strs = line.split(",");
//					System.out.println("---------- "+strs.length);
					if (strs != null && strs[0] != null && strs[0].substring(0,1).equals("#"))
					{
						continue;
					}
//					int len = strs.length;
//					for (int i=0;i<len;i++)
					
					{
						User user = userService.getUserBymail(strs[1]);
						if (user != null)
						{
							continue;
						}
						userService.save(strs[0], strs[1], strs[2], strs[3], strs[4],
								strs[5], strs[6], strs[7], strs[8],
								strs[9],strs[10],"","","");
					}
				}
				br.close();
				out.print("{\"success\": \"true\"}");
			}
			else
			{
				out.print("{\"success\": \"false\"}");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			out.print("{\"success\": \"false\"}");
		}
	}
	
	/**
	 * 跳轉到管理员登錄介面
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin")
	public ModelAndView admin(HttpServletRequest request) {
		String url = "";
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:/admin/school.action";
		}
		else
		{
			User user = getSessionUser(request);
			if (user == null)
			{
				ModelAndView view = new ModelAndView();
				view.setViewName("/admin/signin");
				url = "/admin/signin";
			}
			else
			{
				Role role = user.getRole();//userInterface.getUserRoleByuserId(user.getId());
				if (!CommonConstant.ROLE_A.equals(role.getRoleName())) {
					url = "redirect:/lms/getteamCategory.action";
				}
			}
		}
		return new ModelAndView(url);
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
	}
	
	/**
	 * 管理员退出
	 * @param request
	 * @return
	 */
	@RequestMapping("/aloginout")
	public ModelAndView aloginout(HttpServletRequest request) {
		setSessionUser(request, null);
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:"+UtilTools.getConfig().getProperty("SSO_LOGOUT");
		}
		else
		{
			url = "/admin/signin";
		}
		return new ModelAndView(url);
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
			String username, String password) {
		try {
			PrintWriter out = response.getWriter();
			User user = userService.getUserByUserName(username);//.getUserBymail(email);
			if (user == null) {
				String result = "{'sucess':'fail','msg':'用户名不对'}";
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
				String result = "{'sucess':'fail','msg':'用户名不是管理员身份'}";
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
