package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Action;

@Repository
public class ActionDao extends BaseDao<Action> {
	
	public Action getActionByname(String actionname) {
		String hql = "from Action where actionname = '" + actionname +"'";
		List<Action> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
