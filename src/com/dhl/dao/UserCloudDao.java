package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserCloud;

@Repository
public class UserCloudDao extends BaseDao<UserCloud> {

	public UserCloud getMyUCE(int userId) {
		String hql = "from UserCloud where userId = " + userId;
		List<UserCloud> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
