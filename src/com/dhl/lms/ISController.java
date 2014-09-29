package com.dhl.lms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.UCEnvironment;
import com.dhl.domain.User;
import com.dhl.domain.UserExamEnvironment;
import com.dhl.service.UCEService;
import com.dhl.service.UserExamEnvironmentService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 创建环境的control
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class ISController extends BaseController {
	// @Autowired
	// private UserTrainService userTrainService;
	@Autowired
	private UCEService uceService;

	@Autowired
	private UserExamEnvironmentService userExamEnvironmenteService;
	
	//---------考试系统-------------

	@RequestMapping("/createExamServer")
	public void createExamServer(HttpServletRequest request,
			HttpServletResponse response, int examId, String name) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);

			UserExamEnvironment uce = userExamEnvironmenteService.getMyUCE(user.getId(), examId,
					name);
			if (uce != null) {
				String uh = uce.getHostname();
				if (uh != null && uh.length() > 0) {
					// zai wansh
					out.write(uh);
				} else {

					String[] servers = UtilTools.createServer(user.getUsername() + System.currentTimeMillis());

					// 创建成功后，保存hostname
					String ip = servers[0];
					String username = servers[1];
					String password = servers[2];
					String ssh = servers[3];
					String str = "{'sucess':'sucess','ip':'" + ip
							+ "','username':'" + username
							+ "','password':'" + password + "','ssh':'"
							+ ssh + "'}";
					userExamEnvironmenteService.update(uce, ip, username, password, ssh);
					out.write(str);
				}
			} else {
				String[] servers = UtilTools.createServer(user.getUsername() + System.currentTimeMillis());
				// 创建成功后，保存hostname
				String ip = servers[0];
				String username = servers[1];
				String password = servers[2];
				String ssh = servers[3];
				String str = "{'sucess':'sucess','ip':'" + ip
						+ "','username':'" + username + "','password':'"
						+ password + "','ssh':'" + ssh + "'}";
				userExamEnvironmenteService.save(user.getId(), examId, name, ip, username,
						password, ssh);
				out.write(str);
			}

		} catch (Exception e) {
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				String str = "{'sucess':'fail'}";
				if (out != null)
					out.write(str);
			}
		}
	}

	@RequestMapping("/deleteExamEnv")
	public ModelAndView deleteExamEnv(HttpServletRequest request,
			HttpServletResponse response, int id) {
		UserExamEnvironment uce = userExamEnvironmenteService.get(id);
		if (uce != null) {
			String uh = uce.getServerId();
			if (uh != null && uh.length() > 0) {
				UtilTools.delServer(uh);
			}
			userExamEnvironmenteService.delete(uce);
		}
		String url = "redirect:/lms/setting.action?index=2";
		return new ModelAndView(url);
	}
	
	//---------考试系统结束-------------
	
	@RequestMapping("/createServer")
	public void createServer(HttpServletRequest request,
			HttpServletResponse response, int courseId, String name) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
//			if (user == null) {
//				String str = "{'sucess':'fail'}";
//				out.write(str);
//			} else {

				UCEnvironment uce = uceService.getMyUCE(user.getId(), courseId,
						name);
				if (uce != null) {
					String uh = uce.getHostname();
					if (uh != null && uh.length() > 0) {
						// zai wansh
						out.write(uh);
					} else {

						String[] servers = UtilTools.createServer(user.getUsername() + System.currentTimeMillis());

						// 创建成功后，保存hostname
						String ip = servers[0];
						String username = servers[1];
						String password = servers[2];
						String ssh = servers[3];
						String str = "{'sucess':'sucess','ip':'" + ip
								+ "','username':'" + username
								+ "','password':'" + password + "','ssh':'"
								+ ssh + "'}";
						uceService.update(uce, ip, username, password, ssh);
						out.write(str);
					}
				} else {
					String[] servers = UtilTools.createServer(user.getUsername() + System.currentTimeMillis());
					// 创建成功后，保存hostname
					String ip = servers[0];
					String username = servers[1];
					String password = servers[2];
					String ssh = servers[3];
					String str = "{'sucess':'sucess','ip':'" + ip
							+ "','username':'" + username + "','password':'"
							+ password + "','ssh':'" + ssh + "'}";
					uceService.save(user.getId(), courseId, name, ip, username,
							password, ssh);
					out.write(str);
				}

//			}
		} catch (Exception e) {
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				String str = "{'sucess':'fail'}";
				if (out != null)
					out.write(str);
			}
		}
	}

	@RequestMapping("/deleteEnv")
	public ModelAndView delServer(HttpServletRequest request,
			HttpServletResponse response, int id) {
		UCEnvironment uce = uceService.get(id);
		if (uce != null) {
			String uh = uce.getServerId();
			if (uh != null && uh.length() > 0) {
				UtilTools.delServer(uh);
			}
		}
		uceService.delete(id);
		String url = "redirect:/lms/setting.action?index=2";
		return new ModelAndView(url);
	}
}
