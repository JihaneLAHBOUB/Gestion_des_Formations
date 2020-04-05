package com.fst.service;

import java.util.List;

import com.fst.entity.Course;
import com.fst.entity.Section;

public interface SectionService extends GenericService<Section, Long> {

	public List<Section> getSectionByCourseId(Long id);
	
	public Course getCourseBySectionId( Long id);
	
	public int getTimeByCourseId( Long id);
}
