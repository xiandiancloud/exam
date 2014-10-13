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
@Table(name= "t_user_exam_history")
public class UserExamHistory extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
//	private int courseId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "examId")
	private Exam exam;
	private int docounts;
	private int state;//1：完成试卷0：没有完成
	private String usetime;
	private int activestate;//0:默认，最近操作就set为1
	private String againdotime;//再来一次的时间点
	
	public String getAgaindotime() {
		return againdotime;
	}
	public void setAgaindotime(String againdotime) {
		this.againdotime = againdotime;
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
