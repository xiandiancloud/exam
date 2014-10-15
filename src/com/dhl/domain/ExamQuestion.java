package com.dhl.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.dhl.bean.QuestionData;

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
	@JoinColumn(name = "trainId")
	private Train train;
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	@Transient
	private List<QuestionData> qdlist;
	@Transient
	private int score;
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public List<QuestionData> getQdlist() {
		return qdlist;
	}
	public void setQdlist(List<QuestionData> qdlist) {
		this.qdlist = qdlist;
	}
	/*private String htmlcontent;
	
	public String getHtmlcontent() {
		return htmlcontent;
	}
	public void setHtmlcontent(String htmlcontent) {
		this.htmlcontent = htmlcontent;
	}*/
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
}
