package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CompetionDao;
import com.dhl.dao.CompetionSchoolDao;
import com.dhl.domain.Competion;
import com.dhl.domain.CompetionSchool;

/**
 * 竞赛
 */
@Service
public class CompetionService {

	@Autowired
	private CompetionDao competionDao;
	@Autowired
	private CompetionSchoolDao competionSchoolDao;
	
	/**
	 * 保存章节
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Competion save(Competion c)
	{
		save(c);
		return c;
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
			String score, String passscore, String describle, String schoolId)
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
		return c;
	}
	
}
