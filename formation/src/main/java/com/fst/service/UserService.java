package com.fst.service;

import java.util.List;

import com.fst.entity.User;

public interface UserService extends GenericService<User, Long> {

	List<User> getInstructors();
	
	List<User> getStudents();
	
	User getInstructorById(Long id);
	
	User getStudentById(Long id);
	
	// add this
	 User findUser(String username);
}
