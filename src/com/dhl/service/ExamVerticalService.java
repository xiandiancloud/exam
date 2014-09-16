package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamVerticalDao;
import com.dhl.domain.ExamVertical;

/**
 *
 */
@Service
public class ExamVerticalService {
	
	@Autowired
	private ExamVerticalDao verticalDao;
//	@Autowired
//	private SequentialDao sequentialDao;
	
	public ExamVertical get(int id)
	{
		return verticalDao.get(id);
	}
	
	public List<ExamVertical> getAllVertical(int sequentialId)
	{
		return verticalDao.getAllVertical(sequentialId);
	}
	
	/**
	 * 保存单元
	 * @param name
	 * @param courseId
	 * @return
	 */
	public ExamVertical save(ExamVertical c)
	{
		verticalDao.save(c);
		return c;
	}
	
	/**
	 * 更新单元
	 * @param c
	 * @return
	 */
	public ExamVertical update(ExamVertical c)
	{
		verticalDao.update(c);
		return c;
	}
	
	/**
	 * 刪除单元
	 * @param c
	 * @return
	 */
	public void remove(ExamVertical c)
	{
		verticalDao.remove(c);
	}
}
