<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Checkout example · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/checkout/">

    <!-- Bootstrap core CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu&family=Gamja+Flower&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      *{font-family: "Gaegu", sans-serif;
  font-weight: 400;
  font-style: normal;
  font-size:21px; }
   p{font-weight:700; font-size:35px; !important;}
   
   .needs-validation{
   }
   .btn-order:hover{
	color:white;
	}
	.btn-order{
	
	border:none;
	border-radius: 12px;
	border:none;
	width: 200px;
    height: 50px;}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
<div class="container">
<jsp:include page="common/top.jsp" flush="true" /><br>
  <main>
    <div class="py-5 text-center">
      <h2>주문 상세</h2>
    </div>
<div>
<form class="needs-validation" action="orderAdd" method="get">
    <div class="row g-5">
      <div class="">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">주문 상품</span>
          <span class="badge bg-primary rounded-pill">${checkLen}</span>
        </h4>
        <input type="hidden" name="orderNum" value="${orderNum}">
        <c:set var="sum" value="0"/>
        <c:forEach var="dto" items="${cartList}" varStatus="status">
        <c:set var="sum" value="${dto.goodsList[0].gPrice * dto.gAmount + sum}"/>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">상품 이름</h6>
            </div>
            <span class="text-muted">${dto.goodsList[0].gName}</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">상품 이미지</h6>
            </div>
            <span class="text-muted"><img src="images/items/${dto.goodsList[0].gImage}.png" width="100" height="100" ></span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">상품 가격</h6>
            </div>
            <span class="text-muted">${dto.goodsList[0].gPrice}원</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div>
              <h6 class="my-0">상품 수량</h6>
            </div>
            <span class="text-success">${dto.gAmount}</span>
          </li>
          </ul>
        </c:forEach>
          <ul class="list-group-item d-flex justify-content-between">
            <span>Total (USD)</span>
            <strong>${sum}</strong>
            <input type="hidden" name="total" value="${sum}">
          </ul>
        

      </div>
      <div class="">
        <h4 class="mb-3">주문 정보</h4>
        <!--  원래 form 자리-->
          <div class="row g-3">
          <!-- 주문자명 -->
            <div class="col-sm-6">
              <label for="firstName" class="form-label">주문자명</label>
              <input type="text" class="form-control" id="firstName" value="${login.username}" disabled>
            </div>

			<!-- 전화번호 -->
            <div class="col-12">
              <label for="username" class="form-label">전화번호</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="phone">
                <%-- <input type="text" class="form-control" value="${login.phone2}" disabled>
                <input type="text" class="form-control" value="${login.phone2}" disabled> --%>
              </div>
            </div>

			<!-- 주소 -->
            <div class="col-12">
              <label for="address" class="form-label">Address</label>
              <input type="text" name="post" class="form-control" id="sample4_postcode" value="${login.post}">
              <button type="button" class=" btn-post" onclick="sample4_execDaumPostcode()" style="background-color:#BCF2F5;">우편번호 찾기</button>
              <input type="text"  name="addr1" class="form-control" name="addr1" id="sample4_roadAddress" value="${login.addr1}">
              <input type="text" name="addr2" class="form-control" id="sample4_jibunAddress" value="${login.addr2}">
              
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

			<!-- 배송 메세지 -->
            <div class="col-12">
              <label for="address" class="form-label">배송 메세지</label>
              <input type="text" class="form-control" name="meg" placeholder="배송 메세지" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">결제 정보</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" value="신용/체크카드" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용/체크카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" value="계좌이체" class="form-check-input" required>
              <label class="form-check-label" for="debit">계좌이체</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" value="무통장 입급" class="form-check-input" required>
              <label class="form-check-label" for="paypal">무통장 입급</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" value="휴대폰 결제" class="form-check-input" required>
              <label class="form-check-label" for="paypal">휴대폰 결제</label>
            </div>
          </div>
          </div>

          <hr class="my-4">

          <button class="btn-order btn-primary m-4" type="submit" >주문하기</button>
        </form>
      </div>
    </div>
  </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="form-validation.js"></script>
  </body>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</html>
