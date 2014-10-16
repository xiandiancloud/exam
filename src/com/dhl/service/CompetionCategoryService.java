package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CompetionCategoryDao;
import com.dhl.dao.Page;

/**
 *
 */
@Service
public class CompetionCategoryService {
	
	@Autowired
	private CompetionCategoryDao competionCategoryDao;
	
	/**
	 * 竞赛列表
	 * @param categoryId
	 * @param rank
	 * @param search
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page searchExam(int categoryId,int rank,String search,int pageNo,int pageSize)
	{
		return competionCategoryDao.searchExam(categoryId, rank, search, pageNo, pageSize);
	}
	
}
