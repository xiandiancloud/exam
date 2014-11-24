package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.EnvironmentDao;
import com.dhl.dao.ShellEnvironmentDao;
import com.dhl.domain.Environment;
import com.dhl.domain.ShellEnvironment;

/**
 *每个考试对应的环境,脚本参数等
 */
@Service
public class ExamEnvironmentService {
	
	@Autowired
	private EnvironmentDao envDao;
	@Autowired
	private ShellEnvironmentDao shellEnvDao;
	
	public boolean saveEnv(int examId,String name,String value,String shellprefix)
	{
		Environment e = envDao.getEnvironmentByname(name);
		if (e != null)
		{
			return false;
		}
		Environment uce = new Environment();
		uce.setExamId(examId);
		uce.setName(name);
		uce.setValue(value);
		uce.setShellprefix(shellprefix);
		envDao.save(uce);
		return true;
	}
	
	public boolean saveShellEnv(int examId,String name,String value)
	{
		ShellEnvironment e = shellEnvDao.getShellEnvironmentByname(name);
		if (e != null)
		{
			return false;
		}
		ShellEnvironment uce = new ShellEnvironment();
		uce.setExamId(examId);
		uce.setName(name);
		uce.setValue(value);
		shellEnvDao.save(uce);
		return true;
	}
	
	public void deleteEnv(int id)
	{
		envDao.remove(envDao.get(id));
	}
	
	public void deleteShellEnv(int id)
	{
		shellEnvDao.remove(shellEnvDao.get(id));
	}
	
	
	public List<Environment> getExamEnvironment(int examId) {
		return envDao.getExamEnvironment(examId);
	}
	
	public List<ShellEnvironment> getExamShellEnvironment(int examId) {
		return shellEnvDao.getExamShellEnvironment(examId);
	}
	
//	
//	public UserExamEnvironment get(int id) {
//		return uceDao.get(id);
//	}
//	
//	public UserExamEnvironment getMyUCE(int userId,int examId,String name) {
//		return uceDao.getMyUCE(userId,examId,name);
//	}
//	
//	public List<UserExamEnvironment> getMyUCE(int userId) {
//		return uceDao.getMyUCE(userId);
//	}
//	
//	public void update(UserExamEnvironment uce,String hostname,String username,String password,String serverId)
//	{
//		uce.setHostname(hostname);
//		uce.setUsername(username);
//		uce.setPassword(password);
//		uce.setServerId(serverId);
//		uceDao.update(uce);
//	}
//	
//	public void save(int userId,int examId,String name,String hostname,String username,String password,String serverId)
//	{
//		UserExamEnvironment uce = new UserExamEnvironment();
//		uce.setUserId(userId);
//		uce.setExamId(examId);
//		uce.setName(name);
//		uce.setHostname(hostname);
//		uce.setUsername(username);
//		uce.setPassword(password);
//		uce.setServerId(serverId);
//		uce.setCreatetime(UtilTools.timeTostrHMS(new Date()));
//		uceDao.save(uce);
//	}
//	
//	public void delete(int id) {
//		uceDao.remove(uceDao.get(id));
//	}
//	
//	public void delete(UserExamEnvironment uee) {
//		uceDao.remove(uee);
//	}
	
}
