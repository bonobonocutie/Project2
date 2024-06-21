package com.exam.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import com.exam.dto.OrderinfoDTO;

public interface OrderinfoService {
	public void orderinfoAdd(OrderinfoDTO dto);
	public void orderinfoDelete(int num);
	public List<OrderinfoDTO> orderinfoList(Map<String, Object> date);
}
