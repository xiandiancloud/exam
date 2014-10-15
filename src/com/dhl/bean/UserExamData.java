package com.dhl.bean;

/**
 * 用户考试交换数据的类
 * @author dhl
 */
public class UserExamData {
	//章节名-----答对，答错，未答，得分
	String name;
	int right;
	int wrong;
	int noanswer;
	int cscore;
	
	public int getRight() {
		return right;
	}
	public void setRight(int right) {
		this.right = right;
	}
	public int getWrong() {
		return wrong;
	}
	public void setWrong(int wrong) {
		this.wrong = wrong;
	}
	public int getNoanswer() {
		return noanswer;
	}
	public void setNoanswer(int noanswer) {
		this.noanswer = noanswer;
	}
	public int getCscore() {
		return cscore;
	}
	public void setCscore(int cscore) {
		this.cscore = cscore;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
