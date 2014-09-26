package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserExamDao;
import com.dhl.domain.UserExam;

/**
 *
 */
@Service
public class UserExamService {

	@Autowired
	private UserExamDao userExamDao;

	public void save(UserExam entity)
	{
		userExamDao.save(entity);
	}
	public void updateUserExam(UserExam userExam) {
		userExamDao.update(userExam);
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
