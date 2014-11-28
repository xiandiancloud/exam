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
@Table(name = "t_log")
public class Log extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String username;
	private String useraction;
	private String dotime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseraction() {
		return useraction;
	}
	public void setUseraction(String useraction) {
		this.useraction = useraction;
	}
	public String getDotime() {
		return dotime;
	}
	public void setDotime(String dotime) {
		this.dotime = dotime;
	}
	
}
