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
 * 用户对应的竞赛
 * @author dhl
 *
 */

@Entity
@Table(name= "t_user_competion")
public class UserCompetion extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
//	private int competionId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "competionId")
	private Competion competion;
	private String job;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Competion getCompetion() {
		return competion;
	}
	public void setCompetion(Competion competion) {
		this.competion = competion;
	}
}
