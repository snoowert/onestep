<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> 



<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
function modify_submit(){
	document.querySelector("#freecontent").value = editor.getHTML();
	document.querySelector("form[role='form']").submit();	
}
const editor = new toastui.Editor({
    el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
    initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
    initialValue: '${free.freecontent}',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
    previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
    hooks: {
        async addImageBlobHook(blob, callback) {
            try {
                // FormData에 이미지 추가
                var formData = new FormData();
                formData.append('image', blob);

                // 서버로 이미지 업로드
                const response = await fetch('/free/tui-editor/image-upload', {
                    method: 'POST',
                    body: formData
                });

                // 서버에서 반환된 파일명
                const filename = await response.text();
             	// 이미지 URL 생성
                const imageUrl = '/free/tui-editor/image-print?filename=' + filename;

                // 에디터에 이미지 삽입
                callback(imageUrl, 'image');
            } catch (error) {
                console.error('이미지 업로드 실패:', error);
            }
        }
    }
});
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>