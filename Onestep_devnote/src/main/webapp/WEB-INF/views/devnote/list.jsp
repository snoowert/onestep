<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/module/base.jsp"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
	<div class="container-fluid">
		<!-- 상단박스 -->
		<div class="card" style="width: 80%; margin: 40px; margin-left: auto; margin-right: auto;">
			<div class="card-body" style="margin: 30px;">
				<h3 class="card-title">개발자노트</h3>
				<br/>
				<p class="card-text">개발자들이 프로젝트를 ...</p>
			</div>
		</div>

		<section class="content">
			<div class="card" style="margin: 50px; padding: 80px">
				<div id="keyword" class="card-tools" style="width: 450px;">
					<div class="input-group row">
						<select class="form-control col-md-3">
							<option>제목</option>
						</select> &nbsp;&nbsp; <input class="form-control" type="text"
							placeholder="검색어를 입력하시오" /> &nbsp;&nbsp;
						<button class="btn btn-primary" type="button" id="searchBtn"
							data-card-widget="search" onclick="">
							<i class="fa fa-fw fa-search"></i>
						</button>

					</div>

				</div>
				<div>
					<button type="button" class="btn btn-secondary" style="float:right;" onclick="location='registProject'">새 프로젝트</button>
				</div>


				<div style="margin: 40px; margin-left: 1px; margin-right: 100px;">
					<!-- 프로젝트 목록-->
					<c:forEach var="project" items="${projectList }">
						<div class="card"
							style="width: 200px; height:140px; float: left; margin-right: 50px;">
							<div class="card-body">
								<h5 class="card-title" style="font-size: 20px;">${project.projectName }</h5>
								<h5 class="card-subtitle">${project.projectDesc }</h5>
							</div>
						</div>
					</c:forEach>
				</div> 
			</div>
		</section>
	</div>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>