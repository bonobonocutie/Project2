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
public class CartAddController {
	CartService cartService;

	public CartAddController(CartService cartService) {
		this.cartService = cartService;
	}
//dsdsdsdsdsdsdsdsds
	@GetMapping("/cartAdd")
	public String main(
			@RequestParam String gAmount,
			@RequestParam String gCode,
			ModelMap m) {
		System.out.println(m);
		MemberDTO dto = (MemberDTO) m.getAttribute("login");

		if (dto != null) {
			String userid = dto.getUserid();

			System.out.println(gAmount);
			System.out.println(gCode);
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setUserid(userid);
			cartDTO.setgAmount(Integer.parseInt(gAmount));
			cartDTO.setgCode(gCode);
			
			cartService.cartAdd(cartDTO);

			return "redirect:cartList";

		} else {
			return "loginForm";
		}
	}

}
