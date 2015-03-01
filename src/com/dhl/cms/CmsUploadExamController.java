package com.dhl.cms;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.dao.TrainExtDao;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamCategory;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.service.ExamService;
import com.dhl.util.UtilTools;
import com.dhl.util.WordTools;
import com.dhl.web.BaseController;

/**
 * 老师倒入，导出试卷
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CmsUploadExamController extends BaseController {

	@Autowired
	private ExamService examService;
	@Autowired
	private TrainExtDao trainExtDao;
	
	/**
	 * 上传更新课程的图片
	 * 
	 * @param request
	 * @param response
	 * @param file
	 */
	@RequestMapping("/importCourseimg")
	public void importCourseimg(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String uuid = UUID.randomUUID().toString();
				String path = "upload/" + uuid + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();
				out.print("{\"success\": \"true\",\"imgpath\":\"" + path
						+ "\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				// out.write("<script>parent.callback('fail')</script>");
				out.print("{\"success\": \"false\"}");
			}

		} catch (Exception e) {
			out.print("{\"success\": \"false\"}");
		}
	}

	/**
	 * 上传实验自动验证脚本
	 * @param request
	 * @param response
	 * @param file
	 */
	@RequestMapping("/uploadtrain")
	public void uploadtrain(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String uuid = UUID.randomUUID().toString();
				String path = "shell/" + uuid + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();
				out.print("{\"success\": \"true\",\"shell\":\"" + path + "\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				// out.write("<script>parent.callback('fail')</script>");
				out.print("{\"success\": \"false\"}");
			}

		} catch (Exception e) {
			out.print("{\"success\": \"false\"}");
		}
	}
	
	/**
	 * 上传exam的附件
	 * @param request
	 * @param response
	 * @param file
	 */
	@RequestMapping("/uploadexamattach")
	public void uploadexamattach(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String uuid = UUID.randomUUID().toString();
				String path = "upload/" + uuid + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();
				out.print("{\"success\": \"true\",\"path\":\"" + path + "\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				// out.write("<script>parent.callback('fail')</script>");
				out.print("{\"success\": \"false\"}");
			}

		} catch (Exception e) {
			out.print("{\"success\": \"false\"}");
		}
	}
	
	/**
	 * 跳转到老师试卷导出页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexportexam")
	public ModelAndView totexportexam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("exam", exam);
		view.setViewName("/cms/exportexam");
		return view;
	}

	/**
	 * 跳转到老师试卷导出Word页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexportexamword")
	public ModelAndView totexportexamword(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("exam", exam);
		view.setViewName("/cms/exportexamword");
		return view;
	}

	
	/**
	 * 跳转到老师课程导入页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totimportexam")
	public ModelAndView totimportexam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		view.addObject("exam", exam);
		view.setViewName("/cms/importexam");
		return view;
	}

	/**
	 * 跳转到老师选择试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totselectexam")
	public ModelAndView totselectexam(HttpServletRequest request, int examId) {
		ModelAndView view = new ModelAndView();
		view.addObject("examId", examId);
		Exam exam = examService.get(examId);
		
		List<Exam> examlist = examService.getAllExam();
		view.addObject("examlist", examlist);
		
		view.addObject("exam", exam);
		view.setViewName("/cms/selectexam");
		return view;
	}
	
	@RequestMapping("/importsexam")
	public void importsexam(HttpServletRequest request,HttpServletResponse response, int examId,int texamId) {
		
		try
		{
			String upath = request.getSession().getServletContext()
					.getRealPath("/");
			examService.updateExam(upath, examId, texamId);
			PrintWriter	out = response.getWriter();
			out.print("{\"success\": \"true\"}");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 导入课程
	 */
	@RequestMapping("/importExam")
	public void importExam(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file,
			int examId) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				// 上传
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String uuid = UUID.randomUUID().toString();
				String path = "import/" + uuid + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();
				// 解压缩
				File tgz = new File(upath + path);
				String rootpath = upath + "import/" + uuid;
				UtilTools.unTarGz(tgz, rootpath);
				// 删除原文件
				tgz.delete();
				// 导入课程

				// 跟路径
				File root = new File(rootpath);
				File[] files = root.listFiles();

				File rootfile = files[0];
				if (rootfile.isDirectory()) {

					String rootelement = rootpath + File.separator
							+ rootfile.getName();
					// User user = getSessionUser(request);
					examService.updateCourse(examId,  upath, rootelement);
				}

				// 删除文件夹
				UtilTools.delAllFile(rootpath);
				root.delete();
				out.print("{\"success\": \"true\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				// out.write("<script>parent.callback('fail')</script>");
				out.print("{\"success\": \"false\"}");
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.print("{\"success\": \"false\"}");
		}
	}

	/**
	 * 导出试卷
	 * 
	 * @param courseId
	 */
	@RequestMapping("/exportExamword")
	public void exportExamword(HttpServletRequest request,
			HttpServletResponse response, int examId) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;

			String path = request.getSession().getServletContext()
					.getRealPath("/");
			String ctxPath = path + "export";
			Exam exam = examService.get(examId);
			 //获得WebRoot的路径  
//			ClassLoader classLoader = Thread.currentThread()  
//		            .getContextClassLoader();  
//		    if (classLoader == null) {  
//		        classLoader = ClassLoader.getSystemClassLoader();  
//		    }  
//		    java.net.URL url = classLoader.getResource("");  
//		    String ROOT_CLASS_PATH = url.getPath() + "/";  
//		    File rootFile = new File(ROOT_CLASS_PATH);  
//		    String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "/";  
//		    File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);  
//		    String SERVLET_CONTEXT_PATH = webInfoDir.getParent() + "/";  
		    String filepath = path + "template/template.docx";  
//		    System.out.println("file"+filepath);
//			String inputfilepath = "e:\\template.docx";
			WordprocessingMLPackage wordMLPackage =
					WordprocessingMLPackage.load(new File(filepath));
			WordTools.writeALLQuestion(wordMLPackage,exam);
			String name = exam.getName()+".docx";
			String filename = ctxPath + "/"+name;
			File file = new File(filename);
			if (!file.exists())
				file.createNewFile();
			wordMLPackage.save(file);
			//
			long fileLength = file.length();
			//
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(name.getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(response.getOutputStream());
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
	 * 导出试卷
	 * 
	 * @param courseId
	 */
	@RequestMapping("/exportExam")
	public void exportExam(HttpServletRequest request,
			HttpServletResponse response, int examId) {

		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;

			String path = request.getSession().getServletContext()
					.getRealPath("/");
			String ctxPath = path + "export";
			
			ExamCategory cc = examService.getExamCategoryByExamId(examId);
			Exam c = cc.getExam();
			String rootname = ctxPath + File.separator + c.getStarttime();

			UtilTools.deletefile(rootname);

			// 创建course.xml文件
			createRootXMl(path, rootname, "course.xml", cc.getEcategory().getName(), c);

			// 打包生成tar.gz文件
			File tarfile = new File(rootname + ".tar");
			tarfile.createNewFile();
			UtilTools.WriteToTarGzip(ctxPath + File.separator,
					c.getStarttime(), c.getStarttime() + ".tar");

			// 下载tar.gz文件
			String downLoadPath = rootname + ".tar.gz";
			String fp = c.getStarttime() + ".tar.gz";
			//
			File downLoadFile = new File(downLoadPath);
			long fileLength = downLoadFile.length();
			//
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fp.getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			bis.close();
			bos.close();

			downLoadFile.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void createRootXMl(String path, String coursepath, String xml,
			String category, Exam c) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("course");
		rootGen.addAttribute("url_name", c.getStarttime());
		rootGen.addAttribute("org", c.getOrg());
		rootGen.addAttribute("course", c.getCoursecode());
		rootGen.addAttribute("category", category);
		rootGen.addAttribute("rank", c.getRank());

		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			File filedir = new File(coursepath);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(coursepath + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		createExamXMl(path, coursepath, c.getStarttime() + ".xml", c);
		createExamAbout(coursepath, c.getDescrible());
	}

	private void createExamAbout(String coursepath, String desc) {
		try {
			if (desc == null)
			{
				return;
			}
			String tt = coursepath + File.separator + "about";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + "short_description.html");
			if (!file.exists())
				file.createNewFile();
			BufferedWriter writer = new BufferedWriter(new FileWriter(file));
			writer.write(desc);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void createExamXMl(String path, String coursepath, String xml,
			Exam c) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("course");
		String imgpath = c.getImgpath();
		if (imgpath != null)
		{
			imgpath = imgpath.substring(imgpath.indexOf('/')+1);
			rootGen.addAttribute("course_image", imgpath);
		}
		rootGen.addAttribute("display_name", c.getName());
		rootGen.addAttribute("start", c.getStarttime());
		rootGen.addAttribute("enrollment_start", c.getStarttimedetail());
		rootGen.addAttribute("enrollment_end", c.getEndtimedetail());

		File imgdir = new File(coursepath + File.separator + "static");
		if (!imgdir.exists())
			imgdir.mkdir();
		if (imgpath != null)
		{
			UtilTools.copyFile(path + "upload" + File.separator + imgpath,
					coursepath + File.separator + "static" + File.separator
							+ imgpath);
		}
		Set<ExamChapter> set = c.getExamchapters();
		Iterator<ExamChapter> it = set.iterator();
		while (it.hasNext()) {
			ExamChapter chapter = it.next();

			Element childElement = rootGen.addElement("chapter");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createChapterXMl(path, coursepath, uuid + ".xml", chapter);
		}
		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "course";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void createChapterXMl(String path, String coursepath, String xml,
			ExamChapter chapter) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("chapter");
		rootGen.addAttribute("display_name", chapter.getName());
		rootGen.addAttribute("sortnumber", chapter.getSortnumber()+"");
		Set<ExamSequential> sequentialset = chapter.getEsequentials();
		Iterator<ExamSequential> it = sequentialset.iterator();

		while (it.hasNext()) {
			ExamSequential sequential = it.next();
			Element childElement = rootGen.addElement("sequential");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createSequentialXMl(path, coursepath, uuid + ".xml", sequential);
		}
		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "chapter";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void createSequentialXMl(String path, String coursepath,
			String xml, ExamSequential sequential) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("sequential");
		rootGen.addAttribute("display_name", sequential.getName());
		rootGen.addAttribute("sortnumber", sequential.getSortnumber()+"");
		Set<ExamVertical> verticalset = sequential.getExamVerticals();
		Iterator<ExamVertical> it = verticalset.iterator();
		while (it.hasNext()) {
			ExamVertical vertical = it.next();

			Element childElement = rootGen.addElement("vertical");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createVerticalXMl(path, coursepath, uuid + ".xml", vertical);
		}
		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "sequential";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createVerticalXMl(String path, String coursepath, String xml,
			ExamVertical vertical) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("vertical");
		rootGen.addAttribute("display_name", vertical.getName());
		rootGen.addAttribute("sortnumber", vertical.getSortnumber()+"");
		Set<ExamQuestion> verticalTrainset = vertical.getExamQuestion();
		Iterator<ExamQuestion> it = verticalTrainset.iterator();
		while (it.hasNext()) {
			ExamQuestion vt = it.next();
			Question question = vt.getQuestion();
			if (question != null)
			{
				Element childElement = rootGen.addElement("question");
				String uuid = UUID.randomUUID().toString();
				childElement.addAttribute("url_name", uuid);
				createQuestionXMl(path, coursepath, uuid + ".xml", question);
			}
			else
			{
				Train train = vt.getTrain();

				Element childElement = rootGen.addElement("train");
				String uuid = UUID.randomUUID().toString();
				childElement.addAttribute("url_name", uuid);
				createTrainXMl(path, coursepath, uuid + ".xml", train);
			}
		}
		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "vertical";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void createQuestionXMl(String path, String coursepath, String xml,
			Question question) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("question");
		rootGen.addAttribute("content", question.getContent());
		rootGen.addAttribute("lowcontent", question.getLowcontent());
		rootGen.addAttribute("type", question.getType()+"");

		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "question";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createTrainXMl(String path, String coursepath, String xml,
			Train train) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("train");
		rootGen.addAttribute("display_name", train.getName());
		rootGen.addAttribute("codenum", train.getCodenum());
		rootGen.addAttribute("envname", train.getEnvname());
		rootGen.addAttribute("content", train.getConContent());
		rootGen.addAttribute("answer", train.getConAnswer());
//		String shellpath = train.getConShell();
//		String[] strs = shellpath.split("/");
//		String shellname = "";
//		if (strs.length > 1)
//		{
//			shellname = strs[1];
//		}
//		rootGen.addAttribute("shell", shellname);
		rootGen.addAttribute("score", train.getScore() + "");
		rootGen.addAttribute("scoretag", train.getScoretag());

		List<TrainExt> telist = trainExtDao.getTrainExtList(train.getId());
		for (TrainExt te:telist)
		{
			Element childElement = rootGen.addElement("trainext");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createTrainExtXMl(path, coursepath, uuid + ".xml", te);
		}
//		File imgdir = new File(coursepath + File.separator + "shell");
//		if (!imgdir.exists())
//			imgdir.mkdir();
//		UtilTools.copyFile(path + shellpath,
//				coursepath + File.separator + shellpath);

		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "train";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createTrainExtXMl(String path, String coursepath, String xml,
			TrainExt trainExt)
	{
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("trainext");
//		rootGen.addAttribute("trainId", trainExt.getTrainId()+"");
		String shellpath = trainExt.getShellpath();
		
		rootGen.addAttribute("shellpath", shellpath);
		rootGen.addAttribute("shellname", trainExt.getShellname());
		rootGen.addAttribute("shellparameter", trainExt.getShellparameter());
		rootGen.addAttribute("devinfo", trainExt.getDevinfo());
//		rootGen.addAttribute("scoretag", trainExt.getScoretag());
				
		File imgdir = new File(coursepath + File.separator + "shell");
		if (!imgdir.exists())
			imgdir.mkdir();
		UtilTools.copyFile(path + shellpath,
				coursepath + File.separator + shellpath);

		OutputFormat format = null;
		XMLWriter xmlwriter = null;
		try {
			// 进行格式化
			format = OutputFormat.createPrettyPrint();
			// 设定编码
			format.setEncoding("UTF-8");
			String tt = coursepath + File.separator + "trainext";
			File filedir = new File(tt);
			if (!filedir.exists())
				filedir.mkdir();
			File file = new File(tt + File.separator + xml);
			if (!file.exists())
				file.createNewFile();
			xmlwriter = new XMLWriter(new FileOutputStream(file), format);
			xmlwriter.write(document);
			xmlwriter.flush();
			xmlwriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
