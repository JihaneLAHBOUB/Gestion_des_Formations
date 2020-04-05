package com.fst.web;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fst.entity.Course;
import com.fst.entity.Instructor;
import com.fst.entity.Student;
import com.fst.entity.User;
import com.fst.service.CourseService;
import com.fst.service.EnrollService;
import com.fst.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private EnrollService enrollService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("index")
	public String getMessageAll(Principal principal, HttpSession session) {
		User user = userService.findUser(principal.getName());
		session.setAttribute("username", user);
		return "index";
	}
	
	@RequestMapping("instructor")
	public String pageAdmin(Principal principale, ModelMap modelMap) {
		User user = userService.findUser(principale.getName());
		List<Course> list = courseService.getInstructorCourses(user.getId());
		List<User> listUser = enrollService.getEnrolledStudents();
		List<Course> recentCoures = courseService.getRecentCourses();
		if(list.size() == 0 ) {
			modelMap.addAttribute("nbrCourse", list.size());
			modelMap.addAttribute("nbrStudent", listUser.size());
			modelMap.addAttribute("date", recentCoures.get(0).getDate());
		}
		
		return "instructor/index";
	}
	
	@RequestMapping("student")
	public String pageUser(Principal principale, ModelMap modelMap) {
			User user = userService.findUser(principale.getName());
			// enrolled course
			List<Course> enrolledCoures = enrollService.getConfirmedEnrolledCourses(user.getId());
			modelMap.addAttribute("nbrEnrollement", enrolledCoures.size());
			modelMap.addAttribute("date", LocalDate.now());
			
			// recent Cources
			List<Course> recentCoures = courseService.getRecentCourses();
			modelMap.addAttribute("recentCoures", recentCoures);
		return "student/index";
	}
	
	@GetMapping("login")
	public String login(Model model) {
//		session.setAttribute("username", user);
		model.addAttribute("facebook", "oauth2/authorization/facebook");
		model.addAttribute("google", "oauth2/authorization/google");
		return "login";
	}
	
	@GetMapping("success")
	public @ResponseBody String success(@AuthenticationPrincipal OAuth2User user) {
		System.out.println("in success : " + user);
		System.out.println(user.getAttributes());
		String nom = user.getAttribute("name");
		String email = user.getAttribute("email");
		String photo = "<img scr="+user.getAttribute("picture")+">";
		return nom+"<br>"+email+"<br>"+photo;
		
	}
	
	@RequestMapping("editStudent")
	private String edit( ModelMap modelMap, Principal principal, HttpSession session ) {
		if( principal.getName() == null) {
			String username = session.getAttribute("user").toString();
			User user = userService.findUser(username);
			modelMap.addAttribute("User", user);
			
		}else {
			String username = principal.getName();
			User user = userService.findUser(username);
			modelMap.addAttribute("User", user);
		}

		
		return "editAccountStudent";
	}
	
	@RequestMapping("editAccountStudent")
	private String editAccount(@ModelAttribute("Student") Student user, Principal principal, ModelMap modelMap ) {
		
		User currentUser = userService.findUser(principal.getName());
		user.setId(currentUser.getId());
		user.setRoles(currentUser.getRoles());
		System.out.println( "submited raw user.getPassword()) : " + user.getPassword() );
		System.out.println( "storage currentUser.getPassword() : " + currentUser.getPassword() );
		if( passwordEncoder.matches(user.getPassword(), currentUser.getPassword())) {
			System.out.println(" password matches ");
			user.setPassword(passwordEncoder.encode(user.getNewPassword()));
			modelMap.addAttribute("process", "Success: your information will be edit the next login session." );
		}else {
			System.out.println(" password does not matche ");
			user.setPassword(currentUser.getPassword());
			modelMap.addAttribute("process", "Failed: your current password is incorrect. You are not allowed to edit the informations");
		}
		
		userService.update( user );
//		System.out.println(" user.getId(): " + user.getId());
//		System.out.println(" user.getUsername() : " + user.getUsername() );
		System.out.println(" New password user.getPassword()) : " + user.getNewPassword() );
//		System.out.println(" user.getEmail()  : " + user.getEmail() );
//		System.out.println(" user.getRoles() : " + user.getRoles() );
		return "editAccountStudent";
	}
	
	@RequestMapping("editInstructor")
	private String editInstructor( ModelMap modelMap, Principal principal, HttpSession session ) {
		if( principal.getName() == null) {
			String username = session.getAttribute("user").toString();
			User user = userService.findUser(username);
			modelMap.addAttribute("User", user);
			
		}else {
			String username = principal.getName();
			User user = userService.findUser(username);
			modelMap.addAttribute("User", user);
		}

		
		return "editAccountInstructor";
	}
	
	@RequestMapping("editAccountInstructor")
	private String editAccountInstructor(@ModelAttribute("Instructor") Instructor user, Principal principal, ModelMap modelMap ) {
		
		User currentUser = userService.findUser(principal.getName());
		user.setId(currentUser.getId());
		user.setRoles(currentUser.getRoles());
		System.out.println( "submited raw user.getPassword()) : " + user.getPassword() );
		System.out.println( "storage currentUser.getPassword() : " + currentUser.getPassword() );
		if( passwordEncoder.matches(user.getPassword(), currentUser.getPassword())) {
			System.out.println(" password matches ");
			user.setPassword(passwordEncoder.encode(user.getNewPassword()));
			modelMap.addAttribute("process", "Success: your information will be edit the next login session." );
		}else {
			System.out.println(" password does not matche ");
			user.setPassword(currentUser.getPassword());
			modelMap.addAttribute("process", "Failed: your current password is incorrect. You are not allowed to edit the informations");
		}
		
		userService.update( user );
		return "editAccountInstructor";
	}
}









