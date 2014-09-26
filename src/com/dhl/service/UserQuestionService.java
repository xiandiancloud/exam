package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionDao;
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
		
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(number,uq.getId());
		if (uqc == null)
		{
			UserQuestionChild uqc2 = new UserQuestionChild();
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
