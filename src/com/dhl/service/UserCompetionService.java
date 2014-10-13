package com.dhl.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionExamDao;
import com.dhl.dao.UserCompetionDao;
import com.dhl.dao.UserDao;
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
import com.dhl.domain.QuestionData;
import com.dhl.domain.Train;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;
import com.dhl.domain.UserCompetionData;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.util.ParseQuestion;
import com.dhl.util.UtilTools;

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
	private UserDao userDao;
	@Autowired
	private UserExamDao userExamDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserQuestionChildDao userQuestionChildDao;
	
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
		uc.setUser(userDao.get(userId));
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
	
	/**
	 * 得到竞赛下的学生数据
	 * @param competionId
	 * @return
	 */
	public List<UserCompetionData> getCompetionStudentData(int competionId) {
		
		List<UserCompetion> ucslist = getCompetionStudent(competionId);
		List<UserCompetionData> list = new ArrayList<UserCompetionData>();
		//竞赛下的试卷
		CompetionExam ce = competionExamDao.getCompetionSelectExam(competionId);
		if (ce != null)
		{
			Exam exam = ce.getExam();
			for (UserCompetion uc:ucslist)
			{
				UserCompetionData ucd = new UserCompetionData();
				ucd.setUserCompetionId(uc.getId());
				User user = uc.getUser();
				ucd.setUsername(user.getUsername());
				ucd.setUserId(user.getId());
				//用户对应的竞赛试卷			
				UserExam ue = userExamDao.getUserExam(user.getId(), exam.getId());
				if (ue != null)
				ucd.setState(ue.getFipf() == 1?CommonConstant.STRING_1:CommonConstant.STRING_0);
				//对应的总分数，先采取计算方式，如果性能出问题再优化
				int score = 0;
				
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
								////////////////////
								Question q = eq.getQuestion();
								if (q != null)//问题
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
	//								eq.setHtmlcontent(content);
									}
									else
									{
										
										List<QuestionData> qdlist = ParseQuestion.changetohtml(content,q.getId());
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
										trainList.add(qd);
										eq.setQdlist(trainList);
									}
								}
							}
							////////////////
							for (ExamQuestion eq:vt)
							{
								List<QuestionData> qdlist = eq.getQdlist();
								int len = qdlist.size();
								for (int i=0;i<len;i++)
								{
									int number = i+1;
									QuestionData qd = qdlist.get(i);
									int type = qd.getType();
									UserQuestion uq;
									if (type == CommonConstant.QTYPE_6)
									{
										uq = userQuestionDao.getUserQuestionBytrain(user.getId(), exam.getId(),qd.getId());
									}
									else
									{
										uq = userQuestionDao.getUserQuestionByquestion(user.getId(), exam.getId(), qd.getId());
									}
									if (uq != null)
									{
										UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(user.getId(),number,uq.getId());
										if (uqc != null)
										{
											score += Integer.parseInt(UtilTools.getScore(uq, uqc, number));
										}
									}
//									if (type == CommonConstant.QTYPE_6)
//									{
//										UserQuestion uq = userQuestionDao.getUserQuestionBytrain(user.getId(), exam.getId(),qd.getId());
//										if (uq != null)
//										{
//											UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByusertrainId(user.getId(),uq.getId());
//											if (uqc != null)
//											{
//												String useranswer = uqc.getUseranswer();
//												String pfscore = uqc.getPfscore();
//												//判分裁判一旦修改了系统判分，采用判分裁判的
//												if (pfscore != null)
//												{
//													score += Integer.parseInt(pfscore);
//												}
//												else
//												{
//													List<String> answerlist = qd.getAnswer();
//													if (answerlist != null && answerlist.size() > 0)
//													{
//														if (useranswer != null && useranswer.trim().equals(answerlist.get(0).trim()))
//														{
//															score += qd.getScore();
//														}
//													}
//												}
//											}
//										}
//									}
//									else
//									{
//										UserQuestion uq = userQuestionDao.getUserQuestionByquestion(user.getId(), exam.getId(), qd.getId());
//										if (uq != null)
//										{
//											UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(user.getId(),number,uq.getId());
//											if (uqc != null)
//											{
//												String useranswer = uqc.getUseranswer();
//												String pfscore = uqc.getPfscore();
//												//判分裁判一旦修改了系统判分，采用判分裁判的
//												if (pfscore != null)
//												{
//													score += Integer.parseInt(pfscore);
//												}
//												else
//												{
//													if (type == CommonConstant.QTYPE_2 || type == CommonConstant.QTYPE_4 || type == CommonConstant.QTYPE_5)
//													{
//														List<String> answerlist = qd.getAnswer();
//														if (answerlist != null && answerlist.size() > 0)
//														{
//															if (useranswer != null && useranswer.trim().equals(answerlist.get(0).trim()))
//															{
//																score += qd.getScore();
//															}
//														}
//													}
//													else if (type == CommonConstant.QTYPE_3)//多选要匹配答案列表
//													{
//														if (useranswer != null)
//														{
//															List<String> answerlist = qd.getAnswer();
//															if (answerlist != null)
//															{
//																String[] strs = useranswer.split("#");
//																int size = answerlist.size();
//																boolean flag = true;
//																for (int j=0;j<size;j++)
//																{
//																	if (answerlist.get(j).equals(strs[j]))
//																	{
//																		flag = false;
//																		break;
//																	}
//																}
//																if (flag)
//																{
//																	score += qd.getScore();
//																}
//															}
//														}
//													}
//												}
//											}
//										}
//									}
								}
							}
						}
					}
				}
				ucd.setScore(score+"");
				list.add(ucd);
			}
		}
		return list;
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
