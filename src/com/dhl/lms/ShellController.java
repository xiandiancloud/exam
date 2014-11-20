package com.dhl.lms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.SCPClient;

import com.dhl.domain.RestShell;
import com.dhl.domain.UserEnvironment;
import com.dhl.domain.UserQuestion;
import com.dhl.service.UCEService;
import com.dhl.service.UserEnvironmentService;
import com.dhl.service.UserQuestionService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;
import com.xiandian.model.User;

/**
 * 实验提交检测control
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class ShellController extends BaseController {
	
	@Autowired
	private UserQuestionService userQuestionService;
//	@Autowired
//	private UserTrainService userTrainService;
	// @Autowired
	// private UserCourseService userCourseService;
	@Autowired
	private UCEService uceService;
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private UserEnvironmentService userEnvironmenteService;
//	@Autowired
//	private UserExamEnvironmentService userExamEnvironmenteService;
	
	//-------------考试系统-------------------
	@RequestMapping("/myExamShell")
	public void myExamShell(HttpServletRequest request,
			HttpServletResponse response, int examId, int trainId,
			String name, String path) {
		try {
			String rp = request.getSession().getServletContext()
					.getRealPath("/");
			System.out.println(rp);
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			
			//远程上传文件传递--------要考虑实现方式（1 系统一次性对拷实现脚本2判断是否有检测脚本）
			String restid = UtilTools.getConfig().getProperty("RESTHOST_ID");
			String restusername = UtilTools.getConfig().getProperty("RESTHOST_USERNAME");
			String restpassword = UtilTools.getConfig().getProperty("RESTHOST_PASSWORD");
			Connection conn = UtilTools.getConnection(restid, restusername, restpassword);
			if (conn != null) {
//				Session ssh = conn.openSession();
				SCPClient scpClient = conn.createSCPClient();
				scpClient.put(rp + path, "/tmp", "0755");
			}
			conn.close();
			System.out.println("path ---------- " + path);
			UserEnvironment uce = userEnvironmenteService.getMyUCE(user.getId(), examId, trainId);
			if (uce != null)
			{
				String ip = uce.getHostname();
				String userName = uce.getUsername();
				String passWord = uce.getPassword();
				
				RestShell rs = new RestShell();
				rs.setIp(ip);
				rs.setUserName(userName);
				rs.setPassWord(passWord);
				rs.setPath(path);
				HttpEntity<RestShell> entity = new HttpEntity<RestShell>(rs);
				
				String resturl = UtilTools.getConfig().getProperty("REST_URL");
				ResponseEntity<RestShell> res = restTemplate.postForEntity(resturl, 
						entity, RestShell.class);
				
				RestShell e = res.getBody();
				
				String rdata = e.getCondition();
				String result = e.getResult();
				result = UtilTools.replaceBr(result);
				
				UserQuestion uq = userQuestionService.getUserExamTrainQuestion(user.getId(), examId, trainId);
				if (uq == null) {
					userQuestionService.saveQuestionTrain(user.getId(), examId, trainId,rdata,result);
				} else {
					userQuestionService.updateQuestionTrain(uq, user.getId(), rdata,result);
				}
				String str = "{'sucess':'sucess','result':'" + result + "','revalue':'"
						+ rdata + "'}";

				out.write(str);
			}
			else
			{
				String str = "{'sucess':'fail','msg':'环境还没有创建'}";

				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally {
				String str = "{'user':'error','msg':'服务器有异常，请联系管理员'}";
				if (out != null)
					out.write(str);
			}
		}
	}
	
	/**
	 * 用户提交自己的答案
	 * @param useranswer
	 */
	@RequestMapping("/submituseranswer")
	public void submituseranswer(HttpServletRequest request,
			HttpServletResponse response, int examId, int trainId,String useranswer) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			
			UserQuestion uq = userQuestionService.getUserExamTrainQuestion(user.getId(), examId, trainId);
			if (uq == null) {
				userQuestionService.saveUserAnswer(user.getId(), examId, trainId,useranswer);
			} else {
				userQuestionService.updateUserAnswer(uq, user.getId(), useranswer);
			}
			String str = "{'sucess':'sucess'}";
			out.write(str);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//------------------------------------------------------------
	
//	@RequestMapping("/myshell")
//	public void myshell(HttpServletRequest request,
//			HttpServletResponse response, int courseId, int trainId,
//			String name, String path) {
//		try {
//			String rp = request.getSession().getServletContext()
//					.getRealPath("/");
//			System.out.println(rp);
//			PrintWriter out = response.getWriter();
//			User user = getSessionUser(request);
//				System.out.println("path ---------- " + path);
//				// ----------shell start--------------
//				UCEnvironment uce = uceService.getMyUCE(user.getId(), courseId,
//						name);
//				if (uce != null)
//				{
//					String ip = uce.getHostname();
//					String userName = uce.getUsername();
//					String passWord = uce.getPassword();
//					
//					RestShell rs = new RestShell();
//					rs.setIp(ip);
//					rs.setUserName(userName);
//					rs.setPassWord(passWord);
//					rs.setPath(path);
//					HttpEntity<RestShell> entity = new HttpEntity<RestShell>(rs);
//					
//					String resturl = UtilTools.getConfig().getProperty("REST_URL");
//					ResponseEntity<RestShell> res = restTemplate.postForEntity(resturl, 
//							entity, RestShell.class);
//					
//					RestShell e = res.getBody();
//					
//					String rdata = e.getCondition();
//					String result = e.getResult();
//					result = UtilTools.replaceBr(result);
//					UserTrain userTrain = userTrainService.getUserTrain(
//							user.getId(), courseId, trainId);
//					if (userTrain == null) {
//						UserTrain ut = new UserTrain();
//						ut.setCounts(1);
//						ut.setResult(result);
//						ut.setRevalue(rdata);
//						ut.setCourseId(courseId);
//						ut.setUserId(user.getId());
//						ut.setTrainId(trainId);
//						// ut.setVerticalId(verticalId);
//						userTrainService.save(ut);
//					} else {
//						userTrain.setCounts(userTrain.getCounts() + 1);
//						userTrain.setResult(result);
//						userTrain.setRevalue(rdata);
//						userTrainService.update(userTrain);
//					}
//
//					String str = "{'sucess':'sucess','result':'" + result + "','revalue':'"
//							+ rdata + "'}";
//
//					out.write(str);
//				}
//				else
//				{
//					String str = "{'sucess':'fail','msg':'环境还没有创建'}";
//
//					out.write(str);
//				}
//		} catch (Exception e) {
//			e.printStackTrace();
//			PrintWriter out = null;
//			try {
//				out = response.getWriter();
//			} catch (IOException e1) {
//				e1.printStackTrace();
//			} finally {
//				String str = "{'user':'error','msg':'服务器有异常，请联系管理员'}";
//				if (out != null)
//					out.write(str);
//			}
//		}
//	}

}
