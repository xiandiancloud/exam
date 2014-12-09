package com.dhl.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.bean.QuestionData;
import com.dhl.bean.UserCompetionData;
import com.dhl.bean.UserQuestionData;
import com.dhl.cons.CommonConstant;
import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionExamDao;
import com.dhl.dao.TrainExtDao;
import com.dhl.dao.UserCompetionDao;
import com.dhl.dao.UserExamDao;
import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.dhl.domain.Question;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.domain.UserCompetion;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.util.ParseQuestion;
import com.dhl.util.UtilTools;
import com.xiandian.cai.UserInterface;
import com.xiandian.model.User;

/**
 *
 */
@Service
public class UserCompetionService {

	@Autowired
	private UserCompetionDao userCompetionDao;
	@Autowired
	private CompetionDao competionDao;
	@Autowired
	private CompetionExamDao competionExamDao;
	@Autowired
	private UserExamDao userExamDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserQuestionChildDao userQuestionChildDao;
	@Autowired
	private TrainExtDao trainExtDao;	
//	@Autowired
//	private UserInterface userInterface;
	
	public UserCompetion get(int id)
	{
		return userCompetionDao.get(id);
	}
	/**
	 * 保存竞赛相关的用户
	 * @param userId
	 * @param competionId
	 * @param job
	 */
	public void save(int userId,int competionId,String job)
	{
		UserCompetion uc = new UserCompetion();
		uc.setUserId(userId);
		uc.setCompetion(competionDao.get(competionId));
		uc.setJob(job);
		userCompetionDao.save(uc);
	}
	
	public void remove(int id)
	{
		userCompetionDao.remove(get(id));
	}
	
	/**
	 * 删除竞赛相关的用户
	 * @param userId
	 * @param competionId
	 * @param job
	 */
	public void removeCompetionUser(int userId,int competionId)
	{
		userCompetionDao.removeCompetionjudgment(competionId, userId);
	}
	
	/**
	 * 得到我的所有竞赛
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserCompetion> getMyAllCompetion(int userId) {
		return userCompetionDao.getMyAllCompetion(userId);
	}
	public List<UserCompetion> getMyCompetionByuserIdAndCompetionId(int userId,int competionId)
	{
		return userCompetionDao.getMyCompetionByuserIdAndCompetionId(userId,competionId);
	}
	/**
	 * 根据职务来查找相关的
	 * @param job
	 * @return
	 */
	public List<UserCompetion> getCompetionByJob(String job) {
		return userCompetionDao.getCompetionByJob(job);
	}
	
	/**
	 * 得到竞赛的裁判
	 * @return
	 */
	public List<UserCompetion> getCompetionjudgment(int competionId) {
		return userCompetionDao.getCompetionjudgment(competionId);
	}
	
	/**
	 * 得到竞赛的学生
	 * @return
	 */
	public List<UserCompetion> getCompetionStudent(int competionId) {
		return userCompetionDao.getCompetionStudent(competionId);
	}
	
	
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
		return null;
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
		return null;
	}
	
	/**
	 * 得到竞赛下的学生数据
	 * @param competionId
	 * @return
	 */
	public List<UserCompetionData> getCompetionStudentData(int competionId,UserInterface userInterface) {
		
		List<UserCompetion> ucslist = getCompetionStudent(competionId);
		List<UserCompetionData> ucdlist = new ArrayList<UserCompetionData>();
		//竞赛下的试卷
		CompetionExam ce = competionExamDao.getCompetionSelectExam(competionId);
		if (ce != null)
		{
			Exam exam = ce.getExam();
			for (UserCompetion uc:ucslist)
			{
				UserCompetionData ucd = new UserCompetionData();
				ucd.setUserCompetionId(uc.getId());
				User user = userInterface.getUserById(uc.getUserId());//uc.getUser();
				ucd.setUsername(user.getUsername());
				int userId = user.getId();
				ucd.setUserId(userId);
				//用户对应的竞赛试卷			
				UserExam ue = userExamDao.getUserExam(user.getId(), exam.getId());
				if (ue != null)
				ucd.setState(ue.getFipf() == 1?CommonConstant.STRING_1:CommonConstant.STRING_0);
				//对应的总分数，先采取计算方式，如果性能出问题再优化
				int cscore = 0;
				
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
											
											UserQuestionData uqc = getUserQuestionData(-1,userId,exam.getId(),q.getId(),number);
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
												}
												else
												{
													if (useranswer != null)
													{
														List<String> answerlist = qd.getAnswer();
														if (answerlist != null)
														{
															List list = UtilTools.isCorrect(type,useranswer,answerlist,qd.getExplain(),quscore);
															int isflag = (int)list.get(0);
															if (isflag == 1)
															{
																qd.setUserscore(quscore);
																cscore += quscore;
															}
															else if (isflag == 2)
															{
																int temp = (int)list.get(1);
																qd.setUserscore(temp);
																cscore += temp;
															}
														}
													}
												}
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
										UserQuestionData uqc = getUserTrainData(-1,userId,exam.getId(),t.getId());
										if (uqc != null)
										{
											String useranswer = uqc.getUseranswer();
											qd.setUseranswer(useranswer);
//											String tanswer = t.getConAnswer();
											String revalue = uqc.getRevalue();
											qd.setOsanswer(revalue);
											int quscore = t.getScore();
											//得分，取裁判分
											String pfscore = uqc.getPfscore();										
											if (pfscore != null)
											{
												qd.setUserscore(Integer.parseInt(pfscore));
												cscore += Integer.parseInt(pfscore);
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
															REGEX += "#";
														}
														List list = UtilTools.isCorrect(CommonConstant.QTYPE_6,useranswer,answerlist,REGEX,quscore);
														int isflag = (int)list.get(0);
														if (isflag == 1)
														{
															qd.setUserscore(quscore);
															cscore += quscore;
														}
														else if (isflag == 2)
														{
															int temp = (int)list.get(1);
															qd.setUserscore(temp);
															cscore += temp;
														}
														else
														{
															if (revalue != null)
															{
																List list2 = UtilTools.isCorrect(CommonConstant.QTYPE_6,revalue,answerlist,REGEX,quscore);
																int isflag2 = (int)list2.get(0);
																if (isflag2 == 1)
																{
																	qd.setUserscore(quscore);
																	cscore += quscore;
																}
																else if (isflag2 == 2)
																{
																	int temp = (int)list2.get(1);
																	qd.setUserscore(temp);
																	cscore += temp;
																}
															}
														}
													}
												}
												else
												{
													List<String> answerlist = qd.getAnswer();
													if (answerlist != null)
													{
														if (revalue != null)
														{
															List<TrainExt> te = trainExtDao.getTrainExtList(t.getId());
															String REGEX = "";
															for (TrainExt text:te)
															{
																REGEX += text.getScoretag();
																REGEX += "#";
															}
															List list2 = UtilTools.isCorrect(CommonConstant.QTYPE_6,revalue,answerlist,REGEX,quscore);
															int isflag2 = (int)list2.get(0);
															if (isflag2 == 1)
															{
																qd.setUserscore(quscore);
																cscore += quscore;
															}
															else if (isflag2 == 2)
															{
//																int temp = (int)list2.get(1);
																Object tempsc = list2.get(1);
																int temp = 0;
																if (tempsc instanceof String)
																{
																	String ttt = (String)tempsc;
																	temp = Integer.parseInt(ttt);
																}
																else
																{
																    temp = (int)list2.get(1);
																}
																qd.setUserscore(temp);
																cscore += temp;
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				ucd.setScore(cscore+"");
				ucdlist.add(ucd);
			}
		}
		return ucdlist;
	}
	
	/**
	 * 得到竞赛的命题裁判
	 * @return
	 */
	public List<UserCompetion> getCompetionMjudgment(int competionId) {
		return userCompetionDao.getCompetionMjudgment(competionId);
	}
	
	/**
	 * 删除竞赛的裁判
	 * @return
	 */
	public void removeCompetionjudgment(int competionId,int userId) {
		userCompetionDao.removeCompetionjudgment(competionId, userId);
	}
}
