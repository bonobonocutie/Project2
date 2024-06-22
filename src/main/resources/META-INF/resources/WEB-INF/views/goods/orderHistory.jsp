<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
  <div class="TodoApp">
    <div class="container">
    	<%-- <c:forEach var="dto" items="${orderList}" varStatus="status"> --%>
            <div>
            <c:forEach var="dto" items="${orderList2}" varStatus="status">
                <p style="text-align:left">주문일자: ${dto.get(0).orderDay}</p>
                <p style="text-align:left">전화번호: ${dto.get(0).phone}, 주소: ${dto.get(0).addr1}</p>
                <p style="text-align:left">배송 메세지: ${dto.get(0).meg}, 결제정보: ${dto.get(0).payment}</p>
                <table class="table">
                    <thead>
                            <tr>
                                <th>상품이미지</th>
                                <th>상품이름</th>
                                <th>상품가격</th>
                                <th>상품수량</th>
                                <th>주문일자</th>
                            </tr>
                    </thead>
                    <tbody>
                      <c:set var="sum" value="0"/>
                      	 <c:forEach var="dto2" items="${dto}" varStatus="status">
                         <c:set var="amount" value="${dto2.gAmount}"/>
                         <c:set var="sum" value="${dto2.gPrice * amount + sum}"/>
						 <%-- <input type="hidden" name="num" value="${dto.num}"> --%>
						 <tr>
                            <td><img src="images/items/${dto2.gImage}.png" width="100" height="100" ></td>
                            <td>${dto2.gName}</td>
                            <td>${dto2.gPrice}원</td>
                            <td>${amount}</td>
                            <td>${dto2.orderDay}</td>
						</tr>
						</c:forEach>
					    <tr>
					      <td></td>
					      <td></td>
					      <td>총합: &nbsp; ${sum}원</td>
					      <td></td>
					      <td></td>
                    </tbody>
                  </table>
                  <p>&nbsp;</p>
             </c:forEach>
              </div>
        </div>
    </div>
