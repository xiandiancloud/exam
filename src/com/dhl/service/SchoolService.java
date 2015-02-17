package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.SchoolDao;
import com.dhl.domain.School;

@Service
public class SchoolService{

	@Autowired
	private SchoolDao schoolDao;
	
	public List<School> getAllSchool() {
		return schoolDao.getAllSchool();
	}

	public void remove(int id) {
		schoolDao.remove(id);
	}

	public String saveSchool(String name) {
		return schoolDao.saveSchool(name);
	}
}
