package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserExamDao;
import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionChildHistoryDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.dao.UserQuestionHistoryDao;
import com.dhl.domain.UserExam;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.domain.UserQuestionChildHistory;
import com.dhl.domain.UserQuestionHistory;

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
	
	public void save(UserExam entity)
	{
		userExamDao.save(entity);
	}
	public void updateUserExam(UserExam userExam) {
		userExamDao.update(userExam);
	}

	/**
	 * 再来一次
	 * @param userExam
	 */
	public void updateAgainUserExam(int userId,int examId) {
		
		UserExam ucs = getUserExam(userId, examId);
		if (ucs != null)
		{
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
					uqch.setUserquestionId(uqc.getUserquestionId());
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
}
