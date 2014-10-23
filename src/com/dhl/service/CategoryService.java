package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.CategoryDao;
import com.dhl.domain.Category;

/**
 *
 */
@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	/**
	 * 取得所有分类
	 * 
	 * @return
	 */
	public List<Category> getAllCategory() {
		return categoryDao.getAllCategory();
	}

	/**
	 * 保存分类
	 * 
	 * @param c
	 */
	public void save(Category c) {
		categoryDao.save(c);
	}

	/**
	 * 保存分类
	 * 
	 * @param name
	 */
	public String saveCategory(String name) {
		Category s = getCategoryByname(name);
		if (s == null) {
			Category school = new Category();
			school.setName(name);
			categoryDao.save(school);
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
		Category c = categoryDao.get(id);
		if (c != null) {
			categoryDao.remove(c);
		}
	}

	/**
	 * 根据分类名字取得分类
	 * 
	 * @param name
	 * @return
	 */
	public Category getCategoryByname(String name) {
		return categoryDao.getCategoryByname(name);
	}

}
