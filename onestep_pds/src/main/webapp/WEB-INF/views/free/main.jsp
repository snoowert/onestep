<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/modules/header.jsp" %>
<%@ include file="/WEB-INF/views/base.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>
    <section class="content-header">
    	<div class="row">
    		<div class="w-75 p-3 justify-content-center mx-auto">
	    		<div class="col-sm-12 bg-secondary" style="height:100%; margin-bottom:2rem">
	    		<br>
	  	      		<h1 style="font-size:30px">자유게시판</h1><br>
		      		<h1 style="font-size:20px">자유롭게 이야기 할 수 있는 게시판입니다.</h1>
		      	</div>	
		    </div>  	
      	</div>
    </section>
    
    <section class="content w-75 p-3 mx-auto">
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:450px;">	
					<div class="input-group row">
	
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="t" ${pageMaker.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${pageMaker.searchType eq 'w' ? 'selected':'' }>작성자</option>																		
						</select>	
										
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="search_list(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>						
				</div>			
			</div>
			<div class="card-body">
				<table class="table table-bordered text-center">
					<tr style="font-size:0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:40%;">제 목</th>
						
						<th style="width:15%;">작성자</th>
						<th>작성일자</th>
						<th style="width:10%;">조회수</th>
					</tr>	
					<c:if test="${empty freeList}">
						<td colspan="6">해당내용이 없습니다.</td>
					</c:if>
					<c:forEach items="${ freeList }" var="free">
						<tr style='font-size:0.85em;'>
							<td>${free.freeid }</td>
							<td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden;
										 white-space: nowrap; text-overflow: ellipsis;">
								<a href="detail.do?freeid=${free.freeid }&from=list">
									<span class="col-sm-12 ">${free.freetitle }</span>
								</a>
							</td>
							
							<td>${free.writer }</td>
							<td>
								<fmt:formatDate value="${free.freeregdate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><span class="badge bg-red">${free.freeviewpoint }</span></td>
						</tr>
					</c:forEach>	
				</table>
			</div>
			<div class="card-footer">
					<%@ include file="/WEB-INF/views/modules/pagination.jsp" %>
				</div>
			</div>
			<button type="button" class="btn btn-primary btn float-right" id="registBtn" onclick="location='registForm'">글쓰기</button>
		
	</section>
			



<%@ include file="/WEB-INF/views/modules/footer.jsp" %>
