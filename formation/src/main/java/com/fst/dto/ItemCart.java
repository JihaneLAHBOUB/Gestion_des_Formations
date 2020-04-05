package com.fst.dto;

import com.fst.entity.Course;

public class ItemCart {

	private Long id;
	private Course course;

	public ItemCart() {
		super();
	}

	public ItemCart(Long id, Course course) {
		super();
		this.id = id;
		this.course = course;
	}
	
	public ItemCart(Course course) {
		super();
		this.course = course;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "ItemCart [id=" + id + ", course=" + course + "]";
	}

}
