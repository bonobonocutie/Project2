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
public class CartDeleteAllController {

	CartService cartService;

	public CartDeleteAllController(CartService cartService) {
		this.cartService = cartService;
	}

	@GetMapping("/cartDeleteAll")
	public String main(@RequestParam int num, ModelMap m) {
		System.out.println(m);
		MemberDTO dto = (MemberDTO) m.getAttribute("login");

		if (dto != null) {
			String userid = dto.getUserid();
			cartService.cartDeleteAll(userid);

			return "redirect:cartList";

		} else {
			return "loginForm";
		}
	}

}
