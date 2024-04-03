<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/base.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OneStep</title>
<style>
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 상단박스 -->
		<div class="card" style="width: 80%; margin: 40px; margin-left: auto; margin-right: auto;">
			<div class="card-body" style="margin: 30px;">
				<h3 class="card-title">개발자노트</h3>
				<br />
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
					<button type="button" class="btn btn-secondary" style="float:right;">새 프로젝트</button>
				</div>



				<div style="margin: 40px; margin-left: 1px; margin-right: 100px;">
					<!-- 프로젝트 목록-->
					<div class="card"
						style="width: 230px; float: left; margin-right: 50px;">
						<img src="" class="card-img-top" alt="썸네일" />
						<div class="card-body">
							<h5 class="card-title" style="font-size: 20px;">프로젝트 제목</h5>
							<p class="card-text">프로젝트 설명</p>
						</div>
					</div>
					<div class="card"
						style="width: 230px; float: left; margin-right: 50px;">
						<img src="" class="card-img-top" alt="썸네일" />
						<div class="card-body">
							<h5 class="card-title" style="font-size: 20px;">프로젝트 제목</h5>
							<p class="card-text">프로젝트 설명</p>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>


</body>
</html>