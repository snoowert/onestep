<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ include file="/WEB-INF/base.jsp" %>

  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info">
				
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm" onsubmit="return false;">
							<input type="hidden" name="freeId" value="${free.freeId }" />
							<div class="form-group">
								<label for="freeTitle">제 목</label> 
								<input type="text" id="freeTitle" name='freeTitle' class="form-control" value="${free.freeTitle }">
							</div>
							<div class="form-group">
								<label for="memberId">작성자</label> 
								<input type="text" id="memverId" readonly	name="memberId" class="form-control"  value="${free.memberId }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>		
								<textarea class="form-control" name="content" id="content" rows="20"
									placeholder="내용을 수정하세요">${free.freeContent }</textarea>						
							</div>
							<input type="file" class="real-upload" accept="image/*" required multiple>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none"></div>
				</div><!-- end card -->		
							<div class="float-right">
								<button type="button" class="btn btn-warning " id="modifyBtn" onclick="modify_submit();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn" onclick="history.go(-1);">취 소</button>
							</div>		
			</div><!-- end col-md-12 -->

		</div><!-- end row -->
    </section>
    <!-- /.content -->

<script>
function modify_submit(){
	//alert("click modify btn");
	document.querySelector("form[role='form']").submit();	
}

</script>


<%@ include file="/WEB-INF/views/module/footer.jsp" %>