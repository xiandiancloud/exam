package com.dhl.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.SCPClient;

import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionExamDao;
import com.dhl.dao.ECategoryDao;
import com.dhl.dao.ExamCategoryDao;
import com.dhl.dao.ExamChapterDao;
import com.dhl.dao.ExamDao;
import com.dhl.dao.ExamQuestionDao;
import com.dhl.dao.ExamSequentialDao;
import com.dhl.dao.ExamVerticalDao;
import com.dhl.dao.LogDao;
import com.dhl.dao.QuestionDao;
import com.dhl.dao.TeacherExamDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.TrainExtDao;
import com.dhl.dao.UserExamDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamCategory;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Log;
import com.dhl.domain.Question;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class ExamService {

	@Autowired
	private ExamDao examDao;
	@Autowired
	private ExamVerticalDao examVerticalDao;
	@Autowired
	private ECategoryDao ecategoryDao;
	@Autowired
	private ExamCategoryDao examCategoryDao;
	@Autowired
	private ExamChapterDao chapterDao;
	@Autowired
	private ExamSequentialDao sequentialDao;
	@Autowired
	private ExamVerticalDao verticalDao;
	@Autowired
	private ExamQuestionDao examQuestionDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private TrainExtDao trainExtDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserExamDao userExamDao;
	@Autowired
	private TeacherExamDao teacherExamDao;
	@Autowired
	private CompetionExamDao competionExamDao;
	@Autowired
	private CompetionDao competionDao;
	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private ExamQuestionDao examquestionDao;
	@Autowired
	private LogDao logDao;
	
	public void sortChapter(String charpters) {
		String[] strs = charpters.split(",");
		int len = strs.length;
		for (int i=0;i<len;i++)
		{
			ExamChapter ec = chapterDao.get(Integer.parseInt(strs[i]));
			ec.setSortnumber(i+1);
			chapterDao.update(ec);
		}
	}
	
	public void sortSequential(String charpters) {
		JSONArray array = JSONArray.fromObject(charpters); 
		for (int i = 0; i < array.size(); i++) {
           String a = array.getJSONObject(i).getString("charpter");
           String b = array.getJSONObject(i).getString("sequential");
           ExamChapter ec = chapterDao.get(Integer.parseInt(a));
           if (!"".equals(b))
           {
	           String[] strs = b.split(",");
	           int len = strs.length;
	           for (int j=0;j<len;j++)
		   	   {
	        	   ExamSequential es = sequentialDao.get(Integer.parseInt(strs[j]));
	        	   es.setEchapter(ec);
	        	   es.setSortnumber(j+1);
	        	   sequentialDao.update(es);
		   	   }
           }
       }
	}
	
	
public void sortVertical(String charpters) {
		
		JSONArray array = JSONArray.fromObject(charpters); 
		System.out.println(array);
		for (int i = 0; i < array.size(); i++) {
//	           String a = array.getJSONObject(i).getString("charpter");
	           String b = array.getJSONObject(i).getString("sequential");
	           String c = array.getJSONObject(i).getString("vertical");
	           ExamSequential es = sequentialDao.get(Integer.parseInt(b));
	           if (!"".equals(c))
	           {
		           String[] strs = c.split(",");
		           int len = strs.length;
		           for (int j=0;j<len;j++)
			   	   {
		        	   ExamVertical ev = verticalDao.get(Integer.parseInt(strs[j]));
		        	   ev.setEsequential(es);
		        	   ev.setSortnumber(j+1);
		        	   verticalDao.update(ev);
			   	   }
	           }
	       }
	}

	/**
	 * 备份实训
	 * @param trainstr
	 * @param examId
	 * @param everticalId
	 */
	public void copyTrain(String trainstr,int examId,int everticalId)
	{
//		String tmpstr = UtilTools.replaceBackett(trainstr);
		JSONObject jsonObject = JSONObject.fromObject(trainstr);
		//原创文件的相对路径
		String conShell = (String)jsonObject.get("conShell");
		
		boolean flag = copyshell(conShell);
		if (flag)
		{
			Train t = new Train();
			
			String name = (String)jsonObject.get("name");
			String codenum = (String)jsonObject.get("codenum");
			String envname = (String)jsonObject.get("envname");
			String conContent = (String)jsonObject.get("conContent");
			try {
				conContent = URLDecoder.decode(conContent, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String conAnswer = (String)jsonObject.get("conAnswer");
			try {
				conAnswer = URLDecoder.decode(conAnswer, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String score = (String)jsonObject.get("score");
			String scoretag = (String)jsonObject.get("scoretag");
			
			t.setName(name);
			t.setCodenum(codenum);
			t.setEnvname(envname);
			t.setConContent(conContent);
//			t.setConShell(conShell);
			t.setConAnswer(conAnswer);
			t.setScore(Integer.parseInt(score));
//			t.setScoretag(scoretag);
			trainDao.save(t);
			
			//保存考试系统下单元下对应的课程
	        ExamQuestion eq = new ExamQuestion();
	        eq.setTrain(t);
	        eq.setExam(examDao.get(examId));
	        eq.setExamVertical(examVerticalDao.get(everticalId));
	        examquestionDao.save(eq);
		}
	}
	
	public Train getTrain(int trainId)
	{
		return trainDao.get(trainId);
	}
	
	private boolean copyshell(String conShell)
	{
		//到实训系统远程下载检测脚本		
		String ip = UtilTools.getConfig().getProperty("TRAINHOST_IP");
		String userName = UtilTools.getConfig().getProperty("TRAINHOST_USERNAME");
		String passWord = UtilTools.getConfig().getProperty("TRAINHOST_PASSWORD");
		String remoteFile = UtilTools.getConfig().getProperty("TRAINHOST_REMOTEFILE");
		String localFile = UtilTools.getConfig().getProperty("TRAINHOST_LOCALFILE");
		try {
			Connection conn = UtilTools.getConnection(ip, userName, passWord);
//			Session ssh = conn.openSession();
			SCPClient scpClient = conn.createSCPClient();
			scpClient.get(remoteFile+conShell, localFile);
			conn.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * 根据试卷id取得分类
	 * 
	 * @return
	 */
	public ExamCategory getExamCategoryByExamId(int examId) {
		return examCategoryDao.getExamCategoryByExamId(examId);
	}

	/**
	 * 得到推荐试卷
	 */
	public List<Exam> getGroomExam()
	{
		return examDao.getGroomExam();
	}
	
	/**
	 * 保存试卷
	 * 
	 * @param name
	 * @param imgpath
	 * @param desc
	 * @return
	 */
	public Exam save(Exam course) {
		examDao.save(course);
		return course;
	}

	/**
	 * 保存试卷下单元下的问题
	 * @param content
	 * @param examId
	 * @param everticalId
	 * @return
	 */
	public String save(String content,String lowcontent, int examId, int everticalId) {

		Question q = new Question();
		q.setContent(content);
		q.setLowcontent(lowcontent);
		questionDao.save(q);
		
		ExamQuestion vt = new ExamQuestion();
		vt.setExam(examDao.get(examId));
		vt.setExamVertical(examVerticalDao.get(everticalId));
		vt.setQuestion(q);
		examquestionDao.save(vt);
		return null;
	}
	
	/**
	 * 保存试卷下单元下的高级问题
	 * @param content
	 * @param examId
	 * @param everticalId
	 * @return
	 */
	public String save(String content, int examId, int everticalId) {

		Question q = new Question();
		q.setContent(content);
		questionDao.save(q);
		
		ExamQuestion vt = new ExamQuestion();
		vt.setExam(examDao.get(examId));
		vt.setExamVertical(examVerticalDao.get(everticalId));
		vt.setQuestion(q);
		examquestionDao.save(vt);
		return null;
	}
	
	/**
	 * 保存试卷下单元下的html描述问题
	 * @param content
	 * @param examId
	 * @param everticalId
	 * @return
	 */
	public String savehtml(String content, int examId, int everticalId) {

		Question q = new Question();
		q.setContent(content);
		q.setType(1);
		questionDao.save(q);
		
		ExamQuestion vt = new ExamQuestion();
		vt.setExam(examDao.get(examId));
		vt.setExamVertical(examVerticalDao.get(everticalId));
		vt.setQuestion(q);
		examquestionDao.save(vt);
		return null;
	}
	/**
	 * 更新试卷下单元下的问题
	 * @param content
	 * @param examId
	 * @param everticalId
	 * @return
	 */
	public String updateExamQuestion(int id,String content,String lowcontent) {

		ExamQuestion eq = examquestionDao.get(id);
		Question q = eq.getQuestion();
		q.setContent(content);
		q.setLowcontent(lowcontent);
		questionDao.update(q);
		eq.setQuestion(q);
		examquestionDao.update(eq);
		return null;
	}
	
	/**
	 * 更新试卷下单元下的高级问题
	 * @param content
	 * @param examId
	 * @param everticalId
	 * @return
	 */
	public String updateAdviceExamQuestion(int id,String content) {

		ExamQuestion eq = examquestionDao.get(id);
		Question q = eq.getQuestion();
		q.setContent(content);
		q.setLowcontent(null);
		questionDao.update(q);
		eq.setQuestion(q);
		examquestionDao.update(eq);
		return null;
	}
	
//	/**
//	 * 取得所有的试卷
//	 * 
//	 * @param pageNo
//	 * @param pageSize
//	 * @return 返回试卷的分页对象
//	 */
//	public Page getAllExamnotcompetion(int pageNo, int pageSize) {
//		return examDao.getAllExamnotcompetion(pageNo, pageSize);
//	}
	
	/**
	 * 得到所有发布的普通试卷
	 * @return
	 */
	public List<Exam> getAllExam(){
		return examDao.getAllExam();
	}
	
	/**
	 * 得到所有的日志记录
	 * @return
	 */
	public List<Log> getAllLog(){
		return logDao.getAllLog();
	}
	/**
	 * 根据试卷id取得试卷
	 * 
	 * @param id
	 * @return
	 */
	public Exam get(int id) {
		return examDao.get(id);
	}

	/**
	 * 根据试卷id删除试卷
	 * 
	 * @param id
	 * @return
	 */
	public void remove(int id) {
		Exam exam = get(id);
		if (exam != null)
		examDao.remove(exam);
	}
	
	/**
	 * 更新试卷
	 * 
	 * @param entity
	 */
	public void update(Exam entity) {
		examDao.update(entity);
	}

	public void createExam(String name, String org, String coursecode,
			String starttime, int userId, int categoryId, String rank) {
		Exam c = new Exam();
		c.setName(name);
		c.setOrg(org);
		c.setCoursecode(coursecode);
		c.setStarttime(starttime);
		c.setRank(rank);
		save(c);
		ExamCategory cc = new ExamCategory();
		ECategory category = ecategoryDao.get(categoryId);
		cc.setEcategory(category);
		cc.setExam(c);
		examCategoryDao.save(cc);
		TeacherExam tc = new TeacherExam();
		tc.setExam(c);
		tc.setUserId(userId);
		teacherExamDao.save(tc);
	}

	/**
	 * 竞赛创建试卷
	 * @param name
	 * @param userId
	 * @param competionId
	 */
	public void createExam(String name,int userId, int competionId) {
		Competion competion = competionDao.get(competionId);
		
		Exam c = new Exam();
		c.setName(name);
		c.setIsnormal(1);
		c.setStarttimedetail(competion.getExamstarttime());
		c.setEndtimedetail(competion.getExamendtime());
		save(c);
		
		CompetionExam ce = new CompetionExam();
		ce.setCompetionId(competionId);
		ce.setExam(c);
		competionExamDao.save(ce);
		
		TeacherExam tc = new TeacherExam();
		tc.setExam(c);
		tc.setUserId(userId);
		teacherExamDao.save(tc);

	}
	
	/**
	 * 删除竞赛试卷
	 * @param name
	 * @param userId
	 * @param competionId
	 */
	public void removeExam(int competionId,int examId) {
		CompetionExam ce = competionExamDao.getCompetionExam(competionId, examId);
		competionExamDao.remove(ce);
	}
	
	public String selectexam(int competionId,int examId)
	{
		competionExamDao.resetCompetionExam(competionId);
		CompetionExam ce = competionExamDao.getCompetionExam(competionId, examId);
		ce.setSelectexam(1);
		String time = UtilTools.timeTostrHMS(new Date());
		ce.setSelecttime(time);
		competionExamDao.update(ce);
		return time;
	}
	/**
	 * 更新试卷日程，细节等
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateExam(int examId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		Exam exam = get(examId);
		// 更新试卷
		if (exam != null) {
			exam.setDescrible(describle);
			exam.setStarttimedetail(starttimedetail);
			exam.setEndtimedetail(endtimedetail);
			exam.setImgpath(imgpath);
			update(exam);
		}
	}

	/**
	 * 更新试卷名称
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateExamName(int examId, String name) {
		Exam exam = get(examId);
		// 更新试卷
		if (exam != null) {
			exam.setName(name);
			update(exam);
		}
	}
	
	/**
	 * 选择试卷导入的时候更新试卷
	 * 文件名不更新，试卷类别也不更新
	 */
	public void updateExam(String upath,int examId, int texamId) {
		
		Exam texam = get(texamId);
		Exam exam = get(examId);		
		
		texam.setCoursecode(exam.getCoursecode());
		//复制图片
		// copy试卷图片到upload目录
		String oldimage = exam.getImgpath();
		String newimage = "upload"+ File.separator+UUID.randomUUID().toString()+oldimage.substring(oldimage.lastIndexOf('.'));
		UtilTools.copyFile(upath + oldimage, upath+newimage);
		
		texam.setImgpath(newimage);
		texam.setOrg(exam.getOrg());
		texam.setStarttime(exam.getStarttime());
		texam.setStarttimedetail(exam.getStarttimedetail());
		texam.setEndtimedetail(exam.getEndtimedetail());
		texam.setDescrible(exam.getDescrible());
		texam.setRank(exam.getRank());
		
		// 删除试卷下的章节
		chapterDao.removeChapterByExamId(texamId);
		// 删除试卷下的实验
		examQuestionDao.removeExamQuestionByExamId(texamId);
		// 删除试卷下的用户对应的实验问题等信息
		userQuestionDao.removeUserQuestionByExamId(texamId);
		// 更新所有用户对应的试卷信息
		userExamDao.updateUserExam(texamId);
		update(texam);
		
		// 更新对应的章节等信息
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		while (it.hasNext()) {
			ExamChapter chapter = (ExamChapter) it.next();
			
			ExamChapter tchapter = new ExamChapter();
			tchapter.setName(chapter.getName());
			tchapter.setExam(texam);
			chapterDao.save(tchapter);
			
			Set<ExamSequential> sequentialset = chapter.getEsequentials();
			Iterator it2 = sequentialset.iterator();
			while (it2.hasNext()) {
				ExamSequential sequential = (ExamSequential) it2.next();
				
				ExamSequential s = new ExamSequential();
				s.setName(sequential.getName());
				s.setEchapter(tchapter);
				sequentialDao.save(s);
				
				Set<ExamVertical> verticalset = sequential.getExamVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					ExamVertical vertical = (ExamVertical) it3.next();
					
					ExamVertical v = new ExamVertical();
					v.setName(vertical.getName());
					v.setEsequential(s);
					verticalDao.save(v);
					
					Set<ExamQuestion> verticalTrainset = vertical.getExamQuestion();
					Iterator it4 = verticalTrainset.iterator();
					while (it4.hasNext()) {
						ExamQuestion vt = (ExamQuestion) it4.next();
						
						Question question = vt.getQuestion();
						if (question != null)
						{
							Question q = new Question();
							q.setContent(question.getContent());
							q.setLowcontent(question.getLowcontent());
							q.setType(question.getType());
							questionDao.save(q);
							
							ExamQuestion newvt = new ExamQuestion();
							newvt.setExam(texam);
							newvt.setExamVertical(v);
							newvt.setQuestion(q);
							examQuestionDao.save(newvt);
						}
						else
						{
							Train vtrain = vt.getTrain();
							
							Train train = new Train();
							train.setCodenum(vtrain.getCodenum());
							train.setConAnswer(vtrain.getConAnswer());
							train.setConContent(vtrain.getConContent());
							train.setEnvname(vtrain.getEnvname());
							train.setName(vtrain.getName());
							train.setScore(vtrain.getScore());
							train.setIscreate(vtrain.getIscreate());
							trainDao.save(train);
							
							ExamQuestion newvt = new ExamQuestion();
							newvt.setExam(texam);
							newvt.setExamVertical(v);
							newvt.setTrain(train);
							examQuestionDao.save(newvt);
							
							
							List<TrainExt> telist = trainExtDao.getTrainExtList(vtrain.getId());
							for (TrainExt ext:telist)
							{
								String endshell = UUID.randomUUID().toString() + ".sh";
								UtilTools.copyFile(upath+File.separator +ext.getShellpath(), upath + File.separator + "shell"
										+ File.separator + endshell);
	
								TrainExt te = new TrainExt();
								te.setTrainId(train.getId());
								te.setShellpath("shell/"+ endshell);
								te.setShellname(ext.getShellname());
								te.setShellparameter(ext.getShellparameter());
								te.setDevinfo(ext.getDevinfo());
								te.setScoretag(ext.getScoretag());
								trainExtDao.save(te);
							}
						}
					}
				}
			}
		}
	}
	
	/**
	 * 导入试卷的时候更新试卷
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateCourse(int examId, String path, String rootelement) {
		File rootxml = new File(rootelement + File.separator + "course.xml");
		Exam course = get(examId);
		// 更新试卷
		if (course != null && rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String url_name = rt.attributeValue("url_name");
				String org = rt.attributeValue("org");
				String coursecode = rt.attributeValue("course");
				String category = rt.attributeValue("category");
				String rank = rt.attributeValue("rank");
				File coursexml = new File(rootelement + File.separator
						+ "course" + File.separator + url_name + ".xml");
				if (coursexml.exists()) {
					document = reader.read(coursexml);
					rt = document.getRootElement();
					String course_image = rt.attributeValue("course_image");
					// copy试卷图片到upload目录
					File imgdir = new File(path + File.separator + "upload");
					if (!imgdir.exists())
						imgdir.mkdir();
					String endcourse_image = UUID.randomUUID().toString()
							+ course_image;
					UtilTools.copyFile(rootelement + File.separator + "static"
							+ File.separator + course_image, path
							+ File.separator + "upload" + File.separator
							+ endcourse_image);

//					String display_name = rt.attributeValue("display_name");
					String starttime = rt.attributeValue("start");
					String starttimedetail = rt
							.attributeValue("enrollment_start");
					String endtimedetail = rt.attributeValue("enrollment_end");

					course.setCoursecode(coursecode);
					course.setImgpath("upload/" + endcourse_image);
//					course.setName(display_name);
					course.setOrg(org);
					course.setStarttime(starttime);
					course.setStarttimedetail(starttimedetail);
					course.setEndtimedetail(endtimedetail);
					course.setRank(rank);

					String tt = rootelement + File.separator + "about";
					File filedir = new File(tt);
					if (filedir.exists()) {
						File file = new File(tt + File.separator
								+ "short_description.html");
						if (file.exists()) {
							Long fileLengthLong = file.length();
							byte[] fileContent = new byte[fileLengthLong
									.intValue()];
							try {
								FileInputStream inputStream = new FileInputStream(
										file);
								inputStream.read(fileContent);
								inputStream.close();
							} catch (Exception e) {
							}
							String describle = new String(fileContent);
							course.setDescrible(describle);
						}
					}

					// 删除试卷下的章节
					chapterDao.removeChapterByExamId(examId);
					// 删除试卷下的实验
					examQuestionDao.removeExamQuestionByExamId(examId);
					// 删除试卷下的用户对应的实验问题等信息
					userQuestionDao.removeUserQuestionByExamId(examId);
					// 更新所有用户对应的试卷信息
					userExamDao.updateUserExam(examId);
					update(course);
					ECategory ct = ecategoryDao.getCategoryByname(category);
					if (ct == null) {
						ct = new ECategory();
						ct.setName(category);
						ct.setDescrible(category);
						ecategoryDao.save(ct);
					}
					ExamCategory ccc = examCategoryDao.getExamCategoryByExamId(examId);
					if (ccc != null) {
						ccc.setEcategory(ct);
						ccc.setExam(course);
						examCategoryDao.update(ccc);
					} else {
						ccc = new ExamCategory();
						ccc.setEcategory(ct);
						ccc.setExam(course);
						examCategoryDao.save(ccc);
					}
					// 新建对应的章节等信息
					Iterator iter = rt.elementIterator("chapter");
					while (iter.hasNext()) {
						Element recordEle = (Element) iter.next();
						String chapter_url_name = recordEle
								.attributeValue("url_name");
						createChapter(course, path, rootelement,
								chapter_url_name);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void createChapter(Exam course, String path, String rootelement,
			String url_name) {

		File rootxml = new File(rootelement + File.separator + "chapter"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");
				int sortnumber = 10000;
				try
				{
				sortnumber = Integer.parseInt(rt.attributeValue("sortnumber"));
				}
				catch(Exception e)
				{}
				ExamChapter chapter = new ExamChapter();
				chapter.setName(display_name);
				chapter.setExam(course);
				chapter.setSortnumber(sortnumber);
				chapterDao.save(chapter);
				Iterator iter = rt.elementIterator("sequential");
				while (iter.hasNext()) {
					Element recordEle = (Element) iter.next();
					String chapter_url_name = recordEle
							.attributeValue("url_name");
					createSequential(course, chapter, path, rootelement,
							chapter_url_name);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void createSequential(Exam course, ExamChapter c, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "sequential"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");
				int sortnumber = 10000;
				try
				{
				sortnumber = Integer.parseInt(rt.attributeValue("sortnumber"));
				}
				catch(Exception e)
				{}
				ExamSequential s = new ExamSequential();
				s.setName(display_name);
				s.setEchapter(c);
				s.setSortnumber(sortnumber);
				sequentialDao.save(s);
				Iterator iter = rt.elementIterator("vertical");
				while (iter.hasNext()) {
					Element recordEle = (Element) iter.next();
					String chapter_url_name = recordEle
							.attributeValue("url_name");
					createVertical(course, s, path, rootelement,
							chapter_url_name);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void createVertical(Exam course, ExamSequential c, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "vertical"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");
				int sortnumber = 10000;
				try
				{
				sortnumber = Integer.parseInt(rt.attributeValue("sortnumber"));
				}
				catch(Exception e)
				{}
				ExamVertical v = new ExamVertical();
				v.setName(display_name);
				v.setEsequential(c);
				v.setSortnumber(sortnumber);
				verticalDao.save(v);
				Iterator iter = rt.elementIterator("train");
				if (iter != null)
				{
					while (iter.hasNext()) {
						Element recordEle = (Element) iter.next();
						String chapter_url_name = recordEle
								.attributeValue("url_name");
						createTrain(course, v, path, rootelement, chapter_url_name);
					}
				}
				Iterator iter2 = rt.elementIterator("question");
				if (iter2 != null)
				{
					while (iter2.hasNext()) {
						Element recordEle = (Element) iter2.next();
						String chapter_url_name = recordEle
								.attributeValue("url_name");
						createQuestion(course, v, path, rootelement, chapter_url_name);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void createQuestion(Exam course, ExamVertical v, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "question"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String content = rt.attributeValue("content");
				String lowcontent = rt.attributeValue("lowcontent");
				String type = rt.attributeValue("type");

				Question q = new Question();
				q.setContent(content);
				q.setLowcontent(lowcontent);
				q.setType(Integer.parseInt(type));
				questionDao.save(q);
				ExamQuestion vt = new ExamQuestion();
				vt.setExam(course);
				vt.setExamVertical(v);
				vt.setQuestion(q);
				examQuestionDao.save(vt);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void createTrain(Exam course, ExamVertical v, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "train"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String codenum = rt.attributeValue("codenum");
				String conAnswer = rt.attributeValue("answer");
				String conContent = rt.attributeValue("content");
//				String conShell = rt.attributeValue("shell");
				String envname = rt.attributeValue("envname");
				String display_name = rt.attributeValue("display_name");
				String score = rt.attributeValue("score");
//				String scoretag = rt.attributeValue("scoretag");

//				File imgdir = new File(path + File.separator + "shell");
//				if (!imgdir.exists())
//					imgdir.mkdir();
//				String endshell = UUID.randomUUID().toString() + conShell;
//				UtilTools.copyFile(rootelement + File.separator + "static"
//						+ File.separator + conShell, path + "shell"
//						+ File.separator + endshell);

//				Train train = trainDao.getTrainByCodenum(codenum);
//				if (train == null) {
				Train train = new Train();
					train.setCodenum(codenum);
					train.setConAnswer(conAnswer);
					train.setConContent(conContent);
//					train.setConShell("shell"+ File.separator + endshell);
					train.setEnvname(envname);
					train.setName(display_name);
					train.setScore(Integer.parseInt(score));
//					train.setScoretag(scoretag);
					trainDao.save(train);
//				}
				ExamQuestion vt = new ExamQuestion();
				vt.setExam(course);
				vt.setExamVertical(v);
				vt.setTrain(train);
				examQuestionDao.save(vt);
				
				Iterator iter = rt.elementIterator("trainext");
				if (iter != null)
				{
					while (iter.hasNext()) {
						Element recordEle = (Element) iter.next();
						String chapter_url_name = recordEle
								.attributeValue("url_name");
						createTrainExt(course, train, path, rootelement, chapter_url_name);
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void createTrainExt(Exam course, Train train, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "trainext"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				
				String shellpath = rt.attributeValue("shellpath");
				String shellname = rt.attributeValue("shellname");
				String shellparameter = rt.attributeValue("shellparameter");
				String devinfo = rt.attributeValue("devinfo");
				String scoretag = rt.attributeValue("scoretag");

				File imgdir = new File(path + File.separator + "shell");
				if (!imgdir.exists())
					imgdir.mkdir();
				String endshell = UUID.randomUUID().toString() + shellname;
				UtilTools.copyFile(rootelement + File.separator + shellpath, path+ File.separator + "shell"
						+ File.separator + endshell);

				TrainExt te = new TrainExt();
				te.setTrainId(train.getId());
				te.setShellpath("shell/"+ endshell);
				te.setShellname(shellname);
				te.setShellparameter(shellparameter);
				te.setDevinfo(devinfo);
				te.setScoretag(scoretag);
				trainExtDao.save(te);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
