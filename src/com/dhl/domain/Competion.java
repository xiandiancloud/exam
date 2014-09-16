package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author dhl
 * 竞赛
 */

@Entity
@Table(name = "t_competion")
public class Competion extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	private String describle;
	private String starttime;
	private String endtime;
	private String wstarttime;
	private String wendtime;
	private String examstarttime;
	private String examendtime;
	private String type;
	private String score;
	private String passscore;
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
	public String getDescrible() {
		return describle;
	}
	public void setDescrible(String describle) {
		this.describle = describle;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getWstarttime() {
		return wstarttime;
	}
	public void setWstarttime(String wstarttime) {
		this.wstarttime = wstarttime;
	}
	public String getWendtime() {
		return wendtime;
	}
	public void setWendtime(String wendtime) {
		this.wendtime = wendtime;
	}
	public String getExamstarttime() {
		return examstarttime;
	}
	public void setExamstarttime(String examstarttime) {
		this.examstarttime = examstarttime;
	}
	public String getExamendtime() {
		return examendtime;
	}
	public void setExamendtime(String examendtime) {
		this.examendtime = examendtime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getPassscore() {
		return passscore;
	}
	public void setPassscore(String passscore) {
		this.passscore = passscore;
	}
}
