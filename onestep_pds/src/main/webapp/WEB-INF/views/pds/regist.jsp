<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/pds/base.jsp" %>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
<section class="container">
	<dev class="container-fluid col-sm-10">
		<form class="mb-3">
			<label class="form-label">제목</label>
			<input id="title" type="text" class="form-control" placeholder="자료명">
			<br>
			<!-- 
			<div class="row">
			&nbsp;&nbsp;<label class="form-label">파일</label>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="업로드">
			</div>		
			<ul>
				<div class="row">
					<li>11</li>&nbsp;
					<a href="">x</a>
				</div>
			</ul>
			<br>
			<label class="form-label">자료 설명</label>
			<textarea  id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요."></textarea>
			<br>-->
			<div id="content">
			</div>
			<input type="file" class="form-control">
			<br>
			<input type="submit" class="btn btn-primary" value="등록">&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="취소">
		</form>
	</dev>
</section>
</body>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
        const editor = new toastui.Editor({
            el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
            hooks: {
                async addImageBlobHook(blob, callback) {
                    try {
                        // FormData에 이미지 추가
                        var formData = new FormData();
                        formData.append('image', blob);

                        // 서버로 이미지 업로드
                        const response = await fetch('/pds/tui-editor/image-upload', {
                            method: 'POST',
                            body: formData
                        });

                        // 서버에서 반환된 파일명
                        const filename = await response.text();
                     	// 이미지 URL 생성
                        const imageUrl = '/pds/tui-editor/image-print?filename=' + filename;

                        // 에디터에 이미지 삽입
                        callback(imageUrl, 'image');
                    } catch (error) {
                        console.error('이미지 업로드 실패:', error);
                    }
                }
            }
        });
</script>
</html>