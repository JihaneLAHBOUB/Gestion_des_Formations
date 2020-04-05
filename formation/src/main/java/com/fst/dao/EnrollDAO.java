package com.fst.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fst.entity.Enroll;

@Repository
public interface EnrollDAO extends JpaRepository<Enroll, Long> {

	//@Query(value = "select id from Enroll where isConfirm=:isConfirm", nativeQuery = true)
	List<Enroll> findByIsConfirmTrue();
	
	@Query(value="select DISTINCT s.id from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and c.id=:course_id", nativeQuery = true)
	List<Long> findByCourseId(@Param("course_id") Long course_id, @Param("roles") String roles);
	
	@Query(value="select s.id from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles ", nativeQuery = true)
	List<Long> getEnrolledStudents(@Param("roles") String roles);
	
	@Query(value = "select count(e.student_id) from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and e.is_confirm=:is_confirm and c.id=:course_id", nativeQuery = true)
	int getConfirmedStudent(@Param("is_confirm") boolean is_confirm, @Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select count(e.id) from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and s.id=:student_id and c.id=:course_id", nativeQuery = true)
	int findDuplicateEnroll(@Param("student_id") Long student_id, @Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select s.id from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and e.is_confirm=:is_confirm and c.id=:course_id", nativeQuery = true)
	List<Long> getIsConfirmTrueStudent(@Param("is_confirm") boolean is_confirm, @Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select DISTINCT e.id from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and s.id=:student_id and c.id=:course_id", nativeQuery = true)
	Long findEnroll(@Param("student_id") Long student_id, @Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select c.id from Enroll e, User s, Course c where e.course_id=c.id and e.student_id=s.id and roles=:roles and e.is_confirm=:is_confirm and s.id=:student_id ", nativeQuery = true)
	List<Long> getEnrolledCourses(@Param("is_confirm") boolean is_confirm, @Param("student_id") Long student_id, @Param("roles") String roles);
}