package com.fst.web;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fst.dto.ItemCart;
import com.fst.entity.Course;
import com.fst.entity.Enroll;
import com.fst.entity.Student;
import com.fst.entity.User;
import com.fst.service.CourseService;
import com.fst.service.EnrollService;
import com.fst.service.SectionService;
import com.fst.service.UserService;
import com.fst.util.EmailUtil;

@Controller
@RequestMapping("enroll")
public class EnrollController {
	
	@Autowired
	private EnrollService enrollService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private EmailUtil emailUtil;
	
	@RequestMapping
	private List<Enroll> getEnrolls(){
		List<Enroll> listEnroll = enrollService.getAll();
		return listEnroll;
	}
	
	
	@RequestMapping("/students")
	private List<User> getStudent(){
		List<User> listEnroll = enrollService.getEnrolledStudents();
		return listEnroll;
	}
	
	@RequestMapping("/students/{courseId}")
	private List<User> getStudent(@PathVariable("courseId") Long courseId){
		List<User> listEnroll = enrollService.findStudentBySpecificCourseId(courseId);
		return listEnroll;
	}
	
	@RequestMapping("/confirmed/students")
	private int getConfirmedStudent(@RequestParam("courseId") Long courseId){
		int count = enrollService.getNbrOfConfirmedStudent(courseId);
		return count;
	}
	
	@RequestMapping("/sendMail")
	private String sendMail(@RequestParam("id") Long courseId, ModelMap modelMap) {
		
		Course course = courseService.getById(courseId);
		int count = getConfirmedStudent(courseId);
		List<User> listEnroll = enrollService.getConfirmTrueStudentByCourseId(courseId);
		
		if(count >= 1 ) {
			for (User user : listEnroll) {
				emailUtil.sendEmail(user.getEmail(), "Course Confirmation", "Hi "+user.getUsername()+", \r\n"
						+ "Congratulations!  You applied to the " +course.getName()+" Course.\r\n" + 
						"Next Step: Confirm your participation \r\n" +
						"To secure your spot in the course, please confirm your participation  by contacting me in  06 50 30 33 15 for the paiement or other informations,\r\n" + 
						"You must confirm your participation by April 10th at 11:59 PM UTC,  \r\n" + 
						"-- \r\n"
						+ " Training Management Team  \r\n" + 
						"Copyright © 2020 Training Management App, All rights reserved. \r\n");
			}
		}
		modelMap.addAttribute("msg", "there are " + count + " students enrolled and confirmed this courses");
		return "instructor/enrollement";
	}
	
	@RequestMapping("/confirmed")
	public List<Enroll> getConfirmedEnrolls(){
		
		List<Enroll> listEnroll = enrollService.getConfirmedEnroll();
		return listEnroll;
	}
	
	@RequestMapping("/listCourses")
	public String createEnroll( Principal principale, HttpSession session, ModelMap modelMap) {
		
		
		List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		
		User user = userService.findUser(principale.getName());
			
		if( cart != null ) {
			
			System.out.println("user : " + user);
			for( int i= 0; i< cart.size(); i++ ) {
				
				System.out.println(" in for loop i : "+ i +" : cart.get(i).getCourse().getId() :  " + cart.get(i).getCourse().getId());
				int nbr = enrollService.findDuplicateEnroll(user.getId(), cart.get(i).getCourse().getId());
				System.out.println(" nbr of duplicated : " + nbr);
				if(nbr == 0) {
				Enroll enroll = new Enroll();
				Course savedCourse = courseService.getById(cart.get(i).getCourse().getId());
				System.out.println(" in if i : "+ i +" : savedCourse :  " + savedCourse);
				savedCourse.addEnroll(enroll);
				Student savedStudent = (Student) userService.getById(user.getId());
				savedStudent.addEnroll(enroll);
				enroll.setConfirm(false);
				enrollService.save(enroll);
				
				System.out.println(" enroll saved : " +enroll);
				}else {
					System.out.println(" Course already enrolled! ");
				}
			
			}
		}
		
		
		modelMap.addAttribute("msg", "You already enrolled these courses. Check your cart to confirm them. ");
		session.setAttribute("cart", cart);
		session.removeAttribute("cart");
		return "student/cart";
	}
	
	@RequestMapping("/enrolledCourses")
	public String enrolledCourses(Principal principale, ModelMap modelMap) {
		User user = userService.findUser(principale.getName());
		// enrolled course
		List<Course> enrolledCoures = enrollService.getConfirmedEnrolledCourses(user.getId());
		modelMap.addAttribute("enrolledCoures", enrolledCoures);
		return "student/myCourses";
	}

	@RequestMapping("/unconfirmed")
	public String enrolledUnconfirmed(Principal principale, ModelMap modelMap) {
		User user = userService.findUser(principale.getName());
		// enrolled course
		List<Course> enrolledCoures = enrollService.getUnconfirmedEnrolledCourses(user.getId());
		modelMap.addAttribute("unconfirmed", enrolledCoures);
		return "student/myCart";
	}
	// One enroll course
//	@PostMapping("/{idStudent}/{idCourse}")
//	public Enroll createEnroll(@RequestParam("idStudent") Long idStudent, @RequestParam("idCourse") Long idCourse ) {
//		
//		int nbr = enrollService.findDuplicateEnroll(idStudent, idCourse);
//		if(nbr == 0) {
//			Enroll enroll = new Enroll();
//			Course savedCourse = courseService.getById(idCourse);
//			savedCourse.addEnroll(enroll);
//			Student savedStudent = (Student) userService.getById(idStudent);
//			savedStudent.addEnroll(enroll);
//			enroll.setConfirm(false);
//			Enroll createdEnroll = enrollService.save(enroll);
//			return createdEnroll;
//			
//		}else {
//			return null;
//		}
//		
//	}
	
	@RequestMapping("/confirm")
	private String confirmEnroll(Principal principale, @RequestParam("id") Long id, ModelMap modelMap) {
		User user = userService.findUser(principale.getName());
		int nbr = enrollService.findDuplicateEnroll(user.getId(), id);
		if(nbr == 1 ) {
		Enroll savedEnroll = enrollService.findEnroll(user.getId(), id);
//		Enroll savedEnroll = enrollService.getById(idEnroll);
		savedEnroll.setConfirm(true);
		enrollService.update(savedEnroll);
		}else {
			System.out.println(" duplicates enroll");
		}
		List<Course> enrolledCoures = enrollService.getUnconfirmedEnrolledCourses(user.getId());
		modelMap.addAttribute("unconfirmed", enrolledCoures);
		return "student/myCart";
		
	}
}
