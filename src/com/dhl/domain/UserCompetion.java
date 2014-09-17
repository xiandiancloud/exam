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
 * 
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_user_competion")
public class UserCompetion extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	// private int userId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	private User user;

	// private int competionId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "competionId")
	private Competion competion;
	private String job;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
