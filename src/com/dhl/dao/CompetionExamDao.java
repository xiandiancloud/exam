package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.CompetionExam;

@Repository
public class CompetionExamDao extends BaseDao<CompetionExam> {
	public List<CompetionExam> getCompetionExam(int competionId)
	{
		String hql = "from CompetionExam where competionId = "+competionId;
		return find(hql);
	}
	
	public CompetionExam getCompetionExam(int competionId,int examId)
	{
		String hql = "from CompetionExam where competionId = "+competionId+" and examId="+examId;
		List<CompetionExam> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
	}
	public void resetCompetionExam(int competionId)
	{
		String hql = "update CompetionExam set selectexam = 0 where competionId = "+competionId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
