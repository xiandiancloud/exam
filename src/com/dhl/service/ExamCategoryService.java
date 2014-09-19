package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamCategoryDao;
import com.dhl.dao.Page;

/**
 *
 */
@Service
public class ExamCategoryService {
	
	@Autowired
	private ExamCategoryDao examCategoryDao;
	
	/**
	 * 取得分类下的已经发布的课程
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getExamByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		return examCategoryDao.getExamByCategoryId(categoryId, pageNo, pageSize);
	}
	
}
