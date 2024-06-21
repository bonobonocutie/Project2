package com.exam.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.exam.dto.OrderinfoDTO;
import com.exam.mapper.OrderinfoMapper;

@Service
public class OrderinfoServiceImpl implements OrderinfoService {

	OrderinfoMapper orderinfoMapper;
	
	public OrderinfoServiceImpl(OrderinfoMapper orderinfoMapper) {
		this.orderinfoMapper = orderinfoMapper;
	}

	@Override
	public void orderinfoAdd(OrderinfoDTO dto) {
		orderinfoMapper.orderinfoAdd(dto);
	}

	@Override
	public void orderinfoDelete(int num) {
		orderinfoMapper.orderinfoDelete(num);
	}

	@Override
	public List<OrderinfoDTO> orderinfoList(Map<String, Object> date) {
		return orderinfoMapper.orderinfoList(date);
	}

}
