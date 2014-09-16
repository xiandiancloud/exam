package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.ECategoryDao;
import com.dhl.domain.ECategory;

/**
 *
 */
@Service
public class ECategoryService {

	@Autowired
	private ECategoryDao ecategoryDao;

	/**
	 * 取得所有分类
	 * 
	 * @return
	 */
	public List<ECategory> getAllCategory() {
		return ecategoryDao.getAllCategory();
	}

	/**
	 * 保存分类
	 * 
	 * @param c
	 */
	public void save(ECategory c) {
		ecategoryDao.save(c);
	}

	/**
	 * 保存分类
	 * 
	 * @param name
	 */
	public String saveCategory(String name) {
		ECategory s = getCategoryByname(name);
		if (s == null) {
			ECategory school = new ECategory();
			school.setName(name);
			ecategoryDao.save(school);
			return CommonConstant.ERROR_2;
		} else {
			return CommonConstant.ERROR_3;
		}
	}

	/**
	 * 根据id删除分类
	 * 
	 * @param id
	 */
	public void remove(int id) {
		ECategory c = ecategoryDao.get(id);
		if (c != null) {
			ecategoryDao.remove(c);
		}
	}

	/**
	 * 根据分类名字取得分类
	 * 
	 * @param name
	 * @return
	 */
	public ECategory getCategoryByname(String name) {
		return ecategoryDao.getCategoryByname(name);
	}

}
