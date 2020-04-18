package com.fst.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Instructor extends User {

	private int score;
	
	
	private String newPassword;
//	define a relation between instructor and course

	@OneToMany(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "instructor_id")
	private List<Course> courses;

	public Instructor() {

	}

	public Instructor(int score, List<Course> courses) {
		super();
		this.score = score;
		this.courses = courses;
	}

	public Instructor(String username, String password, String email, String roles) {
		this.setUsername(username);
		this.setPassword(password);
		this.setEmail(email);
		this.setRoles(roles);
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public List<Course> addCourse(Course course) {
		if (courses == null) {
			courses = new ArrayList<>();
		}
		courses.add(course);

		return courses;
	}

//	public String getDescription() {
//		return description;
//	}
//
//	public void setDescription(String description) {
//		this.description = description;
//	}
//	
	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@Override
	public String toString() {
		return "Instructor [score=" + score + ", courses=" + courses + "]";
	}

}
