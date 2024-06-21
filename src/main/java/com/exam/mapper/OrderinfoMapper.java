package com.exam.mapper;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.OrderinfoDTO;

@Mapper
public interface OrderinfoMapper {
	public void orderinfoAdd(OrderinfoDTO dto);
	public void orderinfoDelete(int num);
	public List<OrderinfoDTO> orderinfoList(Map<String, Object> date);
}
