package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.TrainExt;

@Repository
public class TrainExtDao extends BaseDao<TrainExt> {
	public List<TrainExt> getTrainExtList(int trainId) {
		String hql = "from TrainExt where trainId = "+trainId;
		return find(hql);
	}
	
	public void removeByTrainId(int trainId)
	{
		String hql = "delete from TrainExt where trainId = "+trainId;
		createQuery(hql).executeUpdate();
	}
}
