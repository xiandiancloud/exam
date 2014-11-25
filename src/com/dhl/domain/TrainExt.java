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
@Table(name = "t_train_ext")
public class TrainExt extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int trainId;
	private String shellpath;//脚本path
	private String shellname;//脚本name
	private String shellparameter;//脚本参数，已#号分割
	private String devip;//执行环境，机器IP
	public String getShellname() {
		return shellname;
	}
	public void setShellname(String shellname) {
		this.shellname = shellname;
	}
	public String getDevip() {
		return devip;
	}
	public void setDevip(String devip) {
		this.devip = devip;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTrainId() {
		return trainId;
	}
	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}
	public String getShellpath() {
		return shellpath;
	}
	public void setShellpath(String shellpath) {
		this.shellpath = shellpath;
	}
	public String getShellparameter() {
		return shellparameter;
	}
	public void setShellparameter(String shellparameter) {
		this.shellparameter = shellparameter;
	}
	
}
