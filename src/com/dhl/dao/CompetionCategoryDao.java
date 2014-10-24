package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.CompetionCategory;

@Repository
public class CompetionCategoryDao extends BaseDao<CompetionCategory> {
	
	public CompetionCategory getCompetionCategory(int competionId)
	{
		String hql = "from CompetionCategory where competionId = "+competionId;
		List<CompetionCategory> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
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
		String hql = "from CompetionCategory where competion.type = 0";
		if (categoryId > 0)
		{
			hql = "from CompetionCategory where competion.type = 0 and ecategory.id = "+categoryId;
		}
		if (rank > 0)
		{
			hql = "from CompetionCategory where competion.type = 0 and competion.rank = '"+r+"'";
		}
		if (search != null&& !"".equals(search))
		{
			hql = "from CompetionCategory where competion.type = 0 and (competion.name like '%"+search+"%' or competion.describle like '%"+search+"%')";
		}
		if (categoryId > 0 && rank > 0)
		{
			hql = "from CompetionCategory where competion.type = 0 and ecategory.id = "+categoryId+" and competion.rank = '"+r+"'";
		}
		if (categoryId > 0 && search != null && !"".equals(search))
		{
			hql = "from CompetionCategory where competion.type = 0 and ecategory.id = "+categoryId+" and (competion.name like '%"+search+"%' or competion.describle like '%"+search+"%')";
		}
		if (rank > 0 && search != null)
		{
			hql = "from CompetionCategory where competion.type = 0 and competion.rank = '"+r+"' and (competion.name like '%"+search+"%' or competion.describle like '%"+search+"%')";
		}
		if (categoryId > 0 && rank > 0 && search != null && !"".equals(search))
		{
			hql = "from CompetionCategory where competion.type = 0 and ecategory.id = "+categoryId+" and competion.rank = '"+r+"' and (competion.name like '%"+search+"%' or competion.describle like '%"+search+"%')";
		}
		return pagedQuery(hql, pageNo, pageSize);
	}
	
}
