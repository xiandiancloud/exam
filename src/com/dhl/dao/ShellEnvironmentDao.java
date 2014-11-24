package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ShellEnvironment;

@Repository
public class ShellEnvironmentDao extends BaseDao<ShellEnvironment> {

	public List<ShellEnvironment> getExamShellEnvironment(int examId) {
		String hql = "from ShellEnvironment where examId = " + examId;
		return find(hql);
	}
	
	public ShellEnvironment getShellEnvironmentByname(String name)
	{
		String hql = "from ShellEnvironment where name = '"+name+"'";
		List<ShellEnvironment> list =  find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
