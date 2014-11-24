package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ShellEnvironment;

@Repository
public class ShellEnvironmentDao extends BaseDao<ShellEnvironment> {

	public List<ShellEnvironment> getExamEnvironment(int examId) {
		String hql = "from ShellEnvironment where examId = " + examId;
		return find(hql);
	}
}
