<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/base.jsp"%>



<%@ include file="/WEB-INF/views/module/header.jsp"%>

<div >
	&nbsp;&nbsp;
</div>
<%@ include file="/WEB-INF/views/module/base_detail.jsp" %>
	
	<div class="container-fluid">
		<!-- 본문 -->
		<div class="content">
			<!-- 제목 -->
			<%@ include file="/WEB-INF/views/module/content_top.jsp" %>
			<div class="card-body" style="padding-bottom:-20px;">
				<h3>프로젝트명</h3>
			</div>
			<hr style="width:90%;  margin-left : auto; margin-right : auto;">
			<!-- 설명 -->
			<div class="card-body"> 
				프로젝트 설명
			</div>
		<%@ include file="/WEB-INF/views/module/content_bottom.jsp" %>
		<!-- 참여자 목록 -->
		<%@include file="/WEB-INF/views/module/member.jsp" %>

		</div>		
	</div>
	
<%@ include file="/WEB-INF/views/module/footer.jsp"%>