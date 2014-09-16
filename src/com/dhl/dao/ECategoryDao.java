package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ECategory;

@Repository
public class ECategoryDao extends BaseDao<ECategory> {
	
	public List<ECategory> getAllCategory()
	{
		String hql = "from ECategory";
    	return find(hql);
	}
	
	public ECategory getCategoryByname(String name)
	{
		String hql = "from ECategory where name = '"+name+"'";
		List<ECategory> list =  find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
