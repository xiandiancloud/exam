package com.dhl.dao;
import java.util.Date;

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
}
