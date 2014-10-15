package com.dhl.bean;

/**
 * 用户竞赛交换数据的类
 * @author dhl
 */
public class UserCompetionData {

	private String username;
	private int userId;
	private String score;//学生对应的总分
	private String state;//是否评分完毕，给老师看的评分状态
	private int userCompetionId;
	
	public int getUserCompetionId() {
		return userCompetionId;
	}

	public void setUserCompetionId(int userCompetionId) {
		this.userCompetionId = userCompetionId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
