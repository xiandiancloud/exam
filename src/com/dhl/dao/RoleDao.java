package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Role;

@Repository
public class RoleDao extends BaseDao<Role> {
	
	public Role getByRoleName(String roleName)
	{
		String hql = "from Role where roleName = ?";
		List<Role> list = find(hql,roleName);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
