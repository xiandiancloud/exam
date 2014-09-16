package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.TeacherExam;

@Repository
public class TeacherExamDao extends BaseDao<TeacherExam> {

	public List<TeacherExam> getMyTCourse(int userId)
	{
		String hql = "from TeacherExam where userId = "+userId;
	    return find(hql);
	}
}
