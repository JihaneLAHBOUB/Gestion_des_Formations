package com.fst.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fst.entity.Course;
import com.fst.entity.Section;

@Repository
public interface SectionDAO extends JpaRepository<Section, Long> {

	@Query(value = "select s.id from Section s, Course c where s.course_id = c.id and s.course_id=:idCourse ", nativeQuery = true)
	List<Long> getSectionByCourseId(@Param("idCourse") Long idCourse);
	
	@Query(value = "select c.id from Section s, Course c where s.course_id = c.id and s.id=:idSection ", nativeQuery = true)
	Long getCourseBySectionId(@Param("idSection") Long idSection);
	
	@Query(value = "select SUM(s.duration) from Section s, Course c where s.course_id = c.id and s.course_id=:idCourse ", nativeQuery = true)
	int getTimeByCourseId(@Param("idCourse") Long idCourse);
}
