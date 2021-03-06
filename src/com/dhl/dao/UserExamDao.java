package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserExam;

@Repository
public class UserExamDao extends BaseDao<UserExam> {

	public void updateUserExam(int examId) {
		String hql = "update UserExam set docounts = 0, state = 0, activestate = 0, usetime = '0' where examId = "+examId;
        this.getSession().createQuery(hql).executeUpdate();
	}
	
	public UserExam getUserExam(int userId, int examId) {
		String hql = "from UserExam where examId = " + examId
				+ " and userId = " + userId;
		List<UserExam> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}

	public UserExam getUserRecentlyExam(int userId) {
		String hql = "from UserExam where activestate = 1 and userId = " + userId +" and exam.isnormal = 0";
		List<UserExam> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	public List<UserExam> getMyAllExam(int userId) {
		String hql = "from UserExam where userId = " + userId +" and exam.isnormal = 0";
		return find(hql);
	}
	
	public List<UserExam> getMyFinishExam(int userId) {
		String hql = "from UserExam where userId = " + userId +" and state = 1 and exam.isnormal = 0";
		return find(hql);
	}
	
	public List<UserExam> getMyHavingExam(int userId) {
		String hql = "from UserExam where userId = " + userId +" and state = 0";
		return find(hql);
	}
	
	public void setMyExamActiveState(int userId) {
		String hql = "update UserExam set activestate = 0 where userId = "+userId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
