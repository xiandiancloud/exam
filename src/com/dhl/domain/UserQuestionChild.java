package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 学生考试时答题对应子问题的表
 * @author dhl
 *
 */

@Entity
@Table(name= "t_user_questionchild")
public class UserQuestionChild extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int number;
	private int userquestionId;
	private String useranswer;
	private String revalue;
	private String result;
	private int userId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getUserquestionId() {
		return userquestionId;
	}
	public void setUserquestionId(int userquestionId) {
		this.userquestionId = userquestionId;
	}
	public String getUseranswer() {
		return useranswer;
	}
	public void setUseranswer(String useranswer) {
		this.useranswer = useranswer;
	}
	public String getRevalue() {
		return revalue;
	}
	public void setRevalue(String revalue) {
		this.revalue = revalue;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
