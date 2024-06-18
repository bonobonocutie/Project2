package com.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.CartService;

@Controller
@SessionAttributes(names= {"login"})
public class CartDeleteController {

	CartService cartService;

	public CartDeleteController(CartService cartService) {
		this.cartService = cartService;
	}

	@GetMapping("/cartDelete")
	public String main(@RequestParam int num, ModelMap m) {
		System.out.println(m);
		MemberDTO dto = (MemberDTO) m.getAttribute("login");
		System.out.println(num);

		if (dto != null) {
			String userid = dto.getUserid();
			cartService.cartDelete(num);

			return "redirect:cartList";

		} else {
			return "loginForm";
		}
	}

}
