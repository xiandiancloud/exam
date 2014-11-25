package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TrainDao;
import com.dhl.domain.Train;

/**
 *
 */
@Service
public class TrainService {

	@Autowired
	private TrainDao trainDao;
	
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
	
//	public void update(int id,String name, String codenum, String envname,
//			String conContent, String conShell, String conAnswer, int score,
//			String scoretag) {
//
//		Train t = get(id);
//		if (t != null)
//		{
//			t.setName(name);
//			t.setCodenum(codenum);
//			t.setEnvname(envname);
//			t.setConContent(conContent);
////			t.setConShell(conShell);
//			t.setConAnswer(conAnswer);
//			t.setScore(score);
//			t.setScoretag(scoretag);
//			update(t);
//		}
//	}
	
	/**
	 * 保存实验
	 * 
	 * @return
	 */
	public Train save(Train t) {
		trainDao.save(t);
		return t;
	}

}
