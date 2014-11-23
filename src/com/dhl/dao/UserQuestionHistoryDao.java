package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionHistory;

@Repository
public class UserQuestionHistoryDao extends BaseDao<UserQuestionHistory> {

	/**
	 * 根据问题id取得用户对应的问题
	 * @param userId
	 * @param examId
	 * @param questionId
	 * @return
	 */
	public UserQuestionHistory getUserQuestionByquestion(int userId,int examId,int questionId,int docounts) {
		String hql = "from UserQuestionHistory where userId = "+userId+" and examId = "+examId+" and questionId = "+questionId+" and docounts = "+docounts;
		List<UserQuestionHistory> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
	public UserQuestionHistory getUserQuestionBytrain(int userId,int examId,int trainId,int docounts) {
		String hql = "from UserQuestionHistory where userId = "+userId+" and examId = "+examId+" and trainId = "+trainId+" and docounts = "+docounts;
		List<UserQuestionHistory> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
