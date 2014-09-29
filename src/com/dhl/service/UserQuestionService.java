package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamDao;
import com.dhl.dao.ExamQuestionDao;
import com.dhl.dao.ExamVerticalDao;
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
	public UserQuestionChild getQuestion(int userId,int examId,int questionId,int number)
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
	 * 得到用户关于单元下的实验类型的问题
	 */
	public UserQuestionChild getUserExamTrainQuestion(int userId,int examId,int trainId)
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
	 * 提交答案
	 */
	public void saveQuestion(int userId,int examId,int questionId,int number,String useranswer)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq == null)
		{
			uq = new UserQuestion();
			uq.setExamId(examId);
			uq.setQuestionId(questionId);
			uq.setUserId(userId);
			uq.setTrain(null);
			userQuestionDao.save(uq);
		}
		else
		{
			uq.setExamId(examId);
			uq.setQuestionId(questionId);
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
	public void saveTrainQuestion(int userId,int examId,int trainId)
	{
		
	}
}
