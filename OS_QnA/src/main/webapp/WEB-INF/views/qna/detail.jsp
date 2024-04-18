<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${from eq 'remove' }">
	<script>
		alert("${param.qnaid} 번 글이 삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
</c:if>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<section class="content-header">
  	<div class="container-fluid">
  		<div class="row md-2">
  			<div class="col-sm-6">
  				<h1>상세보기</h1>  				
  			</div>
  			<div class="col-sm-6">
  				<ol class="breadcrumb float-sm-right">
		        <li class="breadcrumb-item">
		        	<a href="list.do">
			        	<i class="fa fa-dashboard"></i>QnA
			        </a>
		        </li>
		        <li class="breadcrumb-item active">
		        	상세보기
		        </li>		        
    	  </ol>
  			</div>
  		</div>
  	</div>
</section>
 
  
    <!-- Main content -->
<section class="content container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">상세보기</h3>
					<div class="card-tools">
						<button type="button" id="modifyBtn" class="btn btn-warning" onclick="submit_go('modifyForm.do');">수정하기</button>						
					    <button type="button" id="removeBtn" class="btn btn-danger" onclick="submit_go('remove.do');">삭 제</button>
					    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">닫 기</button>
				    </div>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group col-sm-12">
							<label for="qnatitle">제 목</label>
							<span class="form-control" id="qnatitle">${qna.qnatitle }</span>							
						</div>
					</div>
					<div class="row">	
						<div class="form-group col-sm-4" >
							<label for="writer">작성자</label>
							<span class="form-control" id="writer">${qna.memberid }</span>
						</div>		
						
						<div class="form-group col-sm-4" >
							<label for="qnaregdate">작성일</label>
							<span class="form-control" id="qnaregdate">
								<fmt:formatDate value="${qna.qnaregdate }" pattern="yyyy-MM-dd"/>  
							</span>
						
						</div>
						<div class="form-group col-sm-4" >
							<label for="qnaviewcnt">조회수</label>
							<span class="form-control" id="viewcnt" >${qna.qnaviewcnt }</span>
						</div>
					</div>		
					<div class="form-group col-sm-12">
						<label for="content">내 용</label>
						<div id="content">${qna.qnacontent }</div>	
					</div>
				</div>													
			</div><!-- end card -->				
		</div><!-- end col-md-12 -->
	</div><!-- end row  -->
</section>
  <!-- /.content -->
<!-- REQUIRED SCRIPTS -->
<form role="form">
	<input type="hidden" name="qnaid" value="${qna.qnaid }" />
</form>



<script>
var formObj = document.querySelector("form[role='form']");

function submit_go(url){
	if(url=="remove.do" && !confirm("정말로 삭제하시겠습까?")){
		return;
	}
	formObj.action=url;
	formObj.submit();
}
</script>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>
