<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ include file="/WEB-INF/base.jsp" %>

    <!-- Main content -->
<section class="content container-fluid">
	<div class="row justify-content-center">
		<div class="col-md-9">
			<div class="card card-outline card-info">

				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group col-sm-10">
							<span class="form-control" id="freeTitle" placeholder="제목이다.">${free.freeTitle }</span>							
						</div>&nbsp;&nbsp;&nbsp;
						<div class="row card-tools col-sm-1 justify-content-center">
							<button type="button" id="modifyBtn" class="btn btn-warning" style="width:100px; height:40px" onclick="submit_go('modifyForm.do');">수정</button>						
					    </div>
					    	&nbsp;&nbsp;&nbsp;&nbsp;
					    <div class="row card-tools col-sm-1 justify-content-center">
					    	<button type="button" id="removeBtn" class="btn btn-danger" style="width:100px; height:40px" onclick="submit_go('remove.do');">삭제</button>
				   		</div>
					</div>
					<div class="row">	
						<div class="form-group col-sm-10" >
							<span class="form-control" id="memberId">${free.memberId }</span>
						</div>		
						
						<div class="form-group col-sm-1" >
							<span class="form-control" id="freeRegDate">
								<fmt:formatDate value="${free.freeRegDate }" pattern="yyyy-MM-dd"/>  
							</span>
						
						</div>
						<div class="form-group col-sm-1" >
							<span class="form-control" id="freeViewPoint" >${free.freeViewPoint }</span>
						</div>
					</div>		
					<div class="form-group col-sm-12" style="height:800px; border:10px">
						<div id="freeContent">내용임니다.</div>	
					</div>
					<h4>댓글</h4>
					  <div class="col-md-12">
					      <!-- 원글에 댓글을 작성할 폼 -->
					      <form class="comment-form insert-form" action="comment_insert" method="post">
					         <!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
					         <input type="hidden" name="ref_group" value="${free.freeId }"/>
					         <!-- 원글의 작성자가 댓글의 대상자가 된다. -->
					         <input type="hidden" name="target_id" value="${free.memberId }"/>
					   
					         <textarea name="content" style="width:100%">${empty memberId ? '댓글 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
					         <div class="float-right">
					         	<button type="submit">등록</button>
					         </div>
					      </form>
					      <br>
					      <br>
					    


				            <c:if test="${tmp.num ne tmp.comment_group }">
				                <li id="reli${tmp.num }" style="padding-left:50px;">    
				            </c:if>
				            <form id="reForm${tmp.num }" action="comment_insert" method="post">
				            <input type="hidden" name="ref_group" value="${dto.num }"/>
				            <input type="hidden" name="target_id" value="${tmp.writer }"/>
				        <!-- 댓글의 댓글은 글번호도 같이 들어갈 수 있게 한다 -->
				            <input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
				            <textarea name="content" style="width:100%"></textarea>
				             <div class="float-right">
					         	<button type="submit">등록</button>
					         </div>
						      <div class="row">
					            <c:if test="${sessionScope.id eq dto.writer }">
							         <div class="row card-tools col-sm-2 justify-content-center">
										<button type="button" id="modifyBtn" class="btn btn-warning" style="width:100px; height:40px" onclick="submit_go('modifyForm.do');">수정</button>						
								    </div>
								    	&nbsp;&nbsp;&nbsp;
								    <div class="row card-tools col-sm-2 justify-content-center">
								    	<button type="button" id="removeBtn" class="btn btn-danger" style="width:100px; height:40px" onclick="submit_go('remove.do');">삭제</button>
							   		</div>
								</c:if>
							</div>

				         </form>
				        </div>
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
	</section>
  <!-- /.content -->
<!-- REQUIRED SCRIPTS -->
<form role="form">
	<input type="hidden" name="freeId" value="${free.Id }" />
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
function deleteConfirm(){
    const isDelete=confirm("이 글을 삭제 하겠습니까?");
    if(isDelete){
       location.href="delete?num=${dto.num}";
    }
 }
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>