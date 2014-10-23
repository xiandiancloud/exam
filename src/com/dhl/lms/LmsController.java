package com.dhl.lms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.Page;
import com.dhl.domain.Category;
import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.CourseCategory;
import com.dhl.domain.Sequential;
import com.dhl.domain.Train;
import com.dhl.domain.UserCourse;
import com.dhl.domain.UserTrain;
import com.dhl.domain.UserTrainHistory;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.service.CategoryService;
import com.dhl.service.CourseCategoryService;
import com.dhl.service.CourseService;
import com.dhl.service.UserCourseService;
import com.dhl.service.UserTrainHistoryService;
import com.dhl.service.UserTrainService;
import com.dhl.service.VerticalService;
import com.dhl.service.VerticalTrainService;
import com.dhl.web.BaseController;
import com.xiandian.model.User;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private CourseService courseService;
	@Autowired
	private VerticalService verticalService;
	@Autowired
	private VerticalTrainService vtService;
	@Autowired
	private UserTrainService utService;
	@Autowired
	private UserCourseService userCourseService;
	@Autowired
	private UserTrainHistoryService userTrainHistoryService;

	/**
	 * 自动注入
	 */
	@Autowired
	private CategoryService categoryService;

	/**
	 * 自动注入
	 */
	@Autowired
	private CourseCategoryService courseCategoryService;

	@RequestMapping("/getCourseByCategoryId")
	public void getCourseByCategoryId(HttpServletRequest request,
			HttpServletResponse response, int categoryId, int pageNo) {
		try {
			Page page = courseCategoryService.getCourseByCategoryId(categoryId,
					pageNo, CommonConstant.SYS_PAGE_SIZE);
			String str = getProjectViewStr(page);
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String getProjectViewStr(Page list) {
		StringBuffer buffer = new StringBuffer();
		long count = list.getTotalPageCount();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		List<CourseCategory> data = list.getResult();
		Iterator<CourseCategory> it = data.iterator();
		while (it.hasNext()) {
			CourseCategory p = it.next();
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getCourse().getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getCourse().getName() + "\"");
			buffer.append(",\"imgpath\":");
			buffer.append("\"" + p.getCourse().getImgpath() + "\"");
			buffer.append(",\"desc\":");
			buffer.append("\"" + p.getCourse().getDescrible() + "\"");
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

//	/**
//	 * 跳转到学生首页
//	 * 
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("/lms")
//	public ModelAndView cms(HttpServletRequest request) {
//		String url = "redirect:/lms/getAllCategory.action";
//		return new ModelAndView(url);
//	}

	@RequestMapping("/getAllCategory")
	public ModelAndView getAllCategory(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		List<Category> category = categoryService.getAllCategory();
		view.addObject("category", category);
		view.addObject("navindex", 1);
		view.setViewName("/lms/courselist");
		return view;
	}

	/**
	 * 参加课程,继续学习
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/tocourse")
	public ModelAndView tocourse(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		// if (user == null) {
		// String url = "redirect:/tologin.action?url=getCourse.courseId="
		// + courseId;
		// return new ModelAndView(url);
		// }
		userCourseService.setMyCourseActiveState(user.getId());
		UserCourse ucs = userCourseService
				.getUserCourse(user.getId(), courseId);
		if (ucs == null) {
			UserCourse uc = new UserCourse();
			uc.setUserId(user.getId());
			uc.setCourse(courseService.get(courseId));
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			uc.setUsetime("0");
			userCourseService.save(uc);
		} else {
			ucs.setActivestate(1);
			userCourseService.updateUserCourse(ucs);
		}
		Course course = courseService.get(courseId);
		view.addObject("course", course);

		Set<Chapter> chapterset = course.getChapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		while (it.hasNext()) {
			Chapter chapter = (Chapter) it.next();
			Set<Sequential> sequentialset = chapter.getSequentials();
			Iterator it2 = sequentialset.iterator();

			while (it2.hasNext()) {
				Sequential sequential = (Sequential) it2.next();
				Set<Vertical> verticalset = sequential.getVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					Vertical vertical = (Vertical) it3.next();
					Set<VerticalTrain> verticalTrainset = vertical
							.getVerticalTrains();
					Iterator it4 = verticalTrainset.iterator();
					while (it4.hasNext()) {
						VerticalTrain vt = (VerticalTrain) it4.next();
						Train train = vt.getTrain();
						if (train != null) {
							tlist.add(train);
						}
					}
				}
			}
		}
		view.addObject("tlist", tlist);
		view.addObject("currentPage", 1);
		view.setViewName("/lms/train");
		return view;
	}

	/**
	 * 参加课程,继续学习,直接跳转到指定的实验
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/tocourseone")
	public ModelAndView tocourseone(HttpServletRequest request, int courseId,
			int verticalId, int trainId) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		// if (user == null) {
		// String url = "redirect:/tologin.action?url=getCourse.courseId="
		// + courseId;
		// return new ModelAndView(url);
		// }
		userCourseService.setMyCourseActiveState(user.getId());
		UserCourse ucs = userCourseService
				.getUserCourse(user.getId(), courseId);
		if (ucs == null) {
			UserCourse uc = new UserCourse();
			uc.setUserId(user.getId());
			uc.setCourse(courseService.get(courseId));
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			userCourseService.save(uc);
		} else {
			ucs.setActivestate(1);
			userCourseService.updateUserCourse(ucs);
		}
		Course course = courseService.get(courseId);
		view.addObject("course", course);

		Set<Chapter> chapterset = course.getChapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		int currentPage = 0;
		while (it.hasNext()) {
			Chapter chapter = (Chapter) it.next();
			Set<Sequential> sequentialset = chapter.getSequentials();
			Iterator it2 = sequentialset.iterator();

			while (it2.hasNext()) {
				Sequential sequential = (Sequential) it2.next();
				Set<Vertical> verticalset = sequential.getVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					Vertical vertical = (Vertical) it3.next();
					Set<VerticalTrain> verticalTrainset = vertical
							.getVerticalTrains();
					Iterator it4 = verticalTrainset.iterator();
					while (it4.hasNext()) {
						VerticalTrain vt = (VerticalTrain) it4.next();
						Train train = vt.getTrain();
						if (train != null) {
							tlist.add(train);
							currentPage++;
							if (trainId == train.getId()) {
								view.addObject("currentPage", currentPage);
							}
						}
					}
				}
			}
		}
		view.addObject("tlist", tlist);
		view.setViewName("/lms/train");
		return view;
	}
	
	/**
	 * 首页显示最近操作的课程，登陆后显示
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/recentcourse")
	public void recentcourse(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			if (user == null) {
				String str = "{'sucess':'fail'}";

				out.write(str);
			} else {

				UserCourse userCourse = userCourseService
						.getUserRecentlyCourse(user.getId());
				if (userCourse == null) {
					String str = "{'sucess':'fail'}";

					out.write(str);
				} else {
					List<VerticalTrain> vtlist = vtService
							.getAllTrainByCourseId(userCourse.getCourse()
									.getId());
					List<UserTrain> utlist = utService.getMyFinishCourseTrain(
							user.getId(), userCourse.getCourse().getId());
					int counts = vtlist == null ? 0 : vtlist.size();
					int ncounts = utlist == null ? 0 : utlist.size();
					String complete = "0%";
					if (utlist != null) {
						double c = 0;
						if (c != 0) {
							c = ncounts * 100 / counts;
							complete = Math.floor(c) + "%";
						}

					}
					String str = "{'sucess':'sucess','name':'"
							+ userCourse.getCourse().getName() + "','img':'"
							+ userCourse.getCourse().getImgpath()
							+ "','courseId':'" + userCourse.getCourse().getId()
							+ "','complete':'" + complete + "'}";

					out.write(str);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 课程的完成状态
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/condition")
	public void condition(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			List<VerticalTrain> vtlist = vtService
					.getAllTrainByCourseId(courseId);
			List<UserTrain> utlist = utService.getMyFinishCourseTrain(
					user.getId(), courseId);
			int counts = vtlist == null ? 0 : vtlist.size();
			int ncounts = utlist == null ? 0 : utlist.size();
			String complete = "0%";
			if (utlist != null) {
				double c = ncounts * 100 / counts;
				complete = Math.floor(c) + "%";
			}
			UserCourse uc = userCourseService.getUserCourse(user.getId(),
					courseId);
			// UserCourseTime uctime = userCourseService.getUserCourseTime(
			// user.getId(), courseId, uc.getDocounts());
			String str = "{'sucess':'sucess','allcounts':'" + counts
					+ "','counts':'" + ncounts + "','dotime':'"
					+ uc.getUsetime() + "','complete':'" + complete + "'}";

			out.write(str);
			// }
		} catch (Exception e) {

		}
	}

	/**
	 * 课程的实验时间
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/dotime")
	public void dotime(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			UserCourse uc = userCourseService.getUserCourse(user.getId(),
					courseId);
			// UserCourseTime uctime = userCourseService.getUserCourseTime(
			// user.getId(), courseId, uc.getDocounts());
			String dotime = uc.getUsetime();
			if (dotime == null || "".equals(dotime)) {
				dotime = "0:00:00";
			}
			String str = "{'sucess':'sucess','dotime':'" + dotime + "'}";

			out.write(str);
			// }
		} catch (Exception e) {

		}
	}

	/**
	 * 更新课程的实验时间
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/setdotime")
	public void setdotime(HttpServletRequest request,
			HttpServletResponse response, int courseId, String usetime) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			UserCourse uc = userCourseService.getUserCourse(user.getId(),
					courseId);
			uc.setUsetime(usetime);
			userCourseService.updateUserCourse(uc);
			// UserCourseTime uct = userCourseService.getUserCourseTime(
			// user.getId(), courseId, uc.getDocounts());
			// userCourseService.updateUserCourseTime(uct, usetime);
			String str = "{'sucess':'sucess'}";

			out.write(str);
			// }
		} catch (Exception e) {

		}
	}

	/**
	 * 完成课程
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/fcourse")
	public void fcourse(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			UserCourse uc = userCourseService.getUserCourse(user.getId(),
					courseId);
			uc.setState(1);
			userCourseService.updateUserCourse(uc);
			String str = "{'sucess':'sucess'}";
			out.write(str);
			// }
		} catch (Exception e) {

		}
	}

	/**
	 * 再来一次课程
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/acourse")
	public void acourse(HttpServletRequest request,
			HttpServletResponse response, int courseId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			// if (user == null) {
			// String str = "{'sucess':'fail'}";
			//
			// out.write(str);
			// } else {
			UserCourse uc = userCourseService.getUserCourse(user.getId(),
					courseId);
			int docounts = uc.getDocounts();
			String usetime = uc.getUsetime();
			List<UserTrain> utlist = utService.getMyCourseTrain(user.getId(),
					courseId);
			for (UserTrain ut : utlist) {
				// 保存历史记录
				UserTrainHistory entity = new UserTrainHistory();
				entity.setCounts(ut.getCounts());
				entity.setCourseId(ut.getCourseId());
				entity.setResult(ut.getResult());
				entity.setRevalue(ut.getRevalue());
				entity.setTrainId(ut.getTrainId());
				entity.setUserId(ut.getUserId());
				entity.setDocounts(docounts);
				entity.setUsetime(usetime);
				userTrainHistoryService.save(entity);
				// 更新老的用户实验记录
				ut.setResult("");
				ut.setRevalue("");
				ut.setCounts(0);
				utService.update(ut);
			}
			// 更新用户课程
			uc.setState(0);
			uc.setUsetime("0");
			uc.setDocounts(docounts + 1);
			userCourseService.updateUserCourse(uc);
			String str = "{'sucess':'sucess'}";
			out.write(str);
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 我的课程
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycourse")
	public ModelAndView mycourse(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		// if (user == null) {
		// String url = "redirect:/tologin.action";
		// return new ModelAndView(url);
		// }
		// List<UserCourse> mycourses = userCourseService.getMyAllCourse(user
		// .getId());
		List<UserCourse> mycourses = userCourseService.getMyHavingCourse(user
				.getId());
		view.addObject("having", mycourses);
		List<UserCourse> mycourses2 = userCourseService.getMyFinishCourse(user
				.getId());
		view.addObject("finish", mycourses2);
		view.addObject("navindex", 2);
		view.setViewName("/lms/mycourse");
		return view;
	}

	/**
	 * 课程列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/courselist")
	public ModelAndView courselist(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
//		User user = getSessionUser(request);
//		// if (user == null) {
//		// String url = "redirect:/tologin.action";
//		// return new ModelAndView(url);
//		// }
//		// List<UserCourse> mycourses = userCourseService.getMyAllCourse(user
//		// .getId());
//		List<UserCourse> mycourses = userCourseService.getMyHavingCourse(user
//				.getId());
//		view.addObject("having", mycourses);
//		List<UserCourse> mycourses2 = userCourseService.getMyFinishCourse(user
//				.getId());
//		view.addObject("finish", mycourses2);
//		view.addObject("navindex", 2);
		view.setViewName("/lms/online");
		return view;
	}
	
	@RequestMapping("/getAllCourse")
	public ModelAndView getAllCourse(HttpServletRequest request, int currentpage) {
		ModelAndView view = new ModelAndView();

		// int currentpage = 1;//Integer.parseInt(request.getParameter("page"));
		// int rows = CommonConstant.SYS_PAGE_SIZE;

		Page page = courseService.getAllCourse(currentpage,
				CommonConstant.SYS_PAGE_SIZE);
		List<Course> courses = page.getResult();
		int totalpage = (int) page.getTotalPageCount();
		view.addObject("courses", courses);
		view.addObject("totalpage", totalpage);
		view.addObject("navindex", 1);
		view.setViewName("/lms/courselist");
		return view;
	}

	/**
	 * 进入课程页面
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/getCourse")
	public ModelAndView getCourse(HttpServletRequest request, int courseId) {
		ModelAndView view = new ModelAndView();
		Course course = courseService.get(courseId);
		view.addObject("course", course);

		User user = getSessionUser(request);
		if (user == null) {
			view.addObject("buttonshow", 0);
		} else {
			UserCourse mycourse = userCourseService.getUserCourse(user.getId(),
					courseId);
			if (mycourse != null) {
				view.addObject("buttonshow", 1);
				if (mycourse.getState() == 0) {
					view.addObject("coursehaving", 0);
				} else {
					view.addObject("coursehaving", 1);
				}
			} else {
				view.addObject("buttonshow", 0);
			}
		}
		// view.addObject("courseId", courseId);
		// List<Train> train = vtService.getTrainList(verticalId);
		// view.addObject("train", train);
		view.setViewName("/lms/course");
		return view;
	}
}
