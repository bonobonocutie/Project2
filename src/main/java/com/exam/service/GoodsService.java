package com.exam.service;

import java.util.List;

import com.exam.dto.GoodsDTO;

public interface GoodsService {
	public List<GoodsDTO> goodsList(String gCategory1);
	public GoodsDTO goodsRetrieve(String gCode);
}
