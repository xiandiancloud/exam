package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserExamHistoryDao;
import com.dhl.domain.UserExamHistory;

/**
 *
 */
@Service
public class UserExamHistoryService {

	@Autowired
	private UserExamHistoryDao userExamHistoryDao;
	
	public List<UserExamHistory> getMyHistoryExam(int userId)
	{
		return userExamHistoryDao.getMyHistoryExam(userId);
	}
	
	public UserExamHistory getUserExam(int userId, int examId) {
		return userExamHistoryDao.getUserExam(userId, examId);
	}
}
