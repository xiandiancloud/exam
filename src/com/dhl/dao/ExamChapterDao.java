package com.dhl.dao;
import org.springframework.stereotype.Repository;

import com.dhl.domain.ExamChapter;

@Repository
public class ExamChapterDao extends BaseDao<ExamChapter> {
	
	public void removeChapterByExamId(int examId)
	{
		String hql = "delete from ExamChapter where examId = "+examId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
