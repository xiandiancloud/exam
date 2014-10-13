package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.ExamCategory;

@Repository
public class ExamCategoryDao extends BaseDao<ExamCategory> {
	
	public Page getExamByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		String hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and ecategory.id = "+categoryId;
		return pagedQuery(hql, pageNo, pageSize);
	}
	
	public Page searchExam(int categoryId,int rank,String search,int pageNo,int pageSize)
	{
		String r = "";
		if (rank == 1)
		{
			r = CommonConstant.LEVEL_1;
		}
		else if (rank == 2)
		{
			r = CommonConstant.LEVEL_2;
		}
		else if (rank == 3)
		{
			r = CommonConstant.LEVEL_3;
		}
		String hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1";
		if (categoryId > 0)
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and ecategory.id = "+categoryId;
		}
		if (rank > 0)
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and exam.rank = '"+r+"'";
		}
		if (search != null&& !"".equals(search))
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and (exam.name like '%"+search+"%' or exam.describle like '%"+search+"%')";
		}
		if (categoryId > 0 && rank > 0)
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and ecategory.id = "+categoryId+" and exam.rank = '"+r+"'";
		}
		if (categoryId > 0 && search != null && !"".equals(search))
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and ecategory.id = "+categoryId+" and (exam.name like '%"+search+"%' or exam.describle like '%"+search+"%')";
		}
		if (rank > 0 && search != null)
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and exam.rank = '"+r+"' and (exam.name like '%"+search+"%' or exam.describle like '%"+search+"%')";
		}
		if (categoryId > 0 && rank > 0 && search != null && !"".equals(search))
		{
			hql = "from ExamCategory where exam.isnormal = 0 and exam.publish = 1 and ecategory.id = "+categoryId+" and exam.rank = '"+r+"' and (exam.name like '%"+search+"%' or exam.describle like '%"+search+"%')";
		}
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
