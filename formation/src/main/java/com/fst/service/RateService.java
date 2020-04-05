package com.fst.service;

import com.fst.entity.Rate;

public interface RateService {

	Rate save(Rate rate);
	
	float getAVGContentRate(Long courseId);
	
	float getAVGestablishmentRate(Long courseId);
	
	float getAVGinstructorRate(Long courseId);
}
