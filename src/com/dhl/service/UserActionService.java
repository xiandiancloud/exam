package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ActionDao;
import com.dhl.dao.UserActionDao;
import com.dhl.domain.Action;
import com.dhl.domain.UserAction;

/**
 *
 */
@Service
public class UserActionService {
	
	@Autowired
	private UserActionDao userActionDao;
	@Autowired
	private ActionDao actionDao;
	
	public List<UserAction> getActionList(int userId) {
		return userActionDao.getActionList(userId);
	}
	
	public void saveActionList(int userId,List<String> list)
	{
		for (String str:list)
		{
			Action action = actionDao.getActionByname(str);
			if (action != null)
			{
				UserAction ua = new UserAction();
				ua.setAction(action);
				ua.setUserId(userId);
				userActionDao.save(ua);
			}
		}
	}
}
