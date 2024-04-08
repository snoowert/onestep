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
							<input type="hidden" name="freeid" value="${free.freeid }" />
							<div class="form-group">
								<label for="freeTitle">제 목</label> 
								<input type="text" id="freetitle" name='freetitle' class="form-control" value="${free.freetitle }">
							</div>
							<div class="form-group">
								<label for="memberid">작성자</label> 
								<input type="text" id="memberid" readonly	name="memberid" class="form-control"  value="${free.memberid }">
							</div>
							<div class="form-group">
								<label for="freecontent">내 용</label>		
								<textarea class="form-control" name="freecontent" id="freecontent" rows="20"
									placeholder="내용을 수정하세요">${free.freecontent }</textarea>						
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
	document.querySelector("form[role='form']").submit();	
}

</script>


<%@ include file="/WEB-INF/views/module/footer.jsp" %>