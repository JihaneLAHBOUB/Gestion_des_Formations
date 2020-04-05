package com.fst.service;

import java.util.List;

import com.fst.entity.Course;
import com.fst.entity.Enroll;
import com.fst.entity.User;

public interface EnrollService extends GenericService<Enroll, Long> {

	List<Enroll> getConfirmedEnroll();
	
	List<Course> getConfirmedEnrolledCourses(Long studentId);
	
	List<Course> getUnconfirmedEnrolledCourses(Long studentId);
	
	List<User> getEnrolledStudents();
	
	List<User> findStudentBySpecificCourseId(Long courseId);
	
	List<User> getConfirmTrueStudentByCourseId(Long courseId);
	
	int getNbrOfConfirmedStudent(Long courseId);
	
	int findDuplicateEnroll(Long studentId, Long courseId);
	
	Enroll findEnroll(Long studentId, Long courseId);
}
