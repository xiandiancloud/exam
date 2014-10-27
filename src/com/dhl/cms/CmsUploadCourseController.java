package com.dhl.cms;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.CourseCategory;
import com.dhl.domain.Sequential;
import com.dhl.domain.Train;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.service.CourseService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 老师倒入，导出课程
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CmsUploadCourseController extends BaseController {
	// 课程
	@Autowired
	private CourseService courseService;

	/**
	 * 跳转到老师课程导出页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totexport")
	public ModelAndView totcourselist(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cms/export");
		return view;
	}

	/**
	 * 跳转到老师课程导入页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/totimport")
	public ModelAndView totimport(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		view.addObject("courseId", courseId);
		Course course = courseService.get(courseId);
		view.addObject("course", course);
		view.setViewName("/cms/import");
		return view;
	}

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
	 * 导入课程
	 * 
	 * @param request
	 * @param response
	 * @param file
	 * @param courseId
	 */
	@RequestMapping("/importCourse")
	public void importCourse(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file,
			int courseId) {
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
					courseService.updateCourse(courseId, upath, rootelement);
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
	 * 导出课程
	 * 
	 * @param courseId
	 */
	@RequestMapping("/exportCourse")
	public void exportCourse(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;

			String path = request.getSession().getServletContext()
					.getRealPath("/");
			String ctxPath = path + "export";

			CourseCategory cc = courseService
					.getCourseCategoryByCourseId(courseId);
			Course c = cc.getCourse();
			String rootname = ctxPath + File.separator + c.getStarttime();

			UtilTools.deletefile(rootname);

			// 创建course.xml文件
			createRootXMl(path, rootname, "course.xml", cc.getCategory()
					.getName(), c);

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
			String category, Course c) {
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
		createCourseXMl(path, coursepath, c.getStarttime() + ".xml", c);
		createCourseAbout(coursepath, c.getDescrible());
	}

	private void createCourseAbout(String coursepath, String desc) {
		try {
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

	private void createCourseXMl(String path, String coursepath, String xml,
			Course c) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("course");
		String imgpath = c.getImgpath();
		if (imgpath != null)
		{
			imgpath = imgpath.substring(imgpath.indexOf('/')+1);
		}
		rootGen.addAttribute("course_image", imgpath);
		rootGen.addAttribute("display_name", c.getName());
		rootGen.addAttribute("start", c.getStarttime());
		rootGen.addAttribute("enrollment_start", c.getStarttimedetail());
		rootGen.addAttribute("enrollment_end", c.getEndtimedetail());

		File imgdir = new File(coursepath + File.separator + "static");
		if (!imgdir.exists())
			imgdir.mkdir();
		UtilTools.copyFile(path + "upload" + File.separator + imgpath,
				coursepath + File.separator + "static" + File.separator
						+ imgpath);

		Set<Chapter> set = c.getChapters();
		Iterator<Chapter> it = set.iterator();
		while (it.hasNext()) {
			Chapter chapter = it.next();

			Element childElement = rootGen.addElement("chapter");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createChapterXMl(path, coursepath, uuid + ".xml", chapter);
			// Set<Sequential> sequentialset = chapter.getSequentials();
			// Iterator it2 = sequentialset.iterator();
			//
			// while (it2.hasNext()) {
			// Sequential sequential = (Sequential) it2.next();
			// Set<Vertical> verticalset = sequential.getVerticals();
			// Iterator it3 = verticalset.iterator();
			// while (it3.hasNext()) {
			// Vertical vertical = (Vertical) it3.next();
			// Set<VerticalTrain> verticalTrainset = vertical
			// .getVerticalTrains();
			// Iterator it4 = verticalTrainset.iterator();
			// while (it4.hasNext()) {
			// VerticalTrain vt = (VerticalTrain) it4.next();
			// Train train = vt.getTrain();
			// }
			// }
			// }
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
			Chapter chapter) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("chapter");
		rootGen.addAttribute("display_name", chapter.getName());

		Set<Sequential> sequentialset = chapter.getSequentials();
		Iterator<Sequential> it = sequentialset.iterator();

		while (it.hasNext()) {
			Sequential sequential = it.next();
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
			String xml, Sequential sequential) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("sequential");
		rootGen.addAttribute("display_name", sequential.getName());

		Set<Vertical> verticalset = sequential.getVerticals();
		Iterator<Vertical> it = verticalset.iterator();
		while (it.hasNext()) {
			Vertical vertical = it.next();

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
			Vertical vertical) {
		// 创建document对象
		Document document = DocumentHelper.createDocument();
		// 定义根节点Element
		Element rootGen = document.addElement("vertical");
		rootGen.addAttribute("display_name", vertical.getName());

		Set<VerticalTrain> verticalTrainset = vertical.getVerticalTrains();
		Iterator<VerticalTrain> it = verticalTrainset.iterator();
		while (it.hasNext()) {
			VerticalTrain vt = it.next();
			Train train = vt.getTrain();

			Element childElement = rootGen.addElement("train");
			String uuid = UUID.randomUUID().toString();
			childElement.addAttribute("url_name", uuid);
			createTrainXMl(path, coursepath, uuid + ".xml", train);
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
		String shellpath = train.getConShell();
		String[] strs = shellpath.split("/");
		String shellname = "";
		if (strs.length > 1)
		{
			shellname = strs[1];
		}
		rootGen.addAttribute("shell", shellname);
		rootGen.addAttribute("score", train.getScore() + "");
		rootGen.addAttribute("scoretag", train.getScoretag());

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
}
