<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery 설치 -->
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	
		$("#up").on("click", function(){
			
			 var gAmount = Number.parseInt(  $("#gAmount").val() );
			 $("#gAmount").val(gAmount+1);
		});

		$("#down").on("click", function(){
			var gAmount = Number.parseInt(  $("#gAmount").val() );
			if(gAmount==1){
				$("#gAmount").val(1);
			}else{
				$("#gAmount").val(gAmount-1);
			}
		});
		
		
		$("form").on("submit", function(){
			alert("cartAdd submit");
			this.action="cartAdd";
			this.method="get";
		});
		
		
		
		
	});// ready()
</script>
<div class="container">
	<form class="row g-3 m-4">
	 <input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
	  <div class="row">    
		<div class="card" style="width:25rem;">
		  <img src="images/items/${goodsRetrieve.gImage}.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h6 class="card-title">
		        <span class="fw-bold">제품코드:</span>  
		        ${goodsRetrieve.gCode}</h6>
		    <h6 class="card-text">
		      <span class="fw-bold ">상품명:</span>
		       ${goodsRetrieve.gName}</h6>
		    <h6 class="card-text">
		      <span class="fw-bold ">가격:</span>
		       ${goodsRetrieve.gPrice}원</h6>
			 
			      <span class="fw-bold ">주문수량:</span>
			      <input type="text" name="gAmount" value="1" id="gAmount">
			      <img src="images/up.PNG" id="up"> 
			      <img src="images/down.PNG" id="down">
		     
		      </h6>
		    <a href="#" class="btn btn-primary mt-3">구매</a>
		    <button type="submit" class="btn btn-primary mt-3">장바구니</button>
		  </div>
		</div>
	   
	  </div>
	</form>
</div>