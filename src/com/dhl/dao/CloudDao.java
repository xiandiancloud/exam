package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Cloud;

@Repository
public class CloudDao extends BaseDao<Cloud> {
	
	public Cloud getCloud(String ip) {
		String hql = "from Cloud where ip = '" + ip +"'";
		List<Cloud> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
	
	public Cloud getMyCloud(int userId) {
		String hql = "from Cloud where userId = " + userId;
		List<Cloud> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
