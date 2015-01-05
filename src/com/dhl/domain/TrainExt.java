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
	private String devinfo;//执行环境机器情况----如果为空，代表是动态产生的，比如虚拟机
//	private String scoretag;
	
//	public String getScoretag() {
//		return scoretag;
//	}
//	public void setScoretag(String scoretag) {
//		this.scoretag = scoretag;
//	}
	public String getDevinfo() {
		return devinfo;
	}
	public void setDevinfo(String devinfo) {
		this.devinfo = devinfo;
	}
	public String getShellname() {
		return shellname;
	}
	public void setShellname(String shellname) {
		this.shellname = shellname;
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
