package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;


@Controller
@SessionAttributes(names = {"gCategory1"})
public class MainController {
	
	GoodsService goodsService;
	
	public MainController(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	@GetMapping("/main")
	// 메인
	public String main(@RequestParam(required = false, defaultValue = "짱구") String gCategory1,
					   ModelMap m) {
		m.addAttribute("gCategory1",gCategory1);
		
		Map<String, String> gCategory = new HashMap<>();
		gCategory.put("gCategory1", gCategory1);
		gCategory.put("gCategory2", "핸드폰 케이스");
		
		m.addAttribute("gCategory1",gCategory1);
		
		List<GoodsDTO> goodsList = goodsService.goodsListAll(gCategory1);
		m.addAttribute("goodsList", goodsList);
		
		return "main";
	}
	
}
