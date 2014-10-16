package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_competion_category")
public class CompetionCategory extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "competionId")
	private Competion competion;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ecategoryId")
	private ECategory ecategory;

	public ECategory getEcategory() {
		return ecategory;
	}

	public void setEcategory(ECategory ecategory) {
		this.ecategory = ecategory;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Competion getCompetion() {
		return competion;
	}

	public void setCompetion(Competion competion) {
		this.competion = competion;
	}
}
