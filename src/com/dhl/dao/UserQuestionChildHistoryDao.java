package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserQuestionChildHistory;

@Repository
public class UserQuestionChildHistoryDao extends BaseDao<UserQuestionChildHistory> {

	public UserQuestionChildHistory getUserQuestionByuserquestionId(int userId,int number,int userquestionId) {
		String hql = "from UserQuestionChildHistory where userId = "+userId+" and number = "+number+" and userquestionId = "+userquestionId;
		List<UserQuestionChildHistory> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
	public UserQuestionChildHistory getUserQuestionByusertrainId(int userId,int userquestionId) {
		String hql = "from UserQuestionChildHistory where userId = "+userId+" and userquestionId = "+userquestionId;
		List<UserQuestionChildHistory> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
