package com.dhl.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ChapterDao;
import com.dhl.dao.ECategoryDao;
import com.dhl.dao.ExamCategoryDao;
import com.dhl.dao.ExamDao;
import com.dhl.dao.Page;
import com.dhl.dao.SequentialDao;
import com.dhl.dao.TeacherExamDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.UserCourseDao;
import com.dhl.dao.UserTrainDao;
import com.dhl.dao.VerticalDao;
import com.dhl.dao.VerticalTrainDao;
import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.ECategory;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamCategory;
import com.dhl.domain.Sequential;
import com.dhl.domain.TeacherExam;
import com.dhl.domain.Train;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class ExamService {

	@Autowired
	private ExamDao examDao;
	@Autowired
	private ECategoryDao ecategoryDao;
	@Autowired
	private ExamCategoryDao examCategoryDao;
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
	private TeacherExamDao teacherExamDao;

	/**
	 * 根据试卷id取得分类
	 * 
	 * @return
	 */
	public ExamCategory getCourseCategoryByCourseId(int courseId) {
		return examCategoryDao.getCourseCategoryByCourseId(courseId);
	}

	/**
	 * 根据名字查试卷
	 * 
	 * @param name
	 * @return
	 */
	public List<Exam> getCourseByName(String name) {
		return examDao.getCourseByName(name);
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
	 * 取得所有的试卷
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return 返回试卷的分页对象
	 */
	public Page getAllCourse(int pageNo, int pageSize) {
		return examDao.getAllCourse(pageNo, pageSize);
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
	 * 更新试卷日程，细节等
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateCourse(int courseId, String describle,
			String starttimedetail, String endtimedetail, String imgpath) {
		Exam course = get(courseId);
		// 更新试卷
		if (course != null) {
			course.setDescrible(describle);
			course.setStarttimedetail(starttimedetail);
			course.setEndtimedetail(endtimedetail);
			course.setImgpath(imgpath);
			update(course);
		}
	}

	/**
	 * 导入试卷的时候更新试卷
	 * 
	 * @param courseId
	 * @param rootelement
	 */
	public void updateCourse(int courseId, String path, String rootelement) {/*
		File rootxml = new File(rootelement + File.separator + "course.xml");
		Course course = get(courseId);
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

					// 删除试卷下的章节
					chapterDao.removeChapterByCourseId(courseId);
					// 删除试卷下的实验
					vtDao.removeVTByCourseId(courseId);
					// 删除试卷下的用户对应的实验信息
					utDao.removeUTByCourseId(courseId);
					// 更新所有用户对应的试卷信息
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
	*/}

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