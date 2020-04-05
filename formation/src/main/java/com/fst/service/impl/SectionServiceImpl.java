package com.fst.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fst.dao.SectionDAO;
import com.fst.entity.Course;
import com.fst.entity.Section;
import com.fst.service.CourseService;
import com.fst.service.SectionService;

@Service
public class SectionServiceImpl implements SectionService {

	@Autowired
	private SectionDAO sectionDAO;
	
	@Autowired
	private CourseService courseService;
	
	@Override
	public Section save(Section section) {
		Section savedSection = sectionDAO.save(section);
		return savedSection;
	}

	@Override
	public Section update(Section section) {
		Section updatedSection = sectionDAO.save(section);
		return updatedSection;
	}

	@Override
	public void delete(Section section) {
		sectionDAO.delete(section);

	}

	@Override
	public Section getById(Long id) {
		Optional<Section> section = sectionDAO.findById(id);
		if (section.isPresent()) {
			return section.get();
		} else {
			return null;
		}
	}

	@Override
	public List<Section> getAll() {
		List<Section> listSection = sectionDAO.findAll();
		return listSection;
	}

	@Override
	public List<Section> getSectionByCourseId(Long idCourse){
		List<Long> listLongId = sectionDAO.getSectionByCourseId(idCourse);
		List<Section> listSection = new ArrayList<>();
		for (Long id : listLongId) {
			listSection.add(sectionDAO.getOne(id));
		}
		return listSection;
	}

	@Override
	public Course getCourseBySectionId(Long sectionId) {
		Long id = sectionDAO.getCourseBySectionId(sectionId);
		Course course = courseService.getById(id);
		return course;
	}

	@Override
	public int getTimeByCourseId(Long id) {
		int price = sectionDAO.getTimeByCourseId(id);
		System.out.println("in service impl price : "+ price);
		return price;
	}
}
