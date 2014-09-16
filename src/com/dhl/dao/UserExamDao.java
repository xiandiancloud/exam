package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserExam;

@Repository
public class UserExamDao extends BaseDao<UserExam> {

	public void updateUserCourse(int examId) {
		String hql = "update UserExam set docounts = 0, state = 0, activestate = 0, usetime = '0' where examId = "+examId;
        this.getSession().createQuery(hql).executeUpdate();
	}
	
	public UserExam getUserCourse(int userId, int courseId) {
		String hql = "from UserExam where courseId = " + courseId
				+ " and userId = " + userId;
		List<UserExam> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}

	public UserExam getUserRecentlyCourse(int userId) {
		String hql = "from UserExam where activestate = 1 and userId = " + userId;
		List<UserExam> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	public List<UserExam> getMyAllCourse(int userId) {
		String hql = "from UserExam where userId = " + userId;
		return find(hql);
	}
	
	public List<UserExam> getMyFinishCourse(int userId) {
		String hql = "from UserExam where userId = " + userId +" and state = 1";
		return find(hql);
	}
	
	public List<UserExam> getMyHavingCourse(int userId) {
		String hql = "from UserExam where userId = " + userId +" and state = 0";
		return find(hql);
	}
	
	public void setMyCourseActiveState(int userId) {
		String hql = "update UserExam set activestate = 0 where userId = "+userId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
