package com.fst.web;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.fst.entity.Course;
import com.fst.entity.Instructor;
import com.fst.entity.Section;
import com.fst.entity.User;
import com.fst.service.CourseService;
import com.fst.service.EnrollService;
import com.fst.service.SectionService;
import com.fst.service.UserService;

@Controller
@RequestMapping("course")
public class CourseController {


	@Autowired
	private EnrollService enrollService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private SectionService sectionService;

	
	@RequestMapping("/takeCourse")
	public String homeCourseStudent(ModelMap modelMap) {
		List<Course> listCourse = courseService.getAvailbleCourses();
		modelMap.addAttribute("listCourses", listCourse);
		return "student/allCourses";
	}
	
	@RequestMapping("/visitInstructor")
	public String visitInstructor(@RequestParam("id") Long id, ModelMap modelMap) {
		
		User user = courseService.findInstructor(id);
		modelMap.addAttribute("instructor", user);
		
		List<Course> listCourses = courseService.getInstructorCourses(user.getId());
		modelMap.addAttribute("listCourses", listCourses);
		return "student/instructorProfil";
	}
	
	@RequestMapping("/detail")
	public String getCourseDetail(ModelMap modelMap, @RequestParam("id") Long courseId) {
		
		int count = enrollService.getNbrOfConfirmedStudent(courseId);
		Course course = courseService.getById(courseId);
		List<Section> listSection = sectionService.getSectionByCourseId(courseId);
		modelMap.addAttribute("nbr", count);
		modelMap.addAttribute("course", course);
		modelMap.addAttribute("listSection", listSection);
		return "student/courseDetail";
	}
	
	
//	@PutMapping("/updateSection/{idSection}")
//	public Section updateSection(@PathVariable("idSection") Long id, @RequestBody Section section) {
//		
//		//Section savedSection = sectionService.getById(id);
//		section.setId(id);
//		Section updatedSection = sectionService.update(section);
		
	//	Course savedCourse = courseService.getById(idCourse);
	//	savedCourse.addSection(updatedSection);
	//	
	//	courseService.update(savedCourse);
		//Section updatedSection = sectionService.update(section);
		
//		return updatedSection;
//	}
	
//	@PutMapping("/updateCourse/{idCourse}")
//	public List<Course> updateCourse( @PathVariable("idCourse") Long id, @RequestBody Course course) {
		
	//	Course savedCourse = courseService.getById(id);
//		course.setId(id);
	//	course.setInstructor(savedCourse.getInstructor());
		
//		courseService.update(course);
//		List<Course> listCourse = courseService.getAll();
//		return listCourse;
//	}
	
/**
 * Instructor Side 
 */
	
	@RequestMapping("/displayCourses")
	public String displayCourse(Principal principal, ModelMap modelMap) {
		User user = userService.findUser(principal.getName());
		System.out.println(" name of user " + user.getId());
		List<Course> listCourse = courseService.getInstructorCourses(user.getId());
		System.out.println(" list course of user " +listCourse);
		modelMap.addAttribute("listCourses", listCourse);

		return "instructor/displayCourses";
	}
	
	@RequestMapping("/addCourse")
	public String showCreateCourse() {

		return "instructor/createCourse";
	}
	
	@RequestMapping("/saveCourse")
	public String createCourse(@ModelAttribute("Course") Course course, ModelMap modelMap, Principal principal,
			HttpSession session) {
		User user = userService.findUser(principal.getName());
		session.setAttribute("username", user.getUsername());

		course.setCreatedOn(LocalDate.now());
		course.setAvailable(true);
		Instructor instructor = (Instructor) userService.findUser(session.getAttribute("username").toString());
		instructor.addCourse(course);

		Course savedCourse = courseService.save(course);

		modelMap.addAttribute("idCourse", savedCourse.getId());
		modelMap.addAttribute("course", savedCourse);
		List<Section> listSections = sectionService.getSectionByCourseId(savedCourse.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/detailsCourse";
	}
	
	@RequestMapping("/getCourse")
	public String getCourse( @RequestParam("id") Long id, ModelMap modelMap ) {
		Course course = courseService.getById(id);
		modelMap.addAttribute("course", course);
		List<Section> listSections = sectionService.getSectionByCourseId(course.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/detailsCourse";
	}
	
	@RequestMapping("/deleteCourse")
	public RedirectView deleteCourse(@RequestParam("id") Long id, ModelMap modelMap) {

		Course courseToDelete = courseService.getById(id);
		courseService.delete(courseToDelete);

		return new RedirectView("displayCourses");
	}
	
	@RequestMapping("/updateCourse")
	public String showUpdateCourse(@RequestParam("id") Long id, ModelMap modelMap) {
		
		Course courseToUpdate = courseService.getById(id);
		modelMap.addAttribute("course", courseToUpdate);
		List<Section> listSections = sectionService.getSectionByCourseId(courseToUpdate.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/updateCourse";
	}
	
	@RequestMapping("/editCourse")
	public String updateCourse(@RequestParam("id") Long id, @ModelAttribute("Course") Course course, ModelMap modelMap) {
		
		Course savedCourse = courseService.getById(id);
		course.setId(id);
		course.setSections(savedCourse.getSections());
		courseService.update(course);
		
		List<Boolean> booList = new ArrayList<>();
		booList.add(true);
		booList.add(false);
		modelMap.addAttribute("booList", booList);
		modelMap.addAttribute("course", course);
		List<Section> listSections = sectionService.getSectionByCourseId(course.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/updateCourse";
	}
	
	@RequestMapping("/displaySections")
	public String displaySection(ModelMap modelMap) {
		List<Section> listSection = sectionService.getAll();
		modelMap.addAttribute("listSections", listSection);
		
		return "instructor/displaySections";
	}
	
	@RequestMapping("/addSection")
	public String showCreateSection(@RequestParam("id") Long id, ModelMap modelMap) {

		Course course = courseService.getById(id);
		modelMap.addAttribute("idCourse", course.getId());
		modelMap.addAttribute("courseName", course.getName());
		return "instructor/createSection";
	}
	
	@RequestMapping("/ajouterSection")
	public String ajouterSection(@RequestParam("id") Long id, ModelMap modelMap) {

		Course course = courseService.getById(id);
		modelMap.addAttribute("idCourse", course.getId());
		modelMap.addAttribute("courseName", course.getName());
		return "instructor/ajouterSection";
	}
	
	@RequestMapping("/saveSection")
	public String createSection(@RequestParam("id") Long id, @ModelAttribute("Section") Section section,
			ModelMap modelMap) {

		Course savedCourse = courseService.getById(id);
		savedCourse.setId(id);

		Section savedSection = sectionService.save(section);
		List<Section> addedSection = savedCourse.addSection(savedSection);
		savedCourse.setSections(addedSection);
		courseService.save(savedCourse);

		modelMap.addAttribute("course", savedCourse);
		List<Section> listSections = sectionService.getSectionByCourseId(savedCourse.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/detailsCourse";
	}
	
	@RequestMapping("/sauvegarderSection")
	public String sauvegarderSection(@RequestParam("id") Long id, @ModelAttribute("Section") Section section,
			ModelMap modelMap) {

		Section savedSection = sectionService.save(section);
		Course savedCourse = courseService.getById(id);
		
		List<Section> addedSection = savedCourse.addSection(savedSection);
		savedCourse.setSections(addedSection);
		courseService.save(savedCourse);

		modelMap.addAttribute("course", savedCourse);
		List<Section> listSections = sectionService.getSectionByCourseId(savedCourse.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/updateCourse";
	}
	
	@RequestMapping("/updateSection")
	public String showUpdateSection(@RequestParam("id") Long id, ModelMap modelMap) {

		Section sectionToUpdate = sectionService.getById(id);
		modelMap.addAttribute("Section", sectionToUpdate);
		return "instructor/updateSection";
	}
	
	@RequestMapping("/editSection")
	public String updateSection(@RequestParam("id") Long id, @ModelAttribute("Section") Section section, ModelMap modelMap) {
		
		section.setId(id);
		Section savedSection = sectionService.update(section);
		Course course = sectionService.getCourseBySectionId(id);
		modelMap.addAttribute("course", course);
		List<Section> listSections = sectionService.getSectionByCourseId(course.getId());
		modelMap.addAttribute("listSections", listSections);
		modelMap.addAttribute("section", savedSection);
		return "instructor/updateCourse";
	}
	
	@RequestMapping("/deleteSection")
	public String deleteSection(@RequestParam("id") Long id, ModelMap modelMap) {
		Course course = sectionService.getCourseBySectionId(id);
		Section section = sectionService.getById(id);
		sectionService.delete(section);

		
		modelMap.addAttribute("course", course);
		List<Section> listSections = sectionService.getSectionByCourseId(course.getId());
		modelMap.addAttribute("listSections", listSections);
		return "instructor/updateCourse";
	}
	
	@RequestMapping("/checkEnrollement")
	public String checkEnrollement(@RequestParam("id") Long id, ModelMap modelMap) {
		
		List<User> listUsers = enrollService.getConfirmTrueStudentByCourseId(id);
		modelMap.addAttribute("listUsers", listUsers);
		modelMap.addAttribute("idCourse", id);
		return "instructor/enrollement";
	}
}












