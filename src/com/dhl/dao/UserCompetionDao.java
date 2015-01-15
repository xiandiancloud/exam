package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.UserAction;
import com.dhl.domain.UserCompetion;

@Repository
public class UserCompetionDao extends BaseDao<UserCompetion> {

	public List<UserCompetion> getMyAllCompetion(int userId) {
		String hql = "from UserCompetion where userId = " + userId +" order by id desc";
		return find(hql);
	}

	public List<UserCompetion> getMyCompetionByuserIdAndCompetionId(int userId,int competionId) {
		String hql = "from UserCompetion where userId = " + userId +" and competionId = "+competionId;
		return find(hql);
	}
	
	public List<UserCompetion> getCompetionByJob(String job) {
		String hql = "from UserCompetion where job = '" + job + "'";
		return find(hql);
	}

	public List<UserCompetion> getCompetionjudgment(int competionId) {
		String hql = "from UserCompetion where competionId = "+competionId+" and (job = '"
				+ CommonConstant.CROLE_2 + "' or job = '"
				+ CommonConstant.CROLE_3 + "' or job = '"
				+ CommonConstant.CROLE_4 + "')";
		return find(hql);
	}
	
	public UserCompetion getUserCompetion(int userId,int competionId,String job)
	{
		String hql = "from UserCompetion where userId = " + userId+" and competionId = "+competionId + " and job = '"+job+"'";
		List<UserCompetion> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
	
	public List<UserCompetion> getCompetionStudent(int competionId) {
		String hql = "from UserCompetion where competionId = "+competionId+" and job = '"
				+ CommonConstant.CROLE_5 + "'";
		return find(hql);
	}
	
	public List<UserCompetion> getCompetionMjudgment(int competionId) {
		String hql = "from UserCompetion where competionId = "+competionId+" and job = '"
				+ CommonConstant.CROLE_3 + "'";
		return find(hql);
	}
	
	public void removeCompetionjudgment(int competionId,int userId)
	{
		String hql = "delete from UserCompetion where userId="+userId+" and competionId="+competionId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
