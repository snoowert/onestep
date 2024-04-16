<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
</head>
<body>
<section class="container">
<div class="col-sm-10">
	<div>
		<h3>현재 비밀번호 입력</h3>
	</div>
	<br>
	<div>
		<form name="checkForm" action="/member/PWCheck" method="POST">
			<input type="password" id="password" name="password" placeholder="현재 비밀번호 입력" class="form-control">
		</form>
	</div>
	<br>
	<div class="row">
		<button class="btn btn-primary col-sm-5 mx-auto" onclick="onCheck();">확인</button>
		<button class="btn btn-default col-sm-5 mx-auto" onclick="">취소</button>
	</div>
</div>
</section>
</body>
<script>
	function onCheck(){
		form = $("form[name='checkForm']");
		
		if(!$("input[name='password']").val()){
			alert("현재 비밀번호를 입력해주세요.");
			return;
		}
		
		form.submit();
	}
</script>
</html>