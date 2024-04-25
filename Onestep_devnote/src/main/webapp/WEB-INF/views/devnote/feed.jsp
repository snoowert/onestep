<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/module/base.jsp"%>


<%@ include file="/WEB-INF/views/module/header.jsp"%>

 <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<style>
.form-control[readonly] {
	color: transperate;
	opacity: 1;
}
</style>
<!-- 상세상단바 -->
<%@ include file="/WEB-INF/views/module/subbar.jsp" %>
<!-- 상세상단바 끝 -->


<!-- 검색 -->
<div id="keyword" class="card-tools" style="width: 450px;">
	<div class="input-group row">
		<select class="form-control col-md-3">
			<option>제목</option>
		</select> &nbsp;&nbsp; <input class="form-control" type="text"
			placeholder="검색어를 입력하시오" /> &nbsp;&nbsp;
		<button class="btn btn-primary" type="button" id="searchBtn"
			data-card-widget="search" onclick="">
			<i class="fa fa-fw fa-search"></i>
		</button>
	</div>
</div>
<!-- 검색 끝 -->
	<!-- 좌측-->
<div class="container-fluid">
		<!-- 본문 -->
	<div class="">
			<!-- 제목 -->
	<%@ include file="/WEB-INF/views/module/content_top.jsp"%>
	<!-- 에디터 여는 버튼-->
	<div style="margin-left: auto; margin-right: auto">
		<!-- 버튼 끝 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">Launch demo modal</button>
		<!--  
					<input class="form-control-plaintext" type="text" readonly placeholder="  클릭하여 글을 작성하세요." 
				   data-bs-toggle="modal" data-bs-target="#exampleModal">
					-->
		<!-- 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
			<div class="modal-dialog modal-xl">
				<div class="modal-content" style="padding:30px;">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">피드 게시글 작성</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					
					
					<div class="form-group" style="margin:15px;">
							<label for=""> 피드 이름 </label>
							<input type="text" id="" name="" class="form-control" placeholder="피드 제목">
					</div>
					
					<div class="modal-body">
						<div id="content">
		
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>


	<!-- 게시글 -->
	<c:forEach var="note" items="${noteList }"> 
	<div class="card" style="width: 90%; margin-left: auto; margin-right: auto;">
		<div class="card-body" style="padding-bottom: -20px;">
			<div style="margin-top: 10px;">[사용자이름자리]</div>
			<div>
				<button type="button" class="btn btn-dark" style="float:right; margin-left:5px;">수정</button>
				<button type="button" class="btn btn-secondary" style="float:right;">삭제</button>
			</div>
			<div class="card-title">
				${note.noteTitle }
				<hr style="width: 190%;" />
			</div>
			<div class="card-text">
				${note.noteContent }
			</div>

			<div class="">
				<img src="" alt="댓글" style="float:left;"> 
				<input class="form-control" type="text" style="display:inline-block; width: 80%; margin-left:10px;">
				<button type="button" class="btn btn-secondary">등록</button>
			</div>
			<div class="card" style="margin-top: 10px; padding:30px;">
				<div style="margin-top: 10px;">[사용자이름자리]</div>
				<div style="">
			<div>
				<button type="button" class="btn btn-dark" style="float:right; margin-left:5px;">수정</button>
				<button type="button" class="btn btn-secondary" style="float:right;">삭제</button>
			</div>			
				</div>

				<hr/>
				<div>다 했음?</div>
			</div>
			
			<%@ include file="/WEB-INF/views/module/content_bottom.jsp" %>
			
		</div>		
	</div>
	</c:forEach>
		<!-- 참여자 목록 -->
		<%@include file="/WEB-INF/views/module/member.jsp" %>
	</div>
</div>
	</div>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>

const editor = new toastui.Editor({
        el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
        height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
        initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
        initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
        previewStyle: 'vertical'
        });

</script>


