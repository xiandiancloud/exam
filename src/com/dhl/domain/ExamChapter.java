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
 * @author dhl 试卷章节
 */

@Entity
@Table(name = "t_echapter")
public class ExamChapter extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "examId")
	private Exam exam;
	private int sortnumber = 10000;
	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "echapter")
	@OrderBy(value = "sortnumber ASC,id ASC")
	private Set<ExamSequential> esequentials;
	public int getSortnumber() {
		return sortnumber;
	}

	public void setSortnumber(int sortnumber) {
		this.sortnumber = sortnumber;
	}
	public Set<ExamSequential> getEsequentials() {
		return esequentials;
	}

	public void setEsequentials(Set<ExamSequential> esequentials) {
		this.esequentials = esequentials;
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

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
}
