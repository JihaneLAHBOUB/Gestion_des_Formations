package com.fst.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fst.dao.CourseDAO;
import com.fst.dao.UserDAO;
import com.fst.entity.Course;
import com.fst.entity.User;
import com.fst.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public Course save(Course course) {
		Course createdCourse = courseDAO.save(course);
		return createdCourse;
	}

	@Override
	public Course update(Course course) {
		Course uptedCourse = courseDAO.save(course);
		return uptedCourse;
	}

	@Override
	public void delete(Course course) {
		courseDAO.delete(course);

	}

	@Override
	public Course getById(Long id) {
		Optional<Course> course = courseDAO.findById(id);
		if (course.isPresent()) {
			return course.get();
		} else {
			return null;
		}
	}

	@Override
	public List<Course> getAll() {
		List<Course> listCourse = courseDAO.findAll();
		return listCourse;
	}

	@Override
	public List<Course> getAvailbleCourses() {
		List<Long> listId = courseDAO.getAvailbleCourses(true);
		List<Course> listCourse = new ArrayList<>();
		for (Long id : listId) {
			listCourse.add(courseDAO.getOne(id));
		}
		return listCourse;
	}
	
	@Override
	public User findInstructor(Long courseId) {
		Long idInstructor = courseDAO.findInstructor(courseId, "INSTRUCTOR");
		User user = userDAO.getOne(idInstructor);
		return user;
	}

	@Override
	public List<Course> getInstructorCourses(Long instructor_id) {
		List<Long> listId = courseDAO.getEnrolledCourses(instructor_id, "INSTRUCTOR");
		
		List<Course> listCourse = new ArrayList<>();
		for (Long id : listId) {
			listCourse.add(courseDAO.getOne(id));
		}
		return listCourse;
	}

	@Override
	public List<Course> getRecentCourses() {
		List<Long> listId = courseDAO.getRecentCourses(true);
		
		List<Course> listCourse = new ArrayList<>();
		for (Long id : listId) {
			listCourse.add(courseDAO.getOne(id));
		}
		return listCourse;
	}


}
