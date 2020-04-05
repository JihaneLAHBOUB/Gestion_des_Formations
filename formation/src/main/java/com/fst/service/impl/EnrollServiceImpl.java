package com.fst.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fst.dao.CourseDAO;
import com.fst.dao.EnrollDAO;
import com.fst.dao.UserDAO;
import com.fst.entity.Course;
import com.fst.entity.Enroll;
import com.fst.entity.User;
import com.fst.service.EnrollService;

@Service
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	private EnrollDAO enrollDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	public Enroll save(Enroll enroll) {
		Enroll createdEnroll = enrollDAO.save(enroll);
		return createdEnroll;
	}

	@Override
	public Enroll update(Enroll enroll) {
		Enroll updatedEnroll = enrollDAO.save(enroll);
		return updatedEnroll;
	}

	@Override
	public void delete(Enroll enroll) {
		enrollDAO.delete(enroll);

	}

	@Override
	public Enroll getById(Long id) {
		Optional<Enroll> enroll = enrollDAO.findById(id);
		if (enroll.isPresent()) {
			return enroll.get();
		} else {
			return null;
		}
	}

	@Override
	public List<Enroll> getAll() {
		List<Enroll> listEnroll = enrollDAO.findAll();
		return listEnroll;
	}

	@Override
	public List<Enroll> getConfirmedEnroll() {
		List<Enroll> listId = enrollDAO.findByIsConfirmTrue();
		return listId;
	}

	@Override
	public List<User> getEnrolledStudents() {
		List<Long> listId = enrollDAO.getEnrolledStudents("STUDENT");
		List<User> listUser = new ArrayList<>();
		for (Long id : listId) {
			listUser.add(userDAO.getOne(id));
		}
		return listUser;
	}

	@Override
	public List<User> findStudentBySpecificCourseId(Long courseId) {
		List<Long> listId = enrollDAO.findByCourseId(courseId,"STUDENT");
		List<User> listUser = new ArrayList<>();
		for (Long id : listId) {
			listUser.add(userDAO.getOne(id));
		}
		return listUser;
	}
	
	@Override
	public List<User> getConfirmTrueStudentByCourseId(Long courseId) {
		List<Long> listId = enrollDAO.getIsConfirmTrueStudent(true, courseId, "STUDENT");
		List<User> listUser = new ArrayList<>();
		for (Long id : listId) {
			listUser.add(userDAO.getOne(id));
		}
		return listUser;
	}

	@Override
	public int getNbrOfConfirmedStudent(Long courseId) {
		int count = enrollDAO.getConfirmedStudent(true, courseId, "STUDENT");
		
		return count;
	}

	@Override
	public int findDuplicateEnroll(Long studentId, Long courseId) {
		int count = enrollDAO.findDuplicateEnroll(studentId, courseId, "STUDENT");
		return count;
	}

	@Override
	public Enroll findEnroll(Long studentId, Long courseId) {
		Long idEnroll = enrollDAO.findEnroll(studentId, courseId, "STUDENT");
		Enroll enroll = getById(idEnroll);
		return enroll;
	}

	@Override
	public List<Course> getConfirmedEnrolledCourses(Long studentId) {
		List<Long> idCourses = enrollDAO.getEnrolledCourses(true, studentId, "STUDENT");
		List<Course> listCourses = new ArrayList<>();
		for (Long id : idCourses) {
			listCourses.add(courseDAO.getOne(id));
		}
		return listCourses;
	}

	@Override
	public List<Course> getUnconfirmedEnrolledCourses(Long studentId) {
		List<Long> idCourses = enrollDAO.getEnrolledCourses(false, studentId, "STUDENT");
		List<Course> listCourses = new ArrayList<>();
		for (Long id : idCourses) {
			listCourses.add(courseDAO.getOne(id));
		}
		return listCourses;
	}
}
