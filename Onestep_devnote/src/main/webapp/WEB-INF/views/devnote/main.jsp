<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/base.jsp"%>



<%@ include file="/WEB-INF/views/module/header.jsp"%>

<div >
	&nbsp;&nbsp;
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="collapse navbar-collapse" >
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="#">프로젝트 홈</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">피드</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">캘린더</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">파일&nbsp;</a>
		</li>
	</ul>
</div>
</nav>
	
		<div class="dropdown">
			<button class="btn btn-light rounded-circle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" >
				&nbsp;⋮&nbsp;
			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="#">프로젝트 삭제</a></li>
				<li><a class="dropdown-item" href="#">프로젝트 탈퇴</a></li>
				
			</ul>
		</div>
	
	<div class="container-fluid">
		<!-- 본문 -->
		<div class="content">
			<!-- 제목 -->
			<%@ include file="/WEB-INF/views/module/content_top.jsp" %>
			<div class="card-body" style="padding-bottom:-20px;">
				<h3>프로젝트명</h3>
			<hr style="width:90%;  margin-left : auto; margin-right : auto;">
			<!-- 설명 -->
			</div>
			<div class="card-body"> 
				프로젝트 설명
			</div>
		<%@ include file="/WEB-INF/views/module/content_bottom.jsp" %>
		<!-- 참여자 목록 -->
		<%@include file="/WEB-INF/views/module/member.jsp" %>

		</div>		
	</div>
	
<%@ include file="/WEB-INF/views/module/footer.jsp"%>