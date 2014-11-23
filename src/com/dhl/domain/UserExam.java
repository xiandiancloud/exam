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
 * 学生试卷
 * @author dhl
 *
 */

@Entity
@Table(name= "t_user_exam")
public class UserExam extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
//	private int courseId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "examId")
	private Exam exam;
	private int docounts;//试卷做的次数
	private int state;//1：完成试卷0：没有完成----针对学生的状态
	private String usetime;
	private int activestate;//0:默认，最近操作就set为1
	private int fipf;//0：默认   1：完成评分   -----  是否评分结束，针对老师评分的状态
	
	public int getFipf() {
		return fipf;
	}
	public void setFipf(int fipf) {
		this.fipf = fipf;
	}
	public int getActivestate() {
		return activestate;
	}
	public void setActivestate(int activestate) {
		this.activestate = activestate;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	public int getDocounts() {
		return docounts;
	}
	public void setDocounts(int docounts) {
		this.docounts = docounts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
}
