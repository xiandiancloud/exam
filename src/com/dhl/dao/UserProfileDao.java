package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserProfile;

@Repository
public class UserProfileDao extends BaseDao<UserProfile> {
	
	public UserProfile getByUserId(int userId)
	{
		String hql = "from UserProfile where user_id = ?";
		List<UserProfile> list = find(hql,userId);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
