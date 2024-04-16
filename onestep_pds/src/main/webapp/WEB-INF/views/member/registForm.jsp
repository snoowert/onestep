<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
</head>
<body>
<section class="container">
	<dev class="container-fluid col-sm-10">
		<form class="mb-3" name="memberform" id="memberform" action="/member/regist" method="POST">
			<label class="form-label">사용자명</label>
			<input id="username" name="username" type="text" class="form-control" placeholder="사용자명">
			<br>
			<input type="hidden" id="authority" name="authority" value="${authority }">
			
			<label class="form-label">이메일</label>
			<input id="email" name="email" type="text" class="form-control" placeholder="이메일">
			<br>	
			<label class="form-label">비밀번호</label>
			<input id="password" name="password" type="password" class="form-control" placeholder="8자 이상 입력해주세요.">
			<br>
			<label class="form-label">비밀번호 확인</label>
			<input id="password" name="re-password" type="password" class="form-control" placeholder="비밀번호 재입력">
			<br>
			
			<br>
			<input type="button" class="btn btn-primary" value="등록" onclick="regist_go()">&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="취소" onclick="history.go(-1)">
		</form>
	</dev>
</section>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var url = '/pds/regist';
	function regist_go(){
		var form = $('form[name="memberform"]');
		
		if(!$('input[name="username"]').val()){
		    alert("사용자명은 필수입니다.");
		    $('input[name="username"]').focus();
		    return;
		}
		if($('input[name="username"]').val().length > 50){
			alert("사용자명은 50자 이내로 작성해주세요.");
			return;
		}
		if(!$('input[name="email"]').val()){
			   alert("이메일은 필수입니다.");
			   return;
			}
		if(!EmailCheck($('input[name="email"]').val())){
			alert("이메일 형식으로 작성해주세요.");
			return;
		}
		if(!$('input[name="password"]').val()){
			   alert("패스워드는 필수입니다.");
			   return;
		    }
		if($('input[name="password"]').val().length<8){
			alert("비밀번호는 8자이상 입력해주세요.");
			return;
		}
		if(!PasswordCheck()){
			alert("비밀번호가 일치하지않습니다.\n다시 확인해주세요.");
			return;
		}
		form.submit();
	}
	
	function EmailCheck(email) {
	    // 이메일 형식을 검증하는 정규 표현식
	    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    return emailRegex.test(email);
	}
	
	function PasswordCheck(){
		var pw = $('input[name="password"]').val();
		var cpw = $('input[name="re-password"]').val();
		
		if(pw == cpw){
			return true;
		}else{
			return false;
		}
	}
</script>
</html>