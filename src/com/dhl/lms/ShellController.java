package com.dhl.lms;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Cloud;
import com.dhl.domain.RestShell;
import com.dhl.domain.TrainExt;
import com.dhl.domain.UserQuestion;
import com.dhl.service.EnvironmentService;
import com.dhl.service.TrainService;
import com.dhl.service.UserCloudService;
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
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private UserEnvironmentService userEnvironmenteService;
	@Autowired
	private EnvironmentService environmenteService;
	@Autowired
	private UserCloudService userCloudService;
	@Autowired
	private TrainService trainService;
	
	@RequestMapping("/myExamShell")
	public void myExamShell(HttpServletRequest request,
			HttpServletResponse response, int examId, int trainId,
			String name) {
		try {
			String rp = request.getSession().getServletContext()
					.getRealPath("/");
			System.out.println(rp);
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			
			//远程上传文件传递--------要考虑实现方式（1 系统一次性对拷实现脚本2判断是否有检测脚本）
			Cloud cloud = userCloudService.getMyCloud(user.getId());
			String str = "";
			if (cloud == null)
			{
				str = "{'sucess':'fail','msg':'你还没有配置你的云平台'}";
				out.write(str);
				return;
			}
			String restid = cloud.getIp();//UtilTools.getConfig().getProperty("RESTHOST_ID");
			String restusername = cloud.getName();//UtilTools.getConfig().getProperty("RESTHOST_USERNAME");
			String restpassword = cloud.getPassword();//UtilTools.getConfig().getProperty("RESTHOST_PASSWORD");
			Connection conn = UtilTools.getConnection(restid, restusername, restpassword);
			if (conn != null) {
//				Session ssh = conn.openSession();
				SCPClient scpClient = conn.createSCPClient();
				
				List<TrainExt> trainExtList = trainService.getTrainExtList(trainId);
				int len = trainExtList.size();
				String rdata = "";
				for (int i=0;i<len;i++)
				{
					TrainExt te = trainExtList.get(i);
//					int number = i+1;
					String shellpath = te.getShellpath();
					String shellparameter = te.getShellparameter();
					if (shellpath ==null)
					{
						str = "{'sucess':'fail','msg':'检测脚本为空'}";
						out.write(str);
						return;
					}
					scpClient.put(rp + shellpath, "/tmp", "0755");
					String devinfo = te.getDevinfo();
					//到指定的云环境查找
					if (devinfo != null && !"".equals(devinfo))
					{
						
						String ip;// = environmenteService.getDevIP(devinfo);
						String userName;// = environmenteService.getDevUserName(devinfo.substring(0,devinfo.lastIndexOf('.'))+".username");
						String passWord;// = environmenteService.getDevPassword(devinfo.substring(0,devinfo.lastIndexOf('.'))+".password");
						if (CommonConstant.CONTROL_NODE.equals(devinfo))
						{
							ip = restid;
							userName = restusername;
							passWord = restpassword;
						}
						else if (CommonConstant.DYNAMIC.equals(devinfo))//动态模板
						{
							ip = "";
							userName = "";
							passWord = "";
						}
						else
						{
							ip = environmenteService.getDevIP(devinfo);
							userName = environmenteService.getDevUserName(devinfo.substring(0,devinfo.lastIndexOf('.'))+".username");
							passWord = environmenteService.getDevPassword(devinfo.substring(0,devinfo.lastIndexOf('.'))+".password");
						}
						RestShell rs = new RestShell();
						rs.setIp(ip);
						rs.setUserName(userName);
						rs.setPassWord(passWord);
						rs.setPath(shellpath);
						rs.setShellparameter(shellparameter);
						HttpEntity<RestShell> entity = new HttpEntity<RestShell>(rs);
						
						String resturl = "http://"+restid+":8080/restdemo/service/shell";//UtilTools.getConfig().getProperty("REST_URL");
						ResponseEntity<RestShell> res = restTemplate.postForEntity(resturl, 
								entity, RestShell.class);
						
						RestShell e = res.getBody();
						
						rdata += e.getCondition();
						if (i < (len -1))
						{
							rdata += "</hr>";
						}
						//检测返回值取得判断正确与否
//						String result = e.getResult();
//						result = UtilTools.replaceBr(result);
//						str = "{'sucess':'sucess','revalue':'"+ rdata + "'}";
					}
					else
					{
						str = "{'sucess':'fail','msg':'脚本运行环境为空'}";
						out.write(str);
						return;
						
//						UserEnvironment uce = userEnvironmenteService.getMyUCE(user.getId(), examId, trainId);
//						if (uce != null)
//						{
//							String ip = uce.getHostname();
//							String userName = uce.getUsername();
//							String passWord = uce.getPassword();
//							
//							RestShell rs = new RestShell();
//							rs.setIp(ip);
//							rs.setUserName(userName);
//							rs.setPassWord(passWord);
//							rs.setPath(shellpath);
//							rs.setShellparameter(shellparameter);
//							HttpEntity<RestShell> entity = new HttpEntity<RestShell>(rs);
//							
//							String resturl = UtilTools.getConfig().getProperty("REST_URL");
//							ResponseEntity<RestShell> res = restTemplate.postForEntity(resturl, 
//									entity, RestShell.class);
//							
//							RestShell e = res.getBody();
//							
//							rdata += e.getCondition();
//							if (i < (len -1))
//							{
//								rdata += "</hr>";
//							}
//						}
//						else
//						{
//							str = "{'sucess':'fail','msg':'环境还没有创建'}";
//							out.write(str);
//							return;
//						}
					}
				}
				if (rdata != null)
				{
					rdata = UtilTools.encoding(rdata);
				}
				UserQuestion uq = userQuestionService.getUserExamTrainQuestion(user.getId(), examId, trainId);
				if (uq == null) {
					userQuestionService.saveQuestionTrain(user.getUsername(),user.getId(), examId, trainId,rdata,1);
				} else {
					userQuestionService.updateQuestionTrain(user.getUsername(),uq, user.getId(),examId,trainId, rdata,1);
				}
				
				conn.close();
				str = "{'sucess':'sucess'}";
			}
			else
			{
				str = "{'sucess':'fail','msg':'控制节点连接不上'}";
			}
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally {
				String str = "{'sucess':'fail','msg':'服务器有异常，请联系管理员'}";
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

}
