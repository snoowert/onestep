<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/base.jsp"%>



<%@ include file="/WEB-INF/views/module/header.jsp"%>

<div >
	&nbsp;&nbsp;
</div>

<%@ include file="/WEB-INF/views/module/subbar.jsp" %>
	
	<div class="container-fluid">
		<!-- 본문 -->
		<div class="content">
			<!-- 제목 -->
			<%@ include file="/WEB-INF/views/module/content_top.jsp" %>
			<div class="card-body" style="padding-bottom:-20px;">
				<h2 class="card-title">${project.projectName }</h2>
			<hr style="width:90%;  margin-left : auto; margin-right : auto;">
			<!-- 설명 -->
			</div>
			<div class="card-body"> 
				<h5 class="card-subtitle">${project.projectDescription }</h5>
			</div>
			<div>
				<div>
				
				<button type="button" class="btn btn-primary" onclick="OpenWindow('modifyProject?projectId=${project.projectId}', '프로젝트 정보 수정', 700, 500);">수정</button>
				</div>
			
			</div>
	</div>
</div>
			
		<%@ include file="/WEB-INF/views/module/content_bottom.jsp" %>
		<!-- 참여자 목록 -->
		<%@include file="/WEB-INF/views/module/member.jsp" %>



<%@ include file="/WEB-INF/views/module/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script>
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth
								+",height="+ WinHeight +", top="+ wintop +", left=" 
								+ winleft +", resizable=yes, status=yes"  );
		win.focus() ; 
	}


	function modify_submit() {
		
		if($("input[name='projectName']").val()==""){
			alert("이름은 비워둘 수 없습니다.");
			$("input[name='projectName']").focus();
			return;
		}
		
		if($("input[name='projectDescription']").val()=="") {
			alert("상세설명은 필수입니다.");
			$("input[name='projectDescription']").focus();
			return;
		}
		
		document.querySelector("#form[role='form']").submit();
		
		
	}
	
	
</script>