
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("form").on("submit", function(){
			this.action="cartDelete";
			this.method="get";
		});
	});
</script>	
  <div class="TodoApp">
    <div class="container">
    		<form class="row g-3 m-4">
            <div>
                <table class="table">
                    <thead>
                            <tr>
                                <th>전체주문
                                    &nbsp;
                                    <input type="checkbox" name="allCheck" id="allCheck"></th>
                                <th>상품이미지</th>
                                <th>상품정보</th>
                                <th>상품가격</th>
                                <th>상품수량</th>
                                <th>합계</th>
                                <th>날짜</th>
                                <th>Delete</th>
                            </tr>
                    </thead>
                    <tbody>
                      <c:set var="sum" value="0"/>
                      <c:forEach var="dto" items="${cartList}" varStatus="status">
                         <c:set var="amount" value="${dto.gAmount}"/>
                         <c:set var="sum" value="${dto.goodsList[0].gPrice * amount + sum}"/>
						 <input type="hidden" name="num" value="${dto.num}">
						 <tr>
				            <td><input type="checkbox" name="check"  class="check"></td> 
                            <td><img src="images/items/${dto.goodsList[0].gImage}.png" width="50" height="50" ></td>
                            <td>${dto.gCode}</td>
                            <td>${dto.goodsList[0].gPrice}원</td>
                            <td>${amount}</td>
                            <td>${dto.goodsList[0].gPrice * amount}원</td>
                            <td>${dto.gCartDate}</td>
                            <!-- <td> <a href="cartDelete" class="btn btn-warning" >Delete</a> </td> -->
                            <td> <button type="submit" class="btn btn-warning">Delete</button> </td>
						</tr>
				      </c:forEach>
					    <tr>
					      <td></td>
					      <td></td>
					      <td></td>
					      <td>${dto.gSize}</td>
					      <td colspan="3">총합: &nbsp; ${sum}원</td>
					      <td> <button class="btn btn-success">전체삭제</button></td>
					    </tr>
                    </tbody>

                  </table>
              </div>
        	</form>
            <div class="btn btn-success m-5">주문하기</div>
        </div>
    </div>
