package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserCompetion;

@Repository
public class UserCompetionDao extends BaseDao<UserCompetion> {
	
	public List<UserCompetion> getMyAllCompetion(int userId)
	{
		String hql = "from UserCompetion where userId = " + userId;
		return find(hql);
	}
}
