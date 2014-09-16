package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserCompetionDao;
import com.dhl.domain.UserCompetion;

/**
 *
 */
@Service
public class UserCompetionService {

	@Autowired
	private UserCompetionDao userCompetionDao;
	
	/**
	 * 得到我的所有竞赛
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserCompetion> getMyAllCompetion(int userId) {
		return userCompetionDao.getMyAllCompetion(userId);
	}
	
}
