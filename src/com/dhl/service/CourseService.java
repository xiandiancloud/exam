package com.dhl.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CategoryDao;
import com.dhl.dao.ChapterDao;
import com.dhl.dao.CourseCategoryDao;
import com.dhl.dao.CourseDao;
import com.dhl.dao.ExamDao;
import com.dhl.dao.ExamQuestionDao;
import com.dhl.dao.ExamVerticalDao;
import com.dhl.dao.Page;
import com.dhl.dao.SequentialDao;
import com.dhl.dao.TeacherCourseDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.UserCourseDao;
import com.dhl.dao.UserTrainDao;
import com.dhl.dao.VerticalDao;
import com.dhl.dao.VerticalTrainDao;
import com.dhl.domain.Category;
import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.CourseCategory;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.Sequential;
import com.dhl.domain.TeacherCourse;
import com.dhl.domain.Train;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class CourseService {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private CourseCategoryDao courseCategoryDao;
	@Autowired
	private ChapterDao chapterDao;
	@Autowired
	private SequentialDao sequentialDao;
	@Autowired
	private VerticalDao verticalDao;
	@Autowired
	private VerticalTrainDao vtDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private UserTrainDao utDao;
	@Autowired
	private UserCourseDao userCourseDao;
	@Autowired
	private TeacherCourseDao teacherCourseDao;

	@Autowired
	private ExamDao examDao;
	@Autowired
	private ExamVerticalDao examVerticalDao;
	@Autowired
	private ExamQuestionDao examQuestionDao;
	
	/**
	 * 根据课程id取得分类
	 * 
	 * @return
	 */
	public CourseCategory getCourseCategoryByCourseId(int courseId) {
		return courseCategoryDao.getCourseCategoryByCourseId(courseId);
	}

	/**
	 * 根据名字查课程
	 * 
	 * @param name
	 * @return
	 */
	public List<Course> getCourseByName(String name) {
		return courseDao.getCourseByName(name);
	}

	/**
	 * 保存课程
	 * 
	 * @param name
	 * @param imgpath
	 * @param desc
	 * @return
	 */
	public Course save(Course course) {
		courseDao.save(course);
		return course;
	}

	/**
	 * 取得所有的课程
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return 返回课程的分页对象
	 */
	public Page getAllCourse(int pageNo, int pageSize) {
		return courseDao.getAllCourse(pageNo, pageSize);
	}

	/**
	 * 根据课程id取得课程
	 * 
	 * @param id
	 * @return
	 */
	public Course get(int id) {
		return courseDao.get(id);
	}

	/**
	 * 更新课程
	 * 
	 * @param entity
	 */
	public void update(Course entity) {
		courseDao.update(entity);
	}

	/**
	 * copy一个课程到考试系统
	 */
	public void copyCourse(String course,int userId,int examId,int everticalId)
	{
		JSONArray jsonArray = JSONArray.fromObject(course);
		for (Object obj : jsonArray)  
        {
            JSONObject jsonObject = (JSONObject) obj;  
            //创建课程--------------------
            Course c = new Course();
            String name = (String)jsonObject.get("name");
    		String imgpath = (String)jsonObject.get("imgpath");
    		String describle = (String)jsonObject.get("describle");
    		String starttime = (String)jsonObject.get("starttime");
    		String starttimedetail = (String)jsonObject.get("starttimedetail");
    		String endtimedetail = (String)jsonObject.get("endtimedetail");
    		String org = (String)jsonObject.get("org");
    		String coursecode = (String)jsonObject.get("coursecode");
    		String rank = (String)jsonObject.get("rank");
    		c.setName(name);
    		c.setImgpath(imgpath);
    		c.setPublish(1);//copy默认都是发布的
    		c.setOrg(org);
    		c.setCoursecode(coursecode);
    		c.setStarttime(starttime);
    		c.setStarttimedetail(starttimedetail);
    		c.setEndtimedetail(endtimedetail);
    		c.setDescrible(describle);
    		c.setRank(rank);
    		save(c);
    		//实训不做分类，后期需要再加进去
//    		CourseCategory cc = new CourseCategory();
//    		Category category = categoryDao.get(categoryId);
//    		cc.setCategory(category);
//    		cc.setCourse(c);
//    		courseCategoryDao.save(cc);
    		//隶属于老师的实训
    		TeacherCourse tc = new TeacherCourse();
    		tc.setCourse(c);
    		tc.setUserId(userId);
    		teacherCourseDao.save(tc);
    		//创建课程--------------------
            JSONArray chapterjsonArray = (JSONArray)jsonObject.get("chapters");
            if (chapterjsonArray != null)
            {
	            for (Object chapterobj : chapterjsonArray)
	            {
	            	JSONObject chapterjsonObject = (JSONObject) chapterobj;  
	            	String chaptername = (String)chapterjsonObject.get("name");
	            	//创建课程章节--------------------
	            	Chapter chapter = new Chapter();
					chapter.setName(chaptername);
					chapter.setCourse(c);
					chapterDao.save(chapter);
					//创建课程章节--------------------
	            	JSONArray sequentialjsonArray = (JSONArray)chapterjsonObject.get("sequentials");
	            	if (sequentialjsonArray != null)
	            	{
		            	for (Object sequentialobj : sequentialjsonArray)
		            	{
		            		JSONObject sequentialjsonObject = (JSONObject) sequentialobj;  
		            		
		            		String sequentialname = (String)sequentialjsonObject.get("name");
		            		//创建课程小节--------------------
			            	Sequential s = new Sequential();
							s.setName(sequentialname);
							s.setChapter(chapter);
							sequentialDao.save(s);
							//创建课程小节--------------------
			            	JSONArray verticaljsonArray = (JSONArray)sequentialjsonObject.get("verticals");
			            	if (verticaljsonArray != null)
			            	{
				            	for (Object verticalobj : verticaljsonArray)
				            	{
				            		JSONObject verticaljsonObject = (JSONObject) verticalobj;  
				            		
				            		String verticalname = (String)verticaljsonObject.get("name");
				            		//创建课程单元--------------------
					            	Vertical v = new Vertical();
									v.setName(verticalname);
									v.setSequential(s);
									verticalDao.save(v);
									//创建课程单元--------------------
					            	JSONArray trainjsonArray = (JSONArray)verticaljsonObject.get("trains");
					            	if (trainjsonArray != null)
					            	{
						            	for (Object trainobj : trainjsonArray)
						            	{
						            		JSONObject trainjsonObject = (JSONObject) trainobj;  
						            		
						            		String trainname = (String)trainjsonObject.get("name");
											String codenum = (String)trainjsonObject.get("codenum");
											String envname = (String)trainjsonObject.get("envname");
											String conContent = (String)trainjsonObject.get("conContent");
											String conShell = (String)trainjsonObject.get("conShell");
											String conAnswer = (String)trainjsonObject.get("conAnswer");
											String score = (String)trainjsonObject.get("score");
											String scoretag = (String)trainjsonObject.get("scoretag");
											
							            	Train train = trainDao.getTrainByCodenum(codenum);
											if (train == null) {
												train = new Train();
												train.setCodenum(codenum);
												train.setConAnswer(conAnswer);
												train.setConContent(conContent);
												train.setConShell(conShell);
												train.setEnvname(envname);
												train.setName(trainname);
												train.setScore(Integer.parseInt(score));
												train.setScoretag(scoretag);
												trainDao.save(train);
											}
											VerticalTrain vt = new VerticalTrain();
											vt.setCourse(c);
											vt.setVertical(v);
											vt.setTrain(train);
											vtDao.save(vt);
						            	}
					            	}
				            	}
			            	}
		            	}
	            	}
	            }
            }
            //保存考试系统下单元下对应的课程
            ExamQuestion eq = new ExamQuestion();
//            eq.setCourse(c);
            eq.setExam(examDao.get(examId));
            eq.setExamVertical(examVerticalDao.get(everticalId));
            examQuestionDao.save(eq);
        }
	}
	
	
	public void createCourse(String name, String org, String coursecode,
			String starttime, int userId, int categoryId, String rank) {
		Course c = new Course();
		c.setName(name);
		c.setOrg(org);
		c.setCoursecode(coursecode);
		c.setStarttime(starttime);
		c.setRank(rank);
		save(c);
		CourseCategory cc = new CourseCategory();
		Category category = categoryDao.get(categoryId);
		cc.setCategory(category);
		cc.setCourse(c);
		courseCategoryDao.save(cc);
		TeacherCourse tc = new TeacherCourse();
		tc.setCourse(c);
		tc.setUserId(userId);
		teacherCourseDao.save(tc);

	}

	/**
	 * 更新课程日程，细节等
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateCourse(int courseId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		Course course = get(courseId);
		// 更新课程
		if (course != null) {
			course.setDescrible(describle);
			course.setStarttimedetail(starttimedetail);
			course.setEndtimedetail(endtimedetail);
			course.setImgpath(imgpath);
			update(course);
		}
	}

	/**
	 * 导入课程的时候更新课程
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateCourse(int courseId, String path, String rootelement) {
		File rootxml = new File(rootelement + File.separator + "course.xml");
		Course course = get(courseId);
		// 更新课程
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
					// copy课程图片到upload目录
					File imgdir = new File(path + File.separator + "upload");
					if (!imgdir.exists())
						imgdir.mkdir();
					String endcourse_image = UUID.randomUUID().toString()
							+ course_image;
					UtilTools.copyFile(rootelement + File.separator + "static"
							+ File.separator + course_image, path
							+ File.separator + "upload" + File.separator
							+ endcourse_image);

					String display_name = rt.attributeValue("display_name");
					String starttime = rt.attributeValue("start");
					String starttimedetail = rt
							.attributeValue("enrollment_start");
					String endtimedetail = rt.attributeValue("enrollment_end");

					course.setCoursecode(coursecode);
					course.setImgpath("upload/" + endcourse_image);
					course.setName(display_name);
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

					// 删除课程下的章节
					chapterDao.removeChapterByCourseId(courseId);
					// 删除课程下的实验
					vtDao.removeVTByCourseId(courseId);
					// 删除课程下的用户对应的实验信息
					utDao.removeUTByCourseId(courseId);
					// 更新所有用户对应的课程信息
					userCourseDao.updateUserCourse(courseId);
					update(course);
					Category ct = categoryDao.getCategoryByname(category);
					if (ct == null) {
						ct = new Category();
						ct.setName(category);
						ct.setDescrible(category);
						categoryDao.save(ct);
					}
					CourseCategory ccc = courseCategoryDao
							.getCourseCategoryByCourseId(courseId);
					if (ccc != null) {
						ccc.setCategory(ct);
						ccc.setCourse(course);
						courseCategoryDao.update(ccc);
					} else {
						ccc = new CourseCategory();
						ccc.setCategory(ct);
						ccc.setCourse(course);
						courseCategoryDao.save(ccc);
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

	private void createChapter(Course course, String path, String rootelement,
			String url_name) {

		File rootxml = new File(rootelement + File.separator + "chapter"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");

				Chapter chapter = new Chapter();
				chapter.setName(display_name);
				chapter.setCourse(course);
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

	private void createSequential(Course course, Chapter c, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "sequential"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");

				Sequential s = new Sequential();
				s.setName(display_name);
				s.setChapter(c);
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

	private void createVertical(Course course, Sequential c, String path,
			String rootelement, String url_name) {

		File rootxml = new File(rootelement + File.separator + "vertical"
				+ File.separator + url_name + ".xml");
		if (rootxml.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document document = reader.read(rootxml);
				Element rt = document.getRootElement();
				String display_name = rt.attributeValue("display_name");

				Vertical v = new Vertical();
				v.setName(display_name);
				v.setSequential(c);
				verticalDao.save(v);
				Iterator iter = rt.elementIterator("train");
				while (iter.hasNext()) {
					Element recordEle = (Element) iter.next();
					String chapter_url_name = recordEle
							.attributeValue("url_name");
					createTrain(course, v, path, rootelement, chapter_url_name);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void createTrain(Course course, Vertical v, String path,
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
				String conShell = rt.attributeValue("shell");
				String envname = rt.attributeValue("envname");
				String display_name = rt.attributeValue("display_name");
				String score = rt.attributeValue("score");
				String scoretag = rt.attributeValue("scoretag");

				File imgdir = new File(path + File.separator + "shell");
				if (!imgdir.exists())
					imgdir.mkdir();
				String endshell = UUID.randomUUID().toString() + conShell;
				UtilTools.copyFile(rootelement + File.separator + "static"
						+ File.separator + conShell, path + "shell"
						+ File.separator + endshell);

				Train train = trainDao.getTrainByCodenum(codenum);
				if (train == null) {
					train = new Train();
					train.setCodenum(codenum);
					train.setConAnswer(conAnswer);
					train.setConContent(conContent);
					train.setConShell("shell"+ File.separator + endshell);
					train.setEnvname(envname);
					train.setName(display_name);
					train.setScore(Integer.parseInt(score));
					train.setScoretag(scoretag);
					trainDao.save(train);

				}
				VerticalTrain vt = new VerticalTrain();
				vt.setCourse(course);
				vt.setVertical(v);
				vt.setTrain(train);
				vtDao.save(vt);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
