package com.fst.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Rate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private  Long establishmentRate;
	private  Long instructorRate;
	private Long contentRate;

	public Rate() {

	}

	public Rate(Long id, Long establishmentRate, Long instructorRate,
			Long contentRate) {
		super();
		this.id = id;
		this.establishmentRate = establishmentRate;
		this.instructorRate = instructorRate;
		this.contentRate = contentRate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getEstablishmentRate() {
		return establishmentRate;
	}

	public void setEstablishmentRate(Long establishmentRate) {
		this.establishmentRate = establishmentRate;
	}

	public Long getInstructorRate() {
		return instructorRate;
	}

	public void setInstructorRate(Long instructorRate) {
		this.instructorRate = instructorRate;
	}

	public Long getContentRate() {
		return contentRate;
	}

	public void setContentRate(Long contentRate) {
		this.contentRate = contentRate;
	}

	@Override
	public String toString() {
		return "Rate [id=" + id + ", establishmentRate=" + establishmentRate + ", instructorRate=" + instructorRate
				+ ", contentRate=" + contentRate + "]";
	}

}
