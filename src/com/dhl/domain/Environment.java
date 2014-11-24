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
@Table(name = "t_environment")
public class Environment extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;//模板名称
	private String value;//如果是创建虚拟机，采用系统的前置名称
	private String shellprefix;//shell脚本的前置名称
	private int examId;
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getShellprefix() {
		return shellprefix;
	}
	public void setShellprefix(String shellprefix) {
		this.shellprefix = shellprefix;
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
