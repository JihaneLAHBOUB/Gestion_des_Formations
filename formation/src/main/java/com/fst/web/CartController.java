package com.fst.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fst.dto.ItemCart;
import com.fst.entity.Course;
import com.fst.service.CourseService;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private CourseService courseService;
	

	@RequestMapping("/myCart")
	public String myCart(HttpSession session){
		List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		return "student/cart";
	}
	
	@RequestMapping("/addProduct")
	public String addToCart(@RequestParam("id") Long id, HttpSession session) {
		Course course = courseService.getById(id);
		if(session.getAttribute("cart") == null) {
			List<ItemCart> cart = new ArrayList<>();
			cart.add(new ItemCart(course));
			session.setAttribute("cart", cart);
			
		}else {
			List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		
			int index = isExists(id, cart);
			if(index == -1) {
				cart.add(new ItemCart(course));
			}else {
				System.out.println("already exist");
			}
			session.setAttribute("cart", cart);
			
		}
		return "student/cart";
	}

	private int isExists(Long idCourse, List<ItemCart> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if(cart.get(i).getCourse().getId() == idCourse) {
				return i;
			}
		}
		return -1;
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteItem(@RequestParam("id") Long id, HttpSession session) {
		
		List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		int index = isExists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "student/cart";
	}
	
	@RequestMapping("/updateProduct")
	public String updateCart(ModelMap modelMap, HttpSession session) {

		List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		modelMap.put("total", total(session));
		return "student/cart";
	}
	
	private double total(HttpSession session) {
		List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
		double somme = 0;
		if (cart != null) {
			for (ItemCart item : cart) {
				somme += item.getCourse().getPrice();
			}
		}
		return somme;
	}

}
