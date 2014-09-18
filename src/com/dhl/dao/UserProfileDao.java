package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamCategory;
import com.dhl.domain.UserProfile;

@Repository
public class UserProfileDao extends BaseDao<UserProfile> {
	
	public List<UserProfile> getUserBySchoolName(String school_name)
	{
		String hql = "from UserProfile where school_name = '"+school_name+"'";
		return find(hql);
	}
}
