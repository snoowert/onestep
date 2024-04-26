<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/module/header.jsp"%>



<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> 
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:760px;">
				<div class="card card-outline card-info">
				
				<div class="card-body">
					<div class="row">
						<div class="form-group col-sm-12">
							<label for="qnatitle">제 목</label>
							<span id="qnatitle">${qna.qnatitle }</span>							
						</div>
					</div>
					<div class="row">	
						<div class="form-group col-sm-2" >
							<label for="writer">작성자</label>
							<span  id="writer">${qna.memberid }</span>
						</div>			
				
				</div>													
					<div class="form-group col-sm-12">
						<label for="content">내 용</label>
						<div id="content">${qna.qnacontent }</div>
											
				</div>	
				</div>	
				
				<!-- 답변폼 -->
				<hr>
						<div class="card-body pad">
				
					<div class="card-header">
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn" onclick="history.go(-1);" >취 소</button>
						</div>
					</div>
					
						<form role="form" method="post" action="regist_answer" name="ansregistForm" enctype="multipart/form-data">
							<input type="hidden" id="answercontent" name="answercontent">
							<input type="hidden" id="qnaid" name="qnaid" value="${qna.qnaid} ">
													
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" title="작성자" readonly
									name="writer" class="form-control notNull" value="2" >
								<input type="hidden" id="memberid" name="memberid" value="2">
							</div>
							<div class="form-group" id="anscontent">
							
							
							</div>


						</form>
					</div>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>

<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<script>

function modify_submit(){
	document.querySelector("#answercontent").value = editor.getHTML();
	document.querySelector("form[role='form']").submit();	
}
const editor = new toastui.Editor({
    el: document.querySelector('#anscontent'), 	 // 에디터를 적용할 요소 (컨테이너)
    height: '500px',                       	 	 // 에디터 영역의 높이 값 (OOOpx || auto)
    initialEditType: 'wysiwyg',           		 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
    initialValue: '${answer.answercontent}',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
    previewStyle: 'vertical',                	 // 마크다운 프리뷰 스타일 (tab || vertical)
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
	var form = document.ansregistForm;
	document.querySelector("#answercontent").value = editor.getHTML();
	var inputNotNull = document.querySelectorAll("input.notNull");
	for(var input of inputNotNull){
		if(!input.value){
			alert(input.getAttribute("title")+"은 필수입니다.");
			input.focus();
			return;
		}
	}
	
	form.action="regist_answer";
	form.method="post";
	form.submit();
	
}

</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>