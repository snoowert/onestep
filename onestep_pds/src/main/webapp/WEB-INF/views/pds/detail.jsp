<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
</head>
<body>
<section class="container">
	<dev class="container-fluid col-sm-10">
		<div class="mb-3">
			<h3>제목</h3>
			<hr>
			<div class="row">
				<p class="col-sm-5">작성자</p>
				<p class="col-sm-3">조회수  0</p>
				<p class="col-sm-2">작성일자  2024.04.02</p>
			</div>
			<hr>
			<div class="row">
			&nbsp;&nbsp;<label class="form-label">파일</label>
			</div>		
			<ul>
				<div class="row">
					<li>11</li>&nbsp;
					<a href="">x</a>
				</div>
			</ul>
			<br>
			<textarea  id="content" class="form-control" rows="5" readonly style="resize:none;"> 자료 내용</textarea>
			<br>
			<input type="submit" class="btn btn-primary mx-auto" value="수정">
			<input type="button" class="btn btn-default mx-auto" value="취소">
		</div>
	</dev>
</section>
</body>
</html>
</body>
</html>