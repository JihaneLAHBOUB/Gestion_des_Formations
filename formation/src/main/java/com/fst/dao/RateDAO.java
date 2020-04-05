package com.fst.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fst.entity.Rate;

@Repository
public interface RateDAO extends JpaRepository<Rate, Long> {

	@Query(value = "select AVG(r.content_rate) from Rate r, User s, Course c where r.course_id=c.id and r.student_id=s.id and roles=:roles and c.id=:course_id", nativeQuery = true)
	float getAVGContentRate(@Param("course_id") Long course_id, @Param("roles") String roles);
	
	@Query(value = "select AVG(r.establishment_rate) from Rate r, User s, Course c where r.course_id=c.id and r.student_id=s.id and roles=:roles and c.id=:course_id", nativeQuery = true)
	float getAVGestablishmentRate(@Param("course_id") Long course_id, @Param("roles") String roles);

	@Query(value = "select AVG(r.instructor_rate) from Rate r, User s, Course c where r.course_id=c.id and r.student_id=s.id and roles=:roles and c.id=:course_id", nativeQuery = true)
	float getAVGinstructorRate(@Param("course_id") Long course_id, @Param("roles") String roles);
}
