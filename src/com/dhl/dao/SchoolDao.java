package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.School;

@Repository
public class SchoolDao extends BaseDao<School>{


	public List<School> getAllSchool() {
		String hql = "from School";
		return find(hql);
	}

	public void remove(int id) {
		School s = get(id);
		if (s != null)
		remove(s);
	}

	public void save(int id) {
		School s = get(id);
		if (s != null)
		save(s);
	}

	public String saveSchool(String name) {
		String hql = "from School where school_name=?";
		List<School> list = find(hql, name);
		if (list != null && list.size() > 0) {
			return CommonConstant.ERROR_1;
			
		} else {
			School s = new School();
			s.setSchool_name(name);
			save(s);
			return CommonConstant.ERROR_2;
		}
	}
}
