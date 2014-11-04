package com.dhl.web;

import javax.servlet.http.HttpServletRequest;

import org.jasig.cas.client.util.AssertionHolder;
import org.springframework.beans.factory.annotation.Autowired;

import com.dhl.cons.CommonConstant;
import com.dhl.util.UtilTools;
import com.xiandian.cai.UserInterface;
import com.xiandian.model.User;

/**
 * 
 * <br>
 * <b>类描述:</b>
 * 
 * <pre>
 * 所有Controller的基类
 * </pre>
 * 
 * @see
 * @since
 */
public class BaseController {
	
	@Autowired
	private UserInterface userInterface;
	
	/**
	 * 获取保存在Session中的用户对象
	 * 
	 * @param request
	 * @return
	 */
	protected User getSessionUser(HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute(CommonConstant.USER_CONTEXT);
		if (user == null)
		{
			int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
			if (type == CommonConstant.SSO_CAS)
			{
				String name = request.getRemoteUser();
				if (name != null)
				{
					user = userInterface.getUserBymail(name);
					setSessionUser(request,user);
				}
			}
		}
		return user;
	}
	
	/**
	 * 保存用户对象到Session中
	 * @param request
	 * @param user
	 */
	protected void setSessionUser(HttpServletRequest request,User user) {
		request.getSession().setAttribute(CommonConstant.USER_CONTEXT,
				user);
	}
	
}
