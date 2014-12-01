package com.dhl.dao;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Log;
import com.dhl.util.UtilTools;

@Repository
public class LogDao extends BaseDao<Log> {
	
	public void saveLog(String username,String useraction)
	{
		Log log = new Log();
		log.setDotime(UtilTools.timeTostrHMS(new Date()));
		log.setUsername(username);
		log.setUseraction(useraction);
		save(log);
	}
	
	public List<Log> getAllLog(){
		String hql = "from Log";
		return find(hql);
    }
}
