package com.dhl.cms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.dhl.domain.RestTrain;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 实验提交检测control
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/cms")
public class ExamTrainController extends BaseController {
	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping("/getTraincourse")
	public void getTraincourse(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();

			RestTrain rs = new RestTrain();
			HttpEntity<RestTrain> entity = new HttpEntity<RestTrain>(rs);

			String resturl = UtilTools.getConfig().getProperty("REST_URL");
			ResponseEntity<RestTrain> res = restTemplate.postForEntity(resturl,
					entity, RestTrain.class);

			RestTrain e = res.getBody();

			String str = "{'sucess':'sucess'}";

			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally {
				String str = "{'user':'error','msg':'服务器有异常，请联系管理员'}";
				if (out != null)
					out.write(str);
			}
		}
	}
}
