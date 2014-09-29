package com.dhl.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserExamEnvironmentDao;
import com.dhl.domain.UserExamEnvironment;
import com.dhl.util.UtilTools;

/**
 *每个考试对应的用户环境
 */
@Service
public class UserExamEnvironmentService {
	
	@Autowired
	private UserExamEnvironmentDao uceDao;
	
	public UserExamEnvironment get(int id) {
		return uceDao.get(id);
	}
	
	public UserExamEnvironment getMyUCE(int userId,int examId,String name) {
		return uceDao.getMyUCE(userId,examId,name);
	}
	
	public List<UserExamEnvironment> getMyUCE(int userId) {
		return uceDao.getMyUCE(userId);
	}
	
	public void update(UserExamEnvironment uce,String hostname,String username,String password,String serverId)
	{
		uce.setHostname(hostname);
		uce.setUsername(username);
		uce.setPassword(password);
		uce.setServerId(serverId);
		uceDao.update(uce);
	}
	
	public void save(int userId,int examId,String name,String hostname,String username,String password,String serverId)
	{
		UserExamEnvironment uce = new UserExamEnvironment();
		uce.setUserId(userId);
		uce.setExamId(examId);
		uce.setName(name);
		uce.setHostname(hostname);
		uce.setUsername(username);
		uce.setPassword(password);
		uce.setServerId(serverId);
		uce.setCreatetime(UtilTools.timeTostrHMS(new Date()));
		uceDao.save(uce);
	}
	
	public void delete(int id) {
		uceDao.remove(uceDao.get(id));
	}
	
	public void delete(UserExamEnvironment uee) {
		uceDao.remove(uee);
	}
	
}
