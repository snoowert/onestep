<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>

    <!-- TUI 에디터 CSS CDN -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
    <h2 style="text-align: center;">등록</h2>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="editor"></div>
	<!-- 에디터 내용을 받을 요소 (컨테이너) -->
    <div id="contents"></div>

    <!-- TUI 에디터 JS CDN -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            width: '1000px',
            initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '내용을 입력해 주세요.',
            previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
        });
        
        document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
        
     	// 1. HTML을 에디터에 표시 설정
        Editor.prototype.getInstance().setHTML("HTML string")

        // 2. Markdown을 에디터에 표시 설정
        Editor.prototype.getInstance().setMarkdown("마크다운 string")
        
    </script>
</body>
</html>