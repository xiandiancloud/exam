package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserAction;

@Repository
public class UserActionDao extends BaseDao<UserAction> {

	public List<UserAction> getActionList(int userId) {
		String hql = "from UserAction where userId = " + userId;
		return find(hql);
	}
}
