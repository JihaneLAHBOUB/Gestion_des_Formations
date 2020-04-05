package com.fst.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Section {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String chapter;
	private String description;
	private int duration;
	private int price;
	
	public Section() {
		super();
	}
	
	public Section(String chapter, String description, int duration, int price) {
		
		this.chapter = chapter;
		this.description = description;
		this.duration = duration;
		this.price = price;
	}

	public Section(Long id, String chapter, String description, int duration, int price) {
		
		this.id = id;
		this.chapter = chapter;
		this.description = description;
		this.duration = duration;
		this.price = price;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Section [id=" + id + ", chapter=" + chapter + ", description=" + description + ", duration=" + duration
				+ ", price=" + price + "]";
	}
	
	
	
}
