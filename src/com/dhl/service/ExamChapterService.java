package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamChapterDao;
import com.dhl.domain.ExamChapter;

/**
 *
 */
@Service
public class ExamChapterService {
	
	@Autowired
	private ExamChapterDao chapterDao;
//	@Autowired
//	private CourseDao courseDao;
	
	/**
	 * 根据章节id返回章节
	 * @param id
	 * @return
	 */
	public ExamChapter get(int id)
	{
		return chapterDao.get(id);
	}
	
	/**
	 * 保存章节
	 * @param name
	 * @param courseId
	 * @return
	 */
	public ExamChapter save(ExamChapter c)
	{
		chapterDao.save(c);
		return c;
	}

	/**
	 * 更新章节
	 * @param name
	 * @return
	 */
	public void update(ExamChapter c)
	{
		chapterDao.update(c);
	}
	
	/**
	 * 更新章节
	 * @param name
	 * @return
	 */
	public void remove(ExamChapter c)
	{
		chapterDao.remove(c);
	}
}
