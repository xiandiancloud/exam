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
	private int type;//是否公开
	private String score;
	private String passscore;
	private int isstart;//竞赛是否开始
	private String imgpath;
	private String rank;
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getIsstart() {
		return isstart;
	}
	public void setIsstart(int isstart) {
		this.isstart = isstart;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
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
