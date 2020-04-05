package com.fst.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Enroll {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private boolean isConfirm;

	public Enroll() {
		super();
	}

	public Enroll(Long id, boolean isConfirm) {
		super();
		this.id = id;
		this.isConfirm = isConfirm;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean isConfirm() {
		return isConfirm;
	}

	public void setConfirm(boolean isConfirm) {
		this.isConfirm = isConfirm;
	}

	@Override
	public String toString() {
		return "Enroll [id=" + id + ", isConfirm=" + isConfirm + "]";
	}

}
