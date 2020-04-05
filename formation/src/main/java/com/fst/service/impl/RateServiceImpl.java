package com.fst.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fst.dao.RateDAO;
import com.fst.entity.Rate;
import com.fst.service.RateService;

@Service
public class RateServiceImpl implements RateService {

	@Autowired
	private RateDAO rateDAO;
	@Override
	public Rate save(Rate rate) {
		Rate createdRate = rateDAO.save(rate);
		return createdRate;
	}
	@Override
	public float getAVGContentRate(Long courseId) {
		float average = rateDAO.getAVGContentRate(courseId, "STUDENT");
		return average;
	}
	@Override
	public float getAVGestablishmentRate(Long courseId) {
		float average = rateDAO.getAVGestablishmentRate(courseId, "STUDENT");
		return average;
	}
	@Override
	public float getAVGinstructorRate(Long courseId) {
		float average = rateDAO.getAVGinstructorRate(courseId, "STUDENT");
		return average;
	}

}
