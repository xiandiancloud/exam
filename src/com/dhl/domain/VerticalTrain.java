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
@Table(name = "vertical_train")
public class VerticalTrain extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	// private int verticalId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "verticalId")
	private Vertical vertical;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "trainId")
	private Train train;

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Vertical getVertical() {
		return vertical;
	}

	public void setVertical(Vertical vertical) {
		this.vertical = vertical;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	// private int trainId;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	// public int getVerticalId() {
	// return verticalId;
	// }
	// public void setVerticalId(int verticalId) {
	// this.verticalId = verticalId;
	// }
	// public int getTrainId() {
	// return trainId;
	// }
	// public void setTrainId(int trainId) {
	// this.trainId = trainId;
	// }
}
