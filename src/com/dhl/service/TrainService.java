package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TrainDao;
import com.dhl.dao.TrainExtDao;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;

/**
 *
 */
@Service
public class TrainService {

	@Autowired
	private TrainDao trainDao;
	@Autowired
	private TrainExtDao trainExtDao;
	
	public List<TrainExt> getTrainExtList(int trainId)
	{
		return trainExtDao.getTrainExtList(trainId);
	}
	
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
