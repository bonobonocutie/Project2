package com.exam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.service.CartService;


@Controller
@SessionAttributes(names = {"gCategory1"})
public class OrderController {
	
	CartService cartService;
	
	public OrderController(CartService cartService) {
		this.cartService = cartService;
	}



	@GetMapping("/order")
	public String order(@RequestParam String[] check ,ModelMap m) {
		
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		
		for (String string : check) {
			cartList.add(cartService.cartListOrder(Integer.parseInt(string)));
			
		}
		
		m.addAttribute("cartList", cartList);
		m.addAttribute("checkLen", check.length);
		
		return "order";
	}
	
}
