<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu&family=Gamja+Flower&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style type="text/css">
*{ 
  font-family: "Gaegu", sans-serif;
  font-weight: 400;
  font-style: normal;
  font-size: 21px;
 }
 p{font-weight:700; font-size:35px; !important;}
    .App {
	  text-align: center;
	  font-size: 16px;
	}
	
    label, input, button {
    margin: 10px;
    padding: 5px;
    }

	footer {
	    bottom: 0;
	    position: absolute;
	    width: 90%;
	    height: 40px;
	}
	.btn-delete:hover{
	color:white;
	}
	.btn-delete{
	
	border-radius: 12px;
	border:none;
	width: 100px;
    height: 50px;
	}
	.btn-order:hover{
	color:white;
	}
	.btn-order{
	
	border:none;
	border-radius: 12px;
	border:none;
	width: 100px;
    height: 50px;}
	
	
 </style>
<link rel="stylesheet"  href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
 <div class="App">
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<jsp:include page="common/menu.jsp" flush="true" />
	<hr>
	<jsp:include page="goods/cartList.jsp" flush="true" />
 </div>
</body>
</html>