package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Environment;

@Repository
public class EnvironmentDao extends BaseDao<Environment> {

	public List<Environment> getEnvironment() {
		String hql = "from Environment";
		return find(hql);
	}
	
	public Environment getEnvironmentByname(String name)
	{
		String hql = "from Environment where name = '"+name+"'";
		List<Environment> list =  find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
