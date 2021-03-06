package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserQuestion;

@Repository
public class UserQuestionDao extends BaseDao<UserQuestion> {

	/**
	 * 根据问题id取得用户对应的问题
	 * @param userId
	 * @param examId
	 * @param questionId
	 * @return
	 */
	public UserQuestion getUserQuestionByquestion(int userId,int examId,int questionId) {
		String hql = "from UserQuestion where userId = "+userId+" and examId = "+examId+" and questionId = "+questionId;
		List<UserQuestion> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
	public UserQuestion getUserQuestionBytrain(int userId,int examId,int trainId) {
		String hql = "from UserQuestion where userId = "+userId+" and examId = "+examId+" and trainId = "+trainId;
		List<UserQuestion> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
	public List<UserQuestion> getUserQueston(int userId,int examId) {
		String hql = "from UserQuestion where userId = "+userId+" and examId = "+examId;
		return find(hql);
	}
	
	public void deleteUserQueston(int userId,int examId) {
		String hql = "delete from UserQuestion where userId = "+userId+" and examId = "+examId;
		this.getSession().createQuery(hql).executeUpdate();
	}
	
	/**
	 * 删除试卷下的所有用户信息
	 * @param courseId
	 */
	public void removeUserQuestionByExamId(int examId)
	{
		String hql = "delete from UserQuestion where examId = "+examId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
