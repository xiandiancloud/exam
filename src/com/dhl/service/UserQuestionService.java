package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.ExamDao;
import com.dhl.dao.ExamQuestionDao;
import com.dhl.dao.ExamVerticalDao;
import com.dhl.dao.QuestionDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.Train;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;

/**
 *
 */
@Service
public class UserQuestionService {

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserQuestionChildDao userQuestionChildDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private ExamQuestionDao examQuestionDao;
	@Autowired
	private ExamDao examDao;
	@Autowired
	private ExamVerticalDao examVerticalDao;
	
	public void saveTrainQuestion(String name, String codenum, String envname,
			String conContent, String conShell, String conAnswer, int score,
			String scoretag, int examId, int verticalId) {

//		Train tt = trainDao.getTrainByCodenum(codenum);
//		if (tt != null)
//		{
//			return CommonConstant.ERROR_4;
//		}
		Train t = new Train();
		t.setName(name);
		t.setCodenum(codenum);
		t.setEnvname(envname);
		t.setConContent(conContent);
		t.setConShell(conShell);
		t.setConAnswer(conAnswer);
		t.setScore(score);
		t.setScoretag(scoretag);
		trainDao.save(t);
		//考试跟实训联系起来
		ExamQuestion eq = new ExamQuestion();
		eq.setExam(examDao.get(examId));
		eq.setTrain(t);
		eq.setExamVertical(examVerticalDao.get(verticalId));
		examQuestionDao.save(eq);
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestion getQuestion(int userId,int examId,int questionId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		return uq;
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestionChild getQuestionChild(UserQuestion uq,int userId,int number)
	{
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
		return uqc;
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestionChild getQuestionChild(int userId,int examId,int questionId,int number)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
			return uqc;
		}
		return null;
	}
	
	/**
	 * 得到用户提交的答案列表
	 */
	public List<UserQuestionChild> getQuestionList(int userId,int examId,int questionId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq != null)
		{
			return userQuestionChildDao.getUserQuestionByuserquestionId(userId,uq.getId());
		}
		return null;
	}
	
	/**
	 * 得到用户关于单元下的实验类型的问题
	 */
	public UserQuestion getUserExamTrainQuestion(int userId,int examId,int trainId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, examId, trainId);
		return uq;
	}
	
	/**
	 * 得到用户关于单元下的实验类型的问题
	 */
	public UserQuestionChild getUserExamTrainQuestionChild(int userId,int examId,int trainId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, examId, trainId);
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByusertrainId(userId,uq.getId());
			return uqc;
		}
		return null;
	}
	
	/**
	 * 保存考试系统的实训答案
	 * @param userId
	 * @param examId
	 * @param trainId
	 */
	public void saveQuestionTrain(int userId,int examId,int trainId,String useranswer,String rdata,String result)
	{
		UserQuestion uq = new UserQuestion();
		uq.setExamId(examId);
		uq.setQuestion(null);
		uq.setUserId(userId);
		uq.setTrain(trainDao.get(trainId));
		userQuestionDao.save(uq);
		
		
		UserQuestionChild uqc = new UserQuestionChild();
		uqc.setUserId(userId);
		uqc.setNumber(1);
		uqc.setUseranswer(useranswer);
		uqc.setResult(result);
		uqc.setRevalue(rdata);
		uqc.setUserquestionId(uq.getId());
		userQuestionChildDao.save(uqc);
		
	}
	
	/**
	 * 更新考试系统的实训答案
	 */
	public void updateQuestionTrain(UserQuestion uq,int userId,int examId,int questionId,String useranswer,String rdata,String result)
	{
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,1,uq.getId());
		if (uqc != null)
		{
			uqc.setUseranswer(useranswer);
			uqc.setResult(result);
			uqc.setRevalue(rdata);
			userQuestionChildDao.update(uqc);
		}
	}
	
	/**
	 * 提交答案
	 */
	public void saveQuestion(int userId,int examId,int questionId,int number,String useranswer)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq == null)
		{
			uq = new UserQuestion();
			uq.setExamId(examId);
			uq.setQuestion(questionDao.get(questionId));
			uq.setUserId(userId);
			uq.setTrain(null);
			userQuestionDao.save(uq);
		}
		else
		{
			uq.setExamId(examId);
			uq.setQuestion(questionDao.get(questionId));
			uq.setUserId(userId);
			uq.setTrain(null);
			userQuestionDao.update(uq);
		}
		
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
		if (uqc == null)
		{
			UserQuestionChild uqc2 = new UserQuestionChild();
			uqc2.setUserId(userId);
			uqc2.setNumber(number);
			uqc2.setUseranswer(useranswer);
			uqc2.setUserquestionId(uq.getId());
			userQuestionChildDao.save(uqc2);
		}
		else
		{
			uqc.setNumber(number);
			uqc.setUseranswer(useranswer);
			uqc.setUserquestionId(uq.getId());
			userQuestionChildDao.update(uqc);
		}
	}
	
	/**
	 * 提交答案
	 */
	public boolean updateQuestion(int type,int userId,int examId,int questionId,int number,String pfscore)
	{
		UserQuestion uq;
		if (type == CommonConstant.QTYPE_6)
		{
			uq = userQuestionDao.getUserQuestionBytrain(userId, examId, questionId);
		}
		else
		{
			uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		}
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
			if (uqc != null)
			{
				uqc.setPfscore(pfscore);
				userQuestionChildDao.update(uqc);
				return true;
			}
		}
		return false;
	}
	/**
	 * 提交答案
	 */
	public void saveTrainQuestion(int userId,int examId,int trainId)
	{
		
	}
}
