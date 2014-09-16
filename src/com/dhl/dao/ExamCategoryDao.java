package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamCategory;

@Repository
public class ExamCategoryDao extends BaseDao<ExamCategory> {
	
	public Page getCourseByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		String hql = "from ExamCategory where exam.publish = 1 and ecategory.id = "+categoryId;
		return pagedQuery(hql, pageNo, pageSize);
	}
	
	public ExamCategory getCourseCategoryByCourseId(int examId)
	{
		String hql = "from ExamCategory where examId = "+examId;
		List<ExamCategory> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
	}
}
