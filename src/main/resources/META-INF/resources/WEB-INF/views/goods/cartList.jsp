
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

	function submit2(frm) { 
	    frm.action='cartDeleteAll'; 
	    frm.submit(); 
	    return true; 
	  } 
	
	function submit3(frm) { 
	    frm.action='order'; 
	    frm.submit(); 
	    return true; 
	  } 
	
	function Check(){
		var check = document.querySelector("#allCheck").checked;
		var chk_list = document.querySelectorAll(".check");
		chk_list.forEach(function(v){
            v.checked = check;
        });
	}
	
</script>	
  <div class="TodoApp">
    <div class="container">
    	<form class="row g-3 m-4" method="get" action="cartDelete">
            <div>
                <table class="table">
                    <thead>
                            <tr>
                                <th>전체주문
                                    &nbsp;
                                    <input type="checkbox" onclick="Check()" name="allCheck" id="allCheck"></th>
                                <th>상품이미지</th>
                                <th>상품이름</th>
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
                            <td><img src="images/items/${dto.goodsList[0].gImage}.png" width="100" height="100" ></td>
                            <td>${dto.goodsList[0].gName}</td>
                            <td>${dto.goodsList[0].gPrice}원</td>
                            <td>${amount}</td>
                            <td>${dto.goodsList[0].gPrice * amount}원</td>
                            <td>${dto.gCartDate}</td>
                            <!-- <td> <a href="cartDelete" class="btn btn-warning" >Delete</a> </td> -->
                            <td><button type="submit" class="btn btn-warning" id="delete">Delete</button> </td>
						</tr>
				      </c:forEach>
					    <tr>
					      <td></td>
					      <td></td>
					      <td></td>
					      <td>${dto.gSize}</td>
					      <td colspan="3">총합: &nbsp; ${sum}원</td>
					      <td><button type="button" class="btn btn-success" onclick="return submit2(this.form);">전체삭제</button></td>
					    </tr>
                    </tbody>

                  </table>
              </div>
            <div><button type="button" class="btn btn-success" onclick="return submit3(this.form);">주문하기</button></div>
        	</form>
        </div>
    </div>
