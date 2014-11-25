package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamShellEnvironment;

@Repository
public class ExamShellEnvironmentDao extends BaseDao<ExamShellEnvironment> {

	public List<ExamShellEnvironment> getExamShellEnvironment(int examId) {
		String hql = "from ExamShellEnvironment where examId = " + examId;
		return find(hql);
	}
	
	public ExamShellEnvironment getShellEnvironmentByname(String name)
	{
		String hql = "from ExamShellEnvironment where name = '"+name+"'";
		List<ExamShellEnvironment> list =  find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
