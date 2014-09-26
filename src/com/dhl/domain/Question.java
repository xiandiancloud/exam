package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author dhl 试卷问题
 */

@Entity
@Table(name = "t_question")
public class Question extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String content;
	//低级
	private String lowcontent;
	//区分描述提
	private int type;//0:代表问题 ，1：代表描述题
	public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

	public String getLowcontent() {
		return lowcontent;
	}

	public void setLowcontent(String lowcontent) {
		this.lowcontent = lowcontent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
