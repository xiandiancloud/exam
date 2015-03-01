package com.dhl.cms;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.bean.UserCompetionData;
import com.dhl.cons.CommonConstant;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionCategory;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.CompetionSchool;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.service.CompetionService;
import com.dhl.service.ExamService;
import com.dhl.service.TeacherExamService;
import com.dhl.service.UserCompetionService;
import com.dhl.service.UserService;
import com.dhl.util.MySqlImportAndExport;
import com.dhl.web.BaseController;

/**
 * 定义竞赛等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CompetionController extends BaseController {

	@Autowired
	private CompetionService competionService;
	@Autowired
	private UserCompetionService usercompetionService;
	@Autowired
	private ExamService examService;
	@Autowired
	private TeacherExamService teacherExamService;
	@Autowired
	private UserService userService;
	@Autowired
	private RestTemplate restTemplate;
	
	/**
	 * 到竞赛页面
	 * @param request
	 * @param competionId
	 * @return
	 */
	@RequestMapping("/totcompetion")
	public ModelAndView totcompetion(HttpServletRequest request,int competionId) {
		ModelAndView view = new ModelAndView();
		
		Competion competion = competionService.get(competionId);
		view.addObject("competion", competion);
		//竞赛裁判
		List<UserCompetion> uclist = usercompetionService.getCompetionjudgment(competionId);
		for (UserCompetion uc:uclist)
		{
			User user = userService.getUserById(uc.getUserId());
			uc.setUser(user);
		}
		view.addObject("judgmentlist", uclist);
		// Exam course = examService.get(examId);
		// view.addObject("exam", course);
		//竞赛试卷
		List<CompetionExam> celist = competionService.getCompetionExam(competionId);
		for (CompetionExam ce:celist)
		{
			TeacherExam te = teacherExamService.getTeacherExamByExamId(ce.getExam().getId());
			ce.setExamuser(userService.getUserById(te.getUserId()).getUsername());
			if (ce.getSelectexam() == 1)
			{
				view.addObject("sexam", ce);
			}
		}
		view.addObject("celist", celist);
		//竞赛学生
		List<UserCompetionData> ucslist = usercompetionService.getCompetionStudentData(competionId);
		view.addObject("studentlist", ucslist);
		
		view.setViewName("/cms/competion");
		return view;
	}
	
	/**
	 * 导出学生竞赛信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportdata")
	public void exportdata(HttpServletRequest request,HttpServletResponse response,int competionId) {
		try {
			
			List<UserCompetionData> list = usercompetionService.getCompetionStudentData(competionId);
			
//			 String path = request.getSession().getServletContext().getRealPath("/export/");
//			 File file = new File(path+"/比赛信息.csv");
//			 if (!file.exists())
//			 {
//				 file.createNewFile();
//			 }
			 
//			 FileOutputStream out=null;
//		        OutputStreamWriter osw=null;
//		        BufferedWriter bw=null;
		        StringBuffer sb = new StringBuffer();
		        try {
//		            out = new FileOutputStream(file);
//		            osw = new OutputStreamWriter(out);
//		            bw =new BufferedWriter(osw);
		            sb.append("#").append("学生编号,比赛成绩").append("\r");
		            if(list!=null && !list.isEmpty()){
		            	
		                for(UserCompetionData ucd : list){
		                	sb.append(ucd.getUsername()).append(",").append(ucd.getScore()+"").append("\r");
		                }
		            }
		        } catch (Exception e) {
		        }finally{
//		            if(bw!=null){
//		            	   bw.close();
//		                    bw=null;
//		            }
//		            if(osw!=null){
//		            	 osw.close();
//		                    osw=null; 
//		            }
//		            if(out!=null){
//		            	 out.close();
//		                    out=null;
//		            }
		        }
	            // 以流的形式下载文件。
//	            InputStream fis = new BufferedInputStream(new FileInputStream(file));
//	            byte[] buffer = new byte[fis.available()];
//	            fis.read(buffer);
//	            fis.close();
//	            // 清空response
//	            response.reset();
//	            // 设置response的Header
//	            response.addHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("UTF-8"),"ISO-8859-1"));
//	            response.addHeader("Content-Length", "" + file.length());
//	            response.setContentType("application/octet-stream");
//	            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
//	            //加上UTF-8文件的标识字符      
//	            toClient.write(new byte []{(byte) 0xEF ,(byte) 0xBB ,(byte) 0xBF});
//	            toClient.write(buffer);
//	            toClient.flush();
//	            toClient.close();
	            
	            OutputStreamWriter outw = new OutputStreamWriter(response.getOutputStream(), "UTF-8");  
		         // 要输出的内容  
//		         result = (String)contentMap.get(RESPONSE_RESULT);  
	            response.setHeader("Content-Disposition", "attachment;filename="+new String("比赛信息.csv".getBytes("UTF-8"),"ISO-8859-1"));  
	            outw.write(new String(new byte[] { (byte) 0xEF, (byte) 0xBB,(byte) 0xBF }));  
	            outw.write(sb.toString());  
	            outw.flush();
	         
	            
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出整个
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportsql")
	public void exportsql(HttpServletRequest request,HttpServletResponse response) {
		try {
			 String path = request.getSession().getServletContext().getRealPath("/export/");
			 File file = new File(path+"/data.sql");
			 if (!file.exists())
			 {
				 file.createNewFile();
			 }
			String exportPath = path+"/data.sql";
            MySqlImportAndExport.export(exportPath);
          
            long fileLength = file.length();
			//
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String("data.sql".getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			bis.close();
			bos.close();

			file.delete();
	            
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 到竞赛的命卷页面
	 * @param request
	 * @param competionId
	 * @return
	 */
	@RequestMapping("/totcompetionmt")
	public ModelAndView totcompetionmt(HttpServletRequest request,int competionId) {
		ModelAndView view = new ModelAndView();
		
		Competion competion = competionService.get(competionId);
		view.addObject("competion", competion);
		//竞赛试卷
		List<CompetionExam> list = competionService.getCompetionExam(competionId);
		List<CompetionExam> celist = new ArrayList();
		User user = getSessionUser(request);
		for (CompetionExam ce:list)
		{
			TeacherExam te = teacherExamService.getTeacherExamByExamId(ce.getExam().getId());
			
			ce.setExamuser(userService.getUserById(te.getUserId()).getUsername());
			if (user.getId() == te.getUserId())
			{
				celist.add(ce);
			}
		}
		view.addObject("celist", celist);
				
		view.setViewName("/cms/competionmt");
		return view;
	}
	
	/**
	 * 到竞赛的评分页面
	 * @param request
	 * @param competionId
	 * @return
	 */
	@RequestMapping("/totcompetionpf")
	public ModelAndView totcompetionpf(HttpServletRequest request,int competionId) {
		ModelAndView view = new ModelAndView();
		
		Competion competion = competionService.get(competionId);
		view.addObject("competion", competion);
		//竞赛学生
		List<UserCompetionData> ucslist = usercompetionService.getCompetionStudentData(competionId);
		view.addObject("studentlist", ucslist);
		
		CompetionExam ce = competionService.getCompetionSelectExam(competionId);
		view.addObject("ceexam", ce);
		view.setViewName("/cms/competionpf");
		return view;
	}
	/**
	 * 创建竞赛
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createcompetion")
	public void createcompetion(HttpServletRequest request,
			HttpServletResponse response,String imgpath,int rank,int categoryId, String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, String score, String passscore, String describle, String schoolId) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user != null) {
				Competion c = competionService.createCompetion(imgpath, rank, categoryId,name, starttime,
						endtime, wstarttime, wendtime, examstarttime,
						examendtime, score, passscore, describle,
						schoolId, user);

				String str = "{'sucess':'sucess','competionId':'" + c.getId()
						+ "'}";
				out.write(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建竞赛
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/updatecompetion")
	public void updatecompetion(HttpServletRequest request,
			HttpServletResponse response,String imgpath,int rank,int categoryId,int competionId, String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, String score, String passscore, String describle, String schoolId) {
		try {
			PrintWriter out = response.getWriter();
			competionService.updateCompetion(imgpath, rank,categoryId,competionId,name, starttime,
					endtime, wstarttime, wendtime, examstarttime,
					examendtime, score, passscore, describle,
					schoolId);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 增加竞赛裁判
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/addcompetionjudgment")
	public void addcompetionjudgment(HttpServletRequest request,
			HttpServletResponse response, int userId, int competionId,
			String job) {
		try {
			PrintWriter out = response.getWriter();
			usercompetionService.save(userId, competionId, job);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除竞赛裁判
	 * @param request
	 * @param response
	 * @param competionId
	 * @param userId
	 */
	@RequestMapping("/delcompetionjudgment")
	public void delcompetionjudgment(HttpServletRequest request,HttpServletResponse response,String competionId,String userId) {
		try {
			PrintWriter out = response.getWriter();
			usercompetionService.removeCompetionjudgment(Integer.parseInt(competionId), Integer.parseInt(userId));
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 竞赛创建试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/addexam")
	public void addexam(HttpServletRequest request,
			HttpServletResponse response,int userId,int competionId, String name,int categoryId) {
		try {
			PrintWriter out = response.getWriter();
			examService.createExam(name, userId, competionId,categoryId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 竞赛删除试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/deleteexam")
	public void deleteexam(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
		try {
			PrintWriter out = response.getWriter();
			examService.removeExam(competionId,examId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 竞赛选择试卷
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/selectexam")
	public void selectexam(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
		try {
			PrintWriter out = response.getWriter();
			String time = examService.selectexam(competionId,examId);
			String str = "{'sucess':'sucess','time':'"+time+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 得到可以命题的老师
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getCompetionMjudgment")
	public void getCompetionMjudgment(HttpServletRequest request,HttpServletResponse response,int competionId) {
		
		try {
			PrintWriter out = response.getWriter();
			List<UserCompetion> uclist = usercompetionService.getCompetionMjudgment(competionId);
			String str = getMjudgment(uclist);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 锁定竞赛下的所有试卷
	 * @param request
	 * @param response
	 */
	@RequestMapping("/lockallexam")
	public void lockallexam(HttpServletRequest request,HttpServletResponse response,int competionId) {
		
		try {
			PrintWriter out = response.getWriter();
			competionService.lockallexam(competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 解锁竞赛下的所有试卷
	 * @param request
	 * @param response
	 */
	@RequestMapping("/unlockallexam")
	public void unlockallexam(HttpServletRequest request,HttpServletResponse response,int competionId,int examId) {
		
		try {
			PrintWriter out = response.getWriter();
			competionService.unlockallexam(competionId,examId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param list
	 * @return
	 */
	private String getMjudgment(List<UserCompetion> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			UserCompetion p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getUserId() + "\"");
			buffer.append(",\"name\":");
			String name = userService.getUserById(p.getUserId()).getUsername();
			buffer.append("\"" + name + "\"");
			buffer.append("},");
		}
		if (count > 0) {
			String str = buffer.substring(0, buffer.length() - 1) + "]}";
			str = str.replaceAll("null", "");
			return str;
		} else {
			String str = buffer.toString() + "]}";
			str = str.replaceAll("null", "");
			return str;
		}
	}
	
	/**
	 * 增加竞赛学生
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/addcompetionuser")
	public void addcompetionuser(HttpServletRequest request,
			HttpServletResponse response,String users,int competionId) {
		try {
			PrintWriter out = response.getWriter();
			if (users != null)
			{
				String[] strs = users.split(",");
				//性能有问题再修改统一提交
				int len = strs.length;
				for (int i=0;i<len;i++)
				{
					usercompetionService.save(Integer.parseInt(strs[i]), competionId, CommonConstant.CROLE_5);
				}
			}
			//examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除竞赛学生
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/delcompetionuser")
	public void delcompetionuser(HttpServletRequest request,
			HttpServletResponse response,int id) {
		try {
			PrintWriter out = response.getWriter();
			usercompetionService.remove(id);
			//examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 开始竞赛
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/startcompetion")
	public void startcompetion(HttpServletRequest request,
			HttpServletResponse response,int competionId) {
		try {
			PrintWriter out = response.getWriter();
//			Competion cp = competionService.get(competionId);
//			cp.setIsstart(1);
			competionService.updateCom(restTemplate,competionId);
			//examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 结束竞赛
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/endcompetion")
	public void endcompetion(HttpServletRequest request,
			HttpServletResponse response,int competionId) {
		try {
			PrintWriter out = response.getWriter();
			Competion cp = competionService.get(competionId);
			cp.setIsstart(0);
			competionService.update(cp);
			//examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 得到竞赛的举办学校
	 * @param request
	 * @param response
	 * @param competionId
	 */
	@RequestMapping("/getExamSchool")
	public void getExamSchool(HttpServletRequest request,
			HttpServletResponse response,int competionId) {
		try {
			PrintWriter out = response.getWriter();
			CompetionSchool cp = competionService.getCompetionSchool(competionId);
			//examService.createExam(name, userId, competionId);
			String str = "{'sucess':'sucess','schoolId':"+cp.getSchoolId()+"}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 得到竞赛的隶属装也
	 * @param request
	 * @param response
	 * @param competionId
	 */
	@RequestMapping("/getCompetionCategory")
	public void getCompetionCategory(HttpServletRequest request,
			HttpServletResponse response,int competionId) {
		try {
			PrintWriter out = response.getWriter();
			CompetionCategory cp = competionService.getCompetionCategory(competionId);
			int id = 0;
			if (cp != null)
			{
				id = cp.getEcategory().getId();
			}
			String str = "{'sucess':'sucess','categoryId':"+id+"}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
