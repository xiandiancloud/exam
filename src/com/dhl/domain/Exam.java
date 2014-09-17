package com.dhl.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @author dhl 试卷定义
 */

@Entity
@Table(name = "t_exam")
public class Exam extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	private String imgpath;
	private String describle;
	private int publish;
	private String starttime;
	private String starttimedetail;
	private String endtimedetail;
	private String org;
	private String coursecode;
	private String rank;
	private int lockexam;//1:试卷锁定

	public int getLockexam() {
		return lockexam;
	}

	public void setLockexam(int lockexam) {
		this.lockexam = lockexam;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getCoursecode() {
		return coursecode;
	}

	public void setCoursecode(String coursecode) {
		this.coursecode = coursecode;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "exam")
	@OrderBy(value = "id ASC")
	private Set<ExamChapter> examchapters;

	// @ManyToOne(fetch = FetchType.EAGER)
	// private Category category;

	public Set<ExamChapter> getExamchapters() {
		return examchapters;
	}

	public void setExamchapters(Set<ExamChapter> examchapters) {
		this.examchapters = examchapters;
	}

	// public Category getCategory() {
	// return category;
	// }
	// public void setCategory(Category category) {
	// this.category = category;
	// }
	public String getStarttimedetail() {
		return starttimedetail;
	}

	public void setStarttimedetail(String starttimedetail) {
		this.starttimedetail = starttimedetail;
	}

	public String getEndtimedetail() {
		return endtimedetail;
	}

	public void setEndtimedetail(String endtimedetail) {
		this.endtimedetail = endtimedetail;
	}

	public int getPublish() {
		return publish;
	}

	public void setPublish(int publish) {
		this.publish = publish;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
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
}
