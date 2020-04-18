package com.fst.web;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fst.entity.Course;
import com.fst.entity.Rate;
import com.fst.entity.Student;
import com.fst.entity.User;
import com.fst.service.CourseService;
import com.fst.service.RateService;
import com.fst.service.UserService;

@Controller
@RequestMapping("rate")
public class RateController {

	@Autowired
	private RateService rateService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/add")
	public String goToRate(@RequestParam("id") Long courseId, ModelMap modelMap) {
		Course course = courseService.getById(courseId);
		modelMap.addAttribute("course", course);
		return "student/rate-form";
	}
	
	@RequestMapping("/saveRate")
	public String createRate(HttpServletRequest request, @ModelAttribute("Rate") Rate rate, Principal principale, @RequestParam("id") Long idCourse, ModelMap modelMap) {
		
		String establishmentRate = request.getParameter("establishmentRate"); 
		String instructorRate = request.getParameter("instructorRate"); 
		String contentRate = request.getParameter("contentRate"); 
		
		System.out.println(" establishmentRate :: "+establishmentRate);
		System.out.println(" instructorRate :: "+instructorRate);
		System.out.println(" contentRate :: "+contentRate);
		
		rate.setEstablishmentRate(Long.parseLong(establishmentRate));
		rate.setInstructorRate(Long.parseLong(instructorRate));
		rate.setContentRate(Long.parseLong(contentRate));

		Rate savedRate = rateService.save(rate);
		
		User user = userService.findUser(principale.getName());
		Course savedCourse = courseService.getById(idCourse);
		savedCourse.addRate(savedRate);
		Student savedStudent = (Student) userService.getById(user.getId());
		savedStudent.addRate(savedRate);

		
		System.out.println(" rate : " + savedRate);
		modelMap.addAttribute("rate", "for your feedback.");
		return "student/myCourses";
	}
	
	
}
