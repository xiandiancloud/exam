package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.CompetionSchool;

@Repository
public class CompetionSchoolDao extends BaseDao<CompetionSchool> {
	
	public CompetionSchool getCompetionSchool(int competionId)
	{
		String hql = "from CompetionSchool where competionId = "+competionId;
		List<CompetionSchool> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
	}
}
