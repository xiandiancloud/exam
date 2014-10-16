package com.dhl.lms;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dhl.web.BaseController;

/**
 * lms上传
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsUploadController extends BaseController {

	/**
	 * 上传竞赛的图片
	 * 
	 * @param request
	 * @param response
	 * @param file
	 */
	@RequestMapping("/importcompetionimg")
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

}
