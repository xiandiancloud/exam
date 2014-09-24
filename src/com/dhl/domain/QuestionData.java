package com.dhl.domain;

import java.util.List;


/**
 * 考试系统问题交换数据的类
 * @author dhl
 */
public class QuestionData {

	private int id;
	
	//1:html问题描述 2：单选 3：多选 4：填空 5：多文本填空
	private int type;
	
	private String title;
	
	private List<String> content;
	
	private String answer;
	
	private int score;

	private String explain;

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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}
}
