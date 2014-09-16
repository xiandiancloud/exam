package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamSequentialDao;
import com.dhl.domain.ExamSequential;

/**
 *
 */
@Service
public class ExamSequentialService {
	
//	@Autowired
//	private ChapterDao chapterDao;
	@Autowired
	private ExamSequentialDao sequentialDao;
	
	/**
	 * 根据id返回小节
	 * @param id
	 * @return
	 */
	public ExamSequential get(int id)
	{
		return sequentialDao.get(id);
	}
	
	/**
	 * 保存小节
	 * @return
	 */
	public ExamSequential save(ExamSequential c)
	{
		sequentialDao.save(c);
		return c;
	}
	
	/**
	 * 更新小节
	 * @return
	 */
	public void update(ExamSequential c)
	{
		sequentialDao.update(c);
	}
	
	/**
	 * 刪除小节
	 * @return
	 */
	public void remove(ExamSequential c)
	{
		sequentialDao.remove(c);
	}
}
