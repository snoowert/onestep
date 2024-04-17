<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
	<div class="card">
		<div
			style="position: relative;
				   width: 800px; height: 200px;
				   margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px;
				   background-color: gainsboro; border-radius: 40px 40px 40px 40px;">
			<div class="col-sm-6"
				style="position: absolute; top: 50%; transform: translate(0, -50%); ">
				<br>
				<h1>질문 게시판</h1> <h3>개발 관련 질문을 자유롭게</h3><br>
			</div>
		</div>



		<section class="content">
			<div class="card">
				<div class="card-header with-border">
					<button type="button" class="btn btn-primary"
						onclick="location='regist'">질문 작성</button>
					<div id="keyword" class="card-tools" style="width: 550px;">
						<div class="input-group row">
							<!-- search bar -->
							<select class="form-control col-md-3" name="searchType"
								id="searchType">
								<option value="">검색구분</option>
								<option value="t"
									${pageMaker.searchType eq 't' ? 'selected':'' }>제목</option>
								<option value="c"
									${pageMaker.searchType eq 'c' ? 'selected':'' }>내용</option>	
							</select>
							<!-- keyword -->
							<input class="form-control" type="text" name="keyword"
								placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" /> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button"
									onclick="search_list(1);" id="searchBtn"
									data-card-widget="search">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
							<!-- end : search bar -->
						</div>
					</div>
				</div>
				<div class="card-body" style="text-align: center;">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered">
								<tr>
									<th>글 번호</th>
									<th>글 제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<!-- yyyy-MM-dd  -->
								</tr>
							</table>
						</div>
						<!-- col-sm-12 -->
					</div>
					<!-- row -->
				</div>
				<!-- card-body -->
			</div>
		</section>

	</div>
</div>
<!-- ./wrapper -->




<%@ include file="/WEB-INF/views/module/footer.jsp"%>
