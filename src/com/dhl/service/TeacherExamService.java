package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TeacherExamDao;
import com.dhl.domain.TeacherExam;

/**
 *
 */
@Service
public class TeacherExamService {

	@Autowired
	private TeacherExamDao teacherExamDao;
	
	/**
	 * 保存老师跟试卷的对应关系
	 * @param name
	 * @param imgpath
	 * @param desc
	 * @return
	 */
	public TeacherExam save(TeacherExam course)
	{
		teacherExamDao.save(course);
		return course;
	}
	
	/**
	 * 根据用户id取得老师的所有试卷
	 * @param userId
	 * @return
	 */
	public List<TeacherExam> getMyTCourse(int userId)
	{
		return teacherExamDao.getMyTCourse(userId);
	}
	
	/**
	 * 根据试卷id得到出卷老师，限制一个人
	 * @param examId
	 * @return
	 */
	public TeacherExam getTeacherExamByExamId(int examId)
	{
		return teacherExamDao.getTeacherExamByExamId(examId);
	}
}
