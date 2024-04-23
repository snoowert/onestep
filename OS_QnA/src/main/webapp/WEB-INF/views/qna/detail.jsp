<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${from eq 'remove' }">
	<script>
		alert("${param.qnaid} 번 글이 삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
</c:if>


<%@ include file="/WEB-INF/views/module/header.jsp"%>

<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> 


<section class="content-header">
	<div class="container-fluid">
		<div class="row md-2">
			<div class="col-sm-6">
				<h1>상세보기</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="main">
						<i class="fa fa-dashboard"></i>QnA</a></li>
					<li class="breadcrumb-item active">상세보기</li>
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
							<label for="qnatitle">제 목</label> <span class="form-control" id="qnatitle">${qna.qnatitle }</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-2">
							<label for="writer">작성자</label> <span class="form-control" id="writer">${qna.memberid }</span>
						</div>

						<div class="form-group col-sm-3">
							<label for="qnaregdate">작성일</label> <span class="form-control" id="qnaregdate">
								<fmt:formatDate value="${qna.qnaregdate }" pattern="yyyy-MM-dd" />
							</span>
						</div>

						<div class="form-group col-sm-3">
							<label for="qnaregdate">수정일</label> <span class="form-control" id="qnaupdatedate">
								<fmt:formatDate value="${qna.qnaupdatedate }" pattern="yyyy-MM-dd" />
							</span>

						</div>
						<div class="form-group col-sm-3">
							<label for="qnaviewcnt">조회수</label> <span class="form-control" id="viewcnt">${qna.qnaviewpoint }</span>
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label for="content">내 용</label>
						<div id="content">${qna.qnacontent }</div>
					</div>
					
					<div class ="card-tools">
							<button type="button" id="answerBtn" class="btn btn-primary" 
									onclick="document.getElementById('hiddenContent01').style.display=(document.getElementById('hiddenContent01').style.display=='block') ? 'none' : 'block';">답변 작성</button>
						</div>
					
					<div id="hiddenContent01" class="example01" style="display: block;">
					<div class="card-body pad">
					</div>
						<form role="form" method="post" action="regist.do" name="registForm" enctype="multipart/form-data">
							<input type="hidden" id="anscontent" name="anscontent">
							<div class="form-group">
								<label for="answertitle">제 목</label> 
								<input type="text" id="answertitle"  title="제목"
									name='answertitle' class="form-control notNull" placeholder="제목을 작성해 주세요">
							</div>							
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" title="작성자" readonly
									name="writer" class="form-control notNull" value="2" >
								<input type="hidden" id="memberid" name="memberid" value="2">
							</div>
								<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
							<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
							<div class="form-group" id="anscontent" >
							</div>
	
						</form>
					</div>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    	</div>
    </section>
						
<!-- /.content -->
<!-- REQUIRED SCRIPTS -->
<form role="form">
	<input type="hidden" name="qnaid" value="${qna.qnaid }" />
</form>



<script>
	var formObj = document.querySelector("form[role='form']");
	var formAns = document.querySelector("form[role='ansform']");

	function submit_go(url) {
		if (url == "remove.do" && !confirm("정말로 삭제하시겠습까?")) {
			return;
		}
		form.action = url;
		form.submit();
	}

	function modify_submit(){
		document.querySelector("#content").value = editor.getHTML();
		document.querySelector("form[role='form']").submit();	
	}
	const editor = new toastui.Editor({
	    el: document.querySelector('#anscontent'), // 에디터를 적용할 요소 (컨테이너)
	    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	    initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	    initialValue: '${answer.answercontent}',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	    previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
	    hooks: {
	        async addImageBlobHook(blob, callback) {
	            try {
	                // FormData에 이미지 추가
	                var formData = new FormData();
	                formData.append('image', blob);

	                // 서버로 이미지 업로드
	                const response = await fetch('/qna/tui-editor/image-upload', {
	                    method: 'POST',
	                    body: formData
	                });

	                // 서버에서 반환된 파일명
	                const filename = await response.text();
	             	// 이미지 URL 생성
	                const imageUrl = '/qna/tui-editor/image-print?filename=' + filename;

	                // 에디터에 이미지 삽입
	                callback(imageUrl, 'image');
	            } catch (error) {
	                console.error('이미지 업로드 실패:', error);
	            }
	        }
	    }
	});

	function regist_go(){
		var form = document.registForm;
		document.querySelector("#answercontent").value = editor.getHTML();
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


<%@ include file="/WEB-INF/views/module/footer.jsp"%>
