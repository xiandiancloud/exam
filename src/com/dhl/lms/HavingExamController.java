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

import com.dhl.bean.QuestionData;
import com.dhl.bean.UserExamData;
import com.dhl.cons.CommonConstant;
import com.dhl.domain.Competion;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.Train;
import com.dhl.domain.UserEnvironment;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserExamHistory;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.service.CompetionService;
import com.dhl.service.ExamQuestionService;
import com.dhl.service.ExamService;
import com.dhl.service.UserEnvironmentService;
import com.dhl.service.UserExamHistoryService;
import com.dhl.service.UserExamService;
import com.dhl.service.UserQuestionService;
import com.dhl.util.ParseQuestion;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;
import com.xiandian.model.User;

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
	private UserExamHistoryService userExamHistoryService;
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamQuestionService examquestionService;
	@Autowired
	private UserQuestionService userQuestionService;
//	@Autowired
//	private UserExamEnvironmentService userExamEnvironmentService;
	@Autowired
	private UserEnvironmentService userEnvironmentService;
	@Autowired
	private CompetionService competionService;
	
	//判断是否有权限去考试
	private boolean isHaving(Exam exam)
	{
		int isnormal = exam.getIsnormal();
		if (isnormal == 1)
		{
			//如果是竞赛试卷，需要判断是否考生在这个竞赛内
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
//		q.add(qd);
		return ParseQuestion.changetohtml(content,id);
	}
	
	/**
	 * 跳转到考试错误页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamerror")
	public ModelAndView toexamerror(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/error");
		return view;
	}
	
	/**
	 * 跳转到学生考试试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtostartexam")
	public ModelAndView toexamingtostartexam(HttpServletRequest request,int competionId,int examId) {
		if (!isstart(competionId))
		{
			String url = "redirect:/lms/toexamerror.action";
			return new ModelAndView(url);
		}
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//学生分析情况，试卷页面如果性能有问题，要拆分出来
		User user = getSessionUser(request);
		List<UserExamData> uedlist = new ArrayList<UserExamData>();
		//总分
		int allscore = 0;
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		while (it.hasNext()) {
			ExamChapter chapter = (ExamChapter) it.next();
			Set<ExamSequential> sequentialset = chapter.getEsequentials();
			Iterator it2 = sequentialset.iterator();
			UserExamData ued = new UserExamData();
			ued.setName(chapter.getName());
			int right = 0;
			int wrong = 0;
			int noanswer = 0;
			int cscore = 0;
			while (it2.hasNext()) {
				ExamSequential sequential = (ExamSequential) it2.next();
				Set<ExamVertical> verticalset = sequential.getExamVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					ExamVertical vertical = (ExamVertical) it3.next();
					Set<ExamQuestion> vt = vertical.getExamQuestion();
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
								qd.setType(CommonConstant.QTYPE_1);
								qtlist.add(qd);
								eq.setQdlist(qtlist);
								//html问题描述 不用分析
							}
							else
							{
								
								List<QuestionData> qdlist = changetohtml(content,q.getId());
								eq.setQdlist(qdlist);
								
								//------------分析问题--------可以拆分出去
								int len = qdlist.size();
								for (int i=0;i<len;i++)
								{
									int number = i+1;
									QuestionData qd = qdlist.get(i);
									
									int quscore = qd.getScore();
									allscore += quscore;
									
									UserQuestionChild uqc = userQuestionService.getQuestionChild(user.getId(), examId, q.getId(), number);
									if (uqc != null)
									{
										String useranswer = uqc.getUseranswer();
										int type = qd.getType();
										if (type == CommonConstant.QTYPE_2 || type == CommonConstant.QTYPE_4 || type == CommonConstant.QTYPE_5)
										{
											//得分，取裁判分
											String pfscore = uqc.getPfscore();										
											if (pfscore != null)
											{
												cscore += Integer.parseInt(pfscore);
											}
											else
											{
												List<String> answerlist = qd.getAnswer();
												if (answerlist != null && answerlist.size() > 0)
												{
													//用户答案跟标准答案相同
													if (useranswer != null && useranswer.trim().equals(answerlist.get(0).trim()))
													{
														cscore += quscore;
													}
												}
											}
											//未答
											if (useranswer == null)
											{
												noanswer ++;
											}
											//答对
											if (pfscore != null)
											{
												if (Integer.parseInt(pfscore) == quscore)
												{
													right ++;
												}
											}
											else
											{
												List<String> answerlist = qd.getAnswer();
												if (answerlist != null && answerlist.size() > 0)
												{
													//用户答案跟标准答案相同
													if (useranswer != null && useranswer.trim().equals(answerlist.get(0).trim()))
													{
														right ++;
													}
												}
											}
											//答错
											if (pfscore != null)
											{
												if (Integer.parseInt(pfscore) != quscore)
												{
													wrong ++;
												}
											}
											else
											{
												if (useranswer != null)
												{
													List<String> answerlist = qd.getAnswer();
													if (answerlist != null && answerlist.size() > 0)
													{
														//用户答案跟标准答案相同
														if (useranswer != null && !useranswer.trim().equals(answerlist.get(0).trim()))
														{
															wrong ++;
														}
													}
												}
												else
												{
													wrong ++;
												}
											}
										}
										else if (type == CommonConstant.QTYPE_3)//多选要匹配答案列表
										{
											//得分，取裁判分
											String pfscore = uqc.getPfscore();										
											if (pfscore != null)
											{
												cscore += Integer.parseInt(pfscore);
											}
											else
											{
												if (useranswer != null)
												{
													List<String> answerlist = qd.getAnswer();
													if (answerlist != null)
													{
														String[] strs = useranswer.split("#");
														int size = answerlist.size();
														boolean flag = true;
														if (size != strs.length)
														{
															flag = false;
														}
														else
														{
															for (int j=0;j<size;j++)
															{
																if (!answerlist.get(j).equals(strs[j]))
																{
																	flag = false;
																	break;
																}
															}
														}
														if (flag)
														{
															cscore = quscore;
														}
													}
												}
											}
											//未答
											if (useranswer == null)
											{
												noanswer ++;
											}
											//答对
											if (pfscore != null)
											{
												if (Integer.parseInt(pfscore) == quscore)
												{
													right ++;
												}
											}
											else
											{
												if (useranswer != null)
												{
													List<String> answerlist = qd.getAnswer();
													if (answerlist != null)
													{
														String[] strs = useranswer.split("#");
														int size = answerlist.size();
														boolean flag = true;
														if (size != strs.length)
														{
															flag = false;
														}
														else
														{
															for (int j=0;j<size;j++)
															{
																if (!answerlist.get(j).equals(strs[j]))
																{
																	flag = false;
																	break;
																}
															}
														}
														if (flag)
														{
															right++;
														}
													}
												}
											}
											//答错
											if (pfscore != null)
											{
												if (Integer.parseInt(pfscore) != quscore)
												{
													wrong ++;
												}
											}
											else
											{
												if (useranswer != null)
												{
													List<String> answerlist = qd.getAnswer();
													if (answerlist != null)
													{
														String[] strs = useranswer.split("#");
														int size = answerlist.size();
														boolean flag = true;
														if (size != strs.length)
														{
															flag = false;
														}
														else
														{
															for (int j=0;j<size;j++)
															{
																if (!answerlist.get(j).equals(strs[j]))
																{
																	flag = false;
																	break;
																}
															}
														}
														if (!flag)
														{
															wrong++;
														}
													}
												}
												else
												{
													wrong ++;
												}
											}
										}
									}
									else
									{
										noanswer ++;
									}
								}
							}
						}
						else//实训
						{
							Train t = eq.getTrain();
							if (t != null)
							{
								List<QuestionData> trainList = new ArrayList<QuestionData>();
								QuestionData qd = new QuestionData(t.getId());
								qd.setTitle(t.getName());
								List<String> qs = new ArrayList<String>();
								qs.add(t.getConContent());
								qd.setContent(qs);
								qd.setType(CommonConstant.QTYPE_6);
								trainList.add(qd);
								eq.setQdlist(trainList);
								
								//---------------分析实训--------可以拆分出去
								allscore += t.getScore();
								UserQuestionChild uqc = userQuestionService.getUserExamTrainQuestionChild(user.getId(),examId,t.getId());
								if (uqc != null)
								{
									String useranswer = uqc.getUseranswer();
									String tanswer = t.getConAnswer();
									String result = uqc.getResult();
									int quscore = t.getScore();
									int tmpscore = 0;
									//得分，取裁判分
									String pfscore = uqc.getPfscore();										
									if (pfscore != null)
									{
										cscore += Integer.parseInt(pfscore);
									}
									else
									{										
										if (useranswer != null && tanswer != null && useranswer.trim().equals(tanswer.trim()))
										{
											cscore += quscore;
										}
										else
										{
											//判断机器评分
											if (result != null && "True".equals(result))
											{
												cscore += quscore;
											}
										}
									}
									//未答
									if (useranswer == null && result == null)
									{
										noanswer ++;
									}
									//答对
									if (pfscore != null)
									{
										if (Integer.parseInt(pfscore) == quscore)
										{
											right ++;
										}
									}
									else
									{
										if (useranswer != null && tanswer != null && useranswer.trim().equals(tanswer.trim()))
										{
											right ++;
										}
										else
										{
											//判断机器评分
											if (result != null && "True".equals(result))
											{
												right ++;
											}
										}
									}
									//答错
									if (pfscore != null)
									{
										if (Integer.parseInt(pfscore) != quscore)
										{
											wrong ++;
										}
									}
									else
									{
										if (useranswer != null && tanswer != null && !useranswer.trim().equals(tanswer.trim()))
										{
											wrong ++;
										}
										else
										{
											//判断机器评分
											if (result != null && "False".equals(result))
											{
												wrong ++;
											}
										}
									}
								}
								else
								{
									noanswer ++;
								}
							}
						}
					}
				}
			}
			ued.setRight(right);
			ued.setWrong(wrong);
			ued.setNoanswer(noanswer);
			ued.setCscore(cscore);
			uedlist.add(ued);
		}
		
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
			ucs = uc;
		} else {
			ucs.setActivestate(1);
			userExamService.updateUserExam(ucs);
		}
		view.addObject("score",allscore);
		view.addObject("uedlist",uedlist);
		view.addObject("userexam",ucs);
		view.addObject("exam", exam);
		view.addObject("competionId",competionId);
		view.setViewName("/lms/exam");
		return view;
	}

	
	/**
	 * 跳转到学生考试的历史记录试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtohistoryexam")
	public ModelAndView toexamingtohistoryexam(HttpServletRequest request,int examId) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
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
					Set<ExamQuestion> vt = vertical.getExamQuestion();
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
								qd.setType(CommonConstant.QTYPE_1);
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
								qd.setType(CommonConstant.QTYPE_6);
								trainList.add(qd);
								eq.setQdlist(trainList);
							}
						}
					}
				}
			}
		}
		User user = getSessionUser(request);
//		userExamService.setMyExamActiveState(user.getId());
		UserExamHistory ucs = userExamHistoryService
				.getUserExam(user.getId(), examId);
		view.addObject("userexam",ucs);
		view.addObject("exam", exam);
		
		view.setViewName("/lms/examhistory");
		return view;
	}
	
	/**
	 * 跳转到老师判分试卷页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toexamingtopfexam")
	public ModelAndView toexamingtopfexam(HttpServletRequest request,int competionId,int examId,int userId) {
		ModelAndView view = new ModelAndView();
		Exam exam = examService.get(examId);
		//
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
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
					Set<ExamQuestion> vt = vertical.getExamQuestion();
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
								qd.setType(CommonConstant.QTYPE_1);
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
								qd.setType(CommonConstant.QTYPE_6);
								qd.setScore(t.getScore());
								List<String> answer = new ArrayList();
								answer.add(t.getConAnswer());
								qd.setAnswer(answer);
								trainList.add(qd);
								eq.setQdlist(trainList);
							}
						}
					}
				}
			}
		}
		view.addObject("competionId",competionId);
		view.addObject("exam", exam);
		view.addObject("userId", userId);
		view.setViewName("/lms/pfexam");
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
			UserQuestionChild uqc = userQuestionService.getQuestionChild(user.getId(),examId,questionId, number);
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
	 * 评分裁判得到用户提交的答案
	 */
	@RequestMapping("/getUserQuestionAnswer")
	public void getUserQuestionAnswer(HttpServletRequest request,
			HttpServletResponse response,int qdtype, int examId,int questionId,int number,int index,int userId) {
		try {
			UserQuestion uq;
			if (qdtype == CommonConstant.QTYPE_6)
			{
				uq = userQuestionService.getUserExamTrainQuestion(userId, examId, questionId);
			}
			else
			{
				uq = userQuestionService.getQuestion(userId, examId, questionId);
			}
			String revalue="";
			String str = "{'sucess':'sucess','answer':' ','index':'"+index+"','pfscore':'0','revalue':' '}";
			String score = "0";
			if (uq != null)
			{
				UserQuestionChild uqc = userQuestionService.getQuestionChild(uq,userId,number);
				if (uqc != null)
				{
					String useranswer = uqc.getUseranswer();
					//实训机器返回值
					revalue = uqc.getRevalue();
					score = UtilTools.getScore(uq, uqc, number);
					str = "{'sucess':'sucess','answer':'"+useranswer+"','index':'"+index+"','pfscore':'"+score+"','revalue':'"+revalue+"'}";
				}
			}
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//判断竞赛是否结束---以后修改调用
	private boolean isstart(int competionId)
	{
		if (competionId > 0)
		{
			Competion c = competionService.get(competionId);
			if (c != null)
			{
				if (c.getIsstart() == 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		}
		return true;
	}
		
	/**
	 * 提交答案
	 */
	@RequestMapping("/submitquesstion")
	public void submitquesstion(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId,int questionId,int number,String useranswer) {
		try {
			String str="";
			if (!isstart(competionId))
			{
				str = "{'sucess':'fail'}";
			}
			else
			{
				User user = getSessionUser(request);
				userQuestionService.saveQuestion(user.getId(),examId,questionId, number, useranswer);
				str = "{'sucess':'sucess'}";
			}
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 提交考卷
	 */
	@RequestMapping("/submitallquesstion")
	public void submitallquesstion(HttpServletRequest request,
			HttpServletResponse response,int competionId, int examId) {
		try {
			String str="";
			if (!isstart(competionId))
			{
				str = "{'sucess':'fail'}";
			}
			else
			{
				User user = getSessionUser(request);
				UserExam ue = userExamService.getUserExam(user.getId(),examId);
				ue.setState(1);
				userExamService.updateUserExam(ue);
				str = "{'sucess':'sucess'}";
			}
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	/**
	 * 裁判修改分值
	 */
	@RequestMapping("/setquesstionpfscore")
	public void setquesstionpfscore(HttpServletRequest request,
			HttpServletResponse response,int type,int userId, int examId,int questionId,int number,String pfscore) {
		try {
			
			boolean flag = userQuestionService.updateQuestion(type,userId,examId,questionId, number,pfscore);
			String str = flag?"{'sucess':'sucess'}":"{'sucess':'fail','msg':'"+CommonConstant.ERROR_7+"'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 裁判判分结束
	 */
	@RequestMapping("/finishpf")
	public void finishpf(HttpServletRequest request,
			HttpServletResponse response,int userId, int examId) {
		try {
			userExamService.finishUserExam(userId, examId);
			String str = "{'sucess':'sucess'}";
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 考试界面调转到
	 * 
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/toexamtrainone")
	public ModelAndView tocourseone(HttpServletRequest request, int competionId,int examId,
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
			
			if (ucs.getState() == 1)
			{
				String url = "redirect:/lms/toexamerror.action";
				return new ModelAndView(url);
			}
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
		view.addObject("competionId",competionId);
		view.addObject("tlist", tlist);
		view.setViewName("/lms/examtrain");
		return view;
	}
	
	//----------------------------------考试实训调用--------------------------------
	/**
	 * 判断环境是否已经准备好
	 * 
	 * @param request
	 * @param response
	 * @param courseId
	 * @param name
	 *            :环境名称
	 */
	@RequestMapping("/hasexamenv")
	public void hasexamenv(HttpServletRequest request,
			HttpServletResponse response, int examId, int trainId, String name) {

		try {
			User user = getSessionUser(request);
			PrintWriter out = response.getWriter();
			UserEnvironment uce = userEnvironmentService.getMyUCE(user.getId(), name);
			UserQuestionChild userTrain = userQuestionService.getUserExamTrainQuestionChild(user.getId(),
					examId, trainId);
			String result = userTrain == null ? "" : userTrain.getResult();
			String revalue = userTrain == null ? "" : userTrain.getRevalue();
			String useranswer = userTrain == null ? "" : userTrain.getUseranswer();
			if (uce != null) {
				String str = "{'sucess':'sucess','ip':'" + uce.getHostname()
						+ "','username':'" + uce.getUsername() + "','result':'"
						+ result + "','revalue':'" + revalue+ "','useranswer':'" + useranswer + "','password':'"
						+ uce.getPassword() + "','ssh':'" + uce.getServerId()
						+ "'}";
				out.write(str);
			} else {
				String str = "{'sucess':'fail','result':'" + result
						+ "','revalue':'" + revalue + "','useranswer':'"+useranswer+"'}";
				out.write(str);
			}
		} catch (Exception e) {

		}
	}
	
	/**
	 * 创建考试的实验
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createExamTrain")
	public void createExamTrain(HttpServletRequest request,
			HttpServletResponse response, String name, String codenum,
			String envname, String conContent, String conShell,
			String conAnswer, int score, String scoretag, int examId,
			int everticalId) {

		try {
			PrintWriter out = response.getWriter();
			userQuestionService.saveTrainQuestion(name, codenum, envname, conContent,
					conShell, conAnswer, score, scoretag, examId, everticalId);
			String str = "{'sucess':'sucess'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 用户的统计情况
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/usercounts")
	public void usercounts(HttpServletRequest request,
			HttpServletResponse response,int examId) {

		try {
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			String str = "{'sucess':'sucess',";
			String score = "";
			Exam exam = examService.get(examId);
			Set<ExamChapter> chapterset = exam.getExamchapters();
			Iterator it = chapterset.iterator();
			str+="'chapter':[";
			String tmpstr = "";
			while (it.hasNext()) {
				ExamChapter chapter = (ExamChapter) it.next();
				Set<ExamSequential> sequentialset = chapter.getEsequentials();
				Iterator it2 = sequentialset.iterator();
				tmpstr+="{'name':'"+chapter.getName()+"'";
				while (it2.hasNext()) {
					ExamSequential sequential = (ExamSequential) it2.next();
					Set<ExamVertical> verticalset = sequential.getExamVerticals();
					Iterator it3 = verticalset.iterator();
					while (it3.hasNext()) {
						ExamVertical vertical = (ExamVertical) it3.next();
						Set<ExamQuestion> vt = vertical.getExamQuestion();
						for (ExamQuestion eq:vt)
						{
							Question q = eq.getQuestion();
							//问题
							if (q != null)
							{
								List<UserQuestionChild> uqc = userQuestionService.getQuestionList(user.getId(),examId,q.getId());
							}
							else//实训
							{
								Train t = eq.getTrain();
								if (t != null)
								{
									UserQuestionChild userTrain = userQuestionService.getUserExamTrainQuestionChild(user.getId(),examId, t.getId());
								}
							}
						}
					}
				}
				tmpstr+="},";
			}
			if (tmpstr.length() > 2)
			{
				tmpstr = tmpstr.substring(0,tmpstr.length() - 1);
			}
			str += tmpstr;
			str += "],'score':'"+score+"'}";
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//-----------------------考试实训-------------------------------
}
