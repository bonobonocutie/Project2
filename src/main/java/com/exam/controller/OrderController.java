package com.exam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.service.CartService;
import com.exam.service.GoodsService;


@Controller
@SessionAttributes(names = {"gCategory1"})
public class OrderController {
	
	CartService cartService;
	
	public OrderController(CartService cartService) {
		this.cartService = cartService;
	}



	@GetMapping("/order")
	public String order(@RequestParam String[] num ,ModelMap m) {
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		for (String string : num) {
			System.out.println(string);
			cartList.add(cartService.cartListOrder(Integer.parseInt(string)));
			
		}
//		System.out.println(num.length);
		
		
		
		m.addAttribute("cartList", cartList);
		m.addAttribute("numLen", num.length);
		m.addAttribute("num", num);
		
		return "order";
	}
	
}
