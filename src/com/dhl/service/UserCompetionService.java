package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CompetionDao;
import com.dhl.dao.UserCompetionDao;
import com.dhl.dao.UserDao;
import com.dhl.domain.UserCompetion;

/**
 *
 */
@Service
public class UserCompetionService {

	@Autowired
	private UserCompetionDao userCompetionDao;
	@Autowired
	private CompetionDao competionDao;
	@Autowired
	private UserDao userDao;
	
	/**
	 * 保存竞赛相关的用户
	 * @param userId
	 * @param competionId
	 * @param job
	 */
	public void save(int userId,int competionId,String job)
	{
		UserCompetion uc = new UserCompetion();
		uc.setUser(userDao.get(userId));
		uc.setCompetion(competionDao.get(competionId));
		uc.setJob(job);
		userCompetionDao.save(uc);
	}
	
	/**
	 * 得到我的所有竞赛
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserCompetion> getMyAllCompetion(int userId) {
		return userCompetionDao.getMyAllCompetion(userId);
	}
	
	/**
	 * 根据职务来查找相关的
	 * @param job
	 * @return
	 */
	public List<UserCompetion> getCompetionByJob(String job) {
		return userCompetionDao.getCompetionByJob(job);
	}
	
	/**
	 * 得到竞赛的裁判
	 * @return
	 */
	public List<UserCompetion> getCompetionjudgment(int competionId) {
		return userCompetionDao.getCompetionjudgment(competionId);
	}
}
