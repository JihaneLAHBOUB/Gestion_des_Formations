package com.fst.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fst.entity.User;
import com.fst.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@GetMapping("/instructor")
	public List<User> getInstructor() {
		List<User> listInstructor = userService.getInstructors();
		return listInstructor;
	}
	
	@GetMapping("/profilInstructor/{id}")
	public User profilInstructor(@PathVariable("id") Long id) {
		return userService.getInstructorById(id);
	}
	
	@GetMapping("/student")
	public List<User> getStudent() {
		List<User> listStudent = userService.getStudents();
		return listStudent;
	}
	
	@GetMapping("/profilStudent/{id}")
	public User profilStudent(@PathVariable("id") Long id) {
		return userService.getStudentById(id);
	}
}
