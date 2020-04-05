package com.fst.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Student extends User {

	// private boolean enroll;
//	define a relation between student and courses
//	@ManyToMany
//	@JoinTable(name = "course_student", joinColumns = @JoinColumn(name = "student_id"), inverseJoinColumns = @JoinColumn(name = "course_id"))
//	private List<Course> courses;

//	@OneToMany
//	@JoinColumn(name = "student_id")
//	private  List<Course> courses;


	
	private String newPassword;
//	define a relation between student and rates
	@OneToMany
	@JoinColumn(name = "student_id")
	private List<Rate> rates;

//	define a relation between student and enroll
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "student_id")
	private List<Enroll> enrolls;

	public Student() {
	}

	public Student(List<Rate> rates) {
		super();
		// this.enroll = enroll;
		// this.courses = courses;
		this.rates = rates;
	}

	public Student(String username, String password, String email, String roles) {
		this.setUsername(username);
		this.setPassword(password);
		this.setEmail(email);
		this.setRoles(roles);
	}

//	public boolean isEnroll() {
//		return enroll;
//	}
//
//	public void setEnroll(boolean enroll) {
//		this.enroll = enroll;
//	}

//	public List<Course> getCourses() {
//		return courses;
//	}
//
//	public void setCourses(List<Course> courses) {
//		this.courses = courses;
//	}

	public List<Rate> getRates() {
		return rates;
	}

	public void setRates(List<Rate> rates) {
		this.rates = rates;
	}

	public List<Enroll> getEnroll() {
		return enrolls;
	}

	public void setEnroll(List<Enroll> enroll) {
		this.enrolls = enroll;
	}

	public List<Enroll> addEnroll(Enroll enroll) {
		if (enrolls == null) {
			enrolls = new ArrayList<>();
		}
		enrolls.add(enroll);

		return enrolls;
	}

	public void addRate(Rate theRate) {
		if (rates == null) {
			rates = new ArrayList<>();
		}
		rates.add(theRate);
	}


	public List<Enroll> getEnrolls() {
		return enrolls;
	}

	public void setEnrolls(List<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@Override
	public String toString() {
		return "Student [ rates=" + rates + ", enrolls=" + enrolls + "]";
	}

}
