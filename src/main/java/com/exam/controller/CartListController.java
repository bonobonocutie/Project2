package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.CartService;

@Controller
@SessionAttributes(names = { "login" })
public class CartListController {

	CartService cartService;

	public CartListController(CartService cartService) {
		this.cartService = cartService;
	}

	@GetMapping("/cartList")
	public String cartList(ModelMap m) {

		MemberDTO dto = (MemberDTO) m.getAttribute("login");

		List<CartDTO> cartList = cartService.cartList(dto.getUserid());
		m.addAttribute("cartList", cartList);

		return "cartList";

	}

}
