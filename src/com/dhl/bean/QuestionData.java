package com.dhl.bean;

import java.util.List;


/**
 * 考试系统问题交换数据的类
 * @author dhl
 */
public class QuestionData {

	//问题或者实训的id
	private int id;
	//1:html问题描述 2：单选 3：多选 4：填空 5：多文本填空6：实训
	//--------------查看commonconstants对应的 常量类
	private int type;
	
	private String title;
	
	//如果是多项题目，解析出来的是多个内容跟答案
	private List<String> content;	
	private List<String> answer;
	//题目分
	private int score;
	private String explain;
	
	//user info
	private int userscore;
	private String useranswer;
	
	public String getUseranswer() {
		return useranswer;
	}

	public void setUseranswer(String useranswer) {
		this.useranswer = useranswer;
	}

	public int getUserscore() {
		return userscore;
	}

	public void setUserscore(int userscore) {
		this.userscore = userscore;
	}

	public QuestionData(int id)
	{
		this.id = id;
	}
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	public List<String> getAnswer() {
		return answer;
	}

	public void setAnswer(List<String> answer) {
		this.answer = answer;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getContent() {
		return content;
	}

	public void setContent(List<String> content) {
		this.content = content;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}
}
