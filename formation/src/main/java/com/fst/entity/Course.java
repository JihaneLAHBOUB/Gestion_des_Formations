package com.fst.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private LocalDate createdOn;
	private boolean available;
	private String description;
	private String objectifs;
	private String requirements;
	private String location;
	
	@Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
	private Date date;
	private int placesNumber;
	private int price;

//	requirements
//	add ArrayList to store requirements

// define a relation between course and sections
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "course_id")
	private List<Section> sections;

//	define a relation between course and instructor
//	@ManyToOne
//	@JoinColumn(name = "instructor_id")
//	private Instructor instructor;
//	define a relation between course and students
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinTable(name = "course_student", joinColumns = @JoinColumn(name = "course_id"), inverseJoinColumns = @JoinColumn(name = "student_id"))
//	private List<Student> students;
// 	define a relation between course and rates
	@OneToMany
	@JoinColumn(name = "course_id")
	private List<Rate> rates;

//	define a relation between course and enroll
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "course_id")
	private List<Enroll> enrolls;

	public Course() {
		super();
	}

	public Course(String name, LocalDate createdOn, boolean available, String description, int placesNumber,
			int price) {
		super();
		this.name = name;
		this.createdOn = createdOn;
		this.available = available;
		this.description = description;
		this.placesNumber = placesNumber;
		this.price = price;
		// this.instructor = instructor;
	}

	public Course(String name, LocalDate createdOn, boolean available, String description, int placesNumber, int price,
			List<Rate> rates) {
		super();
		this.name = name;
		this.createdOn = createdOn;
		this.available = available;
		this.description = description;
		this.placesNumber = placesNumber;
		this.price = price;
		// this.instructor = instructor;
		// this.students = students;
		this.rates = rates;
	}

	public Course(Long id, String name, LocalDate createdOn, boolean available, String description, int placesNumber,
			int price, List<Rate> rates) {
		super();
		this.id = id;
		this.name = name;
		this.createdOn = createdOn;
		this.available = available;
		this.description = description;
		this.placesNumber = placesNumber;
		this.price = price;
		// this.instructor = instructor;
		// this.students = students;
		this.rates = rates;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(LocalDate createdOn) {
		this.createdOn = createdOn;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPlacesNumber() {
		return placesNumber;
	}

	public void setPlacesNumber(int placesNumber) {
		this.placesNumber = placesNumber;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

//	public Instructor getInstructor() {
//		return instructor;
//	}
//
//	public void setInstructor(Instructor instructor) {
//		this.instructor = instructor;
//	}

//	public List<Student> getStudents() {
//		return students;
//	}
//
//	public void setStudents(List<Student> students) {
//		this.students = students;
//	}

	public List<Rate> getRates() {
		return rates;
	}

	public void setRates(List<Rate> rates) {
		this.rates = rates;
	}

	public List<Section> getSections() {
		return sections;
	}

	public void setSections(List<Section> sections) {
		this.sections = sections;
	}

	public List<Enroll> getEnroll() {
		return enrolls;
	}

	public void setEnroll(List<Enroll> enroll) {
		this.enrolls = enroll;
	}

//	add convenience methods

//	public void addStudent(Student theStudent) {
//		if (students == null) {
//			students = new ArrayList<>();
//		}
//		students.add(theStudent);
//	}

	public void addRate(Rate theRate) {
		if (rates == null) {
			rates = new ArrayList<>();
		}
		rates.add(theRate);
	}

	public List<Section> addSection(Section theSection) {
		if (sections == null) {
			sections = new ArrayList<>();
		}
		sections.add(theSection);

		return sections;
	}

	public List<Enroll> addEnroll(Enroll enroll) {
		if (enrolls == null) {
			enrolls = new ArrayList<>();
		}
		enrolls.add(enroll);

		return enrolls;
	}

	public String getObjectifs() {
		return objectifs;
	}

	public void setObjectifs(String objectifs) {
		this.objectifs = objectifs;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Enroll> getEnrolls() {
		return enrolls;
	}

	public void setEnrolls(List<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", createdOn=" + createdOn + ", available=" + available
				+ ", description=" + description + ", objectifs=" + objectifs + ", requirements=" + requirements
				+ ", location=" + location + ", placesNumber=" + placesNumber + ", price=" + price + ", sections="
				+ sections + ", rates=" + rates + ", enrolls=" + enrolls + "]";
	}

}
