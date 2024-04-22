<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">OneStep</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/free/main">자유게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/qna/main">질문게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/pds/list">자료실</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">개발자노트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">체험관</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <ul class="navbar-nav mr-auto">
    	<sec:authorize access="isAnonymous()">
	    	<li class="nav-item">
	    		<a class="nav-link" href="/member/registSelect">회원가입</a>
	    	</li>
	    	<li class="nav-item">
	    		<a class="nav-link" href="/member/loginForm">로그인</a>
	    	</li>
    	</sec:authorize>
    	<sec:authorize access="isAuthenticated()">
    		<li class="nav-item">
	    		<a class="nav-link" href="/member/mypage">${loginUser.username }</a>
	    	</li>
	    	<li class="nav-item">
	    		<a class="nav-link" href="/member/logout">로그아웃</a>
	    	</li>
    	</sec:authorize>
    </ul>
  </div>
</nav>
<br><br>