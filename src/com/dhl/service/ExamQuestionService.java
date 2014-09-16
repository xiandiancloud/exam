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
	private ExamQuestionDao verticalTrainDao;

	// @Autowired
	// private TrainDao trainDao;
	
	public List<ExamQuestion> getVerticalTrainList(int verticalId){
		return verticalTrainDao.getVerticalTrainList(verticalId);
    }
	
	public List<ExamQuestion> getAllTrainByCourseId(int examId)
	{
		return verticalTrainDao.getAllTrainByCourseId(examId);
	}
}
