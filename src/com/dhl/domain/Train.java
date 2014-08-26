package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_train")
public class Train extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	//编号
	private String codenum;
	// 环境模板名称
	private String envname;
	private String conContent;
	private String conShell;
	private String conAnswer;
	private int score;
	private String scoretag;

	public String getEnvname() {
		return envname;
	}

	public void setEnvname(String envname) {
		this.envname = envname;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getScoretag() {
		return scoretag;
	}

	public void setScoretag(String scoretag) {
		this.scoretag = scoretag;
	}

	public String getCodenum() {
		return codenum;
	}

	public void setCodenum(String codenum) {
		this.codenum = codenum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getConContent() {
		return conContent;
	}

	public void setConContent(String conContent) {
		this.conContent = conContent;
	}

	public String getConShell() {
		return conShell;
	}

	public void setConShell(String conShell) {
		this.conShell = conShell;
	}

	public String getConAnswer() {
		return conAnswer;
	}

	public void setConAnswer(String conAnswer) {
		this.conAnswer = conAnswer;
	}
}
