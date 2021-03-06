package com.dhl.cms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.bean.QuestionData;
import com.dhl.cons.CommonConstant;
import com.dhl.domain.ECategory;
import com.dhl.domain.Environment;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamShellEnvironment;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.RestTrain;
import com.dhl.domain.School;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.User;
import com.dhl.domain.UserRole;
import com.dhl.service.ECategoryService;
import com.dhl.service.EnvironmentService;
import com.dhl.service.ExamChapterService;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamSequentialService;
import com.dhl.service.ExamService;
import com.dhl.service.ExamVerticalService;
import com.dhl.service.SchoolService;
import com.dhl.service.TeacherExamService;
import com.dhl.service.TrainService;
import com.dhl.service.UserQuestionService;
import com.dhl.service.UserService;
import com.dhl.util.ParseQuestion;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 老师定义试卷，使用等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class ExamController extends BaseController {
	// 试卷
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamChapterService examchapterService;
	// 小节
	@Autowired
	private ExamSequentialService examsequentialService;
	// 单元
	@Autowired
	private ExamVerticalService examverticalService;
	@Autowired
	private ExamQuestionService examquestionService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private TeacherExamService teacherExamService;
	@Autowired
	private ECategoryService ecategoryService;
	@Autowired
	private EnvironmentService environmentService;
	@Autowired
	private UserService userService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private UserQuestionService userQuestionService;
	//定义单元内容的时候取实训系统的课程
	@Autowired
	private RestTemplate restTemplate;
	
	/**
	 * 老师更新试卷章节次序
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/sortChapter")
	public void sortChapter(HttpServletRequest request,
			HttpServletResponse response,String charpters) {
		try {
			PrintWriter out = response.getWriter();
			examService.sortChapter(charpters);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 老师更新试卷章节次序
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/sortSequential")
	public void sortSequential(HttpServletRequest request,
			HttpServletResponse response,String charpters) {
		try {
			PrintWriter out = response.getWriter();
			examService.sortSequential(charpters);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 老师更新试卷单元次序
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/sortVertical")
	public void sortVertical(HttpServletRequest request,
			HttpServletResponse response,String charpters) {
		try {
			PrintWriter out = response.getWriter();
			examService.sortVertical(charpters);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//判断是否是竞赛试卷，并且试卷锁定
	private boolean examPermission(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			int lock = exam.getLockexam();
			if (lock == 1)
			{
				return true;
			}
		}
		return false;
	}
	
	
	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms")
	public ModelAndView cms(HttpServletRequest request) {
		
		String url = "redirect:/cms/totexamlist.action";
		return new ModelAndView(url);
	}

	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamlist")
	public ModelAndView totexamlist(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		List<TeacherExam> tcourselist = teacherExamService
				.getMyTCourse(user.getId());
		view.addObject("texamlist", tcourselist);
		view.setViewName("/cms/texamlist");
		return view;
	}

	/**
	 * 跳转到老师登陆页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totlogin")
	public ModelAndView totlogin(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:/cms/totexamlist.action";
		}
		else
		{
			url = "/cms/signin";
		}
		view.setViewName(url);
		return view;
	}

	/**
	 * 跳转到老师注册页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totregeister")
	public ModelAndView totregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/cms/signup");
		return view;
	}

	/**
	 * 跳转到老师试卷更新页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamupdate")
	public ModelAndView totexamupdate(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("exam", exam);
		view.setViewName("/cms/update");
		return view;
	}

	/**
	 * 跳转到老师试卷团队页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamteam")
	public ModelAndView totexamteam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("Exam", exam);
		view.setViewName("/cms/team");
		return view;
	}

	/**
	 * 跳转到老师试卷schedule页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamschedule")
	public ModelAndView totexamschedule(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("exam", exam);
		view.setViewName("/cms/schedule");
		return view;
	}
	
	/**
	 * 跳转到老师试卷设置页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totsetting")
	public ModelAndView totsetting(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		List<Environment> envlist = environmentService.getEnvironment();
		List<ExamShellEnvironment> shellenvlist = environmentService.getExamShellEnvironment(examId);
		view.addObject("exam", exam);
		view.addObject("envlist", envlist);
		view.addObject("shellenvlist", shellenvlist);
		view.setViewName("/cms/setting");
		return view;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveexamattach")
	public void saveexamattach(HttpServletRequest request,HttpServletResponse response, int examId,String path) {
		try {
			PrintWriter out = response.getWriter();
			Exam exam = examService.get(examId);
			exam.setAttach(path);
			examService.update(exam);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除环境参数
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/delenvironment")
	public void delenvironment(HttpServletRequest request,HttpServletResponse response, int envId) {
		try {
			PrintWriter out = response.getWriter();
			environmentService.deleteEnv(envId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存脚本参数
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveshellenv")
	public void saveshellenv(HttpServletRequest request,HttpServletResponse response, int examId,String name,String value) {
		try {
			PrintWriter out = response.getWriter();
			boolean flag = environmentService.saveShellEnv(examId, name, value);
			String endstr = flag?"sucess":"fail";
			String str = "{'sucess':'"+endstr+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存环境
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveenv")
	public void saveenv(HttpServletRequest request,HttpServletResponse response,int id, String name,String value,String type,String desc) {
		try {
			PrintWriter out = response.getWriter();
			boolean flag = environmentService.saveEnv(id, name, value,type,desc);
			String endstr = flag?"sucess":"fail";
			String str = "{'sucess':'"+endstr+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 老师创建试卷
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/createexam")
	public void createexam(HttpServletRequest request,
			HttpServletResponse response, String name, String org,
			String coursecode, String starttime, String category, String rank) {
		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			examService.createExam(name, org, coursecode, starttime,
					user.getId(), Integer.parseInt(category), rank);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 老师在增加课程的时候取得所有试卷分类
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/tgetAllExamCategory")
	public void tgetAllExamCategory(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			List<ECategory> list = ecategoryService.getAllCategory();
			String str = getProjectViewStr(list);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexam")
	public ModelAndView totexam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		
		boolean flag = examPermission(course);
		if (flag)
		{
			view.setViewName("/cms/nopermisson");
			return view;
		}
		view.addObject("exam", course);
		view.setViewName("/cms/temp");
		return view;
	}
	
	/**
	 * 跳转到老师试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/delexam")
	public ModelAndView delexam(HttpServletRequest request, int examId) {
		examService.remove(examId);
		String url = "redirect:/cms/totexamlist.action";
		return new ModelAndView(url);
	}
	
	/**
	 * 发布跟取消发布试卷
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/publicExam")
	public void publicExam(HttpServletRequest request,
			HttpServletResponse response, int examId, int type) {

		try {
			PrintWriter out = response.getWriter();
			Exam course = examService.get(examId);
			course.setPublish(type);
			examService.update(course);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 老师更新试卷
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/updateExam")
	public void updateExam(HttpServletRequest request,
			HttpServletResponse response, int examId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		try {
			PrintWriter out = response.getWriter();

			examService.updateExam(examId, describle, starttimedetail,
					endtimedetail, imgpath);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 老师更新试卷
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	@RequestMapping("/updateExamname")
	public void updateExamname(HttpServletRequest request,
			HttpServletResponse response, int examId, String name) {
		try {
			PrintWriter out = response.getWriter();

			examService.updateExamName(examId, name);

			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createexamchapter")
	public void createexamchapter(HttpServletRequest request,
			HttpServletResponse response, int examId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = new ExamChapter();
			c.setName(name);
			c.setExam(examService.get(examId));
			examchapterService.save(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateexamchapter")
	public void updateexamchapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = examchapterService.get(chapterId);
			c.setName(name);
			examchapterService.update(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除试卷章节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delexamchapter")
	public void delexamchapter(HttpServletRequest request,
			HttpServletResponse response, int chapterId) {

		try {
			PrintWriter out = response.getWriter();
			ExamChapter c = examchapterService.get(chapterId);
			examchapterService.remove(c);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamSequential")
	public void createExamSequential(HttpServletRequest request,
			HttpServletResponse response, int chapterId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = new ExamSequential();
			s.setName(name);
			s.setEchapter(examchapterService.get(chapterId));
			examsequentialService.save(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateExamSequential")
	public void updateExamSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId, String name) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = examsequentialService.get(sequentialId);
			s.setName(name);
			examsequentialService.update(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除试卷小节
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delExamSequential")
	public void delExamSequential(HttpServletRequest request,
			HttpServletResponse response, int sequentialId) {

		try {
			PrintWriter out = response.getWriter();
			ExamSequential s = examsequentialService.get(sequentialId);
			examsequentialService.remove(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除單元
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delExamVertical")
	public void delExamVertical(HttpServletRequest request,
			HttpServletResponse response, int verticalId) {

		try {
			PrintWriter out = response.getWriter();
			ExamVertical s = examverticalService.get(verticalId);
			examverticalService.remove(s);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建单元或者更新单元
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamVertical")
	public void createVertical(HttpServletRequest request,
			HttpServletResponse response, int sequenticalId, int verticalId,
			String name) {
		try {
			PrintWriter out = response.getWriter();
			ExamVertical v;
			if (verticalId == -1) {
				v = new ExamVertical();
				v.setName(name);
				v.setEsequential(examsequentialService.get(sequenticalId));
				examverticalService.save(v);
			} else {
				v = examverticalService.get(verticalId);
				v.setName(name);
				examverticalService.update(v);
			}
			String str = "{'sucess':'sucess','verticalId':" + v.getId() + "}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到老师新建实验页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexamtrain")
	public ModelAndView totexamtrain(HttpServletRequest request, int examId,
			int sequentialId, int verticalId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam course = examService.get(examId);
		view.addObject("exam", course);
		view.addObject("sequentialId", sequentialId);
		view.addObject("verticalId", verticalId);

		List<ExamQuestion> vt = examquestionService.getVerticalTrainList(verticalId);
		for (ExamQuestion eq:vt)
		{
			Question q = eq.getQuestion();
			if (q != null)
			{
				String content = q.getContent();
				if (q.getType() == 1)
				{
					List<QuestionData> qtlist = new ArrayList();
					QuestionData qd = new QuestionData(q.getId());
					qd.setTitle(content);
					qd.setType(CommonConstant.QTYPE_1);
					qtlist.add(qd);
					eq.setQdlist(qtlist);
				}
				else
				{
					List<QuestionData> qtlist = changetohtml(content,q.getId());
					
					if (qtlist != null)
					{
						int score = 0;
						for (QuestionData qt:qtlist)
						{
							score+=qt.getScore();
						}
						eq.setScore(score);
						eq.setQdlist(qtlist);
					}
					
				}
			}
		}
		view.addObject("vtlist", vt);
		ExamVertical vertical = examverticalService.get(verticalId);
		view.addObject("vertical", vertical);
		
		view.setViewName("/cms/unit");
		return view;
	}
	

	/**
	 * 得到实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getTrain")
	public void getTrain(HttpServletRequest request,
			HttpServletResponse response,int trainId) {

		try {
			PrintWriter out = response.getWriter();
			String str = userQuestionService.getTrainQuestion(trainId);
			str = str.replaceAll("null", "");
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建考试的实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamTrain")
	public void createExamTrain(HttpServletRequest request,
			HttpServletResponse response,@RequestBody List<Map<String,Object>> list) 
	{
		try {
			PrintWriter out = response.getWriter();
			userQuestionService.saveTrainQuestion(list);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 创建考试的环境
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getEnvironment")
	public void getEnvironment(HttpServletRequest request, HttpServletResponse response) 
	{
		try {
			PrintWriter out = response.getWriter();
			
			List<Environment> envlist = environmentService.getEnvironment();
			String str = getEnvironmentStr(envlist);
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getEnvironmentStr(List<Environment> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			Environment p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			buffer.append(",\"value\":");
			buffer.append("\"" + p.getValue() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getName() + "\"");
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
	 * 更新实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateTrain")
	public void updateTrain(HttpServletRequest request,
			HttpServletResponse response,@RequestBody List<Map<String,Object>> list) {

		try {
			PrintWriter out = response.getWriter();
			userQuestionService.updateTrainQuestion(list);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 取得实训系统的实训列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getTrainList")
	public void getTrainList(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			
			String str = "[";
			//取得实训课程列表
			RestTrain rs = new RestTrain();
			HttpEntity<RestTrain> entity = new HttpEntity<RestTrain>(rs);

			String resturl = UtilTools.getConfig().getProperty("REST_URL_COURSELIST");
			ResponseEntity<RestTrain> res = restTemplate.postForEntity(resturl,
					entity, RestTrain.class);
			RestTrain e = res.getBody();
			String courseList = e.getCourselist();
			JSONArray jsonArray = JSONArray.fromObject(courseList);
			
			for (Object obj : jsonArray)  
	        {  
	            JSONObject jsonObject = (JSONObject) obj;
//	        	Train c = new Train();
	            int id = Integer.parseInt((String)jsonObject.get("id"));
	            String name = (String)jsonObject.get("name");
//	            c.setId(id);
//	            c.setName(name);
	            str += "{'id':"+id+",'name':'"+name+"'},";
	        }  
//			view.addObject("trainlist", courselists);
			if (str.length() > 1)
			{
				str = str.substring(0, str.length() - 1) + "]";
				str = str.replaceAll("null", "");
			}
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<QuestionData> changetohtml(String content,int id)
	{
		return ParseQuestion.changetohtml(content,id);
	}
	
	/**
	 * 复制实训系统的实验
	 * @param request
	 * @param response
	 */
	@RequestMapping("/copytrain")
	public void copytrain(HttpServletRequest request,
			HttpServletResponse response,int tainId,int examId,int everticalId) {

		try {
			PrintWriter out = response.getWriter();
			
			RestTrain rs = new RestTrain();
			rs.setCourseId(tainId);
			HttpEntity<RestTrain> entity = new HttpEntity<RestTrain>(rs);

			String resturl = UtilTools.getConfig().getProperty("REST_URL_COURSE");
			ResponseEntity<RestTrain> res = restTemplate.postForEntity(resturl,
					entity, RestTrain.class);
			RestTrain e = res.getBody();
			examService.copyTrain(e.getCourse(),examId,everticalId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷单元下面的问题,确保低级，高级内容同时存在
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamQuestion")
	public void createExamQuestion(HttpServletRequest request,
			HttpServletResponse response,int id, String content,String lowcontent,int examId,
			int everticalId) {

		try {
			PrintWriter out = response.getWriter();
			if (id > 0)
			{
				examService.updateExamQuestion(id,content,lowcontent);
			}
			else
			{
				examService.save(content,lowcontent, examId, everticalId);
			}
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷单元下面的高级问题,本质上跟问题一样，但这个要把低级内容删除
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createadviceExamQuestion")
	public void createadviceExamQuestion(HttpServletRequest request,
			HttpServletResponse response,int id, String content,int examId,
			int everticalId) {

		try {
			PrintWriter out = response.getWriter();
			if (id > 0)
			{
				examService.updateAdviceExamQuestion(id,content);
			}
			else
			{
				examService.save(content, examId, everticalId);
			}
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建试卷单元下面的描述问题,本质上跟问题一样，但这个要把低级内容删除
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createhtmlExamQuestion")
	public void createhtmlExamQuestion(HttpServletRequest request,
			HttpServletResponse response,int id, String content,int examId,
			int everticalId) {

		try {
			PrintWriter out = response.getWriter();
			if (id > 0)
			{
				examService.updateAdviceExamQuestion(id,content);
			}
			else
			{
				examService.savehtml(content, examId, everticalId);
			}
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 创建试卷单元下面的问题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delExamQuestion")
	public void delExamQuestion(HttpServletRequest request,
			HttpServletResponse response, int id) {

		try {
			PrintWriter out = response.getWriter();
			examquestionService.remove(id);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据id得到试卷单元下面的问题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getExamQuestion")
	public void getExamQuestion(HttpServletRequest request,
			HttpServletResponse response, int id) {

		try {
			PrintWriter out = response.getWriter();
			ExamQuestion eq = examquestionService.get(id);
			Question q = eq.getQuestion();
			String lowcontent = q.getLowcontent();
			if (lowcontent == null)
			{
				lowcontent = "";
			}
			lowcontent = UtilTools.replaceBackett(lowcontent);
			String con = UtilTools.replaceBackett(q.getContent());
			String str = "{'sucess':'sucess','advicecontent':'"+con+"','lowcontent':'"+lowcontent+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//--------------------------------------------------------------------------------------
	/**
	 * 所有老师
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAllTeacher")
	public void getAllTeacher(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			PrintWriter out = response.getWriter();
			List<UserRole> school = userService.getAllTeacher(CommonConstant.ROLE_T);
			String str = getTeacherStr(school);
			out.write(str);
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 有性能问题再修改
	 * @param list
	 * @return
	 */
	private String getTeacherStr(List<UserRole> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			UserRole p = list.get(i);
			User user = userService.getUserById(p.getUserId());
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + user.getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + user.getUsername() + "\"");
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
	 * 所有学校
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/getAllSchool")
	public void getAllSchool(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			PrintWriter out = response.getWriter();
			List<School> school = schoolService.getAllSchool();
			String str = getSchoolStr(school);
			out.write(str);
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//性能发现问题再解决
	private String getSchoolStr(List<School> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			School p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			String sn = p.getSchool_name();
			List<User> uplist = userService.getStudentBySchoolName(CommonConstant.ROLE_S,sn);
			buffer.append(",\"user\":"+getUserStr(uplist));
			buffer.append(",\"name\":");
			buffer.append("\"" +sn+ "\"");
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
	private String getUserStr(List<User> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("[");
		
		for (int i = 0; i < count; i++) {
			User p = list.get(i);
//			int userId = p.getUser_id();
//			Role r = userService.getUserRoleByuserId(userId);
//			if (CommonConstant.ROLE_S.equals(r.getRoleName()))
			{
				buffer.append("{");
				buffer.append("\"id\":");
				buffer.append("\"" + p.getId() + "\"");
				buffer.append(",\"name\":");
				buffer.append("\"" +p.getUsername()+ "\"");
				buffer.append("},");
			}
		}
		if (count > 0 && buffer.toString().length() > 1) {
			String str = buffer.substring(0, buffer.length() - 1) + "]";
			str = str.replaceAll("null", "");
			return str;
		} else {
			String str = buffer.toString() + "]";
			str = str.replaceAll("null", "");
			return str;
		}
	}
	
	private String getProjectViewStr(List<ECategory> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i = 0; i < count; i++) {
			ECategory p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getName() + "\"");
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
}
