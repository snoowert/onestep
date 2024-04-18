<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/base.jsp" %>
</head>
<body>
<section class="container">
<div class="col-sm-10 mx-auto">
	<h3>로그인</h3>
	<form action="<sec:authorize url='/login' />" method="POST">
        <label for="username">이메일</label>
        <input type="text" id="email" name="email" required><br>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" required><br>
        <button type="button" onclick="location('/member/registForm')">회원가입</button>
        <button type="submit">로그인</button>
    </form>
    <!-- 로그인 실패 시 에러 메시지 표시 -->
    <c:if test="${param.error != null}">
        <p style="color: red;">아이디 또는 비밀번호가 맞지 않습니다.</p>
    </c:if>
</div>

</section>
</body>
</html>