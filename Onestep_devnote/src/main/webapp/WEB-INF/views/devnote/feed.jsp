<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/module/base.jsp"%>


<%@ include file="/WEB-INF/views/module/header.jsp"%>

<style>
.form-control[readonly] {
	  color: transperate;
  	  opacity: 1;
}
</style>


	<div>&nbsp;&nbsp;</div>
	<%@ include file="/WEB-INF/views/module/base_detail.jsp"%>
	<div class="container-fluid"> 
		<!-- 본문 -->
		<%@ include file="/WEB-INF/views/module/content_top.jsp"%>
		
		<!-- 모달 -->
		<!--  <input class="form-control-plaintext" type="text" readonly placeholder="  클릭하여 글을 작성하세요." 
			   data-bs-toggle="modal" data-bs-target="#exampleModal">
		-->
	
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>


		<%@ include file="/WEB-INF/views/module/content_bottom.jsp" %>
			<!-- 참여자 목록 -->
		<%@include file="/WEB-INF/views/module/member.jsp" %>
	</div>
	
	
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
	        el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
	        height: '200px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	        initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	        initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	        previewStyle: 'vertical'
	    });
		
		
		var myModal = document.getElementById('myModal')
		var myInput = document.getElementById('myInput')

		myModal.addEventListener('shown.bs.modal', function () {
		  myInput.focus()
		})
		
	</script>
	
	
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
	
