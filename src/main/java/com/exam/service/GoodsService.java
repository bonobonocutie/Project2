package com.exam.service;

import java.util.List;
import java.util.Map;

import com.exam.dto.GoodsDTO;

public interface GoodsService {
	public List<GoodsDTO> goodsList(Map<String, String> gCategory);
	public GoodsDTO goodsRetrieve(String gCode);
	public List<GoodsDTO> goodsListAll(String gCategory1);
}
