<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/module/base.jsp"%>


<%@ include file="/WEB-INF/views/module/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<style>

</style>
<!-- 상세상단바 -->
<div>&nbsp;&nbsp;</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">프로젝트 홈</a></li>
			<li class="nav-item "><a class="nav-link" href="#">피드</a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="#">캘린더</a></li>
			<li class="nav-item"><a class="nav-link" href="#">파일&nbsp;</a></li>
		</ul>
		<div class="dropdown">
			<button class="btn btn-light rounded-circle" type="button"
				data-bs-toggle="dropdown" aria-expanded="false">
				&nbsp;⋮&nbsp;</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<a class="dropdown-item" href="#">프로젝트 삭제</a> <a
					class="dropdown-item" href="#">프로젝트 탈퇴</a>
			</div>
		</div>
	</div>
</nav>
<!-- 상세상단바 끝 -->
<div class="container-fluid">

	<div id="calendar" style="width:70%; float:left;">
	
	</div>

	<div>
		<%@include file="/WEB-INF/views/module/member.jsp" %>	
	</div>





</div>









<%@ include file="/WEB-INF/views/module/footer.jsp"%>



<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
	});
	calendar.render();
});
</script>