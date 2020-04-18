package com.fst.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fst.entity.Course;

@Repository
public interface CourseDAO extends JpaRepository<Course, Long> {

	@Query(value = "select s.id from User s, Course c where c.instructor_id=s.id and roles=:roles and c.id=:course_id", nativeQuery = true)
	Long findInstructor(@Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select c.id from User s, Course c where c.instructor_id=s.id and roles=:roles  and s.id=:instructor_id ", nativeQuery = true)
	List<Long> getEnrolledCourses(@Param("instructor_id") Long instructor_id, @Param("roles") String roles);
	
	@Query(value = "select c.id from Course c where c.available=:is_available ORDER BY c.id DESC LIMIT 4 ", nativeQuery = true)
	List<Long> getRecentCourses(@Param("is_available") boolean is_available);
	
	@Query(value = "select c.id from Course c where c.available=:is_available ", nativeQuery = true)
	List<Long> getAvailbleCourses(@Param("is_available") boolean is_available);
	
	
}
