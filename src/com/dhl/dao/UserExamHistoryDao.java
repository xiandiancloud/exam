package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserExamHistory;

@Repository
public class UserExamHistoryDao extends BaseDao<UserExamHistory> {

	public List<UserExamHistory> getMyHistoryExam(int userId)
	{
		String hql = "from UserExamHistory where userId = "+userId+" order by againdotime desc";
		return find(hql);
	}
	
	public UserExamHistory getUserExam(int userId, int examId,int docounts) {
		String hql = "from UserExamHistory where examId = " + examId
				+ " and userId = " + userId+" and docounts = "+docounts;
		List<UserExamHistory> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}

}
