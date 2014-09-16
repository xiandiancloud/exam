package com.dhl.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_esequential")
public class ExamSequential extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "echapterId")
	private ExamChapter echapter;

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "esequential")
	@OrderBy(value = "id ASC")
	private Set<ExamVertical> examVerticals;

	public Set<ExamVertical> getExamVerticals() {
		return examVerticals;
	}

	public void setExamVerticals(Set<ExamVertical> examVerticals) {
		this.examVerticals = examVerticals;
	}

	public ExamChapter getEchapter() {
		return echapter;
	}

	public void setEchapter(ExamChapter echapter) {
		this.echapter = echapter;
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
