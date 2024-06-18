<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<style type="text/css">
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
 </style>
 	<link rel="stylesheet"  href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
	<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
 <div class="App">
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<jsp:include page="common/menu.jsp" flush="true" />
	<c:if test="${gCategory1 eq '짱구'}">
		<jsp:include page="common/menu01.jsp" flush="true" />
	</c:if>
	<c:if test="${gCategory1 eq '스폰지밥'}">
		<jsp:include page="common/menu02.jsp" flush="true" />
	</c:if>
	<c:if test="${gCategory1 eq '포켓몬스터'}">
		<jsp:include page="common/menu03.jsp" flush="true" />
	</c:if>
	<c:if test="${gCategory1 eq '도라에몽'}">
		<jsp:include page="common/menu04.jsp" flush="true" />
	</c:if>
	<c:if test="${gCategory1 eq '명탐정 코난'}">
		<jsp:include page="common/menu05.jsp" flush="true" />
	</c:if>
	<hr>
	<jsp:include page="goods/goodsList.jsp" flush="true" />
 </div>
</body>
</html>