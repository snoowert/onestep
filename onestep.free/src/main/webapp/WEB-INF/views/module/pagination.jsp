<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        			

<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
		    <a class="page-link" href="javascript:searchList_go(${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.startPage});">
		        <i class="fas fa-angle-left"></i>
		    </a>						
		</li>
		<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
		<li class="page-item ${pageMaker.page == pageNum?'active':''}">
			<a class="page-link" href="javascript:searchList_go(${pageNum });" >
				${pageNum }
			</a>
		</li>
		</c:forEach>
		
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.next ? pageMaker.endPage+1 :pageMaker.endPage});">
				<i class="fas fa-angle-right" ></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.realEndPage});">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>	
	</ul>
</nav>


  
<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>



<script>
	function searchList_go(page,url){
		//alert("click search btn");
		if(!url) url="main.do";
		
		var jobForm = document.querySelector("form#jobForm");
		jobForm.page.value = page;
		jobForm.perPageNum.value = 10;
		jobForm.searchType.value = document.querySelector("select[name='searchType']").value;
		jobForm.keyword.value = document.querySelector("input[name='keyword']").value;
		
		jobForm.action=url;
		jobForm.submit();
	}
</script>
