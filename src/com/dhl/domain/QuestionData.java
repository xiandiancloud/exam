package com.dhl.domain;

import java.util.List;


/**
 * 考试系统问题交换数据的类
 * @author dhl
 */
public class QuestionData {

	//问题或者实训的id
	private int id;
	
	public QuestionData(int id)
	{
		this.id = id;
	}
	//1:html问题描述 2：单选 3：多选 4：填空 5：多文本填空6：实训
	private int type;
	
	private String title;
	
	private List<String> content;
	
	private List<String> answer;
	
	private int score;

	private String explain;

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
