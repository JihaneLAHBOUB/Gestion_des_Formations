package com.fst.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fst.dao.UserDAO;
import com.fst.entity.User;
import com.fst.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public User save(User user) {
		User savedUser = userDAO.save(user);
		return savedUser;
	}

	@Override
	public User update(User user) {
		User updatedUser = userDAO.save(user);
		return updatedUser;
	}

	@Override
	public void delete(User user) {
		userDAO.delete(user);
		
	}

	@Override
	public User getById(Long id) {
		Optional<User> user = userDAO.findById(id);
		if (user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}

	@Override
	public List<User> getAll() {
		List<User> listUser = userDAO.findAll();
		return listUser;
	}

	@Override
	public List<User> getInstructors() {
		List<Long> listId = userDAO.findByRoles("INSTRUCTOR");
		List<User> listInstructor = new ArrayList<>();
		for (Long userId : listId) {
			listInstructor.add(getById(userId));
		}
		return listInstructor;
	}

	@Override
	public List<User> getStudents() {
		List<Long> listId = userDAO.findByRoles("STUDENT");
		List<User> listStudents = new ArrayList<>();
		for (Long userId : listId) {
			listStudents.add(getById(userId));
		}
		return listStudents;
	}

	@Override
	public User getInstructorById(Long id) {
		Long idInstructor = userDAO.getInstructorById(id, "INSTRUCTOR");
		User instructor = getById(idInstructor);
		return instructor;
	}

	@Override
	public User getStudentById(Long id) {
		Long idStudent = userDAO.getStudentById(id, "STUDENT");
		User student = getById(idStudent);
		return student;
	}
	
	// add this method
	@Override
	public User findUser(String username) {
		User user = userDAO.findByUsername(username);
		return user;
	}
	
}
