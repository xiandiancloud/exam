package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.TeacherExam;

@Repository
public class TeacherExamDao extends BaseDao<TeacherExam> {

	public List<TeacherExam> getMyTCourse(int userId)
	{
		String hql = "from TeacherExam where userId = "+userId +" and exam.isnormal = 0";
	    return find(hql);
	}
	
	public TeacherExam getTeacherExamByExamId(int examId)
	{
		String hql = "from TeacherExam where examId = "+examId;
	    List<TeacherExam> list = find(hql);
	    if (list != null && list.size() > 0)
	    {
	    	return list.get(0);
	    }
	    return null;
	}
}
