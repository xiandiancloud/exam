package com.dhl.lms;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dhl.domain.School;
import com.dhl.service.SchoolService;
import com.dhl.web.BaseController;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class SchoolController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private SchoolService schoolService;
	
	@RequestMapping("/getAllSchool")
	public void getAllSchool(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<School> list = schoolService.getAllSchool();
			String str = getProjectViewStr(list);
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getProjectViewStr(List<School> list) {
		StringBuffer buffer = new StringBuffer();
		int count = list.size();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		for (int i=0;i<count;i++)
		{
			School p = list.get(i);
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getSchool_name() + "\"");
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
