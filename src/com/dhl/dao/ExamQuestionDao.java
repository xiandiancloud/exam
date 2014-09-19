package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamQuestion;

@Repository
public class ExamQuestionDao extends BaseDao<ExamQuestion> {
	
	public List<ExamQuestion> getVerticalTrainList(int verticalId){
		String hql = "from ExamQuestion where everticalId = "+verticalId;
    	return find(hql);
    }
	
	public List<ExamQuestion> getAllTrainByExamId(int examId)
	{
		String hql = "from ExamQuestion where examId = "+examId;
    	return find(hql);
	}
	
	public void removeVTByCourseId(int examId)
	{
		String hql = "delete from ExamQuestion where examId = "+examId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
