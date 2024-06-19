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

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">주문 상품</span>
          <span class="badge bg-primary rounded-pill">${checkLen}</span>
        </h4>
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
          </ul>
        

      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">주문 정보</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
          <!-- 주문자명 -->
            <div class="col-sm-6">
              <label for="firstName" class="form-label">주문자명</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
            </div>

			<!-- 전화번호 -->
            <div class="col-12">
              <label for="username" class="form-label">전화번호</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="Username" required>
              </div>
            </div>

			<!-- 주소 -->
            <div class="col-12">
              <label for="address" class="form-label">Address</label>
              <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

			<!-- 배송 메세지 -->
            <div class="col-12">
              <label for="address" class="form-label">배송 메세지</label>
              <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">결제 정보</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용/체크카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">계좌이체</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">무통장 입급</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">휴대폰 결제</label>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">주문하기</button>
        </form>
      </div>
    </div>
  </main>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
  </body>
</html>
