package com.exam.dto;

import java.time.LocalDate;

public class OrderinfoDTO {

	String userid;
	String gName;
	int gPrice;
	String gImage;
	int gAmount;
	String addr1;
	String phone;
	int total;
	LocalDate orderDay;
	String meg;
	String payment;
	
	public OrderinfoDTO() {}

	public OrderinfoDTO(String userid, String gName, int gPrice, String gImage, int gAmount, String addr1,
			String phone, int total, LocalDate orderDay, String meg, String payment) {
		this.userid = userid;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gImage = gImage;
		this.gAmount = gAmount;
		this.addr1 = addr1;
		this.phone = phone;
		this.total = total;
		this.orderDay = orderDay;
		this.meg = meg;
		this.payment = payment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public int getgAmount() {
		return gAmount;
	}

	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public LocalDate getOrderDay() {
		return orderDay;
	}

	public void setOrderDay(LocalDate orderDay) {
		this.orderDay = orderDay;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "OrderinfoDTO [userid=" + userid + ", gName=" + gName + ", gPrice=" + gPrice
				+ ", gImage=" + gImage + ", gAmount=" + gAmount + ", addr1=" + addr1 + ", phone=" + phone + ", total="
				+ total + ", orderDay=" + orderDay + ", meg=" + meg + ", payment=" + payment + "]";
	}
	
}
