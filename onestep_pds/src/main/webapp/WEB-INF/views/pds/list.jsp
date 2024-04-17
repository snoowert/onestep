<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
</head>
<body>
<section class="container">
	<div class="row mx-auto">
		<div class="bg-secondary col-sm-10" style="height:100%;">
			<h1 style="margin-top:3rem">자료실</h1>
			<p>개발자에게 필요한 자료를 다운받을 수 있는 게시판입니다.</p>
		</div>	
	</div>
	<br>
	<div class="row mx-auto">
		<div class="col-md-10 ">
			<form action="" role="form">
				<div class="input-group">
					<select style="width:120px"  name="searchType">
						<option value="t" ${pageMaker.searchType eq 't' ? 'selected':'' }>제목</option>
						<option value="c" ${pageMaker.searchType eq 'c' ? 'selected':'' }>내용</option>
						<option value="tc" ${pageMaker.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
					</select>
					<input type="search" class="form-control form-control-lg" placeholder="검색어" name="keyword">
					<div class="input-group-append">
						<button type="submit" class="btn btn-lg btn-default" onclick="search_list(1);">
						<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row mx-auto">
		<div class="card-body col-sm-10">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="col-sm-1">번호</th>
						<th class="col-sm-4">제목</th>
						<th class="col-sm-3">작성자</th>
						<th class="col-sm-3">작성일자</th>
						<th class="col-sm-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty pdsList}">
						<td colspan="5">자료가 존재하지 않습니다.</td>
					</c:if>
					<c:forEach var="pds" items="${pdsList}">
					<tr>
						<td>${pds.pdsid}</td>
						<td><a href="/pds/detail?pdsid=${pds.pdsid}&from=list">${pds.pdstitle }'</a></td>
						<td>${pds.writer }</td>
						<td><fmt:formatDate pattern="yyyy.MM.dd" value="${pds.pdsregdate}"/></td>
						<td>${pds.pdsviewpoint }</td>
					<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<nav aria-label="Navigation" class="row col-sm-10">
		<ul class="pagination justify-content-center my-2" style="width:80%; margin-left: 5rem">
			<li class="page-item">
				<a class="page-link" href="javascript:search_list(1);">
					<i class="fas fa-angle-double-left"></i>
				</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="javascript:search_list(${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.page});">
					<i class="fas fa-angle-left"></i>
				</a>						
			</li>
			<c:forEach var="pageNum" begin="${pageMaker.startPage }" 
									 end="${pageMaker.endPage }" >
			<li class="page-item ${pageMaker.page == pageNum?'active':''}">
				<a class="page-link" href="javascript:search_list(${pageNum });">
					${pageNum }
				</a>
			</li>
			</c:forEach>
				
			<li class="page-item">
				<a class="page-link" href="javascript:search_list(${pageMaker.next ? pageMaker.endPage+1 :pageMaker.page});">
					<i class="fas fa-angle-right"></i>
				</a>						
			</li>	
			<li class="page-item">
				<a class="page-link" href="javascript:search_list(${pageMaker.realEndPage});">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</li>
		</ul>
		<input type="button"style="WIDTH: 70pt; HEIGHT: 30pt" class="btn btn-primary linkBtn my-2" value="자료 등록" onclick="location='registForm'"/>
		
	</nav>  
</section>
<%@ include file="/WEB-INF/views/modules/pagination.jsp" %>
</body>
</html>