<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="collapse navbar-collapse" >
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="/devnote/main?projectId=${project.projectId}">프로젝트 홈</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/devnote/feed">피드</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/devnote/calendar">캘린더</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/devnote/pjpds">파일&nbsp;</a>
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