<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <header class="border-bottom border-light border-5">
	 <div class="container">
	     <div class="row">
	         <nav class="navbar navbar-expand-lg">
	             <div class="collapse navbar-collapse">
	                 <ul class="navbar-nav">
	                     <li class="nav-item">
	                        <p> <a class="nav-link" href="main">말괄량이캐릭터굿즈샵</a></p>
		                 </li>
	                 </ul>
	             </div>
	             <nav class="navbar navbar-expand-lg bg-body-tertiary">
  
	             <!-- 로그인 안된 상태 -->
	             <!--  session.getAttribute("login")값이 null인 경우 -->
	             <%-- <c:if test="${empty login}"> --%>
	             <sec:authorize access="isAnonymous()">
	              <ul class="navbar-nav">
	                  <li class="nav-item">
	                     <a class="nav-link" href="login">Login</a>
	                  </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="signup">signup</a>
	                  </li>
	              </ul>
	              </sec:authorize>
	             <%-- </c:if> --%>
	             
	             <!--  로그인 된 상태 -->
	             <!--  session.getAttribute("login")값이 null이 아닌 경우 -->
	             <%-- <c:if test="${!empty login}"> --%>
	             <sec:authorize access="isAuthenticated()">
	              <ul class="navbar-nav">
	                  <li class="nav-item">
	                     <a class="nav-link" href="logout">logout</a>
	                  </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="mypage">mypage</a>
	                  </li>
	                  <li class="nav-item">
	                     <a class="nav-link" href="cartList">cartList</a>
	                  </li>
	                  <li class="nav-item">
	                     <a class="nav-link" href="orderHistory">orderHistory</a>
	                  </li>
	              </ul>
	              </sec:authorize>
	             <%-- </c:if> --%>
	         </nav>
	     </div>
	 </div>
</header>