package com.dhl.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.UserEnvironmentDao;
import com.dhl.domain.UserEnvironment;
import com.dhl.util.UtilTools;

/**
 *用户对应的云平台环境
 */
@Service
public class UserEnvironmentService {
	
	@Autowired
	private UserEnvironmentDao uceDao;
	@Autowired
	private ExamDao examDao;
	@Autowired
	private TrainDao trainDao;
	
	public UserEnvironment get(int id) {
		return uceDao.get(id);
	}
	
	public UserEnvironment getMyUCE(int userId,int examId,int trainId) {
		return uceDao.getMyUCE(userId,examId,trainId);
	}
	
	public List<UserEnvironment> getMyUCE(int userId) {
		return uceDao.getMyUCE(userId);
	}
	
	public void update(UserEnvironment uce,String hostname,String username,String password,String serverId)
	{
		uce.setHostname(hostname);
		uce.setUsername(username);
		uce.setPassword(password);
		uce.setServerId(serverId);
		uceDao.update(uce);
	}
	
	public void save(int userId,int examId,int trainId,String name,String hostname,String username,String password,String serverId)
	{
		UserEnvironment uce = new UserEnvironment();
		uce.setUserId(userId);
		uce.setExam(examDao.get(examId));
		uce.setTrain(trainDao.get(trainId));
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
	
	public void delete(UserEnvironment uee) {
		uceDao.remove(uee);
	}
	
}
