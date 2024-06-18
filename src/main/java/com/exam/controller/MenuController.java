package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;


@Controller
@SessionAttributes(names = {"gCategory1"})
public class MenuController {
	
	GoodsService goodsService;
	
	public MenuController(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	@GetMapping("/menu")
	public String main(@RequestParam(required = false, defaultValue = "핸드폰 케이스")String gCategory2,
					   ModelMap m) {
		
		Map<String, String> gCategory = new HashMap<>();
		
		gCategory.put("gCategory1", (String)m.getAttribute("gCategory1"));
		gCategory.put("gCategory2", gCategory2);
		
		List<GoodsDTO> goodsList = goodsService.goodsList(gCategory);
		m.addAttribute("goodsList", goodsList);
		
		return "main";
	}
	
}
