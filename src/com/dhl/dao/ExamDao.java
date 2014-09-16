package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Exam;

@Repository
public class ExamDao extends BaseDao<Exam> {
	
	public List<Exam> getCourseByName(String name)
	{
		String hql = "from Exam where name = '"+name+"'";
    	return find(hql);
	}
	
	public Page getAllCourse(int pageNo,int pageSize){
		String hql = "from Exam";
//    	return find(hql);
		return pagedQuery(hql, pageNo, pageSize);
		
    }
}