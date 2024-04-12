<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
</head>
<body>
<section class="container">
	<div class="row mx-auto">
		<div class="bg-secondary col-sm-10" style="height:100%;">
			<h1 style="margin-top:3rem">마이페이지</h1>
			<br><br><br><br><br><br><br><br><br>
		</div>	
		<div class="bg-secondary col-sm-10">
			<a href="/member/detail"><h1 style="font-weight: bolder;">회원 정보</h1></a>
			<br><br><br>
			<a href="/member/list"><h1 style="font-weight: bolder;">회원 목록</h1></a>
		</div>
	</div>
</section>
</body>
</html>