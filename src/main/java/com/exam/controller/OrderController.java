package com.exam.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.OrderinfoDTO;
import com.exam.service.CartService;
import com.exam.service.GoodsService;
import com.exam.service.OrderinfoService;


@Controller
@SessionAttributes(names = {"login", "gCategory1", "orderNum"})
public class OrderController {
	
	CartService cartService;
	GoodsService goodsService;
	OrderinfoService orderinfoService;
	
	public OrderController(CartService cartService, GoodsService goodsService, OrderinfoService orderinfoService) {
		this.cartService = cartService;
		this.goodsService = goodsService;
		this.orderinfoService = orderinfoService;
	}

	@GetMapping("/order")
	public String order(@RequestParam String[] check ,ModelMap m) {
		
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		for (String string : check) {
			//System.out.println(string);
			cartList.add(cartService.cartListOrder(Integer.parseInt(string)));
			
		}
		
		m.addAttribute("orderNum",check);
		m.addAttribute("cartList", cartList);
		m.addAttribute("checkLen", check.length);
		
//		MemberDTO dto = (MemberDTO)m.getAttribute("login");
		
		return "order";
	}
	
	@GetMapping("/orderAdd")
	public String orderAdd(@RequestParam Map<String, Object> map ,ModelMap m) {

		String[] orderNum = (String[])m.getAttribute("orderNum");
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		
		for (String string : orderNum) {
			//System.out.println(string);
			cartList.add(cartService.cartListOrder(Integer.parseInt(string)));
			orderinfoService.orderinfoDelete(Integer.parseInt(string));
		}
		
		CartDTO cart = null;
//		System.out.println(cartList.get(0));
//		System.out.println(cartList.get(1));
		
		for (CartDTO cartDTO : cartList) {
			cart = cartDTO;
//			System.out.println(cartDTO);
//			System.out.println(cartDTO.getGoodsList().get(0));
//			GoodsDTO goods = cartDTO.getGoodsList().get(0);
//			System.out.println(cartDTO.getGoodsList().get(0).getgName());
			
			LocalDate now = LocalDate.now();
			
			GoodsDTO goods = goodsService.goodsRetrieve(cartDTO.getgCode());
//			System.out.println(goodsService.goodsRetrieve(cartDTO.getgCode()));
			
			OrderinfoDTO orderinfo = new OrderinfoDTO(cart.getUserid(), goods.getgName(), 
													 goods.getgPrice(), goods.getgImage(), 
													 cart.getgAmount(), (String)map.get("addr1")
													 ,(String)map.get("phone"),  
													 Integer.parseInt((String)map.get("total")), 
													 now, (String)map.get("meg"), 
													 (String)map.get("paymentMethod"));
//			System.out.println(orderinfo);
			
			orderinfoService.orderinfoAdd(orderinfo);
		}
		
		return "redirect:orderHistory";
	}
	
	@GetMapping("/orderHistory")
	public String orderHistory(ModelMap m) {
		LocalDate now = LocalDate.now();
		LocalDate pre = now.minusMonths(3);
		
		long diff = pre.until(now, ChronoUnit.DAYS);
		
		List<OrderinfoDTO> oh = new ArrayList<>();
		List<OrderinfoDTO> join = new ArrayList<>();
		List<List<OrderinfoDTO>> join2 = new ArrayList<>();
		
		Map<String, Object> map= new HashMap<>();
		MemberDTO dto = (MemberDTO)m.getAttribute("login");
		String userid = dto.getUserid();
//		System.out.println(userid);
		
		for (long i = 0; i <= diff; i++) {
			map.clear();
			map.put("userid", userid);
			map.put("orderDay", now);
			oh = orderinfoService.orderinfoList(map);
			join.addAll(oh);
			if(oh.isEmpty()) {
				
			}else {
				join2.add(new ArrayList<>(oh));
				oh.clear();
			}
			oh.clear();
			now = now.minusDays(1);
		}
		
//		for (OrderinfoDTO orderinfoDTO : join) {
//			System.out.println(orderinfoDTO);
//			
//		}
		m.addAttribute("orderList",join);
		m.addAttribute("orderList2",join2);
		
		return "orderHistory";
	}
	
}
