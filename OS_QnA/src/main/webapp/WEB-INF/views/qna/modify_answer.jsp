<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<link rel="stylesheet"	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<div class="card-tools">
		<div class="float-right">
			<button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_submit();">수 정</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default " id="cancelBtn" onclick="history.go(-1);">취 소</button>
		</div>
	</div>

<div class="card-body">
	<form role="form" method="post" action="answermodify" name="answermodifyForm" id="answermodify"
		onsubmit="return false;">
		<input type="hidden" name="answercontent" />
		<input type="hidden" name="answerid" value="${answer.answerid }" />
		<input type="hidden" name="qnaid" value="${answer.qnaid }" />
		<div class="form-group">
			<label for="memberid">작성자</label> <input type="text" id="memberid"
				readonly name="memberid" class="form-control"
				value="${answer.memberid }">
		</div>
		<div class="form-group">
			<label for="anscontent">내 용</label>
			<div id="anscontent">
			<input type="hidden" name="answercontent" id="answercontent" />
			</div>
				

		</div>

	</form>
</div>
<!--end card-body  -->
<div class="card-footer" style="display: none"></div>


<script	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

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

var form = document.answermodifyForm;

function modify_submit(){
	
	var ansContentInput = document.querySelector("input[name='answercontent']");
    ansContentInput.value = editor.getHTML(); 
	
	var inputNotNull = document.querySelectorAll("input.notNull");
	
	form.action="modify_answer";
	form.method="post";
	form.submit();
	
}


</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>