package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserQuestionChild;

@Repository
public class UserQuestionChildDao extends BaseDao<UserQuestionChild> {

	public UserQuestionChild getUserQuestionByuserquestionId(int userId,int number,int userquestionId) {
		String hql = "from UserQuestionChild where userId = "+userId+" and number = "+number+" and userquestionId = "+userquestionId;
		List<UserQuestionChild> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
}