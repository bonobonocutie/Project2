package com.exam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.GoodsDTO;

@Mapper
public interface GoodsMapper {
	public List<GoodsDTO> goodsList(Map<String, String> gCategory);
	public GoodsDTO goodsRetrieve(String gCode);
	public List<GoodsDTO> goodsListAll(String gCategory1);
}
