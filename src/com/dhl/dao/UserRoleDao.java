package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserRole;

@Repository
public class UserRoleDao extends BaseDao<UserRole> {
	
	public UserRole getUserRole(int userId)
	{
		String hql = "from UserRole where userId = ?";
		List<UserRole> list = find(hql,userId);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	
	
	public List<UserRole> getByRoleId(int roleId)
	{
		String hql = "from UserRole where roleId = ?";
		return find(hql,roleId);
	}
}
