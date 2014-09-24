package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.CourseDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.VerticalDao;
import com.dhl.dao.VerticalTrainDao;
import com.dhl.domain.Train;
import com.dhl.domain.VerticalTrain;

/**
 *
 */
@Service
public class TrainService {

	@Autowired
	private TrainDao trainDao;
	@Autowired
	private VerticalTrainDao verticalTrainDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private VerticalDao verticalDao;
	
	/**
	 * 根据编码取得实验
	 * 
	 * @return
	 */
	public Train getTrainByCodenum(String codenum) {
		return trainDao.getTrainByCodenum(codenum);
	}

	public Train get(int id)
	{
		return trainDao.get(id);
	}
	
	public void update(Train entity)
	{
		trainDao.update(entity);
	}
	
	public void update(int id,String name, String codenum, String envname,
			String conContent, String conShell, String conAnswer, int score,
			String scoretag) {

		Train t = get(id);
		if (t != null)
		{
			t.setName(name);
			t.setCodenum(codenum);
			t.setEnvname(envname);
			t.setConContent(conContent);
			t.setConShell(conShell);
			t.setConAnswer(conAnswer);
			t.setScore(score);
			t.setScoretag(scoretag);
			update(t);
		}
	}
	
	/**
	 * 保存实验
	 * 
	 * @return
	 */
	public Train save(Train t) {
		trainDao.save(t);
		return t;
	}

	public String save(String name, String codenum, String envname,
			String conContent, String conShell, String conAnswer, int score,
			String scoretag, int courseId, int verticalId) {

		Train tt = getTrainByCodenum(codenum);
		if (tt != null)
		{
			return CommonConstant.ERROR_4;
		}
		Train t = new Train();
		t.setName(name);
		t.setCodenum(codenum);
		t.setEnvname(envname);
		t.setConContent(conContent);
		t.setConShell(conShell);
		t.setConAnswer(conAnswer);
		t.setScore(score);
		t.setScoretag(scoretag);
		save(t);
		
		VerticalTrain vt = new VerticalTrain();
		vt.setCourse(courseDao.get(courseId));
		vt.setVertical(verticalDao.get(verticalId));
		vt.setTrain(t);
		verticalTrainDao.save(vt);
		return null;
	}
}
