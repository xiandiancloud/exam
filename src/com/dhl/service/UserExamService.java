package com.dhl.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.bean.QuestionData;
import com.dhl.bean.UserExamData;
import com.dhl.bean.UserQuestionData;
import com.dhl.cons.CommonConstant;
import com.dhl.dao.LogDao;
import com.dhl.dao.TrainExtDao;
import com.dhl.dao.UserExamDao;
import com.dhl.dao.UserExamHistoryDao;
import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionChildHistoryDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.dao.UserQuestionHistoryDao;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserExamHistory;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.domain.UserQuestionChildHistory;
import com.dhl.domain.UserQuestionHistory;
import com.dhl.util.ParseQuestion;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class UserExamService {

	@Autowired
	private UserExamDao userExamDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserQuestionChildDao userQuestionChildDao;
	@Autowired
	private UserQuestionHistoryDao userQuestionHistoryDao;
	@Autowired
	private UserQuestionChildHistoryDao userQuestionChildHistoryDao;
	@Autowired
	private UserExamHistoryDao userExamHistoryDao;
	@Autowired
	private LogDao logDao;
	@Autowired
	private TrainExtDao trainExtDao;
	
	public void save(UserExam entity)
	{
		userExamDao.save(entity);
	}
	public void updateUserExam(UserExam userExam) {
		userExamDao.update(userExam);
	}

	/**
	 * 学生提交试卷
	 * @param username
	 * @param userId
	 * @param examId
	 */
	public void finishStudentUserExam(String username,int userId,int examId)
	{
		UserExam ue = getUserExam(userId,examId);
		if (ue != null)
		{
			ue.setState(1);
			updateUserExam(ue);
			logDao.saveLog(username,CommonConstant.LOG_2+"examId:"+examId);
		}
	}
	
	/**
	 * 再来一次
	 * @param userExam
	 */
	public void updateAgainUserExam(int userId,int examId) {
		
		UserExam ucs = getUserExam(userId, examId);
		if (ucs != null)
		{
			UserExamHistory ueh = new UserExamHistory();
			ueh.setActivestate(ucs.getActivestate());
			ueh.setDocounts(ucs.getDocounts());
			ueh.setExam(ucs.getExam());
			ueh.setState(ucs.getState());
			ueh.setUserId(ucs.getUserId());
			ueh.setUsetime(ucs.getUsetime());
			ueh.setAgaindotime(UtilTools.timeTostrHMS(new Date()));
			userExamHistoryDao.save(ueh);
			
			//更新用户考试的相关信息
			ucs.setState(0);
			int oldcounts = ucs.getDocounts();
			int newdocounts = oldcounts + 1;
			ucs.setDocounts(newdocounts);
			userExamDao.update(ucs);
			
			//copy用户对应的问题相关信息进历史记录
			List<UserQuestion> list = userQuestionDao.getUserQueston(userId, examId);
			for (UserQuestion uq:list)
			{
				UserQuestionHistory uqh = new UserQuestionHistory();
				uqh.setCounts(uq.getCounts());
				uqh.setDocounts(oldcounts);
				uqh.setExamId(uq.getExamId());
				uqh.setQuestion(uq.getQuestion());
				uqh.setTrain(uq.getTrain());
				uqh.setUserId(uq.getUserId());
				userQuestionHistoryDao.save(uqh);
				
				List<UserQuestionChild> uqclist = userQuestionChildDao.getUserQuestionByuserquestionId(userId,uq.getId());
				for (UserQuestionChild uqc:uqclist)
				{
					UserQuestionChildHistory uqch = new UserQuestionChildHistory();
					uqch.setNumber(uqc.getNumber());
					uqch.setPfscore(uqc.getPfscore());
					uqch.setResult(uqc.getResult());
					uqch.setRevalue(uqc.getRevalue());
					uqch.setUseranswer(uqc.getUseranswer());
					uqch.setUserId(uqc.getUserId());
					uqch.setUserquestionId(uqh.getId());//应该是历史记录的id
					userQuestionChildHistoryDao.save(uqch);
				}
			}
			//删除考试下面的用户对应的问题相关信息
			userQuestionDao.deleteUserQueston(userId, examId);

		}
	}
	
	public void setMyExamActiveState(int userId) {
		userExamDao.setMyExamActiveState(userId);
	}
	public UserExam getUserExam(int userId, int examId) {
		return userExamDao.getUserExam(userId, examId);
	}
	/**
	 * 裁判完成评分
	 * @param userId
	 * @param examId
	 */
	public void finishUserExam(String username,int userId, int examId) {
		UserExam ue = getUserExam(userId, examId);
		if (ue != null)
		{
			ue.setFipf(1);
			userExamDao.update(ue);
			logDao.saveLog(username,CommonConstant.LOG_4+"examId:"+examId);
		}
	}
	
	public UserExam getUserRecentlyExam(int userId) {
		return userExamDao.getUserRecentlyExam(userId);
	}
	
	/**
	 * 得到我的所有考试 
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserExam> getMyAllExam(int userId) {
		return userExamDao.getMyAllExam(userId);
	}
	
	public List<UserExam> getMyFinishExam(int userId) {
		return userExamDao.getMyFinishExam(userId);
	}
	
	public List<UserExam> getMyHavingExam(int userId) {
		return userExamDao.getMyHavingExam(userId);
	}
	
	//////////////////////////////////////////////////////////////////////////
	/**
	 * 得到用户提交的历史答案
	 */
	public UserQuestionChildHistory getQuestionChildHistory(int userId,int examId,int questionId,int number,int docounts)
	{
		UserQuestionHistory uq = userQuestionHistoryDao.getUserQuestionByquestion(userId, examId, questionId,docounts);
		if (uq != null)
		{
			UserQuestionChildHistory uqc = userQuestionChildHistoryDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
			return uqc;
		}
		return null;
	}
	
	///////////////////////////////////////////////////////////////////////
	
	private UserQuestionData getUserQuestionData(int docounts,int userId,int examId,int questionId,int number)
	{
		if (docounts == -1)
		{
			UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
			if (uq != null)
			{
				UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
				if (uqc != null)
				{
					UserQuestionData uqd = new UserQuestionData();
					uqd.setUseranswer(uqc.getUseranswer());
					uqd.setPfscore(uqc.getPfscore());
					return uqd;
				}
			}
			return null;
		}
		else
		{
			UserQuestionHistory uq = userQuestionHistoryDao.getUserQuestionByquestion(userId, examId, questionId,docounts);
			if (uq != null)
			{
				UserQuestionChildHistory uqc = userQuestionChildHistoryDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
				if (uqc != null)
				{
					UserQuestionData uqd = new UserQuestionData();
					uqd.setUseranswer(uqc.getUseranswer());
					uqd.setPfscore(uqc.getPfscore());
					return uqd;
				}
			}
			return null;
		}
	}
	
	private UserQuestionData getUserTrainData(int docounts,int userId,int examId,int trainId)
	{
		if (docounts == -1)
		{
			UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, examId, trainId);
			if (uq != null)
			{
				UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByusertrainId(userId,uq.getId());
				if (uqc != null)
				{
					UserQuestionData uqd = new UserQuestionData();
					uqd.setUseranswer(uqc.getUseranswer());
					uqd.setPfscore(uqc.getPfscore());
					uqd.setRevalue(uqc.getRevalue());
					return uqd;
				}
			}
			return null;
		}
		else
		{
			UserQuestionHistory uq = userQuestionHistoryDao.getUserQuestionBytrain(userId, examId, trainId,docounts);
			if (uq != null)
			{
				UserQuestionChildHistory uqc = userQuestionChildHistoryDao.getUserQuestionByusertrainId(userId,uq.getId());
				if (uqc != null)
				{
					UserQuestionData uqd = new UserQuestionData();
					uqd.setUseranswer(uqc.getUseranswer());
					uqd.setPfscore(uqc.getPfscore());
					uqd.setRevalue(uqc.getRevalue());
					return uqd;
				}
			}
			return null;
		}
	}
	
	//返回用户单个试卷题目的问题分析
	public String getUserExamOneCount(int type,int userId,int examId,int questionId,int number,int docounts)
	{
		if (type != CommonConstant.QTYPE_6)
		{
			UserQuestionHistory uq = userQuestionHistoryDao.getUserQuestionByquestion(userId, examId, questionId,docounts);
			if (uq != null)
			{
				UserQuestionChildHistory uqc = userQuestionChildHistoryDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
				if (uqc != null)
				{
					return uqc.getUseranswer();
				}
			}
		}
		else
		{
			UserQuestionHistory uq = userQuestionHistoryDao.getUserQuestionBytrain(userId, examId, questionId,docounts);
			if (uq != null)
			{
				UserQuestionChildHistory uqc = userQuestionChildHistoryDao.getUserQuestionByusertrainId(userId,uq.getId());
				if (uqc != null)
				{
					return uqc.getUseranswer();
				}
			}
		}
		return null;
	}
	
	private boolean isCorrect(int type,String useranswer,List<String> answerlist,String REGEX)
	{
		try {
			useranswer = java.net.URLDecoder.decode(useranswer,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (type == CommonConstant.QTYPE_2)
		{
			return useranswer.trim().equalsIgnoreCase(answerlist.get(0).trim());
		}
		else if (type == CommonConstant.QTYPE_3)
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
					if (!answerlist.get(j).equalsIgnoreCase(strs[j]))
					{
						flag = false;
						break;
					}
				}
			}
			return flag;
		}
		else if (type == CommonConstant.QTYPE_4 || type == CommonConstant.QTYPE_5 || type == CommonConstant.QTYPE_6)
		{
			//主观题用正则表达式判断
			Pattern p = Pattern.compile(REGEX);
		    Matcher m = p.matcher(useranswer);
		    return m.find();
		}
		else
			return false;
	}
	
	//用户试卷分析情况
	public List getUserExamCount(int userId,Exam exam,int docounts)
	{
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
			int right = 0;//答对
			int wrong = 0;//答错
			int noanswer = 0;//未答
			int cscore = 0;//得分
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
								
								List<QuestionData> qdlist = ParseQuestion.changetohtml(content,q.getId());
								eq.setQdlist(qdlist);
								//------------分析问题--------可以拆分出去
								int len = qdlist.size();
								for (int i=0;i<len;i++)
								{
									int number = i+1;
									QuestionData qd = qdlist.get(i);
									
									int quscore = qd.getScore();
									allscore += quscore;
									
//									UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, exam.getId(), q.getId());
//									UserQuestionChild uqc = null;
//									if (uq != null)
//									{
//										uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
//									}
//									UserQuestionChild uqc = userQuestionService.getQuestionChild(userId, exam.getId(), q.getId(), number);
									UserQuestionData uqc = getUserQuestionData(docounts,userId,exam.getId(),q.getId(),number);
									if (uqc != null)
									{
										String useranswer = uqc.getUseranswer();
										qd.setUseranswer(useranswer);
										int type = qd.getType();
										//得分，取裁判分
										String pfscore = uqc.getPfscore();
										if (pfscore != null)
										{
											qd.setUserscore(Integer.parseInt(pfscore));
											cscore += Integer.parseInt(pfscore);
											if (Integer.parseInt(pfscore) == quscore)
											{
												right ++;
											}
											else
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
													if (isCorrect(type,useranswer,answerlist,qd.getExplain()))
													{
														qd.setUserscore(quscore);
														cscore += quscore;
														right++;
													}
													else
													{
														wrong ++;
													}
												}
												else
												{
													wrong ++;
												}
											}
										}
										//未答
										if (useranswer == null)
										{
											noanswer ++;
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
								List<String> qa = new ArrayList<String>();
								qa.add(t.getConAnswer());
								qd.setAnswer(qa);
								qd.setType(CommonConstant.QTYPE_6);
								qd.setScore(t.getScore());
								trainList.add(qd);
								eq.setQdlist(trainList);
								//---------------分析实训--------可以拆分出去
								allscore += t.getScore();
//								UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, exam.getId(), t.getId());
//								UserQuestionChild uqc = null;
//								if (uq != null)
//								{
//									uqc = userQuestionChildDao.getUserQuestionByusertrainId(userId,uq.getId());
//								}
//								UserQuestionChild uqc = userQuestionService.getUserExamTrainQuestionChild(userId,exam.getId(),t.getId());
								UserQuestionData uqc = getUserTrainData(docounts,userId,exam.getId(),t.getId());
								if (uqc != null)
								{
									String useranswer = uqc.getUseranswer();
									qd.setUseranswer(useranswer);
//									String tanswer = t.getConAnswer();
									String revalue = uqc.getRevalue();
									qd.setOsanswer(revalue);
									int quscore = t.getScore();
//									int tmpscore = 0;
									//得分，取裁判分
									String pfscore = uqc.getPfscore();										
									if (pfscore != null)
									{
										qd.setUserscore(Integer.parseInt(pfscore));
										cscore += Integer.parseInt(pfscore);
										if (Integer.parseInt(pfscore) == quscore)
										{
											right ++;
										}
										else
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
												List<TrainExt> te = trainExtDao.getTrainExtList(t.getId());
												String REGEX = "";
												for (TrainExt text:te)
												{
													REGEX += text.getScoretag();
												}
												if (isCorrect(CommonConstant.QTYPE_6,useranswer,answerlist,REGEX))
												{
													qd.setUserscore(quscore);
													cscore += quscore;
													right++;
												}
												else
												{
													if (revalue != null && isCorrect(CommonConstant.QTYPE_6,revalue,answerlist,REGEX))
													{
														qd.setUserscore(quscore);
														cscore += quscore;
														right++;
													}
													else
													{
														wrong++;
													}
												}
											}
										}
//										if (useranswer != null && tanswer != null && useranswer.trim().equalsIgnoreCase(tanswer.trim()))
//										{
//											cscore += quscore;
//											right ++;
//										}
//										else
//										{
//											//判断机器评分
//											if (result != null && "True".equals(result))
//											{
//												cscore += quscore;
//												right ++;
//											}
//											else
//											{
//												wrong ++;
//											}
//										}
									}
									//未答
									if (useranswer == null && revalue == null)
									{
										noanswer ++;
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
		
		List list = new ArrayList();
		list.add(allscore);
		list.add(uedlist);
		return list;
	}
	
	//试卷开始前的介绍页面，提供试卷总体信息
	public List getUserExamCount2(Exam exam)
	{
		int index = 0;
		int score = 0;
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		List<Train> tlist = new ArrayList<Train>();
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
						if (q != null)
						{
							List<QuestionData> qdlist = ParseQuestion.changetohtml(q.getContent(), q.getId());
							if (qdlist != null && qdlist.size() > 0)
							{
								for (QuestionData qd:qdlist)
								{
									index ++;
									score += qd.getScore();
								}
							}
							else
							{
								index ++;
							}
						}
						else
						{
							index ++;
							Train train = eq.getTrain();
							if (train != null)
							{
								score += train.getScore();
							}
						}
					}
				}
			}
		}
		
		String mmm;
		String s = exam.getStarttimedetail();
		String e = exam.getEndtimedetail();
		if (s==null || e== null || "".equals(s) || "".equals(e))
		{
			mmm = "n";
		}
		else
		{
			long startT = UtilTools.fromDateStringToLong(s);
			long endT = UtilTools.fromDateStringToLong(e);
			long ss=(startT-endT)/(1000); //共计秒数
			int mm = (int)ss/60;   //共计分钟数
			mmm = mm+"";
		}
		int size = exam.getExamchapters().size();
		
		List list = new ArrayList();
		list.add(score);
		list.add(index);
		list.add(size);
		list.add(mmm);
		return list;
	}
}
