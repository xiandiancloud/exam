package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Environment;

@Repository
public class EnvironmentDao extends BaseDao<Environment> {

	public List<Environment> getExamEnvironment(int examId) {
		String hql = "from Environment where examId = " + examId;
		return find(hql);
	}
}
