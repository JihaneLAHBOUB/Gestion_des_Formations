package com.fst.service;

import java.util.List;

import com.fst.entity.Course;
import com.fst.entity.User;

public interface CourseService extends GenericService<Course, Long> {

	User findInstructor( Long courseId);
	
	List<Course> getInstructorCourses(Long instructor_id);
	
	List<Course> getRecentCourses();
	
	List<Course> getAvailbleCourses();
}

