<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("등록을 성공했습니다.");
	window.close();
	window.opener.location.href=("/projectFile?projectId=${projectId}" + projectId);
	
</script>