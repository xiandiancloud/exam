package com.dhl.domain;


/**
 * 考试系统跟实训交换数据的类
 * @author dhl
 */
public class RestTrain {

	//实训课程的列表
	String courselist;
	//单个课程
	String course;
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getCourselist() {
		return courselist;
	}

	public void setCourselist(String courselist) {
		this.courselist = courselist;
	}

	private int courseId;

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	
	
	/*public List<Course> getCourseLit() {
		return courseLit;
	}

	public void setCourseLit(List<Course> courseLit) {
		this.courseLit = courseLit;
	}*/
	
}
