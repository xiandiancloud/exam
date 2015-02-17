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
@Table(name= "t_userprofile")
public class UserProfile extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int user_id;
	private String name;
	private String language;
	private String location;
	private String meta;
	private String courseware;
	private String gender;
	private String mailing_address;
	private int year_of_birth;
	private String level_of_education;
	private String goals;
	private int allow_certificate;
	private String country;
	private String city;
	private String school_name;
	private String major;
	private String class_name;
	private String admission_time;
	
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getAdmission_time() {
		return admission_time;
	}
	public void setAdmission_time(String admission_time) {
		this.admission_time = admission_time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMeta() {
		return meta;
	}
	public void setMeta(String meta) {
		this.meta = meta;
	}
	public String getCourseware() {
		return courseware;
	}
	public void setCourseware(String courseware) {
		this.courseware = courseware;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMailing_address() {
		return mailing_address;
	}
	public void setMailing_address(String mailing_address) {
		this.mailing_address = mailing_address;
	}
	public int getYear_of_birth() {
		return year_of_birth;
	}
	public void setYear_of_birth(int year_of_birth) {
		this.year_of_birth = year_of_birth;
	}
	public String getLevel_of_education() {
		return level_of_education;
	}
	public void setLevel_of_education(String level_of_education) {
		this.level_of_education = level_of_education;
	}
	public String getGoals() {
		return goals;
	}
	public void setGoals(String goals) {
		this.goals = goals;
	}
	public int getAllow_certificate() {
		return allow_certificate;
	}
	public void setAllow_certificate(int allow_certificate) {
		this.allow_certificate = allow_certificate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
}
