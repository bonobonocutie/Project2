package com.exam.dto;

import org.apache.ibatis.type.Alias;

@Alias("GoodsDTO")
public class GoodsDTO {
	String gCode;
	String gCategory1;
	String gCategory2;
	String gName;
	int gPrice;
	String gImage;
	
	public GoodsDTO() {}

	public GoodsDTO(String gCode, String gCategory1, String gCategory2, String gName, int gPrice, String gImage) {
		this.gCode = gCode;
		this.gCategory1 = gCategory1;
		this.gCategory2 = gCategory2;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gImage = gImage;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}

	public String getgCategory1() {
		return gCategory1;
	}

	public void setgCategory1(String gCategory1) {
		this.gCategory1 = gCategory1;
	}

	public String getgCategory2() {
		return gCategory2;
	}

	public void setgCategory2(String gCategory2) {
		this.gCategory2 = gCategory2;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public String getgImage() {
		return gImage;
	}

	public void setgImage(String gImage) {
		this.gImage = gImage;
	}

	@Override
	public String toString() {
		return "GoodsDTO [gCode=" + gCode + ", gCategory1=" + gCategory1 + ", gCategory2=" + gCategory2 + ", gName="
				+ gName + ", gPrice=" + gPrice + ", gImage=" + gImage + "]";
	}
	
}
