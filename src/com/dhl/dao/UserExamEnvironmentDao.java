package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserExamEnvironment;

@Repository
public class UserExamEnvironmentDao extends BaseDao<UserExamEnvironment> {

	public List<UserExamEnvironment> getMyUCE(int userId) {
		String hql = "from UserExamEnvironment where userId = " + userId;
		return find(hql);
	}
	
	public UserExamEnvironment getMyUCE(int userId,int examId,String name) {
		String hql = "from UserExamEnvironment where userId = " + userId +" and examId = "+examId +" and name = '"+name+"'";
		List<UserExamEnvironment> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
