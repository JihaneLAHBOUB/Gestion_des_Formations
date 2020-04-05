package com.fst.web;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fst.entity.Instructor;
import com.fst.entity.Student;
import com.fst.entity.User;
import com.fst.service.UserService;

@Controller
@RequestMapping("signup/")
public class AccountController {

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("instructor")
	private String signUpI() {
		return "signupInstructor";
	}
	
	@RequestMapping("instructor/register")
	private ModelAndView signupInstructor(@ModelAttribute("Instructor") Instructor user, HttpSession session ) {
		
		User newAccount = new Instructor(user.getUsername(),passwordEncoder.encode(user.getPassword()),user.getEmail(), "INSTRUCTOR");
		User savedUser = userService.save(newAccount);
		session.setAttribute("user", savedUser.getUsername());
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping("student")
	private String signUpS() {
		return "signupStudent";
	}
	
	@RequestMapping("student/register")
	private ModelAndView signupStudent(@ModelAttribute("Student") Student user, HttpSession session ) {
		
		User Account = new Student(user.getUsername(),passwordEncoder.encode(user.getPassword()),user.getEmail(), "STUDENT");
		User savedUser = userService.save(Account);
		session.setAttribute("user", savedUser.getUsername());
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "username", method = RequestMethod.GET)
    @ResponseBody
    public String currentUserName(Principal principal) {
		System.out.println(" the username is : " + principal.getName());
        return principal.getName();
    }

}
