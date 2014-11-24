package com.dhl.cms;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dhl.domain.Train;
import com.dhl.service.TrainService;
import com.dhl.web.BaseController;

/**
 * 老师定义课程，使用等使用
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class CmsController extends BaseController {
	@Autowired
	private TrainService trainService;

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
			Train t = trainService.get(trainId);
    		
			String str = "{'sucess':'sucess','name':'"+t.getName()+"','codenum':'"+t.getCodenum()
					+"','envname':'"+t.getEnvname()+"','conContent':'"+t.getConContent()+"','conShell':'"
					+t.getConShell()+"','conAnswer':'"+t.getConAnswer()+"','scoretag':'"+t.getScoretag()+"','score':'"+t.getScore()+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
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
			HttpServletResponse response,int trainId, String name, String codenum,
			String envname, String conContent, String conShell,
			String conAnswer, int score, String scoretag) {

		try {
			PrintWriter out = response.getWriter();
			trainService.update(trainId,name, codenum, envname, conContent,
					conShell, conAnswer, score, scoretag);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadshell")
	public void uploadshell(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			out.print("{\"success\": \"false\"}");
		}
		try {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String upath = request.getSession().getServletContext()
						.getRealPath("/");
				String path = "shell/" + file.getOriginalFilename();
				FileOutputStream fos = new FileOutputStream(upath + path);
				fos.write(bytes);
				fos.close();

				out.print("{\"success\": \"true\"}");
				// out.write("<script>parent.callback('sucess')</script>");
			} else {
				out.print("{\"success\": \"false\"}");
			}
		} catch (Exception e) {
			out.print("{\"success\": \"false\"}");
		}
	}
}
