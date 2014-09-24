package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionExamDao;
import com.dhl.dao.CompetionSchoolDao;
import com.dhl.dao.ExamDao;
import com.dhl.dao.UserCompetionDao;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.CompetionSchool;
import com.dhl.domain.Exam;
import com.dhl.domain.User;
import com.dhl.domain.UserCompetion;

/**
 * 竞赛
 */
@Service
public class CompetionService {

	@Autowired
	private CompetionDao competionDao;
	@Autowired
	private CompetionExamDao competionExamDao;
	@Autowired
	private UserCompetionDao userCompetionDao;
	@Autowired
	private CompetionSchoolDao competionSchoolDao;
	@Autowired
	private ExamDao examDao;
	
	/**
	 * 取得竞赛
	 * @param id
	 * @return
	 */
	public Competion get(int id)
	{
		return competionDao.get(id);
	}
	
	/**
	 * 锁定竞赛下的所有试卷
	 */
	public void lockallexam(int competionId)
	{
		List<CompetionExam> list = getCompetionExam(competionId);
		
		for (CompetionExam ce:list)
		{
			Exam exam = ce.getExam();
			exam.setLockexam(1);
			examDao.update(exam);
		}
	}
	
	public void unlockallexam(int competionId,int examId)
	{
		CompetionExam ce = competionExamDao.getCompetionExam(competionId,examId);
		
		if (ce != null)
		{
			Exam exam = ce.getExam();
			exam.setLockexam(0);
			examDao.update(exam);
		}
	}
	
	/**
	 * 得到竞赛下的对应的试卷
	 * @param competionId
	 * @return
	 */
	public List<CompetionExam> getCompetionExam(int competionId)
	{
		return competionExamDao.getCompetionExam(competionId);
	}
	
	/**
	 * 得到竞赛下的对应选中的试卷
	 * @param competionId
	 * @return
	 */
	public CompetionExam getCompetionSelectExam(int competionId)
	{
		return competionExamDao.getCompetionSelectExam(competionId);
	}
	
	/**
	 * 保存竞赛
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Competion save(Competion c)
	{
		competionDao.save(c);
		return c;
	}
	
	/**
	 * 更新竞赛
	 * @param name
	 * @param courseId
	 * @return
	 */
	public void update(Competion c)
	{
		competionDao.update(c);
	}
	
	/**
	 * 保存竞赛
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Competion createCompetion(String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, String type,
			String score, String passscore, String describle, String schoolId,User user)
	{
		Competion c = new Competion();
		c.setName(name);
		c.setDescrible(describle);
		c.setStarttime(examstarttime);
		c.setEndtime(examendtime);
		c.setWstarttime(wstarttime);
		c.setWendtime(wendtime);
		c.setExamstarttime(examstarttime);
		c.setExamendtime(examendtime);
		c.setScore(passscore);
		c.setPassscore(passscore);
		c.setType(type);
		competionDao.save(c);
		
		CompetionSchool cs = new CompetionSchool();
		cs.setCompetionId(c.getId());
		cs.setSchoolId(Integer.parseInt(schoolId));
		competionSchoolDao.save(cs);
		
		UserCompetion uc = new UserCompetion();
		uc.setUser(user);
		uc.setCompetion(c);
		uc.setJob(CommonConstant.CROLE_2);
		userCompetionDao.save(uc);
		
		return c;
	}
	
	public void updateCompetion(int id,String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, String type,
			String score, String passscore, String describle, String schoolId)
	{
		Competion c = get(id);
		c.setName(name);
		c.setDescrible(describle);
		c.setStarttime(examstarttime);
		c.setEndtime(examendtime);
		c.setWstarttime(wstarttime);
		c.setWendtime(wendtime);
		c.setExamstarttime(examstarttime);
		c.setExamendtime(examendtime);
		c.setScore(passscore);
		c.setPassscore(passscore);
		c.setType(type);
		competionDao.update(c);
		
		CompetionSchool cs = competionSchoolDao.getCompetionSchool(id);
		cs.setSchoolId(Integer.parseInt(schoolId));
		competionSchoolDao.update(cs);
	}
	
	/**
	 * 得到竞赛的举办学校
	 * @param competionId
	 * @return
	 */
	public CompetionSchool getCompetionSchool(int competionId)
	{
		return competionSchoolDao.getCompetionSchool(competionId);
	}
}
