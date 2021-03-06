package com.dhl.lms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.User;
import com.dhl.domain.UserEnvironment;
import com.dhl.service.UserCloudService;
import com.dhl.service.UserEnvironmentService;
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
//	@Autowired
//	private UCEService uceService;
	@Autowired
	private UserEnvironmentService userEnvironmenteService;
	@Autowired
	private UserCloudService userCloudService;
//	@Autowired
//	private UserExamEnvironmentService userExamEnvironmenteService;
	
	//---------考试系统-------------

	@RequestMapping("/createExamServer")
	public void createExamServer(HttpServletRequest request,
			HttpServletResponse response, int examId,int trainId,String name) {
		
		//创建虚拟机的环境暂时先待实现
		
//		try {
//			PrintWriter out = response.getWriter();
//			User user = getSessionUser(request);
//
//			UserEnvironment uce = userEnvironmenteService.getMyUCE(user.getId(), examId, trainId);
//			if (uce != null) {
//				String uh = uce.getHostname();
//				if (uh != null && uh.length() > 0) {
//					out.write(uh);
//				} else {
//
//					String[] servers = userCloudService.createServer(user.getId(),user.getUsername() + System.currentTimeMillis());
//					if (servers == null)
//					{
//						String str = "{'sucess':'fail'}";
//						out.write(str);
//					}
//					else
//					{
//						// 创建成功后，保存hostname
//						String ip = servers[0];
//						String username = servers[1];
//						String password = servers[2];
//						String ssh = servers[3];
//						String str = "{'sucess':'sucess','ip':'" + ip
//								+ "','username':'" + username
//								+ "','password':'" + password + "','ssh':'"
//								+ ssh + "'}";
//						userEnvironmenteService.update(uce, ip, username, password, ssh);
//						out.write(str);
//					}
//				}
//			} else {
//				String[] servers = userCloudService.createServer(user.getId(),user.getUsername() + System.currentTimeMillis());
//				if (servers == null)
//				{
//					String str = "{'sucess':'fail'}";
//					out.write(str);
//				}
//				else
//				{
//					// 创建成功后，保存hostname
//					String ip = servers[0];
//					String username = servers[1];
//					String password = servers[2];
//					String ssh = servers[3];
//					String str = "{'sucess':'sucess','ip':'" + ip
//							+ "','username':'" + username + "','password':'"
//							+ password + "','ssh':'" + ssh + "'}";
//					userEnvironmenteService.save(user.getId(),examId,trainId, name, ip, username,
//							password, ssh);
//					out.write(str);
//				}
//			}
//
//		} catch (Exception e) {
//			PrintWriter out = null;
//			try {
//				out = response.getWriter();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			} finally {
//				String str = "{'sucess':'fail'}";
//				if (out != null)
//					out.write(str);
//			}
//		}
	}

	@RequestMapping("/deleteExamEnv")
	public ModelAndView deleteExamEnv(HttpServletRequest request,
			HttpServletResponse response, int id) {
		User user = getSessionUser(request);
		UserEnvironment uce = userEnvironmenteService.get(id);
		if (uce != null) {
			String uh = null;//uce.getServerId();
			if (uh != null && uh.length() > 0) {
				userCloudService.delServer(user.getId(),uh);
			}
			userEnvironmenteService.delete(uce);
		}
		String url = "redirect:/lms/myexamenv.action";
		return new ModelAndView(url);
	}
	
	//---------考试系统结束-------------
	
}
