package com.dhl.lms;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.UserExam;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamService;
import com.dhl.service.UserExamService;
import com.dhl.util.ParseQuestion;
import com.dhl.web.BaseController;

/**
 * 开始考试使用
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class HavingExamController extends BaseController {

	@Autowired
	private UserExamService userExamService;
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamQuestionService examquestionService;
	
	//判断是否有权限去考试
	private boolean isHaving(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			
		}
		return false;
	}
	
	//判断是否有权限去判分
	private boolean isHavingPf(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			
		}
		return false;
	}
	
	private String changetohtml(String content)
	{
		return ParseQuestion.changetohtml(content);
	}
	
	/**
	 * 跳转到学生考试试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtostartexam")
	public ModelAndView toexamingtostartexam(HttpServletRequest request,int examId) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//
		
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		while (it.hasNext()) {
			ExamChapter chapter = (ExamChapter) it.next();
			Set<ExamSequential> sequentialset = chapter.getEsequentials();
			Iterator it2 = sequentialset.iterator();

			while (it2.hasNext()) {
				ExamSequential sequential = (ExamSequential) it2.next();
				Set<ExamVertical> verticalset = sequential.getExamVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					ExamVertical vertical = (ExamVertical) it3.next();
					Set<ExamQuestion> vt = vertical.getExamQuestion();//examquestionService.getVerticalTrainList(vertical.getId());
					for (ExamQuestion eq:vt)
					{
						String content = eq.getQuestion().getContent();
						content = changetohtml(content);
						eq.setHtmlcontent(content);
					}
//					Set<VerticalTrain> verticalTrainset = vertical
//							.getVerticalTrains();
//					Iterator it4 = verticalTrainset.iterator();
//					while (it4.hasNext()) {
//						VerticalTrain vt = (VerticalTrain) it4.next();
//						Train train = vt.getTrain();
//						if (train != null) {
//							tlist.add(train);
//						}
//					}
				}
			}
		}
		
		
		
		
		User user = getSessionUser(request);
		userExamService.setMyCourseActiveState(user.getId());
		UserExam ucs = userExamService
				.getUserExam(user.getId(), examId);
		if (ucs == null) {
			UserExam uc = new UserExam();
			uc.setUserId(user.getId());
			uc.setExam(examService.get(examId));
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			uc.setUsetime("0");
			userExamService.save(uc);
		} else {
			ucs.setActivestate(1);
			userExamService.updateUserCourse(ucs);
		}
		
		view.addObject("exam", exam);
		
		view.setViewName("/lms/exam");
		return view;
	}

}
