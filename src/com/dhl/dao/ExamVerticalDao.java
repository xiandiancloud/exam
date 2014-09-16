package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamVertical;

@Repository
public class ExamVerticalDao extends BaseDao<ExamVertical> {
	
	public List<ExamVertical> getAllVertical(int sequentialId){
		String hql = "from ExamVertical where esequentialId = "+sequentialId;
    	return find(hql);
    }
}
