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
@Table(name = "t_evertical")
public class ExamVertical extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	// private int sequentialId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "esequentialId")
	private ExamSequential esequential;
	private int sortnumber = 10000;
//	@Transient
//	private List<Train> trainList;

	@OneToMany(cascade = CascadeType.MERGE,fetch = FetchType.EAGER,mappedBy = "examVertical")
	@OrderBy(value="id ASC")
	private Set<ExamQuestion> examQuestion;

	public int getSortnumber() {
		return sortnumber;
	}

	public void setSortnumber(int sortnumber) {
		this.sortnumber = sortnumber;
	}
	public Set<ExamQuestion> getExamQuestion() {
		return examQuestion;
	}

	public void setExamQuestion(Set<ExamQuestion> examQuestion) {
		this.examQuestion = examQuestion;
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
	
	public ExamSequential getEsequential() {
		return esequential;
	}

	public void setEsequential(ExamSequential esequential) {
		this.esequential = esequential;
	}
}
