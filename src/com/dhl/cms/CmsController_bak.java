package com.dhl.cms;
//package com.dhl.cms;
//
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.dhl.web.BaseController;
//
///**
// * 老师定义课程，使用等使用
// * 
// * @see
// * @since
// */
//@Controller
//@RequestMapping("/cms")
//public class CmsController extends BaseController {
//	
//	@RequestMapping("/uploadshell")
//	public void uploadshell(HttpServletRequest request,
//			HttpServletResponse response,
//			@RequestParam(value = "qqfile", required = true) MultipartFile file) {
//		response.setContentType("text/html");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//		} catch (IOException e1) {
//			out.print("{\"success\": \"false\"}");
//		}
//		try {
//			if (!file.isEmpty()) {
//				byte[] bytes = file.getBytes();
//				String upath = request.getSession().getServletContext()
//						.getRealPath("/");
//				String path = "shell/" + file.getOriginalFilename();
//				FileOutputStream fos = new FileOutputStream(upath + path);
//				fos.write(bytes);
//				fos.close();
//
//				out.print("{\"success\": \"true\"}");
//				// out.write("<script>parent.callback('sucess')</script>");
//			} else {
//				out.print("{\"success\": \"false\"}");
//			}
//		} catch (Exception e) {
//			out.print("{\"success\": \"false\"}");
//		}
//	}
//}
