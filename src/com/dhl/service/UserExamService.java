package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CourseDao;
import com.dhl.dao.UserExamDao;
import com.dhl.domain.UserExam;

/**
 *
 */
@Service
public class UserExamService {

	@Autowired
	private UserExamDao userExamDao;
	@Autowired
	private CourseDao courseDao;

	public void save(UserExam entity)
	{
		userExamDao.save(entity);
	}
	public void updateUserCourse(UserExam userCourse) {
		userExamDao.update(userCourse);
	}

	public void setMyCourseActiveState(int userId) {
		userExamDao.setMyCourseActiveState(userId);
	}
	public UserExam getUserExam(int userId, int examId) {
		return userExamDao.getUserCourse(userId, examId);
	}
	
	public UserExam getUserRecentlyExam(int userId) {
		return userExamDao.getUserRecentlyExam(userId);
	}
	
	/**
	 * 得到我的所有课程
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserExam> getMyAllCourse(int userId) {
		return userExamDao.getMyAllCourse(userId);
	}
	
	public List<UserExam> getMyFinishCourse(int userId) {
		return userExamDao.getMyFinishCourse(userId);
	}
	
	public List<UserExam> getMyHavingCourse(int userId) {
		return userExamDao.getMyHavingCourse(userId);
	}
}
