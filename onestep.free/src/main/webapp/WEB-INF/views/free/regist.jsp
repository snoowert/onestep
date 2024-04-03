<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ include file="/WEB-INF/base.jsp" %>

  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info">

					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group">
								<input type="text" id="title"  title="제목"
									name='title' class="form-control notNull" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<input type="text" id="writer" title="작성자" readonly
									name="writer" class="form-control notNull" value="${loginUser }" >
							</div>
							<div class="form-group">
								<textarea class="textarea" name="content" id="content" rows="20" style="width:100%"
									cols="90" placeholder="내용을 입력해주세요." ></textarea>
							</div>
							<input type="file" class="real-upload" accept="image/*" required multiple>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">


					</div><!--end card-footer  -->
						<div class ="card-tools">
							<button type="button" class="btn btn-primary btn float-right" id="registBtn" onclick="regist_go();">등 록</button>
						</div>
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>



<script>
	function regist_go(){
		var form = document.registForm;
		
		var inputNotNull = document.querySelectorAll("input.notNull");
		for(var input of inputNotNull){
			if(!input.value){
				alert(input.getAttribute("title")+"은 필수입니다.");
				input.focus();
				return;
			}
		}
		
		form.action="regist.do";
		form.method="post";
		form.submit();
		
	}
	
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>
