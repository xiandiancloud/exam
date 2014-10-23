package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.CompetionCategoryDao;
import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionExamDao;
import com.dhl.dao.CompetionSchoolDao;
import com.dhl.dao.ECategoryDao;
import com.dhl.dao.ExamDao;
import com.dhl.dao.UserCompetionDao;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionCategory;
import com.dhl.domain.CompetionExam;
import com.dhl.domain.CompetionSchool;
import com.dhl.domain.Exam;
import com.dhl.domain.UserCompetion;
import com.xiandian.model.User;

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
	private CompetionCategoryDao competionCategoryDao;
	@Autowired
	private UserCompetionDao userCompetionDao;
	@Autowired
	private CompetionSchoolDao competionSchoolDao;
	@Autowired
	private ExamDao examDao;
	@Autowired
	private ECategoryDao ecategoryDao;
	
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
	public Competion createCompetion(String imgpath,int rank,int categoryId,String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, int type,
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
		c.setImgpath(imgpath);
		if (rank > 0)
		{
			String erank = null;
			if (rank == 1)
			{
				erank = CommonConstant.LEVEL_1;
			}
			else if (rank == 2)
			{
				erank = CommonConstant.LEVEL_2;
			}
			else if (rank == 3)
			{
				erank = CommonConstant.LEVEL_3;
			}
			if (erank != null)
			c.setRank(erank);
		}
		competionDao.save(c);
		
		if (categoryId > 0)
		{
			CompetionCategory cc = new CompetionCategory();
			cc.setCompetion(c);
			cc.setEcategory(ecategoryDao.get(categoryId));
			competionCategoryDao.save(cc);
		}
		
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
	
	public void updateCompetion(String imgpath,int rank,int categoryId,int id,String name, String starttime,
			String endtime, String wstarttime, String wendtime,
			String examstarttime, String examendtime, int type,
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
		c.setImgpath(imgpath);
		if (rank > 0)
		{
			String erank = null;
			if (rank == 1)
			{
				erank = CommonConstant.LEVEL_1;
			}
			else if (rank == 2)
			{
				erank = CommonConstant.LEVEL_2;
			}
			else if (rank == 3)
			{
				erank = CommonConstant.LEVEL_3;
			}
			if (erank != null)
			c.setRank(erank);
		}
		else
		{
			c.setRank(null);
		}
		competionDao.update(c);
		
		CompetionSchool cs = competionSchoolDao.getCompetionSchool(id);
		cs.setSchoolId(Integer.parseInt(schoolId));
		competionSchoolDao.update(cs);
		
		if (categoryId > 0)
		{
			CompetionCategory cc = competionCategoryDao.getCompetionCategory(id);
			if (cc != null)
			{
				cc.setCompetion(c);
				cc.setEcategory(ecategoryDao.get(categoryId));
				competionCategoryDao.update(cc);
			}
			else
			{
				cc = new CompetionCategory();
				cc.setCompetion(c);
				cc.setEcategory(ecategoryDao.get(categoryId));
				competionCategoryDao.save(cc);
			}
		}
		else
		{
			CompetionCategory cc = competionCategoryDao.getCompetionCategory(id);
			if (cc != null)
			competionCategoryDao.remove(cc);
		}
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
	
	/**
	 * 得到竞赛的专业分类
	 * @param competionId
	 * @return
	 */
	public CompetionCategory getCompetionCategory(int competionId)
	{
		return competionCategoryDao.getCompetionCategory(competionId);
	}
}
