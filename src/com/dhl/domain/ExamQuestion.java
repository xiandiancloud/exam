package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author dhl
 * 试卷单元下的问题或者实验课程
 */

@Entity
@Table(name = "t_exam_question")
public class ExamQuestion extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "examId")
	private Exam exam;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "everticalId")
	private ExamVertical examVertical;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "questionId")
	private Question question;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public ExamVertical getExamVertical() {
		return examVertical;
	}
	public void setExamVertical(ExamVertical examVertical) {
		this.examVertical = examVertical;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
}
