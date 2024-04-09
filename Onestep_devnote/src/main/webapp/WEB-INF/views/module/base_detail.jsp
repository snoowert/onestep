<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  	
<style>
	.btn {
		font-size:20px; 
	}
	
</style>

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
	
		<div class="dropdown">
			<button class="btn btn-light rounded-circle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" >
				&nbsp;⋮&nbsp;
			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="#">프로젝트 삭제</a></li>
				<li><a class="dropdown-item" href="#">프로젝트 탈퇴</a></li>
				
			</ul>
		</div>


</div>
</nav>