package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.EnvironmentDao;
import com.dhl.dao.ExamShellEnvironmentDao;
import com.dhl.domain.Environment;
import com.dhl.domain.ExamShellEnvironment;

/**
 *每个考试对应的环境,脚本参数等
 */
@Service
public class EnvironmentService {
	
	@Autowired
	private EnvironmentDao envDao;
	@Autowired
	private ExamShellEnvironmentDao shellEnvDao;
	
	public String getDevIP(String key)
	{
		return envDao.getDevIP(key);
	}
	public String getDevUserName(String key)
	{
		return envDao.getDevUserName(key);
	}
	public String getDevPassword(String key)
	{
		return envDao.getDevPassword(key);
	}
	
	public boolean saveEnv(String name,String value,String type,String desc)
	{
		Environment e = envDao.getEnvironmentByname(name);
		if (e != null)
		{
			return false;
		}
		Environment uce = new Environment();
		uce.setName(name);
		uce.setValue(value);
		uce.setType(type);
		uce.setDescrible(desc);
		envDao.save(uce);
		return true;
	}
	
	public boolean saveShellEnv(int examId,String name,String value)
	{
		ExamShellEnvironment e = shellEnvDao.getShellEnvironmentByname(name);
		if (e != null)
		{
			return false;
		}
		ExamShellEnvironment uce = new ExamShellEnvironment();
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
	
	public List<Environment> getEnvironment() {
		return envDao.getEnvironment();
	}
	
	public List<ExamShellEnvironment> getExamShellEnvironment(int examId) {
		return shellEnvDao.getExamShellEnvironment(examId);
	}
	
}
