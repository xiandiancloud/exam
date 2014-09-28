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

import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.QuestionData;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserQuestionChild;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamService;
import com.dhl.service.UserExamService;
import com.dhl.service.UserQuestionService;
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
	@Autowired
	private UserQuestionService userQuestionService;
	
	//判断是否有权限去考试
	private boolean isHaving(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			//如果是竞赛试卷，需要判断是否考试在这个竞赛内
		}
		return true;
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
	
	private List<QuestionData> changetohtml(String content,int id)
	{
//		List<QuestionData> qtlist = new ArrayList();
////		
//		QuestionData qd = new QuestionData();
//		qd.setAnswer("111111");
//		List<String> qs = new ArrayList();
//		qs.add("content111--------");
//		qs.add("content222--------");
//		qd.setContent(qs);
//		qd.setScore(100);
//		qd.setTitle("问题标题测试---------");
//		qd.setId(1);
//		qd.setType(3);
//		qd.setExplain("解释--------");
//		qtlist.add(qd);
		return ParseQuestion.changetohtml(content,id);
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
						Question q = eq.getQuestion();
						//问题
						if (q != null)
						{
							String content = q.getContent();
							if (q.getType() == 1)
							{
								List<QuestionData> qtlist = new ArrayList();
								QuestionData qd = new QuestionData(q.getId());
								qd.setTitle(content);
								qd.setType(1);
								qtlist.add(qd);
								eq.setQdlist(qtlist);
//							eq.setHtmlcontent(content);
							}
							else
							{
								
								List<QuestionData> qdlist = changetohtml(content,q.getId());
								eq.setQdlist(qdlist);
							}
						}
						else//实训
						{
							Train t = eq.getTrain();
							if (t != null)
							{
								List<QuestionData> trainList = new ArrayList();
								QuestionData qd = new QuestionData(t.getId());
								qd.setTitle(t.getName());
								List<String> qs = new ArrayList();
								qs.add(t.getConContent());
								qd.setContent(qs);
								qd.setType(6);
								trainList.add(qd);
								eq.setQdlist(trainList);
							}
						}
					}
				}
			}
		}
		User user = getSessionUser(request);
		userExamService.setMyExamActiveState(user.getId());
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
			userExamService.updateUserExam(ucs);
		}
		
		view.addObject("exam", exam);
		
		view.setViewName("/lms/exam");
		return view;
	}

	/**
	 * 得到用户提交的答案
	 */
	@RequestMapping("/getQuestionAnswer")
	public void getQuestionAnswer(HttpServletRequest request,
			HttpServletResponse response, int examId,int questionId,int number,int index) {
		try {
			
			User user = getSessionUser(request);
			UserQuestionChild uqc = userQuestionService.getQuestion(user.getId(),examId,questionId, number);
			String str = "{'sucess':'sucess'}";
			if (uqc != null)
			{
				String useranswer = uqc.getUseranswer();
				str = "{'sucess':'sucess','answer':'"+useranswer+"','index':'"+index+"'}";
			}
			
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 提交答案
	 */
	@RequestMapping("/submitquesstion")
	public void submitquesstion(HttpServletRequest request,
			HttpServletResponse response, int examId,int questionId,int number,String useranswer) {
		try {
			
			User user = getSessionUser(request);
			userQuestionService.saveQuestion(user.getId(),examId,questionId, number, useranswer);
			String str = "{'sucess':'sucess'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 考试界面调整到
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/toexamtrainone")
	public ModelAndView tocourseone(HttpServletRequest request, int examId,
			int everticalId, int trainId) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		Exam exam = examService.get(examId);
		UserExam ucs = userExamService.getUserExam(user.getId(), examId);
		if (ucs == null) {
			UserExam uc = new UserExam();
			uc.setUserId(user.getId());
			uc.setExam(exam);
			uc.setState(0);
			uc.setDocounts(1);
			uc.setActivestate(1);
			userExamService.save(uc);
		} else {
			ucs.setActivestate(1);
			userExamService.updateUserExam(ucs);
		}
		userExamService.setMyExamActiveState(user.getId());
		view.addObject("exam", exam);

		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList();
		int currentPage = 0;
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
					Set<ExamQuestion> verticalTrainset = vertical.getExamQuestion();
					Iterator it4 = verticalTrainset.iterator();
					while (it4.hasNext()) {
						ExamQuestion vt = (ExamQuestion) it4.next();
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
		view.setViewName("/lms/examtrain");
		return view;
	}
}
