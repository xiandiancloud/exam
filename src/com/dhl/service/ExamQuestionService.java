package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ExamQuestionDao;
import com.dhl.domain.ExamQuestion;

/**
 *
 */
@Service
public class ExamQuestionService {
	
	@Autowired
	private ExamQuestionDao examQuestionDao;

	// @Autowired
	// private TrainDao trainDao;
	
	public ExamQuestion get(int id)
	{
		return examQuestionDao.get(id);
	}
	
	public void update(ExamQuestion eq)
	{
		examQuestionDao.update(eq);
	}
	public List<ExamQuestion> getVerticalTrainList(int verticalId){
		return examQuestionDao.getVerticalTrainList(verticalId);
    }
	
	public List<ExamQuestion> getAllTrainByExamId(int examId)
	{
		return examQuestionDao.getAllTrainByExamId(examId);
	}
	
	public void remove(int id)
	{
		examQuestionDao.remove(get(id));
	}
}
